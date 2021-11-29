-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}

test = [[
kamera = CreateCameraScript {
		CameraReset(),
		AddLookAt(duration,speed,x,y,z),
		AddLookAtRelative(duration,speed,xoff,yoff,zoff),
		AddLookAtFigure(duration,speed,npcid,x,y,z),
		AddLookAtFigureRelative(duration,speed,npcid,xoff,yoff,zoff),
		.. dasselbe mit AddMoveTo*,
		CameraStart(),
	}

CreateCameraFunction
{
	Name = "KameraFunktion",
	CameraReset(),
	AddLookAt(duration,speed,x,y,z),
	AddMoveTo(duration,speed,x,y,z),
	... ,
	CameraStart(),
}
-- ausführen mit:
KameraFunktion()
]]


---------------------------------------------------------------------------------------------------
-------------------------- LOOKING ----------------------------------------------------------------
---------------------------------------------------------------------------------------------------

LookX, LookY, LookZ = 0,0,0
LookXOff, LookYOff, LookZOff = 0,0,0
LookXOff2, LookYOff2, LookZOff2 = 0,0,0
LookSince, LookUntil, LookSpeed = 0,0,0

-- **DOC** ----------------------------------------------------------
function AddLookAt(duration,speed,x,y,z)
	LookX = x
	LookY = y
	LookZ = z
	LookSince = LookUntil
	LookUntil = LookSince + duration
	LookSpeed = speed
	
	return "\tCamera:ScriptAddLookAt("..LookSince..","..LookUntil..","..LookSpeed..","..LookX..","..LookY..","..LookZ..")\n"
end

doc[numdoc] = [[Params: <code> s.o. </code><br>Definiert den Punkt den die Kamera für 'duration' Sekunden im Blick halten soll, und mit 'speed' auf diesen Punkt einschwenkt bzw. mit ihm mithält. Um den Punkt immer im Blick zu behalten beim Vorbeiflug sollte speed maximal 1 sein, aber möglichst auch nicht kleiner als 0.4 da sonst die Bewegung zu schnell (für den Spieler) werden kann.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function AddLookAtRelative(duration,speed,xoff,yoff,zoff)
	LookXOff = LookX + xoff
	LookYOff = LookY + yoff
	LookZOff = LookZ + zoff
	LookSince = LookUntil
	LookUntil = LookSince + duration
	LookSpeed = speed
	
	return "\tCamera:ScriptAddLookAt("..LookSince..","..LookUntil..","..LookSpeed..","..LookXOff..","..LookYOff..","..LookZOff..")\n"
end

doc[numdoc] = [[Params: <code> s.o. </code><br>Definiert den Punkt den die Kamera für 'duration' Sekunden im Blick halten soll, und mit 'speed' auf diesen Punkt einschwenkt bzw. mit ihm mithält. Um den Punkt immer im Blick zu behalten beim Vorbeiflug sollte speed maximal 1 sein, aber möglichst auch nicht kleiner als 0.4 da sonst die Bewegung zu schnell (für den Spieler) werden kann.<br>Relative heisst hier, das die letzte AddLookAt Position genommen wird, und nur jeweils die xoff, yoff und zoff Parameter auf die Koordinaten draufgerechnet werden (xoff etc. können auch negativ sein). Nützlich, wenn man nur kleine Schritte bei der Fokussierung der Kamera machen will.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function AddLookAtFigure(duration,speed,npcid,x,y,z)
	LookXOff = x or 0
	LookYOff = y or 0
	LookZOff = z or 2
	LookSince = LookUntil
	LookUntil = LookSince + duration
	LookSpeed = speed
	
	return "\tCamera:ScriptAddLookAtRelative("..LookSince..","..LookUntil..","..LookSpeed..","..npcid..","..LookXOff..","..LookYOff..","..LookZOff..")\n"
end

doc[numdoc] = [[Params: <code> s.o. </code><br>Definiert den NPC den die Kamera für 'duration' Sekunden im Blick halten soll, und mit 'speed' auf diesen NPC einschwenkt bzw. mit ihm mithält. Um den NPC immer im Blick zu behalten beim Vorbeiflug sollte speed maximal 1 sein, aber möglichst auch nicht kleiner als 0.4 da sonst die Bewegung zu schnell (für den Spieler) werden kann.<br>x,y,z, sind in diesem Fall die Offsets zur NPC Position, sollten in der Regel 0 sein bzw. für z die 2 da man ja nicht die füsse im Blick haben will. xyz sind optional und müssen nicht angegeben werden, defaultwerte sind 0,0,2.]]
doc[numdoc] = nil
numdoc = numdoc + 1

---------------------------------------------------------------------------------------------------
-------------------------- MOVING -----------------------------------------------------------------
---------------------------------------------------------------------------------------------------

MoveX, MoveY, MoveZ = 0,0,0
MoveXOff, MoveYOff, MoveZOff = 0,0,0
MoveXOff2, MoveYOff2, MoveZOff2 = 0,0,0
MoveSince, MoveUntil, MoveSpeed = 0,0,0


-- **DOC** ----------------------------------------------------------
function AddMoveTo(duration,speed,x,y,z)
	MoveX = x
	MoveY = y
	MoveZ = z
	MoveSince = MoveUntil
	MoveUntil = MoveSince + duration
	MoveSpeed = speed
	
	return "\tCamera:ScriptAddMoveTo("..MoveSince..","..MoveUntil..","..MoveSpeed..","..MoveX..","..MoveY..","..MoveZ..")\n"
end

doc[numdoc] = [[Params: <code> s.o. </code><br>Definiert den Punkt an den sich die Kamera für 'duration' Sekunden bewegen soll (also die Kameraposition ändert sich in Richtung des Punkts). Die Geschwindigkeit wird mit 'speed' festgesetzt, ein Wert von 1 bedeutet das die Kamera nach exakt 'duration' Sekunden am Zielpunkt angelangt ist. Kleinere 'speed' Werte bewegen die Kamera schneller (sie verweilt dann am Endpunkt bis 'duration' Sekunden rum sind, bzw. grössere machen die Kamera langsamer, sie wird den Zielpunkt nicht rechtzeitig erreichen und früher zum nächsten Punkt fliegen. Sinnvolle Werte sind so 0.5 bis 2, in der Regel sollte man die Kamera etwas langsamer fliegen lassen, z.b. 1.2 bis 1.5 damit sie am Zielpunkt nicht zu stark verlangsamt und dann gleich wieder Gas gibt. Ändert aber natürlich auch die Flugbahn ein wenig.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function AddMoveToRelative(duration,speed,xoff,yoff,zoff)
	MoveXOff = MoveX + xoff
	MoveYOff = MoveY + yoff
	MoveZOff = MoveZ + zoff
	MoveSince = MoveUntil
	MoveUntil = MoveSince + duration
	MoveSpeed = speed
	
	return "\tCamera:ScriptAddMoveTo("..MoveSince..","..MoveUntil..","..MoveSpeed..","..MoveXOff..","..MoveYOff..","..MoveZOff..")\n"
end

doc[numdoc] = [[Params: <code> s.o. </code><br>wie AddMoveTo, aber mit offset Koordinaten. D.h. der angesteuerte Punkt ist relativ zum letzten AddMoveTo Punkt. xoff,yoff,zoff können daher auch negativ sein.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function AddMoveToFigure(duration,speed,npcid,x,y,z)
	MoveXOff = x
	MoveYOff = y
	MoveZOff = z
	MoveSince = MoveUntil
	MoveUntil = MoveSince + duration
	MoveSpeed = speed
	
	return "\tCamera:ScriptAddMoveToRelative("..MoveSince..","..MoveUntil..","..MoveSpeed..","..npcid..","..MoveXOff..","..MoveYOff..","..MoveZOff..")\n"
end

doc[numdoc] = [[Params: <code> s.o. </code><br>wie AddMoveTo, nur bewegt sich die Kamera relativ zu einem NPC! Man sollte darauf achten, das entweder z höher liegt als das NPC Model, oder x/y die Kamera entsprechend relativ zur NPC Position verschieben, sonst befindet sich die Kamera in dem 3D Model des NPC und das sieht nicht gut aus.<br>Besonders schön ist es bei dieser Funktion, den speed ein wenig grösser als 1 zu wählen, d.h. die Figur läuft der Kamera langsam davon. Dadurch erreicht man einen meist sehr sanften Flug, aber immer in der Nähe der Figur. Ist der Wert kleiner 1, macht die Kamera nämlich alle abgehakten Wendemanöver der Figur exakt mit und dadurch gibt es entspr. abgehakte Richtungswechsel bei der Kamerafahrt.]]
doc[numdoc] = nil
numdoc = numdoc + 1

---------------------------------------------------------------------------------------------------
-------------------------- SPLINE & DEPLOY ------------------------------------------------------------
---------------------------------------------------------------------------------------------------

SplineSince, SplineUntil, SplineSpeed = 0,0,0

-- **DOC** ----------------------------------------------------------
function AddSpline(duration, platform, filename, begintime)
	SplineSince = SplineUntil
	if begintime and begintime > 0 then SplineSince = begintime end
	SplineUntil = SplineSince + duration
	--SplineSpeed = speed
	
	assert(type(platform) == "string")
	assert(type(filename) == "string")
	local splinefile = "script\\\\" .. platform .. "\\\\" .. filename
	
	return "\tCamera:ScriptAddSpline("..SplineSince..","..SplineUntil..","..SplineSpeed..","..splinefile..")\n"
end

doc[numdoc] = [[Params: <code> s.o. </code><br>Fügt einen Spline Kameraflug hinzu. Die Spline Dateien werden im Spline Tool im Editor angelegt. Die 'duration' (in Sekunden) sollte genauso lang sein wie die Dauer der Spline wenn man möchte das die Spline bis zum Ende ausgeführt wird. 'platform' und 'filename' sind zwei Strings die die Platformnummer und den Dateinamen enthalten. Die Spline Datei muss im \redist\script\p#\ Ordner der entspr. Map liegen. Beispiel:<br>
<code>AddSpline(10, "p1", "fliegmichmalwohinbitte.lua")</code><br>'begintime' ermöglicht es, den Anfang der Spline an beliebiger Stelle in der Kamerafahrt zu legen. Also nach 'begintime' Sekunden von Beginn der Kamerafahrt an wird erst die Spline abgefahren, für 'duration' Sekunden. Der Parameter ist optional!]]
doc[numdoc] = nil
numdoc = numdoc + 1



DeployX, DeployY, DeployZ = 0,0,0
DeployLookX, DeployLookY, DeployLookZ = 0,0,0
DeploySince, DeployUntil = 0,0

-- **DOC** ----------------------------------------------------------
function AddDeploy(duration, x, y, z, lookx, looky, lookz, begintime)
	DeployX = x
	DeployY = y
	DeployZ = z
	DeployLookX = lookx
	DeployLookY = looky
	DeployLookZ = lookz
	DeploySince = DeployUntil
	if begintime and begintime > 0 then DeploySince = begintime end
	DeployUntil = DeploySince + duration
	
	return "\tCamera:ScriptAddDeploy("..DeploySince..","..DeployUntil..","..DeployX..","..DeployY..","..DeployZ..","..DeployLookX..","..DeployLookY..","..DeployLookZ..")\n"
end

doc[numdoc] = [[Params: <code> s.o. </code><br>Setzt die Kamera direkt an eine Position mit entspr. Blickrichtung (harter Schnitt)!! Die Kamera verweilt dort starr für 'duration' Sekunden (auch hier können die Sekunden Nachkommastellen haben, z.b. 0.3 Sekunden). Die Koordinaten sollten klar sein.<br>'begintime' ermöglicht es, den Anfang eines harten Schnittes an beliebiger Stelle in der Kamerafahrt zu legen. Also nach 'begintime' Sekunden von Beginn der Kamerafahrt an wird erst das Deploy wirksam, für 'duration' Sekunden. Der Parameter ist optional!]]
doc[numdoc] = nil
numdoc = numdoc + 1

---------------------------------------------------------------------------------------------------
-------------------------- RESET/START ------------------------------------------------------------
---------------------------------------------------------------------------------------------------

-- **DOC** ----------------------------------------------------------
function CameraReset()
	LookX, LookY, LookZ = 0,0,0
	LookXOff, LookYOff, LookZOff = 0,0,0
	LookXOff2, LookYOff2, LookZOff2 = 0,0,0
	LookSince, LookUntil, LookSpeed = 0,0,0
	
	MoveX, MoveY, MoveZ = 0,0,0
	MoveXOff, MoveYOff, MoveZOff = 0,0,0
	MoveXOff2, MoveYOff2, MoveZOff2 = 0,0,0
	MoveSince, MoveUntil, MoveSpeed = 0,0,0

	SplineSince, SplineUntil, SplineSpeed = 0,0,0
	DeployX, DeployY, DeployZ = 0,0,0
	DeployLookX, DeployLookY, DeployLookZ = 0,0,0
	DeploySince, DeployUntil = 0,0
	
	return "\tCamera:ScriptReset()\n"
end

doc[numdoc] = [[Params: <code> keine Parameter </code><br>Dies muss der erste Befehl sein in einer Kamerafahrt, wenn man alle Kamerapositionen etc. zurücksetzen will. In der Regel sollte der Befehl also immer benutzt werden, es gibt nur die Ausnahme wenn man 2 oder mehr Kamerafahrtenhintereinander schalten will. Aber dann sollte man lieber nur ein script daraus machen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function CameraStart()
	return "\tCamera:ScriptStart()\n"
end

doc[numdoc] = [[Params: <code> keine Parameter </code><br>Hiermit beendet man das Kamerascript. Dies ist der eigentliche Befehl der dann die Kamerafahrt startet.]]
doc[numdoc] = nil
numdoc = numdoc + 1


---------------------------------------------------------------------------------------------------
-------------------------- CREATE PATH ------------------------------------------------------------
---------------------------------------------------------------------------------------------------

-- **DOC** ----------------------------------------------------------
function CreateCameraScript(params)
	local FuncName = "CreateCameraScript(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Script, FuncName .. "MISSING PARAMETER: Script = ")

	local CamStr = ""

	for i = 1, getn(params.Script) do
		CamStr = CamStr .. params.Script[i]
	end
	
	return CamStr
end

doc[numdoc] = [[Params: <code>Script = {...}</code><br>DIES IST KEINE SCRIPT ACTION!<br>Erzeugt eine Variable die später dann bei ExecuteCameraScript als Script Parameter angegeben werden kann. Die Syntax des Befehls sieht so aus:<br><code>CreateCameraScript<br>{<br>&nbsp;Script =<br>&nbsp;{<br>&nbsp;&nbsp;CameraReset(),<br>&nbsp;&nbsp;AddLookAt(22,1,111,222,16),<br>&nbsp;&nbsp;AddMoveTo(22,1,111,234,22),<br>&nbsp;&nbsp;CameraStart(),<br>&nbsp;}<br>}</code><br>und dann wird in irgendeinem Actions = {} Block dieser Befehl ausgeführt:<br><code>ExecuteCameraScript{Script = CamScript}</code>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function CreateCameraFunction(params)
	local FuncName = "CreateCameraFunction(): "
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.Script, FuncName .. "MISSING PARAMETER: Script = ")
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")

	local CamStr = "function " .. params.Name .. "()\n"

	for i = 1, getn(params.Script) do
		CamStr = CamStr .. params.Script[i]
	end
	
	CamStr = CamStr .. "\nend\n"
	
	dostring(CamStr, FuncName)
end

doc[numdoc] = [[Params: <code>Name = , Script = {...}</code><br>DIES IST KEINE SCRIPT ACTION!<br>Um den Befehl zu verwenden, muss man vorher einmal ein <code>doscript("GdsCameraHelper")</code> ausgeführt haben. Die Syntax des Befehls sieht dann so aus:<br><code>CreateCameraFunction<br>{<br>Name = "KameraFunktion",<br>&nbsp;Script =<br>&nbsp;{<br>&nbsp;&nbsp;CameraReset(),<br>&nbsp;&nbsp;AddLookAt(22,1,111,222,16),<br>&nbsp;&nbsp;AddMoveTo(22,1,111,234,22),<br>&nbsp;&nbsp;CameraStart(),<br>&nbsp;}<br>}<br></code>Ausgeführt wird die Funktion dann mit ihrem Namen, also in diesem Fall:<br><code>KameraFunktion()</code><br>Das ganze ist gedacht um Kamerafahrten erstmal ausserhalb eines Scripts testen zu können, ohne danach die Syntax komplett umstellen zu müssen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ExecuteCameraScript(params)
	local FuncName = "GDS: ExecuteCameraScript(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Script, FuncName .. "MISSING PARAMETER: Script =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if Debug and Debug.DisableCutscenes == TRUE and Debug.Developer == TRUE and _DEBUG == TRUE then
		return DebugLog{String = FuncName .. "CutScenes are disabled via config.lua ..."}
	end

	return CGdsExecuteCameraScript:new(params.Script)
end

doc[numdoc] = [[Params: <code>Script = </code><br>Lässt das angegebene Kamerascript laufen. Dies ist eine Action und kann nur in einem Action = {} Block verwendet werden! Das Kamerascript definiert man unbedingt vor diesem Befehl!<br>Die neue Syntax sieht so aus:<br>vor dem "function StateMachine..." kommt folgendes:<br><code>CamScript = CreateCameraScript{ ... }<br></code>und dann wird in irgendeinem Actions = {} Block dieser Befehl ausgeführt:<br><code>ExecuteCameraScript{Script = CamScript}</code><br>Siehe auch:<br><a href=C:\project\main\doc\Kamerasteuerung.doc>Kamerasteuerung.doc</a><br><a href=C:\project\main\redist\script\ConCameraScript.lua>ConCameraScript.lua</a> ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function RotateCameraAroundNpc(params)
	local FuncName = "GDS: RotateCameraAroundNpc(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	if NpcId == nil then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
	else
		params.NpcId = params.NpcId or NpcId
	end
	params.Radius = params.Radius or 5
	params.Height = params.Height or 2
	params.BeginTime = params.BeginTime or 0
	params.Duration = params.Duration or 30
	params.Speed = params.Speed or 2
	params.LookAtHeight = params.LookAtHeight or 2
	params.Points = params.Points or 9
	params.Dump = params.Dump or FALSE
	assert2(getn(tkeys(params)) == 9, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local alpha = 0
	local _x
	local _y
	local CenterX, CenterY = 0, 0

	local d = params.Duration / params.Points
	local ts = params.BeginTime
	local te = ts + d
	local s = (params.Duration / params.Points) * params.Speed

	local CamStr = ""
	CamStr = "\tCamera:ScriptReset()\n"
	--CamStr = CamStr .. "\tCamera:ScriptSplineCreateNpcCutScene(255,255,255,0,0.1)\n"

	for i = 1, params.Points do
		alpha = i*360 / params.Points
		_x = CenterX + params.Radius * cos(alpha)
		_y = CenterY - params.Radius * sin(alpha)
		
--		CamStr = CamStr .. "\tCamera:ScriptAddMoveToRelative("..ts..", "..te..", "..s..", "..params.NpcId..", ".._x..", ".._y..", "..params.Height..")\n"
		if Camera then
			--Camera:ScriptAddMoveToRelative(ts, te, s, params.NpcId, _x, _y, params.Height)
		end
		ts = te
		te = te + d
	end

--	CamStr = CamStr .. "\tCamera:ScriptAddLookAtRelative("..params.BeginTime..", "..params.BeginTime + params.Duration..", 1, "..params.NpcId..", 0, 0, "..params.LookAtHeight..")\n"
	if Camera then
		--Camera:ScriptAddLookAtRelative(params.BeginTime, params.BeginTime + params.Duration, 1, params.NpcId, 0, 0, params.LookAtHeight)
	end
	CamStr = CamStr .. "\tCamera:ScriptStart()\n"
	
	return CamStr
end

doc[numdoc] = [[Params: <code>NpcId = <self>, Radius = 5, Height = 2, BeginTime = 0, Duration = 30, Speed = 2, LookAtHeight = 2, Points = 9, Dump = FALSE</code><br>Der Befehl lässt die Kamera um einen NPC rotieren, er kann sowohl in NPC scripten als auch normal verwendet werden. Als NPC script bei ExecuteCameraScript setzt man ihn so ein:<br><code>kamera = RotateCameraAroundNpc{NpcId = 1928, Points = 6}</code><br>Um ihn in einer Funktion zu verwenden setzt man ihn einfach in die Script = {} Zeile der CreateCameraFunction funktion, z.b. so:<br><code>Script = {RotateCameraAroundNpc{NpcId = 1928, Points = 6}}</code><br>ACHTUNG: in einem NPC script kann es zu UTLString Fehlern kommen da der Befehl potentiell sehr lange Scripte erzeugt. Man sollte dann die Anzahl Points reduzieren.]]
doc[numdoc] = nil
numdoc = numdoc + 1


CutSceneEnd_StopAnyCamera = [[ Camera:ScriptDeactivateControllers(); Camera:SetViewAngles(0.8, 0.8) ]]

-- **DOC** ----------------------------------------------------------
function CreateCutScene(params)
	local FuncName = "GDS: CreateCutScene(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(type(params.Name) == "string", FuncName .. "INVALID PARAMETER: Name = is not a string!")
	-- parameter is obsolete:
	params.CameraScript = ""
	--params.CameraScript = params.CameraScript or ""
	--assert2(params.CameraScript, FuncName .. "MISSING PARAMETER: CameraScript =")
	assert2(type(params.CameraScript) == "string", FuncName .. "INVALID PARAMETER: CameraScript = is not a string!")
	assert2(dostring(params.CameraScript, FuncName .. "CameraScript"), FuncName .. "ERROR: while executing CameraScript!")
	params.BeginConditions = params.BeginConditions or {}
	params.BeginActions = params.BeginActions or {}
	assert2(params.TimedActions, FuncName .. "MISSING PARAMETER: TimedActions =")
	params.PlayOnlyOnce = params.PlayOnlyOnce or TRUE
	assert2(getn(tkeys(params)) == 6, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if Debug and Debug.DisableCutscenes == TRUE and Debug.Developer == TRUE and _DEBUG == TRUE then print("Cutscenes disabled via config.lua!") return end

	local index, value = next(params.TimedActions, nil)
	local counter = 0
	local timeline = {}
	
	while index do
		--print(">>> index: " .. index)
		counter = counter + 1
		tinsert(timeline, index)
		index, value = next(params.TimedActions, index)
	end

	sort(timeline)

	-- create begin state
	local StateBegin = "CutSceneState_" .. params.Name .. "_Begin"
	local TimerName = "CutSceneTimer_" .. params.Name
	NewState{Name = StateBegin}

	-- create begin transition
	tinsert( params.BeginConditions, 1, FigureAlive{NpcId = Avatar} )
	tinsert( params.BeginConditions, IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 10} )
	tinsert( params.BeginActions, CutSceneBegin() )
	if params.CameraScript ~= "" then
		tinsert( params.BeginActions, ExecuteCameraScript{Script = params.CameraScript} )
	end
	tinsert( params.BeginActions, SetNpcTimeStamp{Name = TimerName} )
	tinsert( params.BeginActions, Stop{NpcId = Avatar} )
		
	AddTransition
	{
		From = "_IDLE", To = StateBegin,
		RemoveTransitionAfterUse = params.PlayOnlyOnce,
		Conditions = params.BeginConditions,
		Actions = params.BeginActions,
	}

	local FromState = StateBegin
	local ToState = nil

	print("Creating Cutscene: " .. params.Name)
	-- create cutscene states & transitions
	for i = 1, getn(timeline) do
		local timestamp = timeline[i]
		local timediff = timeline[i-1] or 0
		timediff = timestamp - timediff
		--print("cutscene timedaction #" .. i .. " at timestamp " .. timestamp .. " the timediff is " .. timediff)
		
		if params.TimedActions[timestamp] then
			--print("["..timestamp.."] ")
			--dump(params.TimedActions[timestamp])

			local conditions = {}
			tinsert(conditions, IsNpcTimeElapsed{Name = TimerName, Seconds = timediff / 10, UpdateInterval = 1})
			if tfind(params.TimedActions[timestamp], WaitForEndOfSpeech) then
				-- warte bis sprache zu ende
				-- bei cutscenes die "waitforendofspeech" condition abschalten (da default zeit 8 sekunden ist)
				--
				--

				-- hier müssen 2 abfragen rein (leider), weil aus irgendeinem unerfindlichen grund
				-- das verodern sonst nicht funktioniert (bedingung wird nie true wenn Debug == nil)
				if not Debug then
					local cond = Negated(CGdsIsSpeechPlaying:new())
					cond:SetUpdateInterval(1)
					local cond2 = IsNpcTimeElapsed{Name = TimerName, Seconds = 30, UpdateInterval = 10}
					local WaitForSpeechOrBreakCondition = ODER(cond, cond2)
					tinsert(conditions, WaitForSpeechOrBreakCondition)
					
				elseif Debug and Debug.DisableSpeechConditionInCutscenes ~= TRUE then
					local cond = Negated(CGdsIsSpeechPlaying:new())
					cond:SetUpdateInterval(1)
					local cond2 = IsNpcTimeElapsed{Name = TimerName, Seconds = 30, UpdateInterval = 10}
					local WaitForSpeechOrBreakCondition = ODER(cond, cond2)
					tinsert(conditions, WaitForSpeechOrBreakCondition)
				end

				--local f = openfile("speech_condition.log", "a+")
				--write(f, "wait for end of speech condition has been added...\n")
				--closefile(f)

				--
				--
				local index = tfind(params.TimedActions[timestamp], WaitForEndOfSpeech)
				tremove(params.TimedActions[timestamp], index)
			end

			local actions = {}
			if i == getn(timeline) then
				ToState = "_IDLE"
				tinsert( actions, SetNoFightFlagFalse{NpcId = Avatar} )
				tinsert( actions, ExecuteCameraScript{Script = CutSceneEnd_StopAnyCamera} )
				tinsert( actions, CutSceneEnd() )
			else
				ToState = "CutSceneState_" .. params.Name .. "_#" .. i
				NewState{Name = ToState}
			end
			
			foreachi(params.TimedActions[timestamp], function(i, action)
				tinsert(%actions, action)
			end)

			-- neuen timer setzen
			tinsert( actions, SetNpcTimeStamp{Name = TimerName} )
			
			AddTransition
			{
				From = FromState, To = ToState,
				RemoveTransitionAfterUse = params.PlayOnlyOnce,
				Conditions = conditions,
				Actions = actions,
			}
			
			FromState = ToState
		end
	end
end

doc[numdoc] = [[Params: <code>CreateCutScene<br>{<br>Name = "KameraFahrt2003" , PlayOnlyOnce = TRUE , CameraScript = [obsolete parameter],<br>BeginConditions =<br>{<br>-- bedingungen, die angeben wann die cutscene gestartet werden soll (erforderlich)<br>
IsGlobalFlagTrue{Name = "GorinStartLandshow"},<br>},<br>BeginActions =<br>{<br>	-- schliesst automatisch mit ein: <br>	-- SetGlobalTimeStamp{Name = "KameraFahrt2003"},<br>-- ExecuteCameraScript{Script = TestKameraFahrt},<br>
-- CutSceneBegin(),<br>	-- optional weitere actions zu beginn der cutscene:<br>	RemoveDialog{NpcId = 2664},<br>},<br>TimedActions =<br>{<br>-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:<br>
[10] = <br>{ <br>CutSceneSay{NpcId = 2664 , String = "blabla bra bra"},<br>},<br>[15] = <br>{<br>CutSceneSay{NpcId = 2664 , String = "laber"},<br>RevealUnExplored {X = 298,Y = 124, Range = 20},<br>},<br>	[23] = <br>	{<br>CutSceneSay{NpcId = 2664 , String = "häh?"},<br>
-- letzte action beinhaltet automatisch (sicherstellen das kamerafahrt 2-3 sekunden überhang hat):<br>-- CutSceneEnd()<br>},<br>},<br>}<br></code><br>
Erzeugt eine CutScene inkl. Kamerafahrt. Name ist der Name der Cutscene (muss unique sein). Kamerascript ist genau das. BeginConditions sind die Anfangsconditions, soz. der Auslöser. BeginActions entsprechend die Start-Actions. TimedActions gibt die Zeitpunkt in eckigen Klammern an (in GD Steps = Sekunden * 10), zu der jeweils die Actions gehören die dann ausgeführt werden sollen.]]
doc[numdoc] = nil
numdoc = numdoc + 1


REM = [[

CreateCutScene
{
	Name = "KameraFahrt2003", CameraScript = TestKameraFahrt,
	BeginConditions =
	{
		-- bedingungen, die angeben wann die cutscene gestartet werden soll (erforderlich)
		IsGlobalFlagTrue{Name = "GorinStartLandshow"},
	},
	BeginActions =
	{
		-- schliesst automatisch mit ein: 
		-- SetGlobalTimeStamp{Name = "KameraFahrt2003"},
		-- ExecuteCameraScript{Script = TestKameraFahrt},
		-- CutSceneBegin(),
		
		-- optional weitere actions zu beginn der cutscene:
		RemoveDialog{NpcId = 2664},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:
		[00] = 
		{ 
			CutSceneSay{NpcId = 2664 , String = "blabla bra bra"},
		},
		[10] = 
		{
			CutSceneSay{NpcId = 2664 , String = "laber"},
			RevealUnExplored {X = 298,Y = 124, Range = 20},
		},
		[23] = 
		{
			CutSceneSay{NpcId = 2664 , String = "häh?"},

			-- letzte action beinhaltet automatisch (sicherstellen das kamerafahrt 2-3 sekunden überhang hat):
			-- CutSceneEnd()
		},
	},
}

]]