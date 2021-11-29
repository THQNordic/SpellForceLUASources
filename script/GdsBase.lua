-- preview/press/demo version flag
_DEMO_VERSION_ = FALSE

if _DEBUG ~= 1 then
	function assert2(eval, msg)
		print("ASSERT2: " .. tostring(eval) .. " - " .. tostring(msg))
	end
	function assert(eval, msg)
		assert2(eval, msg)
	end
end

-- load all GDS system files:
if not dofile("config.lua") then assert2(nil, "Syntax Error in 'config.lua' or 'config.lua' does not exist !!!") end
if not dofile("script/GdsDailyJobSequence.lua") then assert2(nil, "GDS: Syntax Error in 'GdsDailyJobSequence.lua' !!!") end
if not dofile("script/GdsDialogSystem.lua") then assert2(nil, "GDS: Syntax Error in 'GdsDialogSystem.lua' !!!") end
if not dofile("script/GdsRespawnSystem.lua") then assert2(nil, "GDS: Syntax Error in 'GdsRespawnSystem.lua' !!!") end
if not dofile("script/GdsGlobalEventSystem.lua") then assert2(nil, "GDS: Syntax Error in 'GdsGlobalEventSystem.lua' !!!") end
if not dofile("script/GdsDump.lua") then assert2(nil, "GDS: Syntax Error in 'GdsDump.lua' !!!") end
if not dofile("script/GdsDefines.lua") then assert2(nil, "GDS: Syntax Error in 'GdsDefines.lua' !!!") end
if not dofile("script/GdsDefines2.lua") then assert2(nil, "GDS: Syntax Error in 'GdsDefines2.lua' !!!") end
if not dofile("script/GdsHelper.lua") then assert2(nil, "GDS: Syntax Error in 'GdsHelper.lua' !!!") end
if not dofile("script/GdsCameraHelper.lua") then assert2(nil, "GDS: Syntax Error in 'GdsCameraHelper.lua' !!!") end
if not dofile("script/GdsConditions.lua") then assert2(nil, "GDS: Syntax Error in 'GdsConditions.lua' !!!") end
if not dofile("script/GdsActions.lua") then assert2(nil, "GDS: Syntax Error in 'GdsActions.lua' !!!") end
if not dofile("script/GdsVariables.lua") then assert2(nil, "GDS: Syntax Error in 'GdsVariables.lua' !!!") end
if not dofile("script/GdsVariableStates.lua") then assert2(nil, "GDS: Syntax Error in 'GdsVariableStates.lua' !!!") end
if not dofile("script/GdsStateSystem.lua") then assert2(nil, "GDS: Syntax Error in 'GdsStateSystem.lua' !!!") end
if not dofile("script/GdsRtsSpawnSystem.lua") then assert2(nil, "GDS: Syntax Error in 'GdsRtsSpawnSystem.lua' !!!") end
if not dofile("script/GdsEffects.lua") then assert2(nil, "GDS: Syntax Error in 'GdsEffects.lua' !!!") end
if not dofile("script/GdsQuestRewards.lua") then assert2(nil, "GDS: Syntax Error in 'GdsQuestRewards.lua' !!!") end
if not dofile("object/object_scripteffects.lua") then assert2(nil, "GDS: Syntax Error in 'object/object_scripteffects.lua' !!!") end

-- load effectlist:
EffectList = GetScriptEffectList()

if _DEBUG == 1 and Debug and Debug.RegenAlways == 1 then
	GdsDebug:Assert("\nUpps! Last time the arena was not shut down properly, the current config.lua is therefore invalid!\nPlease delete the config.lua, and rename config.lua.<computername> to config.lua, or make a copy of config.lua.sample ...\nPlaying with this config.lua affects the game balance and will cause De-Synchronisation in Multiplayer!")
end


if Debug and Debug.Developer == 1 and _DEBUG == 1 then
	--GdsDebug:Assert("\nNOTE: game is set to allow the 'Load Map' feature!\n\n\tYou CAN use 'load map' to load a single map or savegame of a single map.\n\tYou CAN NOT play the campaign or any campaign savegame in this mode!\n\n(please press 'ignore' after you have read and understood this message)\nTHIS IS NOT A BUG! DO NOT REPORT THIS MESSAGE! CALM DOWN ALREADY...")
	print("\nNOTE: game is set to allow the 'Load Map' feature!\n\n\tYou CAN use 'load map' to load a single map or savegame of a single map.\n\tYou CAN NOT play the campaign or any campaign savegame in this mode!\n\n(please press 'ignore' after you have read and understood this message)\nTHIS IS NOT A BUG! DO NOT REPORT THIS MESSAGE! CALM DOWN ALREADY...")
elseif _DEBUG == 1 then
	--GdsDebug:Assert("\nNOTE: game is set to allow to play the Campaign!\n\n\tYou CAN use the 'Campaign' button to begin a campaign or load a campaign savegame.\n\tYou CAN NOT play a single map via 'load map' or load a savegame of a single map!\n\n(please press 'ignore' after you have read and understood this message)\nTHIS IS NOT A BUG! DO NOT REPORT THIS MESSAGE! CALM DOWN ALREADY...")
	print("\nNOTE: game is set to allow to play the Campaign!\n\n\tYou CAN use the 'Campaign' button to begin a campaign or load a campaign savegame.\n\tYou CAN NOT play a single map via 'load map' or load a savegame of a single map!\n\n(please press 'ignore' after you have read and understood this message)\nTHIS IS NOT A BUG! DO NOT REPORT THIS MESSAGE! CALM DOWN ALREADY...")
end


-- Definition of variables
StateIdle = nil
StateMachine = nil
NpcId = nil
PlatformId = nil
StateMachineType = nil
NpcX = nil
NpcY = nil

-- Add-On: list of non-persistant Platform IDs
-- NPMaps = {102, 103, 106, 107, 108, 111, 112, 114}
NPMaps = {}	-- es gibt keine NP maps mehr!


function CreateNPWipeVarsStateMachine()
	print("Creating NP Wipe Vars StateMachine ... " .. tostring(NpcId))
	SM = GdsMain:CreateStateMachine("_NP_WIPE_VARS_", kGdsStateMachineTypeFigureScript, 2)
   	StateWait = SM:CreateState("_NP_WIPE_WAIT")

	counter = 0
	processnum = 0
	StateProcess = SM:CreateState("_NP_WIPE_PROCESS_" .. processnum)
	TransWaitProcess = StateWait:CreateTransition(CreateTransitionName("NP_WIPE", "NP_WIPE", "Wait", "Process"), StateProcess)
	TransWaitProcess:AddCondition( IsGlobalFlagTrue{Name = "GDS_PlatformLoaded", UpdateInterval = 6} )
	
	MAX_ACTIONS_IN_TRANSITION = 128

	foreachi(NPInitActions, function(i, _action)
		counter = counter + 1
		--print("\tadd NP init action")
		if counter > MAX_ACTIONS_IN_TRANSITION then
			--print("NP init action number exceeded: " .. counter .. " .. creating processnum: " .. processnum + 1)
			counter = 1
		    processnum = processnum + 1
			StateProcessOld = StateProcess
		    StateProcess = SM:CreateState("_NP_WIPE_PROCESS_" .. processnum)
			TransWaitProcess = StateProcessOld:CreateTransition(CreateTransitionName("NP_WIPE", "NP_WIPE", "Process", "Process"), StateProcess)
		end

		TransWaitProcess:AddAction(_action)
	end)

	foreachi(tkeys(NpcVars), function(i, _var)
		--print("\treset npc var: " .. tostring(_var))
		counter = counter + 1
		if counter > MAX_ACTIONS_IN_TRANSITION then
			--print("NPC vars action number exceeded: " .. counter .. " .. creating processnum: " .. processnum + 1)
			counter = 1
		    processnum = processnum + 1
			StateProcessOld = StateProcess
		    StateProcess = SM:CreateState("_NP_WIPE_PROCESS_" .. processnum)
			TransWaitProcess = StateProcessOld:CreateTransition(CreateTransitionName("NP_WIPE", "NP_WIPE", "Process", "Process"), StateProcess)
		end

		if NpcVars[_var].Timer and NpcVars[_var].Timer == TRUE then
			--print("TIMER: " .. tostring(NpcVars[_var].Timer))
			TransWaitProcess:AddAction( CGdsDbVariableReset:new(_var, NpcVariable) )
		else
			TransWaitProcess:AddAction( CGdsDbVariableSet:new(_var, NpcVariable, FALSE) )
		end
	end)

	TransWaitProcess:AddAction( SetEffect{NpcId = Avatar, Effect = "Spawnboss", Length = 60000} )

	-- schliesse den kreislauf:
	TransProcessDone = StateProcess:CreateTransition(CreateTransitionName("NP_WIPE", "NP_WIPE", "ProcessDone", "Wait"), StateWait)
	TransProcessDone:AddCondition( IsGlobalFlagFalse{Name = "GDS_PlatformLoaded", UpdateInterval = 1} )
	
	MAX_ACTIONS_IN_TRANSITION = nil
	TransWaitProcess = nil
	TransProcessDone = nil
	NPInitActions = nil
	counter = nil
	processnum = nil
	StateProcessOld = nil
	StateDone = nil
	StateProcess = nil
	StateWait = nil
	SM = nil
end

function PostScriptLoad(_PlatformId)
	DefineGlobalConstants2()

	AltTransVal = StateInit:CreateTransitionFromString("_INIT->_IDLE", StateIdle, "StateTransitionInit")
	if AltTransVal ~= gdkUi_csLife2 then
		AltStateMachine = GdsMain:CreateStateMachine("_PLATFORM_" .. _PlatformId, kGdsStateMachineTypeBuildingScript, _PlatformId)
	end

	-- NP variablen wipe statemachine hier aufbauen:
	if tfind(NPMaps, _PlatformId) then
		CreateNPWipeVarsStateMachine()
	end

	if _DEBUG == 1 then
		print("\n---------------------------------------------------------------------------------")
		--- debug ausgaben hier, z.b.:
		SetDumpLevel{DumpNpcIds = TRUE, AllVars = TRUE}
		DumpStates()
		DumpGlobalVars()
		DumpPlayerVars()
		DumpNpcVars()
		print("\nFinish GDS Logging " .. tostring(date("-- Date: %Y/%m/%d -- Time: %H:%M:%S")))
		print("---------------------------------------------------------------------------------")
		doscript("!test\\GdsWatchedVarsTemp")
		print("---------------------------------------------------------------------------------")
	end
end

function CreateStateName(system, name)
	return system .. " - State - " .. name
end

function CreateTransitionName(system, name, fromstate, tostate)
	assert(system ~= nil)
	assert(name ~= nil)
	assert(fromstate ~= nil)
	assert(tostate ~= nil)
	return system .. " - Transition - " .. name .. " - " .. fromstate .. " - " .. tostate
end

function CreateDbVariableName(_System, _Name, _NpcId)
	assert(_System ~= nil)
	assert(_Name ~= nil)

	if _NpcId == nil then
		return _System .. " - " .. _Name
	else
		return _System .. " - " .. _Name .. " - " .. _NpcId
	end
end

function CreateState(_Name)
	assert(StateMachine ~= nil)
	local State = StateMachine:CreateState(_Name)  
	if States then
		tinsert(States, State)
	end
	return State
end

function InitBase()
	
    StateInit = nil
	StateIdle = nil
	StateDead = nil
	
    States = { }
    InitConditions = {}
    InitActions = {}
    
    NPInitActions = {}
end

function CreateBase()
	-- Erzeuge den Idle State (ohne den gehts wirklich nicht *g*)
   	StateInit = CreateState("_INIT")
    StateIdle = CreateState("_IDLE")
	
	DefineGlobalConstants2()

	if NpcId == 0 then
		AltTransVal = StateInit:CreateTransitionFromString("_INIT->_IDLE", StateIdle, "AlternativeStateTransitionInit")
		if AltTransVal ~= gdkUi_csLife1 then
			AltStateMachine = GdsMain:CreateStateMachine("_NPC_" .. NpcId, kGdsStateMachineTypeBuildingScript, NpcId)
		end
	end

	-- bereite "SpawnOnlyWhen" State vor, der Rest ist im Respawn System
	-- rerouting the init transition to StateBornDead instead of StateIdle
	if SpawnDead == TRUE then
		-- create state for the born dead npc
		StateBornDead = CreateState("BORNDEAD")
	    assert(StateBornDead)
		TransitionInit = StateInit:CreateTransition(CreateTransitionName("Base", "Init", "_INIT", "BORNDEAD"), StateBornDead)
		foreachi(InitConditions, function(_i, _condition)
			assert2(type(_condition) == "userdata", "InitAction: " .. "illegal _condition type, not userdata! type: " .. tostring(type(_condition)))
			%TransitionInit:AddCondition(_condition)
		end)
		foreachi(InitActions, function(_i, _action)
			--print("InitAction: #" .. tostring(_i))
			assert2(type(_action) == "userdata", "InitAction: " .. "illegal action type, not userdata! type: " .. tostring(type(_action)))
			%TransitionInit:AddAction(_action)
		end)
		-- wichtig: vanish als letzte action!
		TransitionInit:AddAction(Vanish{})
	else
		TransitionInit = StateInit:CreateTransition(CreateTransitionName("Base", "Init", "_INIT", "_IDLE"), StateIdle)
		foreachi(InitConditions, function(_i, _condition)
			assert2(type(_condition) == "userdata", "InitAction: " .. "illegal _condition type, not userdata! type: " .. tostring(type(_condition)))
			%TransitionInit:AddCondition(_condition)
		end)
		foreachi(InitActions, function(_i, _action)
			--print("InitAction: #" .. tostring(_i))
			assert2(type(_action) == "userdata", "InitAction: " .. "illegal action type, not userdata! type: " .. tostring(type(_action)))
			%TransitionInit:AddAction(_action)
		end)
	end
	
	InitActions = nil
end

function NPInitAction(_action)
	if type(_action) == "table" then GdsDebug:Assert("NPInitAction() in Npc " .. NpcId .. ", Platform " .. PlatformId .. " has wrong parameter type! Probably wrong type of brackets, use 'round' brackets instead of 'pointed' ones. () instead of {}.") end
	assert2(NPInitActions, "NPInitActions = nil")
	if tfind(NPMaps, _PlatformId) then
    	tinsert(NPInitActions, _action)
    else
    	assert2(nil, "NPInitAction() used on non-NP map !! Map: " .. tostring(PlatformId))
    end
end

function OneTimeInitAction(_action)
	if type(_action) == "table" then GdsDebug:Assert("OneTimeInitAction() in Npc " .. NpcId .. ", Platform " .. PlatformId .. " has wrong parameter type! Probably wrong type of brackets, use 'round' brackets instead of 'pointed' ones. () instead of {}.") end
	assert2(InitActions, "InitActions = nil")
    tinsert(InitActions, _action)
end

function InitAction(_action)
	print("\nInitAction() in script for Npc " .. NpcId .. " on Platform " .. PlatformId .. ":\n\tInitAction() Deprecated, please use either DebugInitAction(), OneTimeInitAction() or PlatformInitAction() instead !!!")
	if _DEBUG == 1 then
		GdsDebug:Assert("InitAction() in Npc " .. NpcId .. ", Platform " .. PlatformId .. ": must be REPLACED! Please use either DebugInitAction(), OneTimeInitAction() or PlatformInitAction() instead !!!")
	end

	--assert2(InitActions, "InitActions = nil")
    --tinsert(InitActions, _action)

	-- zwecks debugging:
    --tinsert(InitActions, ShowDebugText{String = "InitAction() in Npc " .. NpcId .. ", Platform " .. PlatformId .. ": must be REPLACED!", Color = ColorLightBlue} )
end

function DebugInitAction(_action)
	if type(_action) == "table" then GdsDebug:Assert("DebugInitAction() in Npc " .. NpcId .. ", Platform " .. PlatformId .. " has wrong parameter type! Probably wrong type of brackets, use 'round' brackets instead of 'pointed' ones. () instead of {}.") end
	if _DEBUG == 1 and Debug and Debug.Developer == 1 then
		print("DebugInitAction(), adding action ...")
		assert2(InitActions, "InitActions = nil")
    	tinsert(InitActions, _action)

		-- zwecks debugging:
		tinsert(InitActions, ShowDebugText{String = "DebugInitAction() in Npc " .. NpcId .. ", Platform " .. PlatformId, Color = ColorLightBlue} )
    end
end


function BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
	StateMachineType = _Type
	PlatformId = _PlatformId
	NpcId = _NpcId
	NpcX = _X
	NpcY = _Y

-- hack für testmap:
--if _DEBUG == 1 and PlatformId == 77 and NpcId ~= 5347 and NpcId ~= 0 then error() return end

	DefineGlobalConstants()

	-- tutorial info tag creation hack
	TutInfoNum = 0
	
	-- begin logging
	ClearGdsLog()
	BeginLog(NpcId)

	if StateMachineType == kGdsStateMachineTypePatch then
		print("Patch Statemachine auf P" .. PlatformId .. " wird ausgeführt!")
		if not dofile("script/GdsPatchSystem.lua") then assert2(nil, "GDS: Syntax Error in 'GdsPatchSystem.lua' !!!") end
		if not dofile("script/GdsGlobalPatchEvents.lua") then assert2(nil, "GDS: Syntax Error in 'GdsGlobalPatchEvents.lua' !!!") end
		InitPatchSystem()
		if _DEBUG == 1 then
			WatchStateMachine()
			print("STATEMACHINE WATCHING ENABLED FOR THIS STATEMACHINE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		end
		return
	end
	
	InitBase()
	InitDialogSystem()
	InitDailyJobSequence()
	InitRespawnSystem()
	InitRtsSpawnSystem()
	InitQuestRewardSystem()
	InitGlobalEventSystem()
	InitStateSystem()
	InitWatchVarsSystem()

	if NpcId == 0 then
		-- load Map Effects lua:
		print("GDS: Loading EffectsP" .. PlatformId .. ".lua")
		dofile("script/P" .. PlatformId .. "/EffectsP" .. PlatformId .. ".lua")
		-- load Rts Spawn lua:
		print("GDS: Loading ClanRtsSpawnP" .. PlatformId .. ".lua")
		dofile("script/P" .. PlatformId .. "/ClanRtsSpawnP" .. PlatformId .. ".lua")

		if Debug and Debug.Developer == 1 then
			if _DEBUG == 1 then
				PlatformInitAction( ShowDebugText{String = "Game is set to allow the 'Load Map' feature! You CAN use 'load map' to load a single map or savegame of a single map."} )
			end
			OneTimeInitAction( SetGlobalFlagTrue{Name = "GDS_>>_GAME_IS_IN_LOADMAP_MODE!!!"} )
			OneTimeInitAction( SetGlobalFlagTrue{Name = "GDS_>>_GAME_BEGAN_ON_PLATFORM_P" .. PlatformId} )
		else
			if _DEBUG == 1 then
				PlatformInitAction( ShowDebugText{String = "Game is set to allow to play the Campaign! You CAN use the 'Campaign' button to begin a campaign or load a campaign savegame."} )
			end
			OneTimeInitAction( SetGlobalFlagTrue{Name = "GDS_>>_GAME_IS_IN_CAMPAIGN_MODE!!!"} )
			OneTimeInitAction( SetGlobalFlagTrue{Name = "GDS_>>_GAME_BEGAN_ON_PLATFORM_P" .. PlatformId} )
		end

		OneTimeInitAction( SetGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P" .. PlatformId} )
	end

	
	if _DEBUG == 1 then
		WatchStateMachine()
		print("STATEMACHINE WATCHING ENABLED FOR THIS STATEMACHINE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	end
end

function EndDefinition()
	-- fürs patchen von scriptzuständen usw.
	if StateMachineType == kGdsStateMachineTypePatch then
		if LOAD_ONLY_ADDON1_PATCHES then
			RegisterAddon1PatchEvents()
		elseif LOAD_ONLY_ADDON2_PATCHES then
			RegisterAddon2PatchEvents()
		else
			-- spellforce 1 patch events (no addons)
			RegisterGlobalPatchEvents()
		end
		
		CreatePatchSystem()
		return
	end

--	if _DEBUG and NpcId ~= 0 then
--		-- in minuten
--		local MAX_IDLE_TIME = 2
--		local MIN_IDLE_TIME = 0.25
--		if GlobalIdleTimeCounter == nil then
--			GlobalIdleTimeCounter = MAX_IDLE_TIME
--		else
--			GlobalIdleTimeCounter = GlobalIdleTimeCounter - 0.1
--		end
--		if GlobalIdleTimeCounter <= MIN_IDLE_TIME then
--			GlobalIdleTimeCounter = MAX_IDLE_TIME * 10
--		end
--		OnEvent
--		{
--			Conditions = {
--				IsPlayerTimeElapsed{Name = "AvatarStehtNurSoRum", Seconds = GlobalIdleTimeCounter * 60, UpdateInterval = 90},
--			},
--			Actions = {
--				ClearPlayerTimeStamp{Name = "AvatarStehtNurSoRum"},
--				Outcry{Tag = "outcryBranniganWP001", NpcId = NpcId, String = "Steht nicht so rum! Tötet irgendwas!", Color = ColorRed},
--			},
--		}
--	elseif _DEBUG and NpcId == 0 then
--		DebugInitAction(SetNpcTimeStamp{Name = "AvatarStehtNurSoRumCheckAgainTimer"})
--		OnEvent
--		{
--			Conditions = {
--				IsNpcTimeElapsed{Name = "AvatarStehtNurSoRumCheckAgainTimer", Seconds = 1, UpdateInterval = 10},
--				Negated(FigureJob{NpcId = Avatar}),
--			},
--			Actions = {
--				SetPlayerTimeStamp{Name = "AvatarStehtNurSoRum"},
--				SetNpcTimeStamp{Name = "AvatarStehtNurSoRumCheckAgainTimer"},
--			},
--		}
--	end


-- addon 2 avatar unterscheidungs events
	if (NpcId == 0) and (PlatformId >= 200) and (PlatformId <= 213) then
		if (PlatformId == 201) or (PlatformId == 202) or (_DEBUG) then 
			
			local APhoenix = {}
			local ASchatten = {}
			tinsert(APhoenix, SetGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"})
			tinsert(ASchatten, SetGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"})
			
			if _DEBUG then
				tinsert(APhoenix, SetEffect{Effect = "Loot", NpcId = Avatar, Length = 9000})
				tinsert(ASchatten, SetEffect{Effect = "Amok", NpcId = Avatar, Length = 9000})
			end

			--Kartenübergreifende, globale Abfrage PhoenixSteinSpieler.
			OnOneTimeEvent
			{
				Conditions = 
				{ 
					IsGlobalFlagFalse {Name = "g_nP202_SchattenklingeSpieler", UpdateInterval = 10},
					PlayerHasItem {ItemId = 2814, Amount = 1, UpdateInterval = 10},
				},
				Actions = APhoenix,
			}
			
			--Kartenübergreifende, globale Abfrage SchattenklingeSpieler.
			OnOneTimeEvent
			{
				Conditions = 
				{ 
					IsGlobalFlagFalse {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 10},
					PlayerHasItem {ItemId = 3764, Amount = 1, UpdateInterval = 10},
				},
				Actions = ASchatten,
			}
		end
	end


-- Skill Level Unterscheidungs event
	if (NpcId == 0) and SkillLevel == SkillHard then
		OnPlatformOneTimeEvent
		{
			Conditions = { },
			Actions =
			{
				SetGlobalFlagTrue{Name = "GDS_SkillHard"},
				SetGlobalFlagFalse{Name = "GDS_SkillNormal"},
				SetGlobalFlagFalse{Name = "GDS_SkillEasy"},
			},
		}
	elseif (NpcId == 0) and SkillLevel == SkillNormal then
		OnPlatformOneTimeEvent
		{
			Conditions = { },
			Actions =
			{
				SetGlobalFlagFalse{Name = "GDS_SkillHard"},
				SetGlobalFlagTrue{Name = "GDS_SkillNormal"},
				SetGlobalFlagFalse{Name = "GDS_SkillEasy"},
			},
		}
	elseif (NpcId == 0) and SkillLevel == SkillEasy then
		OnPlatformOneTimeEvent
		{
			Conditions = { },
			Actions =
			{
				SetGlobalFlagFalse{Name = "GDS_SkillHard"},
				SetGlobalFlagFalse{Name = "GDS_SkillNormal"},
				SetGlobalFlagTrue{Name = "GDS_SkillEasy"},
			},
		}
	end


	-- erzeuge neue StateMachine
	--if _DEBUG == 1 then print("New StateMachine, NpcId == " .. NpcId) end
	StateMachine = GdsMain:CreateStateMachine("_NPC_" .. NpcId, kGdsStateMachineTypeFigureScript, NpcId)

	assert2(NpcId ~= nil)

	-- Erzeuge allgemeine Basisstates und Übergänge
	--if _DEBUG == 1 then print("CreateBase()") end
	CreateBase()

	-- erzeuge State Sytem (manuell erzeugte states/transitions)
	--if _DEBUG == 1 then print("CreateStateSystem()") end
	CreateStateSystem()

	-- Erzeuge JobSequence
	--if _DEBUG == 1 then print("CreateDailyJobSequence()") end
	CreateDailyJobSequence()

	-- Erzeuge Dialogsystem
	--if _DEBUG == 1 then print("CreateDialogSystem()") end
	CreateDialogSystem()

	-- Erzeuge Respawnregeln
	--if _DEBUG == 1 then print("CreateRespawnSystem()") end
	CreateRespawnSystem()
	--if _DEBUG == 1 then print("CreateRtsSpawnSystem()") end
	CreateRtsSpawnSystem()

	-- erzeuge quest reward conditions	
	--if _DEBUG == 1 then print("CreateQuestRewardSystem()") end
	CreateQuestRewardSystem()

	-- Erzeuge Global Event Regeln
	--if _DEBUG == 1 then print("CreateGlobalEventSystem()") end
	CreateGlobalEventSystem()

	-- erzeugt funktionen zum einfachen watchen von npc vars
	--if _DEBUG == 1 then print("CreateWatchVarsSystem()") end
	CreateWatchVarsSystem()

	-- jetzt brauchen wir die StateMachine nicht mehr
	StateMachine = nil
end
