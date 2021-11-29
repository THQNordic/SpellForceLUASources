local comment = [[

1. Idle State:
	- Der zuletzt besuchte Force Control Point wird in einer DB Variablen festgehalten
	- Die Uhrzeit bei einem Control Point gibt an, ab wann die Figure zum nächsten Punkt laufen soll!
	- Der Idle State ermittelt anhand der Uhrzeit und der obigen DB Variablen, welcher Control Point als nächstes angelaufen wird
	- Dazu gelten folgende Bedingungen:
		- Die Control Point werden gruppiert, jeweils alle Control Points bis einschließlich dem nächsten Forced Control Point
		- Die DB Variable gibt an, welche Gruppe angesprochen wird
		- Die Uhrzeit ermittelt, an welchen Punkt innerhalb der Gruppe gesprungen wird
	- An jedem Control Point gibt es einen CP-State, der ein Einsprungpunkt für besondere Aktionen gedacht ist. 
	- Wenn die besonderen Aktionen ausgeführt wurden, wird in den Idle State zurückgesprungen und die DB Variable entsprechend
		der aktuellen Position geseztt.
	- Dadurch wird sichergestellt, daß die Aktionen am Control Point auf jeden Fall ausgeführt wurden.

	- Problem: Beim Reboot einer Plattform ist die Figure wieder auf der Ausgangsposition, aber die DB Variable zeigt irgendwo
		in den Ablauf hinein. Deshalb sollte bei Reboot die DB Variable zurückgesetzt werden. Dadurch wird sichergestellt, daß
		die Figur nicht einfach durch Feindesland läuft, um den nächsten FCP zu erreichen.

	Beispiel:

		FCP("Morgens", 8:00)
		CP("x", 10:00)
		CP("y", 11:00)
		FCP("Mittag", 12:00)

		Also sieht der Idle State so aus:

		1. Transition:
			- Wenn DB Variable leer ist
			=> Geht zu FCP"Morgens"
			=> Wechsle in State goto-Morgens
		2. Transition:
			- Wenn DB Variable = "Morgens"
			- Wenn Zeit >= 11:00
			=> Gehe zu FCP"Mittag"
			=> Wechsle in State goto-Mittag
		3. Transition:
			- Wenn DB Variable = "Morgens"
			- Wenn Zeit >= 10:00
			=> Gehe zu CP"y"
			=> Wechsle in State goto-y
		4. Transition:
			- Wenn DB Variable = "Morgens"
			- Wenn Zeit >= 8:00
			=> Gehe zu CP"x"
			=> Wechsle in State goto-x
		5. Transition:
			- Wenn DB Variable = "Mittag"
			- Wenn Zeit >= 11
			=> Laufe zu FCP"Morgens"
			=> Wechsle in State goto-Morgens

		State goto-Morgens:
		1. Transition: 
			- Wenn Figure am FCP angekommen ist
			=> Setze DB Variable auf "Morgens"
			=> Gehe in Idle State

		State goto-x:
		1. Transition:
			- Wenn Figure am CP angekommen ist
			=> Gehe in Idle State

		State goto-Mittag
		1. Transition: 
			- Wenn Figure am FCP angekommen ist
			=> Setze DB Variable auf "Mittag"
			=> Gehe in Idle State
]]
comment = nil

-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}


-- functions to loop any given control points until at least the given time and most likely beyond
-- because the CP cycle has to be complete! However, it does not wrap at midnight, so be careful...

-- **DOC** -------------------------------------------------------------------------------
function BeginLoopCP(params)
	local FuncName = "GDS: BeginLoopCP(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Time, FuncName .. "MISSING PARAMETER: Time =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	BeginTime = params.Time
end
doc[numdoc] = [[Params: <code>Time = </code><br>Markiert den Beginn der zu wiederholenden Control Points. Einziger Parameter: Time = hms(h,m,s) gibt die Startzeit an.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -------------------------------------------------------------------------------
function AddLoopCP(params)
	local FuncName = "GDS: AddLoopCP(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.WaitTime, FuncName .. "MISSING PARAMETER: WaitTime =")
	assert2(params.Location, FuncName .. "MISSING PARAMETER: Location =")
	assert2(type(params.Location) == "string", FuncName .. "INVALID PARAMETER: Location is not a string")
	params.Optional = params.Optional or 0
	params.WalkMode = params.WalkMode or Walk
	--params.Actions = params.Actions or {}
	assert2(type(params.Actions) == "nil", FuncName .. "INVALID PARAMETER: Actions not supported in looped CPs!")
	--params.Conditions = params.Conditions or {}
	assert2(type(params.Conditions) == "nil", FuncName .. "INVALID PARAMETER: Conditions not supported in looped CPs!")
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	tinsert(LoopPoints, params)
end
doc[numdoc] = [[Params: <code>WaitTime = , Location = , Optional = 0 , WalkMode = Walk </code><br>Fügt einen zu loopenden Control Point hinzu. Parameter sind wie bei AddControlPoint, nur das TimeToLeave = xx mit WaitTime = xx zu ersetzen ist. WaitTime gibt die Verweildauer an diesem Punkt an.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -------------------------------------------------------------------------------
function EndLoopCP(params)
	local FuncName = "GDS: EndLoopCP(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Time or params.Loops, FuncName .. "PARAMETER MISSING: either Time= or Loops= must exist")
	if params.Time then assert2(params.Loops == nil, FuncName .. "TOO MANY PARAMETERS: Time= and Loops= can not be used together!") end
	if params.Loops then assert2(params.Time == nil, FuncName .. "TOO MANY PARAMETERS: Time= and Loops= can not be used together!") end
	params.Time = params.Time or 1.0
	params.Loops = params.Loops or 86400
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local EndTime = params.Time
	local NumLoops = params.Loops
	assert2(BeginTime <= EndTime, FuncName .. "BACK TO THE FUTURE? ---> BeginLoopCP(Time) > EndLoopCP(Time)")
	
	local NumCP = getn(LoopPoints)
	assert2(NumCP, FuncName .. "NO CONTROL POINTS between BeginLoopCP() and EndLoopCP()")

	local DayTime = BeginTime
	local Midnight = 1.0
	local TotalCP = 0
	local LoopCount = 0
	
	while(DayTime <= EndTime and DayTime < Midnight and LoopCount < NumLoops) do
		for i = 1, NumCP do
			local cp = LoopPoints[i]
			
			DayTime = DayTime + cp.WaitTime
			TotalCP = TotalCP + 1
			cp.TimeToLeave = DayTime
			cp.Name = "_LoopPoint_" .. tostring(TotalCP)

			if (DayTime > Midnight) then
				_ALERT(FuncName .. "TimeToLeave after Midnight, thus ending Daily Job abruptly!")
				_ALERT(FuncName .. "CP No #" .. tostring(i) .. " of " .. tostring(NumCP) .. ": TimeToLeave was " .. time2hms2str(cp.TimeToLeave))
				_ALERT(FuncName .. "NPC " .. tostring(NpcId) .. " will not walk until you fix it, baby...")
				assert(false)
			end

			cp2 = tcopy(cp)
			cp2.WaitTime = nil
			AddControlPoint(cp2)
		end

		LoopCount = LoopCount + 1
	end
	
	_ALERT(FuncName .. "<NPC " .. tostring(NpcId) .. "> --> Created Dayjob from " .. time2hms2str(BeginTime) .. " to " .. time2hms2str(DayTime) .. " looping " .. tostring(LoopCount) .. " times.")
	LoopPoints = nil
	BeginTime = 0
	EndTime = 0
end

doc[numdoc] = [[Params: <code>Time = , Loops = </code><br>Hiermit wird die Loop von Control Points abgeschlossen. Parameter sind Time = hms(h,m,s) und Loops = 3 ... Time gibt die Endzeit des Loops an. Loops gibt die Anzahl loops an. Je nachdem was zuerst eintrifft wird das loopen abgebrochen, man kann Loop und Time einzeln und auch zusammen verwenden.<br>Alle zuvor mit AddLoopCP hinzugefügten Control Points werden solange gelooped, bis beim nächsten loop Beginn die Zeit höher ist als die hier angegebene EndTime.
<br>ACHTUNG: die EndTime wird nicht strikt eingehalten, sondern es wird nur keine weitere Schleife erzeugt sondern nur die aktuelle Sequenz noch zu ende geführt, da eine Sequenz von Control Points nicht mittendrin abgebrochen werden darf (sonst könnte der NPC u.U. ungewünschte Wege laufen). Ausserdem ist es ein Fehler, wenn die loop über Mitternacht hinausgeht, denn dann würde die Reihenfolge der Control Point Uhrzeiten nicht mehr stimmen.<br>
Indem man die Begin und end Zeit identisch setzt, erreicht man das die Control Points nur einmal durchlaufen werden. Das hat gegenüber dem bisherigen System den Vorteil das man jetzt einfach WaitTime anstatt TimeToLeave angibt. Je nach Geschmack oder Situation ist das eine oder andere vorzuziehen.<br>
Beispiel:<br>
BeginLoopCP{Time = hms(5,30)}<br>
AddLoopCP{Location = "Point001", WalkMode = Run, WaitTime = hms(0,20)}<br>
AddLoopCP{Location = "Point002", WalkMode = Run, WaitTime = hms(0,30)}<br>
AddLoopCP{Location = "Point003", WalkMode = Run, WaitTime = hms(0,40)}<br>
EndLoopCP{Time = hms(19)}<br>
Looped die 3 waypoints (dauer: 20+30+40 minuten = 1:30 stunden) von 5:30 uhr bis 19 uhr]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -------------------------------------------------------------------------------
function WalkCircle(params)
	local FuncName = "GDS: WalkCircle(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.CenterX, FuncName .. "MISSING PARAMETER: CenterX =")
	assert2(params.CenterY, FuncName .. "MISSING PARAMETER: CenterY =")
	assert2(params.Radius, FuncName .. "MISSING PARAMETER: Radius =")
	params.Points = params.Points or (params.Radius * 2)
	params.CounterClockwise = params.CounterClockwise or nil
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local alpha = 0
	local _x
	local _y

	for i = 1, params.Points do
		alpha = i*360 / params.Points
		_x = params.CenterX + params.Radius * cos(alpha)
		_y = params.CenterY - params.Radius * sin(alpha)
		DefineLocationCircle{Name = "Circle " .. tostring(i), X = _x, Y = _y, Radius = 1}
	end

	if params.CounterClockwise then
		for i = params.Points, 1, -1 do
			AddControlPoint{Name = tostring(i), Location = "Circle " .. tostring(i)}
		end
	else
		for i = 1, params.Points do
			AddControlPoint{Name = tostring(i), Location = "Circle " .. tostring(i)}
		end
	end
end

doc[numdoc] = [[Params: <code>CenterX = , CenterY = , Radius = , Points = Radius*2, CounterClockwise = 0</code><br>
Lässt den NPC im Kreis laufen. Benutzt dazu DefineLocationCircle und AddControlPoint Funktionalität.<br>
ACHTUNG: wenn man diesen Befehl verwendet, sollte man keine AddControlPoint oder LocationCircle Befehle im Script haben! WalkCircle erzeugt nämlich entsprechende LocCircle und CPs die den NPC im Kreis laufen lassen. Wenn überhaupt, dann sollte man genau wissen was man tut...<br>
centerx und centery bestimmen den Mittelpunkt des Kreises, radius ist natürlich der Radius des Kreises (alles in Tile-Koordinaten).<br>
points sind die Anzahl LocationCircle und CPs die für den Kreis erzeugt werden, bei 3 würde der NPC im Dreieck laufen, bei 4 im Quadrat und erst bei höheren Werten entsteht ein glaubwürdiges Kreislaufen. Allerdings sollte man darauf achten, nicht zuviele points anzugeben, sonst kann es passieren das sich eine Menge CPs wieder auflösen, weil sie zu nahe beisammen liegen. Als Richtwert kann man sagen das die Anzahl points mind. dem radius entsprechen sollte, und maximal radius * 3.<br>
counterclockwise ist optional und bestimmt, ob der Kreis entgegen dem Uhrzeigersinn abgelaufen werden soll. Ist der Wert 0 oder lässt man den Parameter ganz weg, läuft der NPC im Uhrzeigersinn, bei Werten von 1 oder höher stattdessen gegen den Uhrzeigersinn.<br>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -------------------------------------------------------------------------------
function DefineLocationCircle(params)
	local FuncName = "GDS: DefineLocationCircle(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
	if params.Range then
		params.Radius = params.Range
		params.Range = nil
	else
		params.Radius = params.Radius or 2
	end
	if params.Radius < 2 then params.Radius = 2 end
	params.Type = params.Type or "Absolute"
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	Locations = Locations or {}

	if params.Type == "Relative" then
		assert2(LastLocation, FuncName .. "Type = \"Relative\" MUST NOT BE USED IN FIRST LOCATION CIRCLE")
		params.X = LastLocation.X + params.X
		params.Y = LastLocation.Y + params.Y
	end

	Locations[params.Name] = params
	LastLocation = params
end

doc[numdoc] = [[Parameter: <code>Name = , X = , Y = , Type = absolut, Radius = 3</code><br>
Definiert einen Punkt bzw. eine Kreisfläche die als Zielpunkt dient, z.b. für AddControlPoint. Der Befehl muss gleich nach BeginDefinition stehen! Es können beliebig viele LocationCircles definiert werden.<br>
Der Name muss für jeden LocationCircle eindeutig sein. X und Y Koordinaten sind Gridpunkte/Tiles auf der Map. Radius bestimmt wie gross der Radius des Zielpunkts ist. Ein Radius von 1 wäre exakt ein Tile. Hinweis: auch wenn der Radius 1 ist und der Zielpunkt belegt ist, wird der NPC den Wegpunkt trotzdem erreichen, das Verhalten wurde entsprechend verbessert indem einfach am nahegelegensten, nicht-blockierten Zielpunkt das Ziel als erreicht gilt.<br>
 <code>Type = "Relative"</code> bedeutet, das die X/Y Koordinaten relativ zur jetzigen Position gelten, z.b. würden dann X/Y von -4,2 bedeuten, das sich der NPC 4 Felder nach „links“ und 2 nach „oben“ bewegen soll.]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** -------------------------------------------------------------------------------
function AddControlPoint(params)
	local FuncName = "GDS: AddControlPoint(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(params.Location, FuncName .. "MISSING PARAMETER: Location =")
	params.Optional = params.Optional or 0
	params.WalkMode = params.WalkMode or Walk
	params.Actions = params.Actions or {}
	params.Conditions = params.Conditions or {}
	params.TimeToLeave = params.TimeToLeave or -1
	assert2(getn(tkeys(params)) == 7, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if params.TimeToLeave == -1 then params.TimeToLeave = nil end
	
	-- in die Liste der Controllpunkte aufnehmen
	tinsert(ControlPoints, params)
end

doc[numdoc] = [[Parameter: <code>Name = , Location = , TimeToLeave = sofort, Optional = 0, WalkMode = Walk,<br>Conditions = {...},<br>Actions = {...}</code><br>Erzeugt einen ControlPoint für das Tagesablaufscript. Der Befehl muss gleich nach den DefineLocationCircle Befehlen stehen. Es können beliebig viele ControlPoints hinzugefügt werden. Der Name des ControlPoint muss eindeutig sein. Location ist der Name eines vorher definierten LocationCircle, welcher natürlich existieren muss.<br>TimeToLeave ist die Uhrzeit (Tageszeit im Spiel) zu welcher der NPC zu besagtem ControlPoint aufbricht (NICHT: wann er dort ankommen soll!). hms(h,m,s) ist nur eine convenience Funktion die eine Tageszeit wie 20:33:45 umwandelt. Wenn man TimeToLeave weglässt, wird der NPC diesen Control Point sofort wieder verlassen. Die ControlPoint Befehle müssen in absteiger Reihenfolge der Uhrzeit eingefügt werden, also der ControlPoint für 12 Uhr muss vor dem für 14 Uhr stehen.<br> Optional=1 bedeutet, das dieser Control Point optional ist, und wenn er zeitlich verpasst wurde wird er übersprungen. Dieser Parameter ist optional, lässt man ihn weg, wird der Wegpunkt immer angelaufen auch wenn der NPC „zu spät“ kommt und gleich wieder zum nächsten läuft.<br>WalkMode bestimmt ob der NPC ab diesem Wegpunkt rennen oder gehen soll. Walk ist gehen, Run ist rennen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -------------------------------------------------------------------------------
function SetFollowMode(params)
	local FuncName = "GDS: SetFollowMode(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
	assert2(params.NpcId ~= NpcId, FuncName .. "CAN NOT FOLLOW SELF!")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	print(",.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,")
	print("WARNING: DO NOT USE SetFollowMode - it is NOT persistant!!!")
	print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")

	DayFollowTarget = params.NpcId
end

doc[numdoc] = [[Params: <code>NpcId = self ,</code><br>Versetzt den NPC in den Verfolgermodus. Er wird immer dem NPC mit der angegebenen NPC ID folgen, in diesem Fall würde er dem NPC mit der ID 97 verfolgen. Hoffentlich ist dieser ihm freundlich gesonnen.... ;)<br>Ist der Verfolger zu Beginn der Map weit weg von seinem Ziel NPC, so wird er erstmal zu ihm hinlaufen. Kann nur global verwendet werden, wird also bei Erzeugung der StateMachine einmalig festgelegt. Kann nicht als Action verwendet werden!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -------------------------------------------------------------------------------
function SetWalkMode(params)
	local FuncName = "GDS: SetWalkMode(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.WalkMode = params.WalkMode or Walk
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	WalkMode = params.WalkMode
end

doc[numdoc] = [[Params: <code>WalkMode = Walk ,</code><br>Ändert den Walkmode des NPC. Es gibt 2 Möglichkeiten: Run oder Walk. Überflüssig zu erwähnen, was der Unterschied ist. ;)<br>Kann nur global verwendet werden, wird also bei Erzeugung der StateMachine einmalig festgelegt. Kann nicht als Action verwendet werden!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -------------------------------------------------------------------------------
function SetRunMode(params)
	local FuncName = "GDS: SetRunMode(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.WalkMode = params.WalkMode or Run
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	WalkMode = params.WalkMode
end

doc[numdoc] = [[Params: <code>WalkMode = Walk ,</code><br>Ändert den Walkmode des NPC. Es gibt 2 Möglichkeiten: Run oder Walk. Überflüssig zu erwähnen, was der Unterschied ist. ;)<br>Kann nur global verwendet werden, wird also bei Erzeugung der StateMachine einmalig festgelegt. Kann nicht als Action verwendet werden!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -------------------------------------------------------------------------------
function DailyJobParams(params)
	local FuncName = "GDS: DailyJobParams(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.Loop = params.Loop or TRUE
	params.Conditions = params.Conditions or {}
	params.EndConditions = params.EndConditions or {}
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- in die Parameterliste aufnehmen
	DayCreateParams = params
end

doc[numdoc] = [[Params: <code>Loop = TRUE , Conditions = {...} , EndConditions = {...}</code><br>Daily Job Params ersetzt das problematische OnIdleWalkPath nun weitgehend. Conditions müssen alle wahr sein damit der Tagesablauf beginnt, während wenn die EndConditions wahr sind, der NPC mit dem Tagesablauf aufhört.<br>WICHTIG: Loop == FALSE funktioniert nur bei Tagesabläufen die NICHT zeitbasiert sind!]]
doc[numdoc] = nil
numdoc = numdoc + 1

--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------


function DayCreateDBVariableState(state)
	return "DailyJobSequence - VarValue - " .. state
end


function InitDailyJobSequence()

	-- Alle Tabellen löschen und initialisieren
	ControlPoints = {}
	Locations = nil
	LastLocation = nil
	DayFollowTarget = nil
	DayCreateParams = nil

	IdleHomeData = {}

	-- looped Dayjob functions use these:
	LoopPoints = {}
	BeginTime = 0

	WalkMode = Walk

	UsedEndConditions = {}
end


function DayCreateFollowMode()

	-- macht keinen sinn controlpunke anzugeben, wenn man doch follow mode setzt
	assert(getn(ControlPoints) == 0)

	-- einfach im idle state loopen, d.h. solange figur idle ist, follow mode setzen, oder wie ändert sich das sonst?

	-- checke, ob Idle State wirklich vorhanden ist
	assert(StateIdle ~= nil)

	local StateFollow = CreateState(CreateStateName("DailyJobSequence", "Follow"))
	local transition = StateIdle:CreateTransition(CreateTransitionName("DailyJobSequence", "Follow", "IDLE", "Follow"), StateFollow)
	transition:AddAction(CGdsFigureFollow:new(NpcId, DayFollowTarget))
end

function DayCheckLocationHit(loc1, loc2)
    local retval = nil

    assert(Locations[loc1] ~= nil)    
    assert(Locations[loc2] ~= nil)    

    local x1 = Locations[loc1].X
    local y1 = Locations[loc1].Y
    local x2 = Locations[loc2].X
    local y2 = Locations[loc2].Y
    local dist = sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))

    if dist <= Locations[loc1].Radius + Locations[loc2].Radius then
        retval = 1
    end

    return retval
end


function DayCreateSequence()
    local TimeBased = nil

	FuncName = "DailyJobSequence: "

--------------------------------------------------------------------------------------------------------------------------
---------------------------- IDLE GO HOME --------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

	-- create IdleGoHome states and transitions ...
	if getn(IdleHomeData) > 0 then
		foreachi(IdleHomeData, function(e, _home)
			-- create the IdleGoHome state
			local IdleHomeStateName = "OnIdleGoHomeState#" .. tostring(e)
			local IdleHomeState = CreateState(IdleHomeStateName)

			-- create transition from IDLE state to itself, in case NPC has a dialog
			if getn(DlgEvents) > 0 or SpawnDead == TRUE then
				local transition = StateIdle:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "IDLE", "IDLE"), StateIdle)
				transition:AddCondition(IsNpcFlagTrue{Name = "IchHabeEinenDialogBeendet"})
				transition:AddCondition(FigureJob{Job = JobIdle})
				transition:AddCondition(Negated(FigureDominated{}))
				transition:AddCondition(FigureInRange{X = _home.X, Y = _home.Y, Range = 0})
				transition:AddAction(SetNpcFlagFalse{Name = "IchHabeEinenDialogBeendet"})
				transition:AddAction(LookAtDirection{Direction = _home.Direction})
			end

			-- create the transition from IDLE state
			local transition = StateIdle:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "IDLE", "IdleHome"), IdleHomeState)
			if getn(DespawnDataSet) > 0 or getn(UmspawnDataSet) > 0 then
				transition:AddCondition(IsNpcFlagFalse{Name = "NpcIsAboutToBeDespawned"})
			end
			transition:AddCondition(Negated(FigureInRange{X = _home.X, Y = _home.Y, Range = _home.Range}))
			if _home.NoIdle ~= TRUE then
				if _home.CheckOnlyAggro == TRUE then
					transition:AddCondition(Negated(FigureHasAggro{}))
				else
					transition:AddCondition(FigureJob{Job = JobIdle})
					transition:AddCondition(Negated(FigureDominated{}))
				end
			else
				transition:AddCondition(FigureDead{NpcId = Avatar})
			end
			-- freie conditions hier einfügen
			if getn(_home.Conditions) > 0 then
				foreachi(_home.Conditions, function(_, condition)
					assert2(type(condition) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(condition)))
					%transition:AddCondition(condition)
				end)
			end
			
			-- zuerst mit waittime
			-----------------------------------------------------------------------------------------------------------			
			if _home.WaitTime > 0 then
			-----------------------------------------------------------------------------------------------------------			

-- NOT IMPLEMENTED !!!
-- NOT CURRENT ... missing Despawn break transition!

				local TimeStampName = "IdleHomeTimeStamp#" .. tostring(e)
				local TimeStampFlagName = "IdleHomeTimeStampFlag#" .. tostring(e)

				-- create the ABORT transition to the IDLE state when condition is no longer met...
				if getn(_home.AbortConditions) > 0 then
					local trans = IdleHomeState:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "AbortIdleHome", "IDLE"), StateIdle)
					trans:AddCondition(FigureDominated{})
					foreachi(_home.AbortConditions, function(_, condition)
						--local cond = condition:Clone()
						--cond:ToggleNegated()
						assert2(type(condition) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(condition)))
						%trans:AddCondition(condition)
					end)
					if getn(_home.AbortActions) > 0 then
						foreachi(_home.AbortActions, function(_, action)
							assert2(type(action) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(action)))
							%trans:AddAction(action)
						end)
					end
				end

				-- abort idle go home when figure is dominated!
				local trans = IdleHomeState:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "AbortIdleHomeBecauseOfDominate", "IDLE"), StateIdle)
				trans:AddCondition(FigureDominated{})


				-- das timestamp flag gleich beim laden zurücksetzen:
				TransitionInit:AddAction(SetNpcFlagFalse{Name = TimeStampFlagName})

				-- in Idle State transition sicherheitshalber auch das TimeStamp flag zurücksetzen				
				transition:AddAction(SetNpcFlagFalse{Name = TimeStampFlagName})
				
				-- zusätzliche transition from IdleHome to itself das Timestamp abfrägt
				transition = IdleHomeState:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "IdleHome", "IdleHome (TimeStamp)"), IdleHomeState)
				
				-- timestamp condition
				transition:AddCondition(FigureJob{Job = JobIdle})
				transition:AddCondition(Negated(FigureDominated{}))
				transition:AddCondition(IsNpcFlagTrue{Name = TimeStampFlagName, UpdateInterval = _home.WaitTime * 10 * 0.35})
				transition:AddCondition(IsNpcTimeElapsed{Name = TimeStampName, Seconds = _home.WaitTime, UpdateInterval = _home.WaitTime * 10 * 0.35})
REM = [[				
				-- für die walkrange sicherstellen, das NPC nur ein Goto ausführt (mit oder ohne walk)
				if _home.WalkRange ~= 0 then
					transition:AddCondition(Negated(FigureInRange{X = _home.X, Y = _home.Y, Range = _home.WalkRange}))
				end
]]
				-- goto home position
				transition:AddAction(Goto{X = _home.X, Y = _home.Y, Range = 5, WalkMode = _home.WalkMode, GotoMode = _home.GotoMode})
				transition:AddAction(SetNpcFlagFalse{Name = TimeStampFlagName})
		
				-- freie actions hier einfügen
				if getn(_home.Actions) > 0 then
					foreachi(_home.Actions, function(_, action)
						assert2(type(action) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(action)))
						%transition:AddAction(action)
					end)
				end
REM = [[
				-- walkrange definieren mit eigener transition
				if _home.WalkRange ~= 0 then
					-- zusätzliche transition für WalkRange from IdleHome to itself
					transition = IdleHomeState:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "IdleHome", "IdleHome (Walk)"), IdleHomeState)

					-- timestamp condition
					transition:AddCondition(FigureJob{Job = JobIdle})
					transition:AddCondition(Negated(FigureDominated{}))
					transition:AddCondition(IsNpcFlagTrue{Name = TimeStampFlagName, UpdateInterval = _home.WaitTime * 10 * 0.35})
					transition:AddCondition(IsNpcTimeElapsed{Name = TimeStampName, Seconds = _home.WaitTime, UpdateInterval = _home.WaitTime * 10 * 0.35})
					-- für die walkrange sicherstellen, das NPC nur ein Goto ausführt (mit oder ohne walk)
					transition:AddCondition(FigureInRange{X = _home.X, Y = _home.Y, Range = _home.WalkRange})
					-- aber nicht am zielpunkt...
					transition:AddCondition(Negated(FigureInRange{X = _home.X, Y = _home.Y, Range = 0}))
	
					-- goto home position
					transition:AddAction(Goto{X = _home.X, Y = _home.Y, Range = 5, WalkMode = Walk})
					transition:AddAction(SetNpcFlagFalse{Name = TimeStampFlagName})
				end
]]
				-- transition from IdleHome to itself, welche den timestamp setzt bei idle
				local transition = IdleHomeState:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "IdleHome", "IdleHome"), IdleHomeState)
				transition:AddCondition(FigureJob{Job = JobIdle})
				transition:AddCondition(Negated(FigureDominated{}))
				transition:AddCondition(IsNpcFlagFalse{Name = TimeStampFlagName, UpdateInterval = _home.WaitTime * 10 * 0.35})
				transition:AddCondition(Negated(FigureInRange{X = _home.X, Y = _home.Y, Range = _home.Range}))

				transition:AddAction(SetNpcTimeStamp{Name = TimeStampName})
				transition:AddAction(SetNpcFlagTrue{Name = TimeStampFlagName})

				-- create the transition back to the IDLE state when home pos is reached
				local transition = IdleHomeState:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "IdleHome", "IDLE"), StateIdle)
				transition:AddCondition(FigureInRange{X = _home.X, Y = _home.Y, Range = _home.Range})
				transition:AddAction(LookAtDirection{Direction = _home.Direction})
				transition:AddAction(SetNpcFlagFalse{Name = TimeStampFlagName})

				-- freie home actions hier einfügen
				if getn(_home.HomeActions) > 0 then
					foreachi(_home.HomeActions, function(_, action)
						assert2(type(action) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(action)))
						%transition:AddAction(action)
					end)
				end

			-----------------------------------------------------------------------------------------------------------			
			else -- ohne waittime:
			-----------------------------------------------------------------------------------------------------------			

				-- create the ABORT transition to the IDLE state when condition is no longer met...
				if getn(_home.AbortConditions) > 0 then
					local trans = IdleHomeState:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "AbortIdleHome", "IDLE"), StateIdle)
					foreachi(_home.AbortConditions, function(_, condition)
						--local cond = condition:Clone()
						--cond:ToggleNegated()
						assert2(type(condition) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(condition)))
						%trans:AddCondition(condition)
					end)
					if getn(_home.AbortActions) > 0 then
						foreachi(_home.AbortActions, function(_, action)
							assert2(type(action) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(action)))
							%trans:AddAction(action)
						end)
					end
				end

				-- transition from IdleHome to itself
				local transition = IdleHomeState:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "IdleHome", "IdleHome"), IdleHomeState)
				transition:AddCondition(FigureJob{Job = JobIdle})
				transition:AddCondition(Negated(FigureDominated{}))
REM = [[
				-- für die walkrange sicherstellen, das NPC nur ein Goto ausführt (mit oder ohne walk)
				if _home.WalkRange ~= 0 then
					transition:AddCondition(Negated(FigureInRange{X = _home.X, Y = _home.Y, Range = _home.WalkRange}))
				else
					transition:AddCondition(Negated(FigureInRange{X = _home.X, Y = _home.Y, Range = 0}))
				end
]]
				transition:AddCondition(Negated(FigureInRange{X = _home.X, Y = _home.Y, Range = _home.Range}))

				-- goto home position
				transition:AddAction(Goto{X = _home.X, Y = _home.Y, Range = 5, WalkMode = _home.WalkMode, GotoMode = _home.GotoMode})
				
				-- freie actions hier einfügen
				if getn(_home.Actions) > 0 then
					foreachi(_home.Actions, function(_, action)
						assert2(type(action) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(action)))
						%transition:AddAction(action)
					end)
				end
REM = [[
				-- walkrange definieren mit eigener transition
				if _home.WalkRange ~= 0 then
					-- zusätzliche transition für WalkRange from IdleHome to itself
					transition = IdleHomeState:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "IdleHome", "IdleHome (Walk)"), IdleHomeState)

					-- timestamp condition
					transition:AddCondition(FigureJob{Job = JobIdle})
					transition:AddCondition(Negated(FigureDominated{}))
					-- für die walkrange sicherstellen, das NPC nur ein Goto ausführt (mit oder ohne walk)
					transition:AddCondition(FigureInRange{X = _home.X, Y = _home.Y, Range = _home.WalkRange})
					-- aber nicht am zielpunkt...
					transition:AddCondition(Negated(FigureInRange{X = _home.X, Y = _home.Y, Range = 0}))
	
					-- goto home position
					transition:AddAction(Goto{X = _home.X, Y = _home.Y, Range = 5, WalkMode = Walk})
				end
]]
				-- create the transition back to the IDLE state when home pos is reached
				local transition = IdleHomeState:CreateTransition(CreateTransitionName("IdleHomeSystem", e, "IdleHome", "IDLE"), StateIdle)
				transition:AddCondition(FigureInRange{X = _home.X, Y = _home.Y, Range = _home.Range})
				transition:AddAction(LookAtDirection{Direction = _home.Direction})

				-- freie home actions hier einfügen
				if getn(_home.HomeActions) > 0 then
					foreachi(_home.HomeActions, function(_, action)
						assert2(type(action) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(action)))
						%transition:AddAction(action)
					end)
				end

			-----------------------------------------------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------------------------------------------			
			
			-- die figur gleich beim laden in die richtige richtung ausrichten lassen
			--OneTimeInitAction(LookAtDirection{Direction = _home.Direction})
		end)
	end

--------------------------------------------------------------------------------------------------------------------------
---------------------------- DAILY JOB SEQUENCE --------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
    
	-- der npc hat überhaupt keine jobsequence, dann lieber den early out nehmen
	if getn(ControlPoints) == 0 then
		return
	end

	-- checke, ob Idle State wirklich vorhanden ist
	assert(StateIdle ~= nil)

    -- Pass 0: Überflüssige Control Points eliminieren (weil sich alter und neuer ControlPoint überschneiden)
    local i = 2
	local adder = 0
    while i <= getn(ControlPoints) do
        local cp1 = ControlPoints[i - 1]
        local cp2 = ControlPoints[i]

        -- berühren sich die Kontrollpunkte?
        if DayCheckLocationHit(cp1.Location, cp2.Location) then
            print(format("GDS: DailyJobSequence for Npc %i: Two waypoints (%i,%i) are overlapping -> merging:", NpcId, i-1 + adder,i + adder))
            local loc1 = Locations[cp1.Location]
            local loc2 = Locations[cp2.Location]
            print(format("GDS: \tMerging '%s': %i,%i (Radius %i) --> into --> '%s': %i,%i (Radius %i)", loc2.Name, loc2.X, loc2.Y, loc2.Radius, loc1.Name, loc1.X, loc1.Y, loc1.Radius))

            -- dann übernehme wichtige Daten des zweiten Controlpunktes in den ersten
            cp1.Location = cp2.Location
            cp1.TimeToLeave = cp2.TimeToLeave
            if cp2.Optional == 0 then
                cp1.Optional = 0
            end

            -- und lösche den zweiten Kontrollpunkt
            tremove(ControlPoints, i)

            -- damit Debugoutput auf den richtigen Kontrollpunkt verweist, wird hier ein Korrekturwert mitgeführt
			adder = adder + 1
        else
            i = i + 1 
        end
    end

	-- Pass 0.5: bei nicht-loopendem Tagesablauf einen End-State vorbereiten,
	--				indem der letzte wegpunkt kopiert wird...
	if DayCreateParams and DayCreateParams.Loop == FALSCH then
		-- make a copy of the CP
		local last = getn(ControlPoints)
		local LastCP = ControlPoints[last]
		local EndCP = tcopy(LastCP)
		EndCP.Location = "FinalPoint"
		EndCP.Name = "Final"
		EndCP.Optional = 0
		EndCP.Conditions = {}
		tinsert(ControlPoints, EndCP)
		-- die actions sollen nur am ende ausgeführt werden:
		LastCP.Actions = {}
		
		-- make a copy of the Loc
		local loc = tcopy(Locations[LastCP.Location])
		loc.Name = "FinalPoint"
		Locations[loc.Name] = loc
	end

	-- Pass 1: States benennen und erzeugen
	for i = 1, getn(ControlPoints) do
		local cp = ControlPoints[i]

		assert(cp.Name ~= nil)
		assert(cp.State == nil)

		cp.State = CreateState(CreateStateName("DailyJobSequence", cp.Name))
	end

	-- Pass 2: Einen Haufen Zusatzinfos in den States einbauen
	local ForcedCP = nil
	local LastCP = nil
	local FirstCP = nil
	local i

	-- zwei Durchläufe sind nötig, damit alle Abhängigkeiten geklärt werden können
	for j=1,2 do
		for i=1, getn(ControlPoints) do

			local cp = ControlPoints[i]

			-- von dieser DB Variablen hängt der Übergang in diesen State ab
			if ForcedCP ~= nil then
				cp.Variable = DayCreateDBVariableState(ForcedCP.Name)
			end

			-- markiere letzten erzwungenen Kontrollpunkt
			if cp.Optional == 0 then
				ForcedCP = cp
			end

			if LastCP ~= nil then
				cp.TimeToGo = LastCP.TimeToLeave
                if cp.TimeToGo ~= nil then
                    TimeBased = 1
                end
			end

			-- für die Zeitmessung brauchen wir die Zeitdifferenz zwischen dem letzten und diesem Kontrollpunkt
			LastCP = cp
			if not FirstCP then
				FirstCP = cp
			end
		end	
	end

	if TimeBased == 1 and DayCreateParams ~= nil then
		assert2(DayCreateParams.Loop ~= FALSE, "ABORTING DAILY JOB CREATION: DailyJobParams: LOOP == FALSE can not be used with time-based daily job!!")
	end

	-- Pass 3: Übergänge vom Idle State zu den Goto-States erzeugen,
	--			nur bei zeitbasierten Tagesabläufen nötig!
	for i = 1, getn(ControlPoints) do
		local transition
		local cp = ControlPoints[i]

		assert(cp.State ~= nil)	
		assert(cp.Name ~= nil)

		-- zuerst die Variante, wo die Variable schon gesetzt ist
        if cp.TimeToGo ~= nil then
		    transition = StateIdle:CreateTransition(CreateTransitionName("DailyJobSequence", "Goto", "IDLE", cp.Name), cp.State)

		    local loc = Locations[cp.Location]
		    assert(loc ~= nil)
		    assert(loc.X ~= nil)
		    assert(loc.Y ~= nil)

			local walk = WalkMode
			if cp.WalkMode then
				walk = cp.WalkMode
			end

			transition:AddCondition(CGdsDbVariable:new(CreateDbVariableName("DailyJobSequence", "LastWaypoint", NpcId), 0, cp.Variable))

			if cp.TimeToLeave then
				local cpNext = ControlPoints[i+1]
				local TimeFrame
				if cpNext then
					TimeFrame = cpNext.TimeToLeave - cp.TimeToLeave
				else
					TimeFrame = 1 - cp.TimeToLeave
				end
				transition:AddCondition(CGdsTimeOfDay:new(cp.TimeToGo, TimeFrame))
			else
				transition:AddCondition(CGdsTimeOfDay:new(cp.TimeToGo, hms(12,0,0)))
			end

		    transition:AddCondition(CGdsFigureNotInRangeCircle:new(NpcId, loc.X, loc.Y, loc.Radius))
		    -- nur goto wenn kein aggro
		    --transition:AddCondition(Negated(FigureHasAggro{NpcId = NpcId, UpdateInterval = 10}))

		    transition:AddAction(CGdsFigureGoto:new(NpcId, loc.X, loc.Y, loc.Radius, GotoNormal, walk))
        end

		-- und jetzt die Variante, wenn noch keine Variable gesetzt ist
        if cp.TimeToGo ~= nil then
		    transition = StateIdle:CreateTransition(CreateTransitionName("DailyJobSequence", "Goto", "IDLE", cp.Name), cp.State)

		    local loc = Locations[cp.Location]
		    assert(loc ~= nil)
		    assert(loc.X ~= nil)
		    assert(loc.Y ~= nil)

			local walk = WalkMode
			if cp.WalkMode then
				walk = cp.WalkMode
			end

			transition:AddCondition(CGdsDbVariable:new(CreateDbVariableName("DailyJobSequence", "LastWaypoint", NpcId), 0, 0))
		    transition:AddCondition(CGdsTimeOfDay:new(cp.TimeToGo, hms(12,0,0)))
		    transition:AddCondition(CGdsFigureNotInRangeCircle:new(NpcId, loc.X, loc.Y, loc.Radius))
		    -- nur goto wenn kein aggro
		    --transition:AddCondition(Negated(FigureHasAggro{NpcId = NpcId, UpdateInterval = 10}))

			-- zusätzliche dailyjobparams conditions einbauen
			if DayCreateParams then
				if getn(DayCreateParams.Conditions) > 0 then
					foreachi(DayCreateParams.Conditions, function(_, cond)
						assert2(type(cond) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(cond)))
						%transition:AddCondition(cond)
					end)
				end
			end

		    transition:AddAction(CGdsFigureGoto:new(NpcId, loc.X, loc.Y, loc.Radius, GotoNormal, walk))
        end
	end

	-- Pass 4: Übergänge von den Goto-States zum Idle State erzeugen (inkl. setzen der DB Variablen)
    --  bzw. Übergänge von den Goto-States zum nächsten Goto State erzeugen
	for i = 1, getn(ControlPoints) do
		local transition
		local cp = ControlPoints[i]

		assert(cp.State ~= nil)
		
        if cp.TimeToLeave ~= nil then
        	-- from any goto state to Idle State
		    transition = cp.State:CreateTransition(CreateTransitionName("DailyJobSequence", "Arrived", cp.Name, "IDLE"), StateIdle)

		    local loc = Locations[cp.Location]
		    assert(loc ~= nil)
		    assert(loc.X ~= nil)
		    assert(loc.Y ~= nil)
		    transition:AddCondition(CGdsFigureInRangeCircle:new(NpcId, loc.X, loc.Y, loc.Radius))
		    if cp.Optional == 0 then
				transition:AddAction(CGdsDbVariableSet:new(CreateDbVariableName("DailyJobSequence", "LastWaypoint", NpcId), 0, DayCreateDBVariableState(cp.Name)))
		    end

			-- optionalen Action Block bei Erreichen des Ziels einfügen
			if cp.Actions ~= nil then
				foreachi(cp.Actions, function(i, item)
					assert2(type(item) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(item)))
					%transition:AddAction(item)
				end)
			end
        else
            -- finde nächsten Controlpunkt heraus
            local inext = i + 1
            if inext > getn(ControlPoints) then
                inext = 1
            end

            local cpnext = ControlPoints[inext]
		    local loc = Locations[cp.Location]
		    assert(loc ~= nil)
		    assert(loc.X ~= nil)
		    assert(loc.Y ~= nil)

			-- wenn nicht loopend dann muss hier ein ende gesetzt werden
			if inext == 1 and DayCreateParams and DayCreateParams.Loop == FALSE then
	            -- erzeuge übergang von goto state zu idle state
	   	        transition = cp.State:CreateTransition(CreateTransitionName("DailyJobSequence", "Finished", cp.Name, "IDLE"), StateIdle)

	   	        -- damit ist der ablauf beendet:
			    transition:AddAction(CGdsDbVariableSet:new(CreateDbVariableName("DailyJobSequence", "LastWaypoint", NpcId), 0, DayCreateDBVariableState("FINISHED!")))

				-- optionalen Action Block bei Erreichen des Ziels einfügen
				if cp.Actions ~= nil then
					foreachi(cp.Actions, function(_i, _item)
						assert2(type(_item) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(_item)))
						%transition:AddAction(_item)
					end)
				end
			else
	            -- erzeuge übergang von goto state zu goto state
	   	        transition = cp.State:CreateTransition(CreateTransitionName("DailyJobSequence", "Arrived", cp.Name, cpnext.Name), cpnext.State)
	
	            -- abfrage, ob aktueller cp erreicht wurde
			    transition:AddCondition(CGdsFigureInRangeCircle:new(NpcId, loc.X, loc.Y, loc.Radius))

			    -- nur goto wenn kein aggro
			    --transition:AddCondition(Negated(FigureHasAggro{NpcId = NpcId, UpdateInterval = 10}))
	
				-- TEST:
			    --transition:AddAction(SetEffect{X = loc.X, Y = loc.Y, Effect = "Lightning", Length = 1500})
			    --transition:AddAction(SetEffect{Effect = "Spawnboss", Length = 1500})

	            -- es war ein wichtiger cp, dann db var aktualisieren
			    if cp.Optional == 0 then
				    transition:AddAction(CGdsDbVariableSet:new(CreateDbVariableName("DailyJobSequence", "LastWaypoint", NpcId), 0, DayCreateDBVariableState(cp.Name)))
			    end
	
				-- optionalen Action Block bei Erreichen des Ziels einfügen
				if cp.Actions ~= nil then
					foreachi(cp.Actions, function(_i, _item) 
						assert2(type(_item) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(_item)))
						%transition:AddAction(_item) 
					end)
				end
	
				local walk = WalkMode
				if cp.WalkMode then
					walk = cp.WalkMode
				end
	
				-- ein zusätzliches goto ist überflüssig am letzten punkt wenn es zum "finish" state geht
				if inext == getn(ControlPoints) and DayCreateParams and DayCreateParams.Loop == FALSE then
					local macht = nix
				else
		            -- zielpunkt des nächsten cp ermitteln
				    local loc = Locations[cpnext.Location]
				    assert(loc ~= nil)
				    assert(loc.X ~= nil)
				    assert(loc.Y ~= nil)
				    transition:AddAction(CGdsFigureGoto:new(NpcId, loc.X, loc.Y, loc.Radius, GotoNormal, walk))
				end

				-- zusätzliche Endbedingungen für den Tagesablauf einbauen
				if DayCreateParams then
					if getn(DayCreateParams.EndConditions) > 0 then
			        	-- from any goto state to Idle State (aborting daily job)
			        	local transitionname = CreateTransitionName("DailyJobSequence", "Abort", cp.Name, "IDLE")
					    transition = cp.State:CreateTransition(transitionname, StateIdle)
					    --print("Daily Job Break Transition: " .. transitionname)
						foreachi(DayCreateParams.EndConditions, function(_, cond)
							assert2(type(cond) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(cond)))
							if tfind(UsedEndConditions, cond) then
								--print("\tnow cloning condition " .. tostring(cond) .. ", please stand by ...")
								cond = cond:Clone()
							end
							--print("\tDailyJob add break sequence condition: " .. tostring(cond))
							%transition:AddCondition(cond)
							tinsert(UsedEndConditions, cond)
						end)
						-- setz die tagesablauf variable beim abbruch auch zurück!
						transition:AddAction(CGdsDbVariableSet:new(CreateDbVariableName("DailyJobSequence", "LastWaypoint", NpcId), 0, 0))
					end
				end
			end

			------------------------------------------------------------------------------------------------

			-- Übergänge von Idle zu den Goto States, abhängig von Goto Variablen
			-- damit NPC nach dialog weiter zum vorigen Waypoint läuft...
			assert(cp.Name ~= nil)
	
			-- nur bei nicht zeitbasierten tagesabläufen!
			if TimeBased ~= 1 then
				-- transition vom Idle State zum goto point
			    transition = StateIdle:CreateTransition(CreateTransitionName("DailyJobSequence", "Goto", "IDLE", cp.Name), cp.State)
			
			    local loc = Locations[cp.Location]
			    assert(loc ~= nil)
			    assert(loc.X ~= nil)
			    assert(loc.Y ~= nil)
			
				local walk = WalkMode
				if cp.WalkMode then
					walk = cp.WalkMode
				end
			
				-- NPC bleibt sonst stehen wenn man ihn nahe eines goto punkts anspricht!
				--transition:AddCondition(CGdsFigureNotInRangeCircle:new(NpcId, loc.X, loc.Y, loc.Radius))
				transition:AddCondition(CGdsDbVariable:new(CreateDbVariableName("DailyJobSequence", "LastWaypoint", NpcId), 0, cp.Variable))
			    -- nur goto wenn kein aggro
			    --transition:AddCondition(Negated(FigureHasAggro{NpcId = NpcId, UpdateInterval = 10}))

			    transition:AddAction(CGdsFigureGoto:new(NpcId, loc.X, loc.Y, loc.Radius, GotoNormal, walk))
			end
        end
	end

    -- wenn kein einziger Kontrollpunkt eine Uhrzeit hat, dann gehe aus dem InitState einfach zum ersten Kontrollpunkt
    if not TimeBased then
        local cp = ControlPoints[1]
		local loc = Locations[cp.Location]

		local walk = WalkMode
		if cp.WalkMode then
			walk = cp.WalkMode
		end

        transition = StateIdle:CreateTransition(CreateTransitionName("DailyJobSequence", "Goto", "IDLE", cp.Name), cp.State)
		
		if DayCreateParams then
			if getn(DayCreateParams.Conditions) > 0 then
				foreachi(DayCreateParams.Conditions, function(_, cond)
					assert2(type(cond) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(cond)))
					%transition:AddCondition(cond)
				end)
			end
		end

		transition:AddCondition(CGdsDbVariable:new(CreateDbVariableName("DailyJobSequence", "LastWaypoint", NpcId), 0, 0))
	    -- nur goto wenn kein aggro
	    --transition:AddCondition(Negated(FigureHasAggro{NpcId = NpcId, UpdateInterval = 10}))

		transition:AddAction(CGdsFigureGoto:new(NpcId, loc.X, loc.Y, loc.Radius, GotoNormal, walk))
    end

	-- Pass 5: Übergänge von den Goto-States zu den Goto-States erzeugen (wenn die Figur einen Idle Job bekommen hat (also abgelenkt wurde))
	for i = 1, getn(ControlPoints) do
		local transition
		local cp = ControlPoints[i]

		assert(cp.State ~= nil)

		-- wenn nicht loopend dann die letzte goto "self" transition nicht anlegen!
		if i == getn(ControlPoints) and DayCreateParams and DayCreateParams.Loop == FALSE then
			local macht = nix
		else
			transition = cp.State:CreateTransition(CreateTransitionName("DailyJobSequence", "Remind", cp.Name, cp.Name), cp.State)
	
			transition:AddCondition(CGdsFigureJob:new(NpcId, CGdsFigureJob.kJobIdle))
			transition:AddCondition(Negated(FigureDominated{}))
		    -- nur goto wenn kein aggro
		    -- transition:AddCondition(Negated(FigureHasAggro{NpcId = NpcId, UpdateInterval = 10}))
	
			local walk = WalkMode
			if cp.WalkMode then
				walk = cp.WalkMode
			end
	
			local loc = Locations[cp.Location]
			assert(loc ~= nil)
			assert(loc.X ~= nil)
			assert(loc.Y ~= nil)
			transition:AddAction(CGdsFigureGoto:new(NpcId, loc.X, loc.Y, loc.Radius, GotoNormal, walk))
		end
	end
	
	-- restart the daily job after death
	if DayCreateParams and DayCreateParams.Loop == FALSCH then
		tinsert(DeathActionData, CGdsDbVariableSet:new(CreateDbVariableName("DailyJobSequence", "LastWaypoint", NpcId), 0, 0))
	end
	
	-- init daily job var with default value 0
	TransitionInit:AddAction(CGdsDbVariableSet:new(CreateDbVariableName("DailyJobSequence", "LastWaypoint", NpcId), 0, 0))
end


function CreateDailyJobSequence()

	-- ist der Npc Bestandteil einer Gruppe?
	if DayFollowTarget ~= nil then

		-- dann bastle einer follow state machine
		DayCreateFollowMode()

	-- ansonsten normalen Tagesablauf abhandeln
	else
		-- dann bastle eines tagessequenz state machine
		DayCreateSequence()
	end

end
