-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}


-- hier werden states & transitions "on the fly" erzeugt
com = [[
STATESYSTEM:
NewState{Name = "test1"}
NewState{Name = "test2"}

AddTransition
{
	From = "_IDLE", To = "test1",
	Conditions = {
		...
	},
	Actions = {
		...
	},
}
]]
com = nil


-- **DOC** -------------------------------------------------------------------------------
function NewState(params)
	local FuncName = "GDS: NewState(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(type(params.Name) == "string", FuncName .. "INVALID PARAMETER: Name is not a string!")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	assert2(tfind(StateSystemNames, params.Name) == nil, FuncName .. "STATE NAME ALREADY IN USE! State = \"" .. params.Name .. "\"")
	tinsert(StateSystemNames, params.Name)

	--print(FuncName .. "\"" .. params.Name .. "\"")
end

doc[numdoc] = [[<code>Params: Name = </code><br>Legt einen neuen State mit diesem Namen an. Der Name muss unique sein! Zu einem State kann mittels AddTransition verzweigt werden. Innerhalb eines States werden nur die Transitions geprüft, die von diesem State wegführen, somit lassen sich States prima für strikt lineare oder verzweigende Logikabläufe verwenden, da vorige Transitions nicht mehr weiter geprüft werden. Es werden keine transitions für globale Events, Dialoge, Respawn, usw. in NewState states angelegt - das sollte aber kein Problem darstellen, sondern ist gewünscht, insbesondere bei CutScenes. Allerdings sollte man bei Verwendung von NewState() auf Tagesabläufe verzichten, da diese intern neue States erzeugen und man somit u.U. den Tagesablauf oder die neuen States unterbricht bzw. ein Teil davon gar nicht ansprechbar ist.<br>States stellt man sich am besten als Allclear Diagramm vor, Blöcke sind States, Transitions sind Verzweigungen bzw. Verbindungslinien.<br>Beispiel:<br><code>NewState{Name = "test"}</code>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -------------------------------------------------------------------------------
function AddTransition(params)
	local FuncName = "GDS: AddTransition(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.From, FuncName .. "MISSING PARAMETER: From =")
	assert2(type(params.From) == "string", FuncName .. "INVALID PARAMETER: From is not a string!")
	assert2(params.To, FuncName .. "MISSING PARAMETER: To =")
	assert2(type(params.To) == "string", FuncName .. "INVALID PARAMETER: To is not a string!")
	assert2(params.Conditions, FuncName .. "MISSING PARAMETER: Conditions =")
	params.Actions = params.Actions or {}
	params.RemoveTransitionAfterUse = params.RemoveTransitionAfterUse or FALSE
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- %$ TODO: prüfen auf doppelte transitions! (From & To identisch mit From & To anderer Transition)
	tinsert(StateSystemTransitions, params)

	--print(FuncName .. "\"" .. tostring(params.From) .. "\" >> \"" .. tostring(params.To) .. "\"")
end

doc[numdoc] = [[<code>Params: From = , To = , RemoveTransitionAfterUse = FALSE , Conditions = {...} , Actions = {...}</code><br>Eine Transition bildet den Übergang von einem State in einen anderen. Es wird vom From State in den To State verzweigt, wenn alle Conditions wahr sind. Dabei werden dann auch alle Actions ausgeführt. Im nächsten State werden dann nur die von dem State abzweigenden Transitions auf deren Conditions geprüft. Es ist aber auch möglich, eine Transition auf denselben State zu haben. Dabei wird dann kein State-Wechsel vollzogen sondern lediglich die Actions ausgeführt wenn alle Conditions wahr sind (man muss hierbei aber darauf achten das man keine Endlosschleife erzeugt!).<br>Einen Sonderstatus nimmt der "_IDLE" State ein, das ist im Moment der einzige State von dem die erste (manuell erzeugte) Transition abgehen kann. Der "_IDLE" State ist der State in dem der NPC sich befindet nachdem die Map geladen wurde, und der State hat NICHTS mit dem Idle Job zu tun, d.h. die Figur kann in einem Kampf sein aber StateMachine-seitig sich weiter im "_IDLE" State befinden (man könnte ihn auch den "default" State nennen).<br>Ein NPC hat normalerweise folgende States:<br><br><b>"_INIT"</b> == der erste State nachdem die Map geladen wurde, von diesem wird sofort automatisch in den "_IDLE" State verzweigt (wobei die InitActions ausgeführt werden, die hängen alle an der Transition von "_INIT" nach "_IDLE")<br><b>"_IDLE"</b> == quasi der default State, der NPC wird sich StateMachine-mässig immer in diesem State befinden, es sei denn er hat einen Tagesablauf oder einen Dialog. Dies ist auch momentan der einzige State von dem man mittels NewState/AddTransition verzweigen kann!<br><b>"DEAD"</b> == dieser State existiert wenn der NPC einen Respawn Befehl hat. Solange der NPC tot ist verweilt die StateMachine in diesem State. Das besondere daran ist, das der NPC nur aufgrund des Respawn Timers und evtl. vorhandener Respawn Conditions aus diesem State wieder rausgeht, wobei automatisch der (re)spawn der Figur (in der Transition von "DEAD" nach "_IDLE") ausgelöst wird.<br><b>DialogStates</b> == wenn der NPC einen Dialog hat, wird er ein oder mehrere Dialog States haben. Diese sind nach einer einfachen Regel erstellt: eine Gruppe erlaubter Antworten erzeugt einen State, wobei die Antworten jeweils auf einen neuen State zeigen. Wenn man einen Dialog beendet, geht das DialogStateSystem automatisch in den "_IDLE" state zurück.<br><b>TagesablaufStates</b> == wenn der NPC einen Tagesablauf (AddControlPoint, AddLoopCP, u.ä.) durchführt, geschieht das auch in mehreren States. Dabei ist jeder Goto Punkt ein eigener State. Ausgenommen davon ist im Moment (dummerweise) OnIdleWalkPath, das mit dem globalen Event System erstellt wurde (nicht unproblematisch, re-design angedacht).<br><b>Globale Events</b> == sind keine States und erzeugen auch keine, vielmehr sind es Transitions die an jeden (!) State angehängt werden (ausgenommen: "_INIT", "DEAD" und auf Wunsch auch nicht an DialogStates) und auf den aktuellen State zurückverzweigen. Also eine Transition <code>From = "test", To = "test"</code> - was bei AddTransition erlaubt ist aber nicht auf den "_IDLE" state angewandt werden sollte, denn dafür sind die globalen Events zuständig wie z.b. OnEvent{}.<br>Beispiel eines simplen "solange der Spieler in Range ist erzeuge Fog effect":<br><br><code>AddTransition<br>{<br>From = "_IDLE", To = "test",<br>Conditions = {FigureInRange{X = 100, Y = 200, Range = 10}},<br>Actions = {SetEffect{Effect = "Fog", X = 100, Y  = 200, Length = 5000}},<br>}<br><br>AddTransition<br>{<br>From = "test", To = "_IDLE",<br>Conditions = {Negated(FigureInRange{X = 100, Y = 200, Range = 10}) },<br>Actions = {SetEffect{Effect = "AcidCloud", X = 110, Y  = 220, Length = 5000}},<br>}</code><br><br>Wer AllClear installiert hat kann sich das Diagramm einer typischen <a href=file://C:\project\main\doc\Script\NpcStateMachine.ACD>NPC Statemachine</a> hier ansehen.]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** -------------------------------------------------------------------------------
function TutorialTextFlow(params)
	local FuncName = "GDS: TutorialTextFlow(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.From, FuncName .. "MISSING PARAMETER: From =")
	assert2(type(params.From) == "string", FuncName .. "INVALID PARAMETER: From is not a string!")
	assert2(params.To, FuncName .. "MISSING PARAMETER: To =")
	assert2(type(params.To) == "string", FuncName .. "INVALID PARAMETER: To is not a string!")
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions =")
	assert2(type(params.Actions) == "table", FuncName .. "INVALID PARAMETER: Actions is not a table!")
	params.RemoveTransitionAfterUse = TRUE
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	TextFlowCounter = TextFlowCounter + 1

	for i = 1, getn(params.Actions) do
		local actions = params.Actions[i]
		--print(FuncName .. i)

		local newparams = {}
		if i == 1 then
			newparams.From = params.From
			tinsert(actions, 1, SetInfoText{Tag = "", String = "", Color = ColorWhite})
		else
			newparams.From = "TutorialTextFlow#" .. TextFlowCounter .. "_State" .. i - 1
			--print(FuncName .. newparams.From)
		end
		if i == getn(params.Actions) then
			newparams.To = params.To
		else
			NewState{Name = "TutorialTextFlow#" .. TextFlowCounter .. "_State" .. i}
			newparams.To = "TutorialTextFlow#" .. TextFlowCounter .. "_State" .. i
			--print(FuncName .. newparams.To)
		end
		
		newparams.RemoveTransitionAfterUse = params.RemoveTransitionAfterUse
		newparams.Conditions = {}
		newparams.Actions = actions
		AddTransition(newparams)
	end
end

doc[numdoc] = [[<code>Params: From = , To = , Actions = { [1] = {..}, ... }</code><br>Nur fürs Tutorial. Führt eine Action nach der anderen aus, also eigentlich nur SetInfoText, sobald die vorige Sprachausgabe beendet wurde. Der letzte Text bleibt solange angezeigt bis der nächste kommt.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function PlatformInitAction(action, force)
	local FuncName = "GDS: PlatformInitAction(): "
	assert2(type(action) == "userdata", FuncName .. "wrong data type!")
	--assert2(NpcId == 0, FuncName .. "ONLY ALLOWED IN PLATFORM SCRIPT (n0.lua) !!")
	if force ~= TRUE then
		assert2(SpawnDead ~= TRUE, FuncName .. "can NOT be used together with SpawnOnlyWhen() !!!")
	end
	
	--print("PlatformIniAction: insert action, Npc " .. NpcId)
	tinsert(PlatformInitActions, action)
	PlatformInitActionCalled = TRUE
end

doc[numdoc] = [[Syntax:<br><code>PlatformInitAction(action)</code><br>Eine Action die jedes mal ausgeführt wird, wenn der Spieler diese Karte betritt! Dafür gibt es mehrere Varianten: betreten durch ein Portal, betreten per Bindstone Reise sowie betreten nach Spielertod auf anderer Karte und Wiederbelebung auf dieser Karte.<br>Hinweis: die Actions werden erst ca. 1 Sekunde nachdem das scripting gestartet wurde ausgeführt!]]
doc[numdoc] = nil
numdoc = numdoc + 1



function InitStateSystem()
	StateSystemNames = {}
	StateSystemStates = {}
	StateSystemTransitions = {}

	-- platform init
	PlatformInitActions = {}
	PlatformInitActionCalled = FALSE
	
	TextFlowCounter = 0
end

-- erzeuge alle manuell erzeugten states und transitions
function CreateStateSystem()
	FuncName = "GDS: CreateStateSystem(): "

	-- erstmal die plattform events reinhacken:
	-- Platform loaded event
	if NpcId == 0 then
		-- das entspr. flag abfragen und timer setzen
		NewState{Name = "DeferredPlatformInitState"}
		AddTransition
		{
			From = "_IDLE", To = "DeferredPlatformInitState",
			Conditions = {
				IsGlobalFlagTrue{Name = "GDS_PlatformLoaded", UpdateInterval = 3},
			},
			Actions = {
				SetGlobalTimeStamp{Name = "GDS_PlatformLoadedResetTimer"},
				--ShowDebugText{String = "The Player has entered a new Platform (different than the previous one)!", Color = ColorPink},
			},
		}

		--print("PlatformIniAction: use actions, Npc " .. NpcId)
		local actions = {}
		foreachi(PlatformInitActions, function(i, action)
			tinsert(%actions, action)
		end)
		tinsert(actions, ClearGlobalTimeStamp{Name = "GDS_PlatformLoadedResetTimer"})
		tinsert(actions, SetGlobalFlagFalse{Name = "GDS_PlatformLoaded"})
		--tinsert(actions, SetEffect{Effect = "Loot", NpcId = Avatar, Length = 13210})

		-- kurze zeit nach plattform load das flag zurücksetzen, 
		-- bis dahin sollten alle plattform events durchgelaufen sein...
		AddTransition
		{
			From = "DeferredPlatformInitState", To = "_IDLE",
			Conditions = {
				IsGlobalTimeElapsed{Name = "GDS_PlatformLoadedResetTimer", Seconds = 2, UpdateInterval = 1},
			},
			Actions = actions,
		}

	-- variante für alle anderen NPCs
	elseif getn(PlatformInitActions) > 0 then
		-- das entspr. flag abfragen und timer setzen
		NewState{Name = "DeferredPlatformInitState"}
		AddTransition
		{
			From = "_IDLE", To = "DeferredPlatformInitState",
			Conditions = {
				IsGlobalFlagTrue{Name = "GDS_PlatformLoaded", UpdateInterval = 3},
			},
			Actions = {
			},
		}

		--print("PlatformIniAction: use actions, Npc " .. NpcId)
		local actions = {}
		foreachi(PlatformInitActions, function(i, action)
			tinsert(%actions, action)
		end)
		--tinsert(actions, SetEffect{Effect = "Loot", NpcId = Avatar, Length = 13210})

		-- kurze zeit nach plattform load das flag zurücksetzen, 
		-- bis dahin sollten alle plattform events durchgelaufen sein...
		AddTransition
		{
			From = "DeferredPlatformInitState", To = "_IDLE",
			Conditions = {
				IsGlobalFlagFalse{Name = "GDS_PlatformLoaded", UpdateInterval = 1},
			},
			Actions = actions,
		}
	end
	
	
	-- erzeuge alle states
	foreachi(StateSystemNames, function (_i, _Name)
		local State = CreateState("SSS: " .. _Name)
		assert2(State, %FuncName .. "could not create State \"" .. _Name .. "\" for some reason!")
		tinsert(%StateSystemStates, State)
	end)

	-- der _IDLE state ist immer mit dabei
	tinsert(StateSystemNames, "_IDLE")
	tinsert(StateSystemStates, StateIdle)

	-- disabled ...
	REM = [[
	if getn(StateSystemNames) > 1 then
		-- debug dumps
		print("---------------- begin dump ------------------")
		print(FuncName .. "Names:")
		dump(StateSystemNames)
		print(FuncName .. "States:")
		dump(StateSystemStates)
		print(FuncName .. "Transitions:")
		foreachi(StateSystemTransitions, function (_i, _Transition)
			dump(_Transition)
		end)
		print("----------------- end dump -------------------")
	end
	]]
	
	-- erzeuge alle transitions
	foreachi(StateSystemTransitions, function (_i, _Transition)
		local NameFrom		= _Transition.From
		local NameTo		= _Transition.To
		local Conditions	= _Transition.Conditions
		local Actions		= _Transition.Actions
		local Remove		= _Transition.RemoveTransitionAfterUse

		local StateFromId	= tfind(StateSystemNames, NameFrom)
		local StateToId		= tfind(StateSystemNames, NameTo)
		local StateFrom		= StateSystemStates[StateFromId]
		local StateTo		= StateSystemStates[StateToId]
		assert2(StateFrom, %FuncName .. "could not find FROM state: \"" .. NameFrom .. "\"")
		assert2(StateTo, %FuncName .. "could not find TO state: \"" .. NameTo .. "\"")
	
		local NameTrans = CreateTransitionName("StateSystem", "Transition_" .. (_i), StateFrom:GetName():CMbStr(), StateTo:GetName():CMbStr())
		local Transition = StateFrom:CreateTransition(NameTrans, StateTo)
		--print(%FuncName .. "new trans.: " .. NameTrans)
		
		-- add conditions & actions here ...
		foreachi(Conditions	, function (_i, _condition)
			assert2(type(_condition) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(_condition)))
			%Transition:AddCondition(_condition)
		end)
		foreachi(Actions	, function (_i, _action)
			assert2(type(_action) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(_action)))
			%Transition:AddAction(_action)
		end)
		
		if Remove == TRUE then
			--print(%FuncName .. "add remove transition: " .. NameTrans)
			Transition:AddAction(CGdsRemoveTransition:new("", NameTrans))
		end
	end)
end
