-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}

REM = [[

OnLoadingPatchEvent
{
	Bugzilla = 9999,
	Changelist = 44444,
	Description = "fix für 'nen bug",
	ApplyOnlyWhenSavegameVersion = 100,
	--ApplyOnlyWhenGameVersion = 102,	-- not used!
	Conditions = {
	},
	Actions = {
	},
}

]]

-- **DOC** --------------------------------------------------------------------------------
function OnLoadingPatchEvent(params)
	local FuncName = "GDS: OnLoadingPatchEvent(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Conditions, FuncName .. "MISSING PARAMETER: Conditions = { ... },")
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = { ... },")
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	assert2(params.Bugzilla, FuncName .. "MISSING PARAMETER: Bugzilla = ")
	params.Bugzilla = tostring(params.Bugzilla)
	assert2(params.Changelist, FuncName .. "MISSING PARAMETER: Changelist = ")
	params.Changelist = tostring(params.Changelist)
	assert2(params.Description, FuncName .. "MISSING PARAMETER: Description = ")
	params.Description = tostring(params.Description)
	params.ApplyOnlyWhenSavegameVersion = params.ApplyOnlyWhenSavegameVersion or 0
	params.ApplyOnlyWhenSavegameVersionBefore = params.ApplyOnlyWhenSavegameVersionBefore or 0
	--assert2(params.ApplyOnlyWhenGameVersion, FuncName .. "MISSING PARAMETER: ApplyOnlyWhenGameVersion = ")
	assert2(getn(tkeys(params)) == 7, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- insert into list
	tinsert(PatchEvents, params)
end

doc[numdoc] = [[Syntax:<br><code>OnLoadingPatchEvent<br>{<br><br>}</code><br>...alle Angaben wie Bugzilla, Changelist, usw. dürfen nach mastern des patches NICHT MEHR VERÄNDERT WERDEN !!!]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** --------------------------------------------------------------------------------
function OnRepeatingPatchEvent(params)
	local FuncName = "GDS: OnRepeatingPatchEvent(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Conditions, FuncName .. "MISSING PARAMETER: Conditions = { ... },")
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = { ... },")
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	assert2(params.Bugzilla, FuncName .. "MISSING PARAMETER: Bugzilla = ")
	params.Bugzilla = tostring(params.Bugzilla)
	assert2(params.Changelist, FuncName .. "MISSING PARAMETER: Changelist = ")
	params.Changelist = tostring(params.Changelist)
	assert2(params.Description, FuncName .. "MISSING PARAMETER: Description = ")
	params.Description = tostring(params.Description)
	params.ApplyOnlyWhenSavegameVersion = params.ApplyOnlyWhenSavegameVersion or 0
	params.ApplyOnlyWhenSavegameVersionBefore = params.ApplyOnlyWhenSavegameVersionBefore or 0
	--assert2(params.ApplyOnlyWhenGameVersion, FuncName .. "MISSING PARAMETER: ApplyOnlyWhenGameVersion = ")
	assert2(getn(tkeys(params)) == 7, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	params.AllowRepeating = TRUE

	-- insert into list
	tinsert(PatchEvents, params)
end

doc[numdoc] = [[Syntax:<br><code>OnRepeatingPatchEvent<br>{<br><br>}</code><br>...alle Angaben wie Bugzilla, Changelist, usw. dürfen nach mastern des patches NICHT MEHR VERÄNDERT WERDEN !!!]]
doc[numdoc] = nil
numdoc = numdoc + 1



-- **DOC** --------------------------------------------------------------------------------
function OnPersistentPatchEvent(params)
	local FuncName = "GDS: OnPersistentPatchEvent(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Conditions, FuncName .. "MISSING PARAMETER: Conditions = { ... },")
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = { ... },")
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	assert2(params.Bugzilla, FuncName .. "MISSING PARAMETER: Bugzilla = ")
	params.Bugzilla = tostring(params.Bugzilla)
	assert2(params.Changelist, FuncName .. "MISSING PARAMETER: Changelist = ")
	params.Changelist = tostring(params.Changelist)
	assert2(params.Description, FuncName .. "MISSING PARAMETER: Description = ")
	params.Description = tostring(params.Description)
	params.ApplyOnlyWhenSavegameVersion = params.ApplyOnlyWhenSavegameVersion or 0
	params.ApplyOnlyWhenSavegameVersionBefore = params.ApplyOnlyWhenSavegameVersionBefore or 0
	--assert2(params.ApplyOnlyWhenGameVersion, FuncName .. "MISSING PARAMETER: ApplyOnlyWhenGameVersion = ")
	assert2(getn(tkeys(params)) == 7, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	OnLoadingPatchEvent
	{
		Bugzilla = params.Bugzilla,
		Changelist = params.Changelist,
		Description = "PersistenceFlag",
		ApplyOnlyWhenSavegameVersion = params.ApplyOnlyWhenSavegameVersion,
		ApplyOnlyWhenSavegameVersionBefore = params.ApplyOnlyWhenSavegameVersionBefore,
		Conditions = {
			-- keine
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PersistentPatchEvent_v" .. params.ApplyOnlyWhenSavegameVersion .. "_Bug#" .. params.Bugzilla .. "_CL#" .. params.Changelist .. "__" .. params.Description},
			SetGlobalFlagTrue{Name = "PersistentPatchEvent_Before_v" .. params.ApplyOnlyWhenSavegameVersionBefore .. "_Bug#" .. params.Bugzilla .. "_CL#" .. params.Changelist .. "__" .. params.Description},
		},
	}

	tinsert(params.Conditions, 1, IsGlobalFlagTrue{Name = "PersistentPatchEvent_v" .. params.ApplyOnlyWhenSavegameVersion .. "_Bug#" .. params.Bugzilla .. "_CL#" .. params.Changelist .. "__" .. params.Description})

	OnLoadingPatchEvent
	{
		Bugzilla = params.Bugzilla,
		Changelist = params.Changelist,
		Description = params.Description,
		ApplyOnlyWhenSavegameVersion = 0,
		ApplyOnlyWhenSavegameVersionBefore = 0,
		Conditions = params.Conditions,
		Actions = params.Actions,
	}

end

doc[numdoc] = [[Syntax:<br><code>OnPersistentPatchEvent<br>{<br><br>}</code><br>...alle Angaben wie Bugzilla, Changelist, usw. dürfen nach mastern des patches NICHT MEHR VERÄNDERT WERDEN !!!]]
doc[numdoc] = nil
numdoc = numdoc + 1


----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

function InitPatchSystem()
	PatchEvents = {}

    PatchInit = nil
	PatchIdle = nil
	PatchDone = nil
	PatchMachine = nil
    PatchStates = { }
end

function CreatePatchSystem()
	FuncName = "PatchSystem: "

	-- early out, if there are no patch events
	if getn(PatchEvents) == 0 then return end

	if PlatformId >= 100 then
		UI = 50
	else
		UI = 100
	end

	-- erzeuge neue StateMachine
	PatchMachine = GdsMain:CreateStateMachine("_PATCH_P" .. PlatformId, kGdsStateMachineTypePatch, 0)
    assert(PatchMachine ~= nil, FuncName .. "Error creating Patch Statemachine!")

	-- Erzeuge den patch Idle State
   	PatchInit = PatchMachine:CreateState("_PATCH_INIT")
    PatchIdle = PatchMachine:CreateState("_PATCH_IDLE")
    PatchDone = PatchMachine:CreateState("_PATCH_DONE")
	
	TransitionPatchInit = PatchInit:CreateTransition(CreateTransitionName("PATCHSYSTEM", "INIT", "PATCH_INIT", "PATCH_IDLE"), PatchIdle)
	TransitionPatchInit:AddAction(SetGlobalTimeStamp{Name = "PatchSystemTimer"})	
	TransitionPatchInit:AddAction(DebugLog{String = "Patching Statemachine Initialized...", NpcId = 0})
	--TransitionPatchInit:AddAction(SetEffect{NpcId = 0, Effect = "Inflex", Length = 60000})
	
	-- erzeuge patch events:
	foreachi(PatchEvents, function(i, event)
		local TransApplyName = CreateTransitionName("PATCHSYSTEM", "IDLE", "PATCH_APPLY_#" .. i, "PATCH_IDLE")
		local TransApply = PatchIdle:CreateTransition(TransApplyName, PatchIdle)
		local PatchApplyFlagName = "GDS_PATCH_APPLIED_#" .. i .. "_Bug#" .. event.Bugzilla .. "_CL#" .. event.Changelist .. "__" .. event.Description
		print("Creating Patch Event: " .. PatchApplyFlagName)

		------------------------------- CONDITIONS -----------------------------------------------------

		-- wurde der patch etwa schon angebracht??
		if not event.AllowRepeating then
			TransApply:AddCondition(IsGlobalFlagFalse{Name = PatchApplyFlagName, UpdateInterval = UI})
		end
		
		if event.ApplyOnlyWhenSavegameVersion > 0 then
			-- ist die savegame version übereinstimmend?
			TransApply:AddCondition(IsGlobalCounter{Name = "GDS_SaveGameVersion", Operator = IsEqual, Value = event.ApplyOnlyWhenSavegameVersion, UpdateInterval = UI})
			-- zur sicherheit: ist die gameversion höher als die savegameversion? 
			-- oder equal ... ich will das erlauben für manuelles nachpatchen ohne versionsnummer-erhöhung!
			TransApply:AddCondition(IsGlobalCounter{Name = "GDS_GameVersion", Operator = IsGreaterOrEqual, Value = event.ApplyOnlyWhenSavegameVersion, UpdateInterval = UI})
		elseif event.ApplyOnlyWhenSavegameVersionBefore > 0 then
			-- ist die savegame version kleiner als aktuelle?
			TransApply:AddCondition(IsGlobalCounter{Name = "GDS_SaveGameVersion", Operator = IsLess, Value = event.ApplyOnlyWhenSavegameVersionBefore, UpdateInterval = UI})
			-- zur sicherheit: ist die gameversion höher als die savegameversion? 
			-- oder equal ... ich will das erlauben für manuelles nachpatchen ohne versionsnummer-erhöhung!
			TransApply:AddCondition(IsGlobalCounter{Name = "GDS_GameVersion", Operator = IsGreaterOrEqual, Value = event.ApplyOnlyWhenSavegameVersionBefore, UpdateInterval = UI})
		end
		
		-- user conditions einbauen:
		foreachi(event.Conditions, function(_, condition)
			if condition.SetUpdateInterval then condition:SetUpdateInterval(UI) end
			%TransApply:AddCondition(condition)
		end)
		
		------------------------------- ACTIONS -----------------------------------------------------
		
		-- user actions einbauen:
		foreachi(event.Actions, function(_, action)
			%TransApply:AddAction(action)
		end)

		TransApply:AddAction(SetGlobalFlagTrue{Name = PatchApplyFlagName})
		TransApply:AddAction(DebugLog{String = "Patch Applied: " .. PatchApplyFlagName, NpcId = 0})
		
		if not event.AllowRepeating then
			TransApply:AddAction(CGdsRemoveTransition:new("", TransApplyName))
		end
		
		TransApply = nil
	end)

	-- ist nicht sicher ... der kaputte scriptzustand kann ja gespeichert sein aber die patchbedingung sind
	-- z.Zt. noch nicht wahr ... daher patch events am laufen halten ... oder?
	-- andere lösung: beim laden savegameversion & questzustand prüfen, wenn savegameversion möglicherweise
	-- broken aber questzustand noch nicht soweit, setze ein "später erneut prüfen" flag welches die 
	-- savegameversion ignoriert aber zusätzlich das flag prüft
	
	--TransitionPatchDone = PatchIdle:CreateTransition(CreateTransitionName("PATCHSYSTEM", "IDLE", "PATCH_IDLE", "PATCH_DONE"), PatchDone)
	--TransitionPatchDone:AddCondition(IsGlobalTimeElapsed{Name = "PatchSystemTimer", Seconds = 5, UpdateInterval = 10})
	--TransitionPatchDone:AddAction(DebugLog{String = "Patching Statemachine Finished...", NpcId = 0})

	print("Patch Statemachine done ...")

	-- aufräumen:
   	PatchInit = nil
    PatchIdle = nil
    PatchDone = nil
	TransitionPatchInit = nil
	TransitionPatchDone = nil
	PatchMachine = nil
end
