------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function RtsCoopSpawnNT2(params)
	NumRtsCoopSpawnNT = NumRtsCoopSpawnNT + 1
    -- prüfe den Datensatz
	local FuncName = "GDS: RtsCoopSpawnNT2() #" .. NumRtsCoopSpawnNT .. ": "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")	
	assert2(params.Clan, FuncName .. "MISSING PARAMETER: Clan = ")	
	assert2(params.MaxClanSize, FuncName .. "MISSING PARAMETER: MaxClanSize = ")	
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")	
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")	
	params.Goal = params.Goal or GoalAggressive
	params.Range = 0 -- immer am eigentlichen spawnpunkt spawnen
	params.Chief = 0
	params.AvatarMinLevel = 0
	params.AvatarMaxLevel = 0
	assert2(params.Timer, FuncName .. "MISSING PARAMETER: Timer = ")	
	assert2(params.Init, FuncName .. "MISSING PARAMETER: Init = ")	
	assert2(params.SpawnData, FuncName .. "MISSING PARAMETER: SpawnData = ")	
	assert2(type(params.SpawnData) == "table", FuncName .. "INVALID PARAMETER: SpawnData is not a table!")	
	params.NpcBuildingsExist = params.NpcBuildingsExist or {}
	params.CampDestroyedActions = params.CampDestroyedActions or {}
	params.Effect = params.Effect or "Materialize"
	params.Length = params.Length or 2000
	assert2(getn(tkeys(params)) == 16, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	print(FuncName .. "Duration = " .. GlobalCoopSpawnDuration .. ", Clan = " .. params.Clan .. ", MaxClanSize = " .. params.MaxClanSize .. ", X/Y = " .. params.X .. "/" .. params.Y .. ", Timer = \"" .. params.Timer .. "\"" ..
		"\n\tChief = " .. params.Chief .. ", InitCoopSpawn " .. getn(params.Init) .. " units, NpcBuildings X/Y = " .. params.NpcBuildingsExist.X .. "/" .. params.NpcBuildingsExist.Y .. ", Range: " .. params.NpcBuildingsExist.Range)

	local CampDestroyedVar = "RtsCoopSpawnNT_" .. NumRtsCoopSpawnNT .. "_BaseCampDestroyed_" ..params.X .. "/" .. params.Y
	local GroundWaveExistsVar = "RtsCoopSpawnNT_" .. NumRtsCoopSpawnNT .. "_GroundWaveExists_" ..params.X .. "/" .. params.Y

	-- erzeuge InitCoopSpawn
	if params.Init and type(params.Init) == "table" then
		i = getn(InitCoopSpawnNTData) + 1
		InitCoopSpawnNTData[i] = {}
		InitCoopSpawnNTData[i].X = params.X
		InitCoopSpawnNTData[i].Y = params.Y
		InitCoopSpawnNTData[i].Range = params.Range
		InitCoopSpawnNTData[i].Chief = params.Chief
		InitCoopSpawnNTData[i].AvatarMinLevel = params.AvatarMinLevel
		InitCoopSpawnNTData[i].AvatarMaxLevel = params.AvatarMaxLevel
		InitCoopSpawnNTData[i].Conditions = {}
		
		-- use InitSpawnFactor to adjust number of units initially spawned
		local NumUnitsInList = getn(params.Init)
		local NumUnitsToSpawn = ceil(NumUnitsInList * InitSpawnFactor)
		print("\tINITSPAWN: num units = " .. NumUnitsInList .. ", num units adjusted = " .. NumUnitsToSpawn)
		if NumUnitsInList < NumUnitsToSpawn then -- add more units
			while getn(params.Init) < NumUnitsToSpawn do
				tinsert(params.Init, params.Init[random(1, NumUnitsInList)])
			end
		elseif NumUnitsInList > NumUnitsToSpawn then -- spawn less units
			while getn(params.Init) > NumUnitsToSpawn do
				tremove(params.Init)
			end
		end
		--print("INITSPAWN: number of init spawn units now: " .. getn(params.Init))
		--dump(params.Init)
		
		InitCoopSpawnNTData[i].Units = params.Init
		tinsert(RtsCoopSpawnUnitList, params.Init)
	
		InitCoopSpawn
		{
			Clan = params.Clan,
			Goal = params.Goal,
			Groups = { InitCoopSpawnNTData[i] },
			Conditions = {
				--IsGlobalFlagFalse{Name = CampDestroyedVar},
			},
		}

		REM = [[		
		if getn(params.Init) > 1 then
			local size = floor(getn(params.Init) / 2)
			print("\tHIT & RUN: min. Clansize = " .. size)
			OnOneTimeEvent
			{
				Conditions = {
					IsGlobalFlagFalse{Name = CampDestroyedVar, UpdateInterval = 180},
					IsGlobalFlagFalse{Name = GroundWaveExistsVar, UpdateInterval = 180},
					Negated(IsGlobalTimeElapsed{Name = params.Timer, Seconds = 0.1, UpdateInterval = 180}),
					Negated(IsClanSize{Clan = params.Clan, Size = size, UpdateInterval = 300}),
				},
				Actions = {
					SetGlobalTimeStamp{Name = params.Timer},
				},
			}
		end
		]]
	end

--	eigentliches spawning ..............................................................................................

	-- sort spawndata	
	local SpawnData = {}
	local keys = tkeys(params.SpawnData)
	sort(keys)
	foreachi(keys, function(i, key)
		%SpawnData[i] = %params.SpawnData[key]
		%SpawnData[i].BeginTime = key * 60
		--print("Begintime " .. key .. " at pos " .. i)
	end)

	local f = 0
	local i, table = next(SpawnData, nil)

	-- RTS spawning abschalten wenn alle gebäude futsch...
	tinsert(params.CampDestroyedActions, SetGlobalFlagTrue{Name = CampDestroyedVar})
	tinsert(params.CampDestroyedActions, StopEffect{X = params.X, Y = params.Y})
	tinsert(params.CampDestroyedActions, SetEffect{Effect = "AreaHit", X = params.X, Y = params.Y, Length = 3000})
	tinsert(params.CampDestroyedActions, SetEffect{Effect = "Lightning", X = params.X, Y = params.Y, Length = 3500})
	tinsert(params.CampDestroyedActions, RemoveObject{Object = 2541, X = params.X, Y = params.Y})

	OnOneTimeEvent
	{
		Conditions = {
			IsGlobalFlagFalse{Name = CampDestroyedVar},
			Negated(BuildingInRange{X = params.NpcBuildingsExist.X, Y = params.NpcBuildingsExist.Y,
						Range = params.NpcBuildingsExist.Range, Owner = OwnerNpc, UpdateInterval = 20} ),
		},
		Actions = params.CampDestroyedActions,
	}

	-- set effect event
	OneTimeInitAction( SetEffect{Effect = "GroundWave", X = params.X, Y = params.Y} )
	OneTimeInitAction( SetGlobalFlagTrue{Name = GroundWaveExistsVar} )

	SpawnGroups = {}
	local first = TRUE
	
	while i do
		f = f + 1
		
		SpawnGroups[f] = {}
		SpawnGroups[f].X = params.X
		SpawnGroups[f].Y = params.Y
		SpawnGroups[f].Range = params.Range
		SpawnGroups[f].Chief = params.Chief
		SpawnGroups[f].AvatarMinLevel = params.AvatarMinLevel
		SpawnGroups[f].AvatarMaxLevel = params.AvatarMaxLevel
		SpawnGroups[f].Units = table.Units
		tinsert(RtsCoopSpawnUnitList, table.Units)
		SpawnGroups[f].SpawnEffect = TRUE
		SpawnGroups[f].Conditions = {}
		SpawnGroups[f].BeginConditions = {}

		-- use BeginWaveFactor for adjusting when a new wave starts
		print("\tBEGIN WAVE: Seconds = " .. SpawnData[i].BeginTime .. ",\tSeconds adjusted = " .. ceil(SpawnData[i].BeginTime * BeginWaveFactor))
		SpawnData[i].BeginTime = ceil(SpawnData[i].BeginTime * BeginWaveFactor)

		-- use SpawnDelayFactor to adjust delay times between spawns
		table.Minutes = table.Minutes or 0
		table.Seconds = table.Seconds or 0
		if table.Minutes == 0 and table.Seconds < 5 then table.Seconds = 5 end
		print("\tSPAWNDELAY: Seconds = " .. table.Seconds + table.Minutes * 60 .. ",\tSeconds adjusted = " .. ceil((table.Seconds + table.Minutes * 60) * SpawnDelayFactor))
		SpawnGroups[f].WaitTime = ceil((table.Seconds + table.Minutes * 60) * SpawnDelayFactor)


		tinsert(SpawnGroups[f].Conditions, IsGlobalTimeElapsed{Name = params.Timer, Seconds = SpawnData[i].BeginTime})
		tinsert(SpawnGroups[f].BeginConditions, IsGlobalFlagFalse{Name = CampDestroyedVar, UpdateInterval = 60})
		
		if getn(tkeys(params.NpcBuildingsExist)) > 0 then
			--print("BUILDING ABFRAGE: " .. params.NpcBuildingsExist.X .. "," .. params.NpcBuildingsExist.Y)
			tinsert(SpawnGroups[f].Conditions, 
				BuildingInRange{X = params.NpcBuildingsExist.X, Y = params.NpcBuildingsExist.Y,
								Range = params.NpcBuildingsExist.Range, Owner = OwnerNpc, UpdateInterval = 60} )
		end

		i, table = next(SpawnData, i)
	end

	i = getn(RtsCoopSpawnNTData) + 1
	RtsCoopSpawnNTData[i] = {}
	tinsert(RtsCoopSpawnNTData[i], SpawnGroups)

	print("\tMAXCLANSIZE: Size = " .. params.MaxClanSize .. ", Size adjusted = " .. ceil(params.MaxClanSize * MaxClanSizeFactor))

	-- erzeuge RTS Spawn
	RtsCoopSpawn
	{
		Clan = params.Clan,
		MaxClanSize = ceil(params.MaxClanSize * MaxClanSizeFactor),
		Groups = SpawnGroups,
		Conditions = {},
	}
end

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function InitCoopSpawn(params)
	NumInitCoopSpawn = NumInitCoopSpawn + 1
    -- prüfe den Datensatz
	local FuncName = "GDS: InitCoopSpawn() #" .. NumInitCoopSpawn .. ": "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")	
	assert2(params.Groups, FuncName .. "MISSING PARAMETER: Groups = {...}")
	assert2(type(params.Groups) == "table", FuncName .. "INVALID PARAMETER: Groups = must be a table!")
	assert2(params.Clan, FuncName .. "MISSING PARAMETER: Clan = {...}")
	params.Conditions = params.Conditions or {}
	params.Goal = params.Goal or GoalAggressive
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- prüfe die spawngruppen daten
	foreachi(params.Groups, function(i, _group)
		local clan = %params.Clan
		assert2(_group, %FuncName .. "ERROR: SpawnGroup " ..i.. " DOES NOT EXIST (nil)!")
		assert2(type(_group) == "table", %FuncName .. "ERROR: SpawnGroup " ..i.. " IS NOT A TABLE!")
		_group.Range = _group.Range or 0
		_group.Chief = _group.Chief or 0
		_group.Conditions = _group.Conditions or {}
		_group.SpawnLimit = _group.SpawnLimit or 0
		_group.ShuffleUnits = _group.ShuffleUnits or FALSE
		_group.AvatarMinLevel = _group.AvatarMinLevel or 0
		_group.AvatarMaxLevel = _group.AvatarMaxLevel or 0
		if _group.AvatarMinLevel ~= 0 and _group.AvatarMaxLevel ~= 0 then
			assert2((_group.AvatarMaxLevel - _group.AvatarMinLevel) >= 0, %FuncName .. "INVALID PARAMETER in SpawnGroup " ..i.. ": AvatarMaxLevel must be greater or equal to AvatarMinLevel!")
		end
		assert2(_group.X, %FuncName .. "MISSING PARAMETER in SpawnGroup " ..i.. ": X = ")
		assert2(_group.Y, %FuncName .. "MISSING PARAMETER in SpawnGroup " ..i.. ": Y = ")
		_group.WaitTime = _group.WaitTime or 0
		assert2(_group.Units, %FuncName .. "MISSING PARAMETER in SpawnGroup " ..i.. ": Groups = { ... , Units = {...}}")
		assert2(type(_group.Units) == "table", %FuncName .. "INVALID PARAMETER in SpawnGroup " ..i.. ": Groups = { ... , Units = {...}} must be a table!")
		assert2(getn(_group.Units) > 0, %FuncName .. "INVALID PARAMETER in SpawnGroup " ..i.. ": Groups = { ... , Units = {...}} must contain at least one unit id!")
		assert2(getn(tkeys(_group)) == 11, %FuncName .. "INCORRECT ARGUMENT FOUND in SpawnGroup " ..i.. ", probably mistyped a parameter?")
	end)

	tinsert(InitCoopSpawnData, params)
end


function RtsCoopSpawn(params)
	NumRtsCoopSpawn = NumRtsCoopSpawn + 1
    -- prüfe den Datensatz
	local FuncName = "GDS: RtsCoopSpawn() #" .. NumRtsCoopSpawn .. ": "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")	
	assert2(params.Groups, FuncName .. "MISSING PARAMETER: Groups = {...}")
	assert2(type(params.Groups) == "table", FuncName .. "INVALID PARAMETER: Groups = must be a table!")
	assert2(params.Clan, FuncName .. "MISSING PARAMETER: Clan = {...}")
	assert2(params.MaxClanSize, FuncName .. "MISSING PARAMETER: MaxClanSize = ")
	params.MaxClanLevel = params.MaxClanLevel or 0
	params.Conditions = params.Conditions or {}
	params.Effect = params.Effect or 0
	params.Length = params.Length or 0
	assert2(getn(tkeys(params)) == 7, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- prüfe die spawngruppen daten
	foreachi(params.Groups, function(i, _group)
		local clan = %params.Clan
		assert2(_group, %FuncName .. "ERROR: SpawnGroup " ..i.. " DOES NOT EXIST (nil)!")
		assert2(type(_group) == "table", %FuncName .. "ERROR: SpawnGroup " ..i.. " IS NOT A TABLE!")
		_group.Range = _group.Range or 0
		_group.Chief = _group.Chief or 0
		if _group.InitCoopSpawn then
			print("found InitCoopSpawn parameter in RTS Spawn: ignored!")
			_group.InitCoopSpawn = nil
		end
		_group.SpawnLimit = _group.SpawnLimit or 0
		_group.ShuffleUnits = _group.ShuffleUnits or FALSE
		_group.Conditions = _group.Conditions or {}
		_group.BeginConditions = _group.BeginConditions or {}
		_group.SpawnEffect = _group.SpawnEffect or FALSE
		_group.AvatarMinLevel = _group.AvatarMinLevel or 0
		_group.AvatarMaxLevel = _group.AvatarMaxLevel or 0
		if _group.AvatarMinLevel ~= 0 and _group.AvatarMaxLevel ~= 0 then
			assert2((_group.AvatarMaxLevel - _group.AvatarMinLevel) >= 0, %FuncName .. "INVALID PARAMETER in SpawnGroup " ..i.. ": AvatarMaxLevel must be greater or equal to AvatarMinLevel!")
		end
		assert2(_group.X, %FuncName .. "MISSING PARAMETER in SpawnGroup " ..i.. ": X = ")
		assert2(_group.Y, %FuncName .. "MISSING PARAMETER in SpawnGroup " ..i.. ": Y = ")
		assert2(_group.WaitTime, %FuncName .. "MISSING PARAMETER in SpawnGroup " ..i.. ": WaitTime = ")
		assert2(_group.WaitTime > 0, %FuncName .. "INVALID PARAMETER: WaitTime must be > 0")
		assert2(_group.Units, %FuncName .. "MISSING PARAMETER in SpawnGroup " ..i.. ": Groups = { ... , Units = {...}}")
		assert2(type(_group.Units) == "table", %FuncName .. "INVALID PARAMETER in SpawnGroup " ..i.. ": Groups = { ... , Units = {...}} must be a table!")
		assert2(getn(_group.Units) > 0, %FuncName .. "INVALID PARAMETER in SpawnGroup " ..i.. ": Groups = { ... , Units = {...}} must contain at least one unit id!")
		assert2(getn(tkeys(_group)) == 13, %FuncName .. "INCORRECT ARGUMENT FOUND in SpawnGroup " ..i.. ", probably mistyped a parameter?")

		-- resort units by random chance if desired	
		if _group.ShuffleUnits ~= FALSE then
			local shuffle = tcopy(_group.Units)
			_group.Units = {}

			while getn(shuffle) > 0 do
				local rand = random(1, getn(shuffle))
				tinsert(_group.Units, shuffle[rand])
				tremove(shuffle, rand)
			end
		end
	end)

	tinsert(RtsCoopSpawnData, params)
end

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function InitRtsCoopSpawnSystem()
	RtsCoopSpawnData = {}
	InitCoopSpawnData = {}
	UsedConditions = {}
	
	InitCoopSpawnNTData = {}
	RtsCoopSpawnNTData = {}
	RtsCoopSpawnUnitList = {}

	NumRtsCoopSpawn = 0
	NumInitCoopSpawn = 0
	NumRtsCoopSpawnNT = 0

	-- in minuten wie lange spawning läuft (not used anymore, spawn forever...)
	GlobalCoopSpawnDuration = 300
end

function CreateRtsCoopSpawnState(_Name)
	assert(StateMachine ~= nil)
	local state = StateMachine:CreateState(_Name)
	tinsert(States, state)
	return state
end

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function CreateRtsCoopSpawnSystem()
	-- early out, if there is no RTS spawn data
	if getn(RtsCoopSpawnData) == 0 and getn(InitCoopSpawnData) == 0 then return end
	
	FuncName = "RtsCoopSpawnSystem: "
	
	--------------------------------------------- RTS SPAWN ------------------------------------------------
	-------------------------------------------- >REDESIGNED< ----------------------------------------------

 	-- erzeuge neue StateMachine
	StateMachine = GdsMain:CreateStateMachine("_RtsCoopSpawn_" .. SpawnX .. "/" .. SpawnY .. "_", kGdsStateMachineTypeFigureScript, NpcId)
  	StateInit = CreateRtsCoopSpawnState("_INIT")
    StateIdle = CreateRtsCoopSpawnState("_IDLE")
	local TransitionInit = StateInit:CreateTransition(CreateTransitionName("RtsBase", "RtsInit", "_INIT", "_IDLE"), StateIdle)

	-- insert init actions:
	foreachi(InitActions, function(i, action)
		%TransitionInit:AddAction(action)
	end)
	TransitionInit:AddAction(DebugLog{String = FuncName .. "Skill = " .. tostring(SkillLevel) .. ", NumPlayers = " .. tostring(NumPlayers) ..
			", ClanId = " .. tostring(ClanId) .. ", X/Y = " .. tostring(SpawnX) .. "/" .. tostring(SpawnY) ..
			", SpawnGroup = " .. tostring(SpawnGroup)})

	if getn(RtsCoopSpawnData) > 0 then
		-- create transitions from Idle state to itself
	    for _i = 1, getn(RtsCoopSpawnData) do
		  local _RtsCoopSpawn = RtsCoopSpawnData[_i]
		  local Groups = _RtsCoopSpawn.Groups
	
		  -- create transitions for each unit group to be spawned
		  assert(type(Groups) == "table")
		  for _j = 1, getn(Groups) do
			local _subgroup = Groups[_j]
			assert(type(_subgroup.Units) == "table")

		  	-- these are useful for creating a unique varname...
		  	local id1 = _i
		  	local id2 = _j
		  	local id3 = _k
		  	local clan = _RtsCoopSpawn.Clan
			local clansize = _RtsCoopSpawn.MaxClanSize 
			local clanlevel = _RtsCoopSpawn.MaxClanLevel

			StateSpawnGroup = CreateRtsCoopSpawnState("RtsCoopSpawnGROUP" .. _i .. "_" .. _j)

	-- transition von IDLE zur RTS Spawn Group...
			local transition = StateIdle:CreateTransition(CreateTransitionName("RtsCoopSpawnSystem", "ToSpawnGroup" .. tostring(_i) .. "_" .. tostring(_j), "IDLE", "SpawnGroup"), StateSpawnGroup)
		    -- berücksichtige wartezeit
		    if getn(_subgroup.BeginConditions) > 0 then
				foreachi(_subgroup.BeginConditions, function(_, item)
					assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
					%transition:AddCondition(item)
				end)
			end
			local cond = IsNpcTimeElapsed{Name = "RtsCoopSpawnTimer" .. tostring(_i) .. "_" .. tostring(_j), Seconds = _subgroup.WaitTime}
			local updateinterval = _subgroup.WaitTime * 10 * 0.49 + random(0,5)
			if updateinterval < 60 then updateinterval = 58 + random(0,4) end
			cond:SetUpdateInterval(updateinterval)
		    transition:AddCondition(cond)
		    -- füge manuellen "update interval" hinzu ...
			transition:AddAction(SetNpcTimeStamp{Name = "RtsCoopSpawnAllowConditions" .. tostring(_i) .. "_" .. tostring(_j)})
			transition = nil

			-- *erfolgreiche* transition von der Spawn Group zurück zum IDLE
			local transition = StateSpawnGroup:CreateTransition(CreateTransitionName("RtsCoopSpawnSystem", "SpawnGroupSpawnUnit" .. tostring(_i) .. "_" .. tostring(_j), "SpawnGroup", "IDLE"), StateIdle)

			------------------------------------------- CONDITIONS ----------------------------------------------

			-- zusätzliche conditions fürs spawnen dieser _subgroup				
			foreachi(_subgroup.Conditions, function(_, item) 
				assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
				%transition:AddCondition(item)
				-- merk dir die verwendeten conditions zum späteren klonen falls nötig
				--print("used condition item in group for later cloning: " .. tostring(item))
				tinsert(UsedConditions, item)
			end)
			foreachi(_RtsCoopSpawn.Conditions, function(_, item) 
				assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
				%transition:AddCondition(item) 
			end)

			-- spawnlimit aufgrund clangrösse?
			if clansize > 0 then
				local cond = Negated(IsClanSize{Clan = clan, Size = clansize})
				local interval = _subgroup.WaitTime * 10 * 0.35 + random(0,5) 
				if interval < 50 then
					print("WARNING: RTS Spawn: ClanSize update interval forced to 50 GD steps.")
					cond:SetUpdateInterval(50 + random(0,5))
				else
					cond:SetUpdateInterval(interval)
				end
			    transition:AddCondition(cond)
			end
			
			------------------------------------------- ACTIONS ----------------------------------------------

			-- timestamp wieder zurücksetzen auf aktuelle zeit
	    	transition:AddAction(SetNpcTimeStamp{Name = "RtsCoopSpawnTimer" .. tostring(id1) .. "_" .. tostring(id2)})

			-- spawn effect setzen?
			if _subgroup.SpawnEffect == TRUE then
				transition:AddAction(SetEffect{Effect = "Materialize", Length = 2500, X = _subgroup.X, Y = _subgroup.Y})
			end

			-- führe den tatsächlichen spawn aus
			local action = Spawn{NpcId = 0, X = _subgroup.X, Y = _subgroup.Y, Range = _subgroup.Range, Clan = clan, NotPersistant = TRUE, UnitId = _subgroup.Units, Effect = _RtsCoopSpawn.Effect, Length = _RtsCoopSpawn.Length, HardMode = HardMode}
			--print("RTS Spawn figure at: " .. _subgroup.X .. "," .. _subgroup.Y .. "  Range: " .. _subgroup.Range .. "  to clan: " .. clan)

			-- break down to single unit...
			for _k = 1, getn(_subgroup.Units) do
				--_unit = _subgroup.Units[_k]
				
				--action:AddUnit(_unit)
				--print("\tadding unit: " .. _unit)
				
				-- erzeuge Init Action für jede unit, die den timestamp erstmalig setzt
				lastname = varname
				varname = "RtsCoopSpawnTimer" .. tostring(_i) .. "_" .. tostring(_j)
				if varname ~= lastname then
					TransitionInit:AddAction(SetNpcTimeStamp{Name = varname})
				end
			end -- Units

			transition:AddAction(action)
			transition = nil

			-- nicht erfolgreiche transition von der Spawn Group zurück zum IDLE
			local transition = StateSpawnGroup:CreateTransition(CreateTransitionName("RtsCoopSpawnSystem", "LeaveSpawnGroup" .. tostring(_i) .. "_" .. tostring(_j), "SpawnGroup", "IDLE"), StateIdle)
		    -- berücksichtige "update interval" (nur ein GD step lang)
			local cond = IsNpcTimeElapsed{Name = "RtsCoopSpawnAllowConditions" .. tostring(_i) .. "_" .. tostring(_j), Seconds = 0.3}
			cond:SetUpdateInterval(3)
		    transition:AddCondition(cond)
		    -- setze den spawn timer zurück damit er nicht gleich wieder triggert...
			transition:AddAction(SetNpcTimeStamp{Name = "RtsCoopSpawnTimer" .. tostring(_i) .. "_" .. tostring(_j)})
		    -- setze den "update interval" timer auf 5%
			--transition:AddAction(SetNpcTimeStamp{Name = "RtsCoopSpawnUpdateInterval" .. tostring(_i) .. "_" .. tostring(_j)})
		    -- setze das "update interval" timer flag, damit der update timestamp geprüft wird
			--transition:AddAction(SetNpcFlagTrue{Name = "RtsCoopSpawnUpdateFlag" .. tostring(_i) .. "_" .. tostring(_j)})
			transition = nil

		  end -- Groups
		end -- RtsCoopSpawnData
	end -- RtsCoopSpawnData ~= nil ?

	--------------------------------------------- INIT SPAWN ------------------------------------------------

	if InitCoopSpawnData ~= nil then
		-- create transitions from any state to itself
	    for _i = 1, getn(InitCoopSpawnData) do
		  local _RtsCoopSpawn = InitCoopSpawnData[_i]
		  local Groups = _RtsCoopSpawn.Groups
	
		  -- create transitions for each unit group to be spawned
		  assert(type(Groups) == "table")
		  for _j = 1, getn(Groups) do
			local group = Groups[_j]
			assert(type(group.Units) == "table")
			local Conditions = _RtsCoopSpawn.Conditions
		  	local clan = _RtsCoopSpawn.Clan
	
		  	-- these are useful for creating a unique varname...
		  	local id1 = _i
		  	local id2 = _j
			  	
			-- create a spawn transition in Idle state
			local transitionname = CreateTransitionName("InitCoopSpawn", tostring(id1) .. "_" .. tostring(id2), "IDLE", "IDLE")
			--print("create InitCoopSpawn: " .. transitionname)
			local transition = StateIdle:CreateTransition(transitionname, StateIdle)
	
			------------------------------------------- CONDITIONS ----------------------------------------------
					
			-- no wait time for init spawn!
			local waittime = 0
			
			-- frage das "only once" flag ab ...
			--transition:AddCondition(IsNpcFlagTrue{Name = "InitCoopSpawnOnlyOnce" .. tostring(id1) .. "_" .. tostring(id2), UpdateInterval = 10})

			if getn(UsedConditions) > 0 then
				--print("USED CONDITIONS:")
				--dump(UsedConditions)
			end
			
			-- zusätzliche conditions fürs spawnen dieser group	
			foreachi(group.Conditions, function(_, item)
				-- condition schon verwendet? wenn ja, muss sie geklont werden
				if tfind(UsedConditions, item) then
					assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
					local condition = item:Clone()
					%transition:AddCondition(condition)
					print("\tcloned condition: " .. tostring(item) .. " >> " .. tostring(condition))
				else
					%transition:AddCondition(item)
				end
			end)
			foreachi(Conditions, function(_, item) %transition:AddCondition(item) end)


			------------------------------------------- ACTIONS ----------------------------------------------

			-- setze das "only once" flag ...
			--transition:AddAction(SetNpcFlagFalse{Name = "InitCoopSpawnOnlyOnce" .. tostring(id1) .. "_" .. tostring(id2)})

			-- führe den tatsächlichen spawn aus
			foreachi(group.Units, function(_, unit)
				local action = Spawn{NpcId = 0, X = %group.X, Y = %group.Y, Range = %group.Range, Clan = %clan, NotPersistant = TRUE, UnitId = unit, HardMode = HardMode}
				--action:AddUnit(unit)
				--print("INIT Spawn figure " .. unit .. " at: " .. %group.X .. "," .. %group.Y .. "  Range: " .. %group.Range .. "  to clan: " .. %clan)
				%transition:AddAction(action)
			end) -- foreachi group.Units

			-- setze das ai change goal flag ...
			transition:AddAction(SetNpcTimeStamp{Name = "AiChangeGoalClan" .. clan})

			-- nie wieder ausführen:
			transition:AddAction( CGdsRemoveTransition:new("", transitionname) )


			---------------------------------------- AI CHANGE GOAL ----------------------------------------------
			-- create a change ai goal transition in Idle state
			local transitionname = CreateTransitionName("InitCoopSpawnChangeGoal", tostring(id1) .. "_" .. tostring(id2), "IDLE", "IDLE")
			local transition = StateIdle:CreateTransition(transitionname, StateIdle)

			-- frage das ai change goal flag ab ...
			transition:AddCondition(IsNpcTimeElapsed{Name = "AiChangeGoalClan" .. clan, Seconds = 10, UpdateInterval = 10})
			-- setze das ai change goal flag ...
			print("ChangeGoal{Clan = "..clan..", Goal = ".._RtsCoopSpawn.Goal.."}")
			transition:AddAction(ChangeGoal{Clan = clan, Goal = _RtsCoopSpawn.Goal})
			-- debug ausgabe ...
			transition:AddAction(DebugLog{String = "Changing Goal of clan " .. clan .. " to goal " .. _RtsCoopSpawn.Goal})
			-- nie wieder ausführen:
			transition:AddAction( CGdsRemoveTransition:new("", transitionname) )
			
		  end -- Groups
		end -- InitCoopSpawnData
	end -- InitCoopSpawnData ~= nil ?


	--------------------------------- UNIT LISTE RAUSSCHREIBEN ----------------------------------------------

	if getn(RtsCoopSpawnUnitList) > 0 then
    	-- zuerst alle mehrfach vorhandenen Units aussortieren
    	local Units = {}
    	for i = 1, getn(RtsCoopSpawnUnitList) do
			local units = RtsCoopSpawnUnitList[i]
			for j = 1, getn(units) do
				local unit = units[j]
    			if tfind(Units, unit) == nil then
    				tinsert(Units, unit)
	    		end
			end
    	end

		local OutString = "\nCategoryName = \"P" .. PlatformId .. "\"\nRtsCoopSpawnNTUnitListP" .. PlatformId .. " = {\n"
		sort(Units)
		for i = 1, getn(Units) do
			OutString = OutString .. "\t[" .. i .. "] = { Unit = " .. Units[i] .. ", Name = \"Unit_" .. Units[i] .. "\",\t\tCreo = nil, CatName = CategoryName },\n"
		end
		OutString = OutString .. "}\n"
		print(OutString)
	end
	
end

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function SetModifiers()
-- überflüssig... siehe setcoopparams
REM = [[
	-- initial values, these will fail if one stays unmodified during setup...
	MaxClanSizeFactor	= 0.0	-- factor for how big the clan can get
	InitSpawnFactor		= 0.0	-- factor for how many units to spawn initially
	BeginWaveFactor		= 0.0	-- factor for adjusting times when a new spawnwave begins spawning
	SpawnDelayFactor	= 0.0	-- factor for adjusting delay between spawning a unit for each spawnwave

		--	-- modify by amount of players first
		--	if NumPlayers == 1 then
		--		MaxClanSizeFactor	= 1.0	-- factor for how big the clan can get
		--		InitSpawnFactor		= 1.0	-- factor for how many units to spawn initially
		--		BeginWaveFactor		= 1.0	-- factor for adjusting times when a new spawnwave begins spawning
		--		SpawnDelayFactor	= 1.0	-- factor for adjusting delay between spawning a unit for each spawnwave
		--	elseif NumPlayers == 2 then
		--		MaxClanSizeFactor	= 1.15	-- factor for how big the clan can get
		--		InitSpawnFactor		= 2.0	-- factor for how many units to spawn initially
		--		BeginWaveFactor		= 0.85	-- factor for adjusting times when a new spawnwave begins spawning
		--		SpawnDelayFactor	= 0.75	-- factor for adjusting delay between spawning a unit for each spawnwave
		--	elseif NumPlayers == 3 then
		--		MaxClanSizeFactor	= 1.4	-- factor for how big the clan can get
		--		InitSpawnFactor		= 3.0	-- factor for how many units to spawn initially
		--		BeginWaveFactor		= 0.66	-- factor for adjusting times when a new spawnwave begins spawning
		--		SpawnDelayFactor	= 0.5	-- factor for adjusting delay between spawning a unit for each spawnwave
		--	else
		--		assert2(nil, "Unsupported number of players!")
		--	end

	-- modify by amount of players first
	if NumPlayers == 1 then
		MaxClanSizeFactor	= 1.0	-- factor for how big the clan can get
		InitSpawnFactor		= 1.0	-- factor for how many units to spawn initially
		BeginWaveFactor		= 1.0	-- factor for adjusting times when a new spawnwave begins spawning
		SpawnDelayFactor	= 1.0	-- factor for adjusting delay between spawning a unit for each spawnwave
	elseif NumPlayers == 2 then
		MaxClanSizeFactor	= 1.5	-- factor for how big the clan can get
		InitSpawnFactor		= 1.5	-- factor for how many units to spawn initially
		BeginWaveFactor		= 0.7	-- factor for adjusting times when a new spawnwave begins spawning
		SpawnDelayFactor	= 0.7	-- factor for adjusting delay between spawning a unit for each spawnwave
	elseif NumPlayers == 3 then
		MaxClanSizeFactor	= 2.0	-- factor for how big the clan can get
		InitSpawnFactor		= 2		-- factor for how many units to spawn initially
		BeginWaveFactor		= 0.5	-- factor for adjusting times when a new spawnwave begins spawning
		SpawnDelayFactor	= 0.5	-- factor for adjusting delay between spawning a unit for each spawnwave
	else
		assert2(nil, "Unsupported number of players!")
	end
	
	-- now finally tweak values by skill modifiers
	if SkillLevel == 0 then		-- easy skill
		MaxClanSizeFactor	= MaxClanSizeFactor * 0.5
		InitSpawnFactor		= InitSpawnFactor	* 0.5
		BeginWaveFactor		= BeginWaveFactor	* 1.5
		SpawnDelayFactor	= SpawnDelayFactor	* 1.5
	elseif SkillLevel == 1 then	-- normal skill
		MaxClanSizeFactor	= MaxClanSizeFactor	* 1.0
		InitSpawnFactor		= InitSpawnFactor	* 1.0
		BeginWaveFactor		= BeginWaveFactor	* 1.0
		SpawnDelayFactor	= SpawnDelayFactor	* 1.0
	elseif SkillLevel == 2 then	-- hard skill
		MaxClanSizeFactor	= MaxClanSizeFactor	* 2.0
		InitSpawnFactor		= InitSpawnFactor	* 2.0
		BeginWaveFactor		= BeginWaveFactor	* 0.6
		SpawnDelayFactor	= SpawnDelayFactor	* 0.6
	else
		assert2(nil, "Unsupported skill level!")
	end

	print("The modifiers for " .. NumPlayers .. " Player game and skill level " .. SkillLevel .. " are:")
	print("\tMaxClanSizeFactor = " .. MaxClanSizeFactor .. ", InitSpawnFactor = " .. InitSpawnFactor .. ", BeginWaveFactor = " .. BeginWaveFactor .. ", SpawnDelayFactor = " .. SpawnDelayFactor)
	assert2(MaxClanSizeFactor > 0, "ERROR: MaxClanSizeFactor <= 0")
	assert2(InitSpawnFactor > 0, "ERROR: InitSpawnFactor <= 0")
	assert2(BeginWaveFactor > 0, "ERROR: BeginWaveFactor <= 0")
	assert2(SpawnDelayFactor > 0, "ERROR: SpawnDelayFactor <= 0")
]]
end


function SetCoopSpawnParams(_MaxClanSizeFactor, _InitSpawnFactor, _BeginWaveFactor, _SpawnDelayFactor)

	MaxClanSizeFactor, InitSpawnFactor, BeginWaveFactor, SpawnDelayFactor = _MaxClanSizeFactor, _InitSpawnFactor, _BeginWaveFactor, _SpawnDelayFactor

	print("SetCoopSpawnParams: modifiers for " .. tostring(NumPlayers) .. " Player game and skill level " .. tostring(SkillLevel) .. " are:")
	print("\tMaxClanSizeFactor = " .. MaxClanSizeFactor .. ", InitSpawnFactor = " .. InitSpawnFactor .. ", BeginWaveFactor = " .. BeginWaveFactor .. ", SpawnDelayFactor = " .. SpawnDelayFactor)
	assert2(MaxClanSizeFactor > 0, "ERROR: MaxClanSizeFactor <= 0")
	assert2(InitSpawnFactor > 0, "ERROR: InitSpawnFactor <= 0")
	assert2(BeginWaveFactor > 0, "ERROR: BeginWaveFactor <= 0")
	assert2(SpawnDelayFactor > 0, "ERROR: SpawnDelayFactor <= 0")
end


function RtsCoopSpawnNT(_SkillLevel, _NumPlayers, _ClanId, _X, _Y, _SpawnGroup)
	local FuncName = "GDS: RtsCoopSpawnNT(): "

	SkillLevel = _SkillLevel
	--if SkillLevel == SkillHard then HardMode = TRUE else HardMode = FALSE end
	HardMode = FALSE
	NumPlayers = _NumPlayers
	ClanId = _ClanId
	SpawnX = _X
	SpawnY = _Y
	SpawnGroup = _SpawnGroup
	
	StateMachine = nil
	States = {}
	StateInit = nil
	StateIdle = nil
	InitActions = {}
	NpcId = SpawnY * 2 + SpawnX	-- einige actions/conditions erwarten eine gesetzte NpcId
	PlatformId = 0 -- ebenfalls nur pro forma
	NpcX = SpawnX
	NpcY = SpawnY

	--------------------------------------------------------------------------------------------------------------------
	-- init script system
	dofile("script/GdsRtsCoopSpawnHelper.lua")
	dofile("script/GdsDefines.lua")
	dofile("script/GdsDump.lua")
	dofile("script/GdsConditions.lua")
	dofile("script/GdsActions.lua")
	dofile("script/GdsVariables.lua")
	ConsoleDebug = FALSE	
	dofile("script/GdsVariableStates.lua")
	dofile("script/GdsGlobalEventSystem.lua")
	dofile("object/object_scripteffects.lua")
	-- load effectlist:
	EffectList = GetScriptEffectList()

	DefineGlobalConstants()
	InitRtsCoopSpawnSystem()
	InitGlobalEventSystem()
	InitWatchVarsSystem()
	
	if ClanId == 2 then remove(GdsLogFileName) end
	--------------------------------------------------------------------------------------------------------------------

	print(FuncName .. "Skill = " .. tostring(SkillLevel) .. ", NumPlayers = " .. tostring(NumPlayers) .. ", ClanId = " .. tostring(ClanId) .. ", X/Y = " .. tostring(SpawnX) .. "/" .. tostring(SpawnY) .. " (NpcId = " .. NpcId .. "), SpawnGroup = " .. tostring(SpawnGroup))

	SpawnGroups = dofile("script/GdsRtsCoopSpawnGroups.lua")
	if SpawnGroup == 1 then
		SpawnGroup = random(2, getn(SpawnGroups))
		print("Random spawn group: " .. SpawnGroup)
	elseif SpawnGroup == 0 then
		SpawnGroup = 1
		assert2(nil, FuncName .. "ERROR: no spawn group set for this spawnobject, this will be your certain death!")
	end
	local group = SpawnGroups[SpawnGroup]
	assert2(group, FuncName .. "SpawnGroup " .. tostring(SpawnGroup) .. " does not exist or syntax error in GdsRtsCoopSpawnGroups.lua")

	-- skill level and number of players modifiers:
	-- wird nun vom code aufgerufen über setcoopparams...
	-- SetModifiers()

	OneTimeInitAction( SetGlobalTimeStamp{Name = "GlobalCoopSpawnTimer"} )

	RtsCoopSpawnNT2
	{
		Clan = ClanId,
		Goal = group.Goal,
		MaxClanSize = group.MaxClanSize,
		X = SpawnX,	Y = SpawnY,
		Timer	= "GlobalCoopSpawnTimer",
		Init	= group.Init, 	-- die units, die zu beginn der karte gespawned sein sollen
		SpawnData = group.SpawnData,
		NpcBuildingsExist = {X = SpawnX, Y = SpawnY, Range = 16},	-- range ist fix
		CampDestroyedActions = {},
	}

	CreateRtsCoopSpawnSystem()
	CreateGlobalEventSystem()
	CreateWatchVarsSystem()	

	print("------------------------------------------------------------------------------------------------")
end
