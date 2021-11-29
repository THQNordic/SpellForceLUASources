-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}


-- **DOC** ----------------------------------------------------------
function AddDialogToggleSystem()
	local FuncName = "GDS: AddDialogToggleSystem(): "
	
	-- not in add-on 1 or spellforce!
	if PlatformId < 200 then return end
	
	--assert2(DialogSystemAdded ~= TRUE, FuncName .. "system already in place, please use only once per NPC. System is automatically added by converting dialog txt files with allclear converter!")
	DialogSystemAdded = TRUE
	print(FuncName .. "added to NPC " .. NpcId)

	-- event zum abschalten des dialogs für diesen NPC
	OnEvent
	{
		Conditions = 
		{
			IsGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId, UpdateInterval = 5},
		},
		Actions =
		{
			SetGlobalFlagFalse{Name = "PleaseRemoveDialog_" .. NpcId},
			SetNpcFlagTrue{Name = "DialogIsDisabled"},
			SetNpcFlagFalse{Name = "DialogIsEnabledMainQuest"},
			SetNpcFlagFalse{Name = "DialogIsEnabledSideQuest"},
			RemoveDialog{},
		},
	}
	
	-- event zum anschalten des dialogs für diesen NPC, Type = MainQuest
	OnEvent
	{
		Conditions = 
		{
			IsGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_" .. NpcId, UpdateInterval = 5},
		},
		Actions =
		{
			SetNpcFlagFalse{Name = "DialogIsDisabled"},
			SetNpcFlagTrue{Name = "DialogIsEnabledMainQuest"},
			SetNpcFlagFalse{Name = "DialogIsEnabledSideQuest"},
			SetGlobalFlagFalse{Name = "PleaseEnableMainQuestDialog_" .. NpcId},
			SetGlobalFlagFalse{Name = "PleaseEnableSideQuestDialog_" .. NpcId},
			EnableDialog{},
			SetDialogType{Type = MainQuest},
		},
	}
	
	-- event zum anschalten des dialogs für diesen NPC, Type = SideQuest
	OnEvent
	{
		Conditions = 
		{
			IsGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_" .. NpcId, UpdateInterval = 5},
		},
		Actions =
		{
			SetNpcFlagFalse{Name = "DialogIsDisabled"},
			SetNpcFlagFalse{Name = "DialogIsEnabledMainQuest"},
			SetNpcFlagTrue{Name = "DialogIsEnabledSideQuest"},
			SetGlobalFlagFalse{Name = "PleaseEnableMainQuestDialog_" .. NpcId},
			SetGlobalFlagFalse{Name = "PleaseEnableSideQuestDialog_" .. NpcId},
			EnableDialog{},
			SetDialogType{Type = SideQuest},
		},
	}
end

doc[numdoc] = [[Syntax:<br><code>AddDialogToggleSystem()</code><br>Wird in jeden Dialog eingeführt. Schaltet Dialoge an/aus über globale Flags.<br>3 globale flags steuern das an/abschalten eines NPC Dialogs, die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt. Dies sind die flags, nach dem underscore kommt die NpcId:<br><i>SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},<br>SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},<br>SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},</i><br>Es ist kein Problem mehrfach einen dialog zu disablen bzw. enablen, der Dialog wird immer den zuletzt gesetzten Zustand annehmen. Man kann damit also auch zwischen Main/SideQuest Dialogen umschalten.<br>Für Allclear gibt es ausserdem diese tags:<br><i> >removedialog<.	// schaltet dialog ab<br>>mainquestdialog<.		// ändert dialogtyp in type mainquest (!)<br>>sidequestdialog<.		// ändert dialogtyp in type sidequest (?)</i><br>(Klammern nur vertauscht wegen HTML syntax...)]]
doc[numdoc] = nil
numdoc = numdoc + 1

function VerifyConditionsAndActionsAreNotNil(params, FuncName)
	if params.Conditions then
		foreachi(params.Conditions, function(_, t)
			assert2(t ~= nil, %FuncName .. "ERROR: one of the conditions is nil !! Probably type error in AllClear/LSD file!")
		end)
	end
	
	if params.Actions then
		foreachi(params.Actions, function(_, t)
			assert2(t ~= nil, %FuncName .. "ERROR: one of the actions is nil !! Probably type error in AllClear/LSD file!")
		end)
	end
end

-- **DOC** ----------------------------------------------------------
function OnEndDialog(params)
	local FuncName = "GDS: OnEndDialog(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Conditions, FuncName .. "MISSING PARAMETER: Conditions = ")
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = ")
	params.OnlyOnce = params.OnlyOnce or FALSE
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	VerifyConditionsAndActionsAreNotNil(params, FuncName)

	tinsert(DlgEndEvents, params)
end

doc[numdoc] = [[Syntax:<br><code>OnEndDialog<br>{<br>OnlyOnce = FALSE,<br>Conditions = { ... },<br>Actions = { ... }<br>}</code><br>Wird bei jedem Ende eines dialogs abgefragt, und ggfs. die actions ausgeführt. Kann mehrfach verwendet werden pro NPC.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function OnBeginDialog(_Event)
	local FuncName = "GDS: OnBeginDialog(): "
    if DlgCheckForEndDialog(_Event.Actions) == nil then
    	_Event.Type = "Begin"
    	-- when dialog begins let Npc look at player:
    	if NoSetDirectionInDialog == FALSE then
			tinsert(_Event.Actions, LookAtFigure{Target = 0})
		end
		tinsert(_Event.Actions, LookAtFigure{NpcId = 0, Target = NpcId})
    else
        _Event.Type = "BeginEnd"
    end

	VerifyConditionsAndActionsAreNotNil(_Event, FuncName)
	tinsert(DlgEvents, _Event)
end

doc[numdoc] = [[Syntax:<br><code>OnBeginDialog<br>{<br>Conditions = { ... },<br>Actions = { ... }<br>}</code><br>Wenn der NPC den Befehl erhält einen Dialog zu beginnen und die Conditions wahr sind, dann wird der Dialog gestartet und die Actions ausgeführt. Die Actions sind meist Say, OfferAnswer und Answer. Ein NPC kann mehrere OnBeginDialog in seinem script haben, man muss nur darauf achten das die Conditions immer nur für genau ein OnBeginDialog wahr werden können! Desweiteren können einige Actions in Dialogen nicht ausgeführt werden.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function OnAnswer(_Event)
	local FuncName = "GDS: OnAnswer(): "
    if DlgCheckForEndDialog(_Event.Actions) == nil then
    	_Event.Type = "Answer"
    	-- when dialog begins let Npc look at player:
    	if NoSetDirectionInDialog == FALSE then
			tinsert(_Event.Actions, LookAtFigure{Target = 0})
		end
		tinsert(_Event.Actions, LookAtFigure{NpcId = 0, Target = NpcId})
    else
        _Event.Type = "End"
    end
	
	VerifyConditionsAndActionsAreNotNil(_Event, FuncName)
	tinsert(DlgEvents, _Event)
end

doc[numdoc] = [[Syntax:<br><code>OnAnswer<br>{answerid;<br>Conditions = { ... },<br>Actions = { ... }<br>}</code><br>Wenn der Spieler eine bestimmte Antwort mit der angegebenen AnswerID auswählt, wird diese Antwort präsentiert sofern die Conditions wahr sind. Dadurch werden die angegebenen Actions ausgeführt. Es kann in einem Dialog mehrere OnAnswer mit derselben AnswerID geben, man sollte nur darauf achten das für jedes OnAnswer die Conditions nur für genau ein OnAnswer wahr werden können. Die AnswerId steht am Anfang als Zahl und wird von einem Semikolon (;) gefolgt.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function OnItem(_Event)
	local FuncName = "GDS: OnItem(): "
    if DlgCheckForEndDialog(_Event.Actions) == nil then
    	_Event.Type = "Item"
    	-- when dialog begins let Npc look at player:
    	if NoSetDirectionInDialog == FALSE then
			tinsert(_Event.Actions, LookAtFigure{Target = 0})
		end
		tinsert(_Event.Actions, LookAtFigure{NpcId = 0, Target = NpcId})
    else
        _Event.Type = "End"
    end

	VerifyConditionsAndActionsAreNotNil(_Event, FuncName)
	tinsert(DlgEvents, _Event)
end

doc[numdoc] = [[Syntax:<br><code>OnItem<br>{<br>Conditions = { ... },<br>Actions = { ... }<br>}</code><br>Dieses Event passiert, wenn der NPC ein Item erhält. *untested* ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function Say(params)
	local FuncName = "GDS: Say(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.String, FuncName .. "MISSING PARAMETER: String =")
	params.Color = params.Color or ColorWhite
	params.Tag = params.Tag or ""
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return { Type = "Talk", SubType = "Say", Tag = params.Tag, Message = params.String, Color = params.Color }
end

doc[numdoc] = [[Params: <code>String = "", Color = 0</code><br>Say{String = „Na, aber hallo!“, Color = 0}<br>
Sagt den Satz _String (muss in Anführungszeichen stehen) ... kann man nur als Action in OnBeginDialog und OnAnswer benutzen. Color ist die Farbe des Text, per default auf 0 (weiss).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function Answer(params)
	local FuncName = "GDS: Answer(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.String, FuncName .. "MISSING PARAMETER: String =")
	assert2(params.AnswerId, FuncName .. "MISSING PARAMETER: AnswerId =")
	params.Tag = params.Tag or ""
	params.Color = params.Color or ColorWhite
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return { Type = "Talk", SubType = "Answer", AnswerId = params.AnswerId, Tag = params.Tag, Answer = params.String, Color = params.Color }
end

doc[numdoc] = [[Params: <code>String = "", AnswerId = , Color = 0</code><br>Answer{String = „Gern, geschehen!“, AnswerId = 123, Color = 0}<br>Sagt den Antwortsatz und verzweig als nächstes zum OnAnswer mit der entsprechenden ID ... kann man nur als Action in OnBeginDialog und OnAnswer benutzen. Color ist die Farbe des Text, per default auf 0 (weiss).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function OfferAnswer(params)
	local FuncName = "GDS: OfferAnswer(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.String, FuncName .. "MISSING PARAMETER: String =")
	assert2(params.AnswerId, FuncName .. "MISSING PARAMETER: AnswerId =")
	params.Color = params.Color or ColorWhite
	params.Tag = params.Tag or ""
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return { Type = "Talk", SubType = "OfferAnswer", AnswerId = params.AnswerId, Tag = params.Tag, Answer = params.String, Color = params.Color}
end

doc[numdoc] = [[Params: <code>String = "", AnswerId = , Color = 0</code><br>Gibt dem Spieler multiple choice Antwortmöglichkeiten, jedes OfferAnswer wäre ein Eintrag in der Antwortliste welches bei „Benutzung“ auf die AntwortId verzweigt. Nur als Action in OnBeginDialog bzw. OnAnswer. Color ist die Farbe des Text, per default auf 0 (weiss).]]
doc[numdoc] = nil
numdoc = numdoc + 1


--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------


function DlgCreateTransition(item, fromstate, tostate, number)
	
	-- erzeuge Transition
    local transition = fromstate.State:CreateTransition(CreateTransitionName("DialogSystem", "DlgEvent", fromstate.Name, tostate.Name .. "_#" .. tostring(number)), tostate.State)

	FuncName = "DialogSystem: "

	-- Basisbedingung erzeugen
    if item.Type == "Begin" then
        transition:AddCondition(CGdsDialogBegin:new(NpcId))
		transition:AddAction(CGdsFigureStop:new(NpcId))
    elseif item.Type == "Answer" then
        transition:AddCondition(CGdsDialogAnswer:new(NpcId, item[1]))
    else
        assert(nil)
    end

    -- Zusätzliche Bedingungen erzeugen
	if item.Conditions ~= nil then
		foreachi(item.Conditions, function(i, item)
			-- force quick updates of dialog conditions
			--if item.SetUpdateInterval then
				--print("DIALOG CONDITION UPDATE INTERVAL FORCED TO 1 !!!")
				--item:SetUpdateInterval(1)
			--end
			assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
			%transition:AddCondition(item)
		end)
	end

	-- alle Aktionen erzeugen und dabei die einzelnen zeilen für say und offeraction zu einer einzelnen aktion zusammenfassen
    local talk = CGdsTalk:new()
    local used = { nil }
	local ans = { nil }
    foreachi(item.Actions, function(i, item) 
            if type(item) == "table" and item.Type == "Talk" then
                if item.SubType == "Say" then
                    %talk:SetMessage(item.Tag, item.Message, item.Color)
                elseif item.SubType == "OfferAnswer" then
                    %talk:AddAnswer(item.AnswerId, item.Tag, item.Answer, item.Color)
                elseif item.SubType == "Answer" then
					if %ans[1] then
						print(format("GDS: DialogSystem for NPC %i: multiple 'Answer' statements given in one event handler, use 'OfferAnswer' instead. Accepting only first answer as workaround.", NpcId))
					else
	                    %talk:AddAnswer(item.AnswerId, item.Tag, item.Answer, item.Color, TRUE)
						%ans[1] = 1
					end
				elseif item.SubType == "EndDialog" then
					%used[2] = 1	-- mark that this is a end dialog message 
                else
                    assert(false)
                end
                %used[1] = 1
            else
				assert2(type(item) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(item)))
                %transition:AddAction(item) 
            end
        end)

    if used[1] then
        -- if this message is marked with enddialog then there should be no answers within
        if used[2] then
            -- %$ TODO
        end

		-- add this special talk action
        transition:AddAction(talk)
    end

	return transition
end

function DlgCheckForEndDialog(_Actions)
    local retval = nil

    for i=0,getn(_Actions) do
        local action=_Actions[i]
        if type(action) == "Table" and action.Type == "Talk" and action.SubType == "EndDialog" then
            retval = 1
        end
    end

    return retval
end

function InitDialogSystem()
	DlgEvents = {}
	DlgEndEvents = {}
	NpcHasDialog = nil
	AllowGlobalStatesInDialog = FALSE
	NoSetDirectionInDialog = FALSE
end


function CreateDialogSystem()
	local OtherStates = {}
	local DlgStates = {}
    local EventStates = {}

	-- ohne dialog brauchen wir kein dialogsystem
	if getn(DlgEvents) == 0 then
		return
	end

	-- das flag brauchen wir an anderer stelle, z.b. respawn um das dialogflag zu setzen
	NpcHasDialog = TRUE

    -- gruppiere DlgEvents und suche passende States
    -- %$ nach welchen Regeln sollen States gebildet werden? 
    --   eine Gruppe von erlaubten Antworten bildet einen State
    --   dadurch wird erreicht, daß man durch raten von antwortids sich nicht durch die quests cheaten kann
	tinsert(OtherStates, { Name = StateIdle:GetName():CMbStr(), State = StateIdle })
	foreachi(States, function(_i, _s)
			if	  _s ~= %StateIdle 
			  and _s ~= %StateInit
			  and _s ~= %StateDead 
			  and _s ~= %StateDying 
			  and _s ~= %StateBornDead 
			  then
	  			if AllowGlobalStatesInDialog == TRUE or strfind(_s:GetName():CMbStr(), "SSS:") == nil then
					tinsert(%OtherStates, { Name = _s:GetName():CMbStr(), State = _s })
				end
			end
		end)

    tinsert(DlgStates, { Name = "Begin" })

    foreachi(DlgEvents, function(i, item) 
        if item.Type == "Begin" then
			local from = {}
			for i = 1, getn(%OtherStates) do
				tinsert(from, %OtherStates[i])
			end
			%EventStates[item] = { From = from, To = %DlgStates[1] } 
        elseif item.Type == "BeginEnd" then
			local from = {}
			for i = 1, getn(%OtherStates) do
				tinsert(from, %OtherStates[i])
			end
			%EventStates[item] = { From = from, To = %OtherStates[1] } 
        elseif item.Type == "End" then
            %EventStates[item]= { From = { %DlgStates[1] }, To = %OtherStates[1] } 
        else
            %EventStates[item]= { From = { %DlgStates[1] }, To = %DlgStates[1] } 
        end
    end)

    -- erzeuge States
	foreachi(DlgStates, function(i, item) 
		%DlgStates[i].State = CreateState(CreateStateName("DialogSystem", %DlgStates[i].Name))
	end)

    -- erzeuge Übergänge zwischen den States
	foreachi(DlgEvents, function(i, event)
		assert(getn(%EventStates[event].From) > 0)
		
		-- erzeuge ersten übergang
		local trans
		trans = DlgCreateTransition(event, %EventStates[event].From[1], %EventStates[event].To, i)
		-- setze das "ich rede jetzt" flag...
		trans:AddAction(CGdsFigureSetTalkingFlag:new(NpcId, TRUE))
		trans:AddAction(SetGlobalFlagTrue{Name = "GDS_PlayerIsTalking"})
		if _DEBUG == 1 then
			trans:AddAction(IncreaseGlobalCounter{Name = "GDS_>>_MitNpc_" .. NpcId .. "_AufPlatform_P" .. PlatformId .. "_Geredet"})
		end
		
		-- alle weiteren übergänge sind kopien des ersten
		for j=2, getn(%EventStates[event].From) do
			%EventStates[event].From[j].State:CreateTransitionFromTemplate(trans)
		end
	end)

	-- zentraler dialog beenden state, von ReturnToIdle nach Idle
	StateDialogDone = CreateState(CreateStateName("DialogSystem", "ReturnToIdle"))

	-- erzeuge Übergänge zum ReturnToIdle State nach Dialogende
	foreachi(DlgStates, function(_i, _state)
		assert(_state.State ~= nil)
		local trans = _state.State:CreateTransition(CreateTransitionName("DialogSystem", "DlgEnd", _state.Name, "ReturnToIdle"), StateDialogDone)
	    trans:AddCondition(CGdsDialogEnd:new(NpcId))
	    trans:AddAction(SetNpcTimeStamp{Name = "DialogEndWaitForUpdateInterval"})
		
		local trans = _state.State:CreateTransition(CreateTransitionName("DialogSystem", "PlatformDlgEnd", _state.Name, "ReturnToIdle"), StateDialogDone)
	    trans:AddCondition(IsGlobalFlagTrue {Name = "GDS_PlatformLoaded", UpdateInterval = 10})
		trans:AddAction(SetNpcTimeStamp{Name = "DialogEndWaitForUpdateInterval"})
	end)

	-- hier die dialog beendet actions rein:
	foreachi(DlgEndEvents, function(_i, item)
		local transitionname = CreateTransitionName("DialogSystem", "DlgEnd", "ReturnToIdle_Special#" .. _i, "ReturnToIdle")
		local trans = StateDialogDone:CreateTransition(transitionname, StateIdle)
		foreachi(item.Conditions, function(_j, condition)
			assert2(type(condition) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(condition)))
	    	%trans:AddCondition(condition)
	    end)
		foreachi(item.Actions, function(_k, action)
			assert2(type(action) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(action)))
	    	%trans:AddAction(action)
	    end)

	    -- damit npc sich notfalls wieder in default richtung ausrichtet:
	    if NpcHasIdleGoHome == TRUE then
			trans:AddAction(SetNpcFlagTrue{Name = "IchHabeEinenDialogBeendet"})
		end
		-- setze das "ich rede jetzt" flag zurück...
		trans:AddAction(CGdsFigureSetTalkingFlag:new(NpcId, FALSE))
		trans:AddAction(SetGlobalFlagFalse{Name = "GDS_PlayerIsTalking"})
		if item.OnlyOnce == TRUE then
			trans:AddAction(CGdsRemoveTransition:new("", transitionname))
		end
	end)

	TransDialogDone = StateDialogDone:CreateTransition(CreateTransitionName("DialogSystem", "DlgEnd", "ReturnToIdle_Normal", "_IDLE"), StateIdle)
	TransDialogDone:AddCondition(ODER(IsNpcTimeElapsed{Name = "DialogEndWaitForUpdateInterval", Seconds = 0.3, UpdateInterval = 2}, IsGlobalFlagTrue {Name = "GDS_PlatformLoaded", UpdateInterval = 10}))
    -- damit npc sich notfalls wieder in default richtung ausrichtet:
    if NpcHasIdleGoHome == TRUE then
		TransDialogDone:AddAction(SetNpcFlagTrue{Name = "IchHabeEinenDialogBeendet"})
	end
	-- setze das "ich rede jetzt" flag zurück...
	TransDialogDone:AddAction(CGdsFigureSetTalkingFlag:new(NpcId, FALSE))
	TransDialogDone:AddAction(SetGlobalFlagFalse{Name = "GDS_PlayerIsTalking"})

	-- erzeuge Init Action, die Gd sagt, daß der Npc dialogbereit ist (wg. MouseOver)
	if SpawnDead ~= TRUE then
		print("DIALOGFLAG: set in dialog system for NPC Init Transition... IMPORTANT == TRUE!")
		TransitionInit:AddAction(CGdsFigureSetDialogFlag:new(NpcId, TRUE))
	end

	-- aufräumen
	DlgEvents = {}
end
