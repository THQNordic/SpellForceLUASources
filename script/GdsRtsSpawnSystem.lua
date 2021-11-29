-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}

com = [[
-- RTS SPAWN, Clan 3 (Goblin Süd-Süd-Ostcamp, Spawnboss Snarglfarffgnamphlaf)
SomeUnits =
{
	X = 100,
	Y = 220,
	Range = 0,
	WaitTime = 60,		-- globaltimeelapsed condition (unique varname!)
	AvatarMinLevel = 0,	-- avatarislevel condition
	AvatarMaxLevel = 0,	-- negated(avatarislevel) condition
	SpawnLimit = 20,	-- max spawn counter mit condition (may be: getn(Units) == 0  or  unlimited == -1)
	Chief = 1240,		-- spawnboss NpcId (FigureAlive condition)
	Conditions = {},
	ShuffleUnits = FALSE,
	Units = {123, 456, 789},	-- count bis num-units, dann reset counter
}
SomeMoreUnits = {Units = {223, 356, 489}}
SomeOtherUnits = {Units = {443, 556, 989}}

RtsSpawn
{
	Clan = 3,
	MaxClanSize = 40,
	Groups = {SomeUnits, SomeMoreUnits, SomeOtherUnits},
	Conditions = {},
}


RtsSpawnNT		-- RTS Spawn: New Technology :)
{
	Clan = 22,
	MaxClanSize = 30,
	X = 240,
	Y = 146,
	Range = 10,
	Chief = 1800, --Gubble
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Timer	= "ElfMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {779, 262, 784, 784}, 	-- die units, die zu beginn der karte gespawned sein sollen
	SpawnData =
	{
	--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
		[0]		= {Minutes = 5, Units = {779}},			-- zu beginn alle 5 minuten je 1 unit 779 spawnen
		[5]		= {Minutes = 3, Units = {779}},			-- zusätzlich alle 3 minuten je 1 unit 779 spawnen
		[10]	= {Minutes = 2, Units = {784}}, 	    -- nach 10 minuten alle 180 und 120 sekunden je 1 unit spawnen
		[20]	= {Minutes = 1.5, Units = {779}},	    -- nach 20 minuten alle 180, 120 und 90 sekunden je 1 unit spawnen
		[28]	= {Minutes = 1, Units = {266, 22}},  	-- usw.
		[36]	= {Seconds = 45, Units = {784, 266, 262}},
		[44]	= {Seconds = 30, Units = {777}},
	},
	NpcBuildingsExist = {X = 100, Y = 200, Range = 10},
	CampDestroyedActions = {},
}

]]
com = nil

-- **DOC** ------------------------------------------------------------------
function RtsSpawnNT(params)
	NumRtsSpawnNT = NumRtsSpawnNT + 1
    -- prüfe den Datensatz
	local FuncName = "GDS: RtsSpawnNT() #" .. NumRtsSpawnNT .. ": "
	assert2(NpcId == 0, FuncName .. "RTS SPAWN (NT) ONLY ALLOWED in n0.lua!")
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")	
	assert2(params.Clan, FuncName .. "MISSING PARAMETER: Clan = ")	
	assert2(params.MaxClanSize, FuncName .. "MISSING PARAMETER: MaxClanSize = ")	
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")	
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")	
	params.Range = params.Range or 0
	if params.Range > 0 then params.Range = 0 end	-- immer am eigentlichen spawnpunkt spawnen
	params.Chief = params.Chief or 0
	params.AvatarMinLevel = params.AvatarMinLevel or 0
	params.AvatarMaxLevel = params.AvatarMaxLevel or 0
	assert2(params.Timer, FuncName .. "MISSING PARAMETER: Timer = ")	
	assert2(params.Init, FuncName .. "MISSING PARAMETER: Init = ")	
	assert2(params.SpawnData, FuncName .. "MISSING PARAMETER: SpawnData = ")	
	assert2(type(params.SpawnData) == "table", FuncName .. "INVALID PARAMETER: SpawnData is not a table!")	
	params.NpcBuildingsExist = params.NpcBuildingsExist or {}
	params.CampDestroyedActions = params.CampDestroyedActions or {}
	params.Effect = params.Effect or "Materialize"
	params.Length = params.Length or 2000
	assert2(getn(tkeys(params)) == 15, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	print(FuncName .. "Duration = " .. GlobalSpawnDuration .. ", Clan = " .. params.Clan .. ", MaxClanSize = " .. params.MaxClanSize .. ", X/Y = " .. params.X .. "/" .. params.Y .. ", Timer = \"" .. params.Timer .. "\"" ..
		"\n\tChief = " .. params.Chief .. ", InitSpawn " .. getn(params.Init) .. " units, NpcBuildings X/Y = " .. params.NpcBuildingsExist.X .. "/" .. params.NpcBuildingsExist.Y .. ", Range: " .. params.NpcBuildingsExist.Range)

	local CampDestroyedVar = "RtsSpawnNT_" .. NumRtsSpawnNT .. "_BaseCampDestroyed_" ..params.X .. "/" .. params.Y
	local GroundWaveExistsVar = "RtsSpawnNT_" .. NumRtsSpawnNT .. "_GroundWaveExists_" ..params.X .. "/" .. params.Y

	-- erzeuge InitSpawn
	if params.Init and type(params.Init) == "table" and getn(params.Init) > 1 then
		i = getn(InitSpawnNTData) + 1
		InitSpawnNTData[i] = {}
		InitSpawnNTData[i].X = params.X
		InitSpawnNTData[i].Y = params.Y
		InitSpawnNTData[i].Range = params.Range
		InitSpawnNTData[i].Chief = params.Chief
		InitSpawnNTData[i].AvatarMinLevel = params.AvatarMinLevel
		InitSpawnNTData[i].AvatarMaxLevel = params.AvatarMaxLevel
		InitSpawnNTData[i].Conditions = {}
		InitSpawnNTData[i].Units = params.Init
		
		tinsert(RtsSpawnUnitList, params.Init)
	
		InitSpawn
		{
			Clan = params.Clan,
			Groups = { InitSpawnNTData[i] },
			Conditions = {
				IsGlobalFlagFalse{Name = CampDestroyedVar},
			},
		}
		
		if SkillLevel == SkillHard or PlatformId >= 100 then
			local size = floor(getn(params.Init) / 2)
			print("\tHIT & RUN: min. Clansize = " .. size)
			--GdsDebug:Assert("\tHIT & RUN exploit Schutz für Camp " .. i .. " tritt ein bei Clansize <= " .. size)
			OnPlatformOneTimeEvent
			{
				Conditions = {
					IsGlobalFlagFalse{Name = "HitAndRunAvoidSystemActive", UpdateInterval = 180},
					IsGlobalFlagFalse{Name = CampDestroyedVar, UpdateInterval = 180},
					IsGlobalFlagFalse{Name = GroundWaveExistsVar, UpdateInterval = 180},
					Negated(IsGlobalTimeElapsed{Name = params.Timer, Seconds = 0.1, UpdateInterval = 180}),
					Negated(IsClanSize{Clan = params.Clan, Size = size, UpdateInterval = 300}),
				},
				Actions = {
					SetGlobalFlagTrue{Name = "HitAndRunAvoidSystemActive"},
					SetGlobalTimeStamp{Name = params.Timer},
					--SetEffect{NpcId = Avatar, Length = 60000, Effect = "Loot"},
					DebugLog{String = "HIT & RUN: enabled because of Clan " .. params.Clan .. " size below " .. size},
				},
			}
		end
	end

--	eigentliches spawning ..............................................................................................

	-- sort spawndata	
	local SpawnData = {}
	local keys = tkeys(params.SpawnData)
	sort(keys)
	foreachi(keys, function(i, key)
		%SpawnData[i] = %params.SpawnData[key]
		%SpawnData[i].BeginTime = key
		--print("Begintime " .. key .. " at pos " .. i)
	end)

	local f = 0
	local i, table = next(SpawnData, nil)

	-- timer nach plattformwechsel zurücksetzen
	PlatformInitAction( ClearGlobalTimeStamp{Name = params.Timer} )

	-- fx abschalten bei erneutem plattform betreten
	OnPlatformOneTimeEvent
	{
		Conditions = {
			IsGlobalFlagTrue{Name = GroundWaveExistsVar, UpdateInterval = 30},
			Negated(IsGlobalTimeElapsed{Name = params.Timer, Seconds = SpawnData[i].BeginTime * 60 + 1, UpdateInterval = 30}),
		},
		Actions = {
			StopEffect{X = params.X, Y = params.Y},
			SetGlobalFlagFalse{Name = GroundWaveExistsVar},
			--DebugLog{String = "GroundWave at " .. params.X .. "," .. params.Y .. " exists - TRUE: " .. GroundWaveExistsVar},
		},
	}

	-- RTS spawning abschalten wenn alle gebäude futsch...
	tinsert(params.CampDestroyedActions, SetGlobalFlagTrue{Name = CampDestroyedVar})
	tinsert(params.CampDestroyedActions, StopEffect{X = params.X, Y = params.Y})
	tinsert(params.CampDestroyedActions, SetEffect{Effect = "AreaHit", X = params.X, Y = params.Y, Length = 3000})
	tinsert(params.CampDestroyedActions, SetEffect{Effect = "Lightning", X = params.X, Y = params.Y, Length = 3500})

	OnOneTimeEvent
	{
		Conditions = {
			IsGlobalFlagFalse{Name = CampDestroyedVar},
			Negated(BuildingInRange{X = params.NpcBuildingsExist.X, Y = params.NpcBuildingsExist.Y,
						Range = params.NpcBuildingsExist.Range, Owner = OwnerNpc, UpdateInterval = 15} ),
		},
		Actions = params.CampDestroyedActions,
	}

	-- set effect event
	local SpawnFxConditions = {}
	tinsert(SpawnFxConditions,  IsGlobalFlagFalse{Name = CampDestroyedVar} )
	tinsert(SpawnFxConditions,  IsGlobalFlagFalse{Name = GroundWaveExistsVar} )
	tinsert(SpawnFxConditions,	IsGlobalTimeElapsed{Name = params.Timer, Seconds = SpawnData[i].BeginTime * 60 + 1, UpdateInterval = 20})
	tinsert(SpawnFxConditions,	BuildingInRange{X = params.NpcBuildingsExist.X, Y = params.NpcBuildingsExist.Y,	Range = params.NpcBuildingsExist.Range, Owner = OwnerNpc, UpdateInterval = 20} )

	OnPlatformOneTimeEvent
	{
		Conditions = SpawnFxConditions,
		Actions = {
			SetEffect{Effect = "GroundWave", X = params.X, Y = params.Y, Length = 0},
			SetGlobalFlagTrue{Name = GroundWaveExistsVar},
			--DebugLog{String = "GroundWave at " .. params.X .. "," .. params.Y .. " exists - TRUE: " .. GroundWaveExistsVar},
		},
	}

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
		tinsert(RtsSpawnUnitList, table.Units)
		table.Minutes = table.Minutes or 0
		table.Seconds = table.Seconds or 0
		SpawnGroups[f].WaitTime = table.Seconds + table.Minutes * 60
		SpawnGroups[f].SpawnEffect = TRUE

		SpawnGroups[f].Conditions = {}
		SpawnGroups[f].BeginConditions = {}

		tinsert(SpawnGroups[f].Conditions, IsGlobalTimeElapsed{Name = params.Timer, Seconds = SpawnData[i].BeginTime * 60})
		tinsert(SpawnGroups[f].BeginConditions, IsGlobalFlagFalse{Name = CampDestroyedVar, UpdateInterval = 60})
		
		if SpawnData[i].BeginTime > 0 then		
			tinsert(SpawnGroups[f].BeginConditions,	IsGlobalTimeElapsed{Name = params.Timer, Seconds = SpawnData[i].BeginTime * 60, UpdateInterval = 60})
		end
		if first == TRUE then
			first = FALSE
			--print("Ignoring spawn stop for first spawnwave at " .. params.X .. "," .. params.Y)
		else
			--print("Stop this spawnwave after " .. GlobalSpawnDuration .. " minutes, at " .. params.X .. "," .. params.Y)
			tinsert(SpawnGroups[f].BeginConditions,	Negated(IsGlobalTimeElapsed{Name = params.Timer, Seconds = GlobalSpawnDuration * 60, UpdateInterval = 60}))
		end

		if getn(tkeys(params.NpcBuildingsExist)) > 0 then
			--print("BUILDING ABFRAGE: " .. params.NpcBuildingsExist.X .. "," .. params.NpcBuildingsExist.Y)
			tinsert(SpawnGroups[f].Conditions, 
				BuildingInRange{X = params.NpcBuildingsExist.X, Y = params.NpcBuildingsExist.Y,
								Range = params.NpcBuildingsExist.Range, Owner = OwnerNpc, UpdateInterval = 60} )
		end

		i, table = next(SpawnData, i)
	end

	i = getn(RtsSpawnNTData) + 1
	RtsSpawnNTData[i] = {}
	tinsert(RtsSpawnNTData[i], SpawnGroups)

	-- erzeuge RTS Spawn
	RtsSpawn
	{
		Clan = params.Clan,
		MaxClanSize = params.MaxClanSize,
		Groups = SpawnGroups,
		Conditions = {},
	}
end

doc[numdoc] = [[Params: <code>...</code><br>RtsSpawnNT .. Dauer des Spawnings in Minuten über: GlobalSpawnDuration = 90 festlegbar.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ------------------------------------------------------------------
function InitSpawn(params)
	NumInitSpawn = NumInitSpawn + 1
    -- prüfe den Datensatz
	local FuncName = "GDS: InitSpawn() #" .. NumInitSpawn .. ": "
	assert2(NpcId == 0, FuncName .. "INIT SPAWN ONLY ALLOWED in n0.lua!")
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")	
	assert2(params.Groups, FuncName .. "MISSING PARAMETER: Groups = {...}")
	assert2(type(params.Groups) == "table", FuncName .. "INVALID PARAMETER: Groups = must be a table!")
	assert2(params.Clan, FuncName .. "MISSING PARAMETER: Clan = {...}")
	params.Conditions = params.Conditions or {}
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

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
		local coord = { X = _group.X, Y = _group.Y}
		tinsert(PositionList, coord)
		_group.WaitTime = _group.WaitTime or 0
		assert2(_group.Units, %FuncName .. "MISSING PARAMETER in SpawnGroup " ..i.. ": Groups = { ... , Units = {...}}")
		assert2(type(_group.Units) == "table", %FuncName .. "INVALID PARAMETER in SpawnGroup " ..i.. ": Groups = { ... , Units = {...}} must be a table!")
		assert2(getn(_group.Units) > 0, %FuncName .. "INVALID PARAMETER in SpawnGroup " ..i.. ": Groups = { ... , Units = {...}} must contain at least one unit id!")
		assert2(getn(tkeys(_group)) == 11, %FuncName .. "INCORRECT ARGUMENT FOUND in SpawnGroup " ..i.. ", probably mistyped a parameter?")
	end)

	tinsert(InitSpawnData, params)


    local id1 = getn(InitSpawnData)
	local _RtsSpawn = InitSpawnData[id1]
	local Groups = _RtsSpawn.Groups

	-- create transitions for each unit group to be spawned
	assert(type(Groups) == "table")
	local id2 = nil
	
	for id2 = 1, getn(Groups) do
		local group = Groups[id2]
		assert(type(group.Units) == "table")

		PlatformInitAction(SetNpcFlagTrue{Name = "InitSpawnOnlyOnce" .. tostring(id1) .. "_" .. tostring(id2)})
	end
end

doc[numdoc] = [[Params: <code>Groups = {...}, Clan = , Conditions = { ... }</code><br>InitSpawn erlaubt das spawnen von NPCs für einen Clan direkt beim Map laden, abhängig von Conditions. Dieser Befehl kann nur in n0.lua verwendet werden, oder in einem seperaten script (empfehlenswert!) das von n0.lua per doscript aufgerufen wird. Der Clan Parameter gibt die Clan Nummer (0-31) an (siehe auch Editor, AI Wizard). Die Conditions sind der "Initialzünder" für diesen InitSpawn, erst wenn die Conditions zutreffen wird gespawnt. Die Groups Tabelle verlangt eine seperate Erklärung:<br><p>
Params: <code>X = , Y = , Units = {...}, Range = 0, AvatarMinLevel = 0, AvatarMaxLevel = unlimited, Chief = {...}, Conditions = {...}, </code><br>Die Koordinaten X,Y sind selbsterklärend, WaitTime ist immer 0. Der Range ist auch verständlich, allerdings sollte man hier wissen das es kein kreisrunder Range ist, sondern ein Quadrat mit dem Mittelpunkt X,Y (war einfacher zu machen und sollte nicht stören). Units = {} enthält eine Liste von Unit IDs die zu spawnen sind. Diese werden alle sofort gespawned.<br>Das Spawnen kann man auch an weitere Conditions = {} knüpfen. Ein paar häufig verwendete sind bereits als Parameter vorgesehen, z.b. AvatarMin/MaxLevel beschränkt das spawnen auf einen Mindest- oder Höchstlevel des Spielers, wahlweise auch auf einen Levelrange von Min bis Max (jeweils inklusive, also spawning NUR in einem bestimmten Avatarlevel erreicht man durch setzen von Max und Min auf den gleichen Wert). Chief = {} ist wiederum vom Respawn bekannt und gibt die NpcId eines oder mehrere Spawnbosse an.
<br><p>
Beispiel:
<br>
SomeUnits =<br>
{<br>
	X = 70,<br>
	Y = 45,<br>
	WaitTime = 0,<br>
	Range = 10,<br>
	Chief = 0,<br>
	AvatarMinLevel = 20,<br>
	AvatarMaxLevel = 20,<br>
	Conditions = <br>
	{<br>
		FigureInRange{NpcId = 2000, X = 70, Y = 45, Range = 20},<br>
	},<br>
	Units = {197, 177, 227, 198, 178, 228, 199, 179, 229},<br>
}<br>
<br>
SomeMoreUnits = {X = 80, Y = 45, Units = {468, 618, 668}}<br>
SomeOtherUnits = {X = 90, Y = 45, Units = {749, 119, 709}}<br>
<br>
InitSpawn<br>
{<br>
	Clan = 3, <br>
	Groups = {SomeUnits, SomeMoreUnits, SomeOtherUnits},<br>
	Conditions = {},<br>
}<br>
]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ------------------------------------------------------------------
function RtsSpawn(params)
	NumRtsSpawn = NumRtsSpawn + 1
    -- prüfe den Datensatz
	local FuncName = "GDS: RtsSpawn() #" .. NumRtsSpawn .. ": "
	assert2(NpcId == 0, FuncName .. "RTS SPAWN ONLY ALLOWED in n0.lua!")
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
		if _group.InitSpawn then
			print("found InitSpawn parameter in RTS Spawn: ignored!")
			_group.InitSpawn = nil
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
		local coord = { X = _group.X, Y = _group.Y}
		tinsert(PositionList, coord)
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

	tinsert(RtsSpawnData, params)
end

doc[numdoc] = [[Params: <code>Groups = {...}, Clan =, MaxClanSize = unlimited, MaxClanLevel = unlimited, Conditions = { ... }</code><br>RTS Spawn erlaubt das nachspawnen von NPCs für einen Clan. Dieser Befehl kann nur in n0.lua verwendet werden, oder in einem seperaten script (empfehlenswert!) das von n0.lua per doscript aufgerufen wird. Der Clan Parameter gibt die Clan Nummer (0-31) an (siehe auch Editor, AI Wizard). MaxClanSize soll verhindern, das die Anzahl Units in diesem Clan ein bestimmtes Limit überschreitet (wenn 0 oder nicht vorhanden, wird die Clangrösse ignoriert). Die Conditions sind der "Initialzünder" für diesen RTS Spawn, erst wenn die Conditions zutreffen wird gespawnt. Sollte die WaitTime einzelner Spawngruppen seit Mapbeginn bereits überschritten sein, werden sofort beim zutreffen der Conditions die ersten Units gespawned. Die Groups Tabelle verlangt eine seperate Erklärung:<br><p>

Params: <code>X = , Y = , WaitTime = , Units = {...}, Range = 0, AvatarMinLevel = 0, AvatarMaxLevel = unlimited, SpawnLimit = None, Chief = {...}, Conditions = {...}, ShuffleUnits = FALSE, InitSpawn = FALSE </code><br>Die Koordinaten X,Y sind selbsterklärend, ebenso die WaitTime (in Sekunden). Der Range ist auch verständlich, allerdings sollte man hier wissen das es kein kreisrunder Range ist, sondern ein Quadrat mit dem Mittelpunkt X,Y (war einfacher zu machen und sollte nicht stören). Units = {} enthält eine Liste von Unit IDs die zu spawnen sind. Diese werden der Reihe nach gespawned und nach der letzten wird wieder die erste gespawned. Es sei denn, das SpawnLimit hat vorher eingegriffen, damit kann man die maximale Anzahl units die gespawned werden soll begrenzen. Eine Sonderstellung hat ein negatives Spawnlimit (-1 bzw. man kann dafür auch Once schreiben), damit wird jede Unit genau einmal gespawned. Gibt man also 5 Units an und SpawnLimit = Once dann werden die 5 Units der Reihe nach gespawned und das wars dann. Mit ShuffleUnits = TRUE kann man übrigens bei jedem map load die Reihenfolge der Units zufällig verändern lassen.<br>Das Spawnen kann man auch an weitere Conditions = {} knüpfen. Ein paar häufig verwendete sind bereits als Parameter vorgesehen, z.b. AvatarMin/MaxLevel beschränkt das spawnen auf einen Mindest- oder Höchstlevel des Spielers, wahlweise auch auf einen Levelrange von Min bis Max (jeweils inklusive, also spawning NUR in einem bestimmten Avatarlevel erreicht man durch setzen von Max und Min auf den gleichen Wert). Chief = {} ist wiederum vom Respawn bekannt und gibt die NpcId eines oder mehrere Spawnbosse an.
<br><p>
Beispiel:
<br>
SomeUnits =<br>
{<br>
	X = 70,<br>
	Y = 45,<br>
	Range = 10,<br>
	Chief = 0,<br>
	WaitTime = 5,<br>
	AvatarMinLevel = 20,<br>
	AvatarMaxLevel = 20,<br>
	Conditions = <br>
	{<br>
		FigureInRange{NpcId = 2000, X = 70, Y = 45, Range = 20},<br>
	},<br>
	Units = {197, 177, 227, 198, 178, 228, 199, 179, 229},<br>
	ShuffleUnits = TRUE,<br>
	SpawnLimit = 15,<br>
}<br>
<br>
SomeMoreUnits = {X = 80, Y = 45, WaitTime = 16, Units = {468, 618, 668}, SpawnLimit = 6, ShuffleUnits = TRUE,}<br>
SomeOtherUnits = {X = 90, Y = 45, WaitTime = 33, Units = {749, 119, 709}, SpawnLimit = -1, ShuffleUnits = TRUE,}<br>
<br>
RtsSpawn<br>
{<br>
	Clan = 3, MaxClanSize = 40, MaxClanLevel = 200<br>
	Groups = {SomeUnits, SomeMoreUnits, SomeOtherUnits},<br>
	Conditions = {},<br>
}<br>
]]
doc[numdoc] = nil
numdoc = numdoc + 1


function InitRtsSpawnSystem()
	RtsSpawnData = {}
	InitSpawnData = {}
	UsedConditions = {}
	
	InitSpawnNTData = {}
	RtsSpawnNTData = {}
	RtsSpawnUnitList = {}

	NumRtsSpawn = 0
	NumInitSpawn = 0
	NumRtsSpawnNT = 0

	-- in minuten wie lange spawning läuft
	GlobalSpawnDuration = 90
	
	ChiefList = {}
	PositionList = {}
	
	RtsSpawnStates = {}
	
	if SkillLevel == SkillHard then HardMode = TRUE else HardMode = FALSE end
	print("RTS SPAWN: HardMode == " .. HardMode)
end

function CreateRtsSpawnState(_Name)
	assert(RtsSpawnStateMachine ~= nil)
	local State = RtsSpawnStateMachine:CreateState(_Name)
	tinsert(RtsSpawnStates, State)
	return State
end


function CreateRtsSpawnSystem()
    assert(StateMachine ~= nil)
	--assert(getn(States) > 0)
    assert(NpcId ~= nil)

	-- early out, if there is no RTS spawn data
	if NpcId ~= 0 then return end
	if getn(RtsSpawnData) == 0 and getn(InitSpawnData) == 0 then return end
	
	FuncName = "RtsSpawnSystem: "
	
	--------------------------------------------- RTS SPAWN ------------------------------------------------
	-------------------------------------------- >REDESIGNED< ----------------------------------------------

	RtsSpawnStateMachine = GdsMain:CreateStateMachine("_RtsSpawn_", kGdsStateMachineTypeFigureScript, 1)
   	local StateInit = CreateRtsSpawnState("_INIT")
    local StateIdle = CreateRtsSpawnState("_IDLE")
	local TransitionInit = StateInit:CreateTransition(CreateTransitionName("RtsBase", "RtsInit", "_INIT", "_IDLE"), StateIdle)

	if getn(RtsSpawnData) > 0 then
	-- create transitions from any state to itself
	    for _i = 1, getn(RtsSpawnData) do
		  local _RtsSpawn = RtsSpawnData[_i]
		  local Groups = _RtsSpawn.Groups
	
		  -- create transitions for each unit group to be spawned
		  assert(type(Groups) == "table")
		  for _j = 1, getn(Groups) do
			local _subgroup = Groups[_j]
			assert(type(_subgroup.Units) == "table")

		  	-- these are useful for creating a unique varname...
		  	local id1 = _i
		  	local id2 = _j
		  	local id3 = _k
		  	local clan = _RtsSpawn.Clan
			local clansize = _RtsSpawn.MaxClanSize 
			local clanlevel = _RtsSpawn.MaxClanLevel

			StateSpawnGroup = CreateRtsSpawnState("RTSSPAWNGROUP" .. _i .. "_" .. _j)

	-- transition von IDLE zur RTS Spawn Group...
			local transition = StateIdle:CreateTransition(CreateTransitionName("RtsSpawnSystem", "ToSpawnGroup" .. tostring(_i) .. "_" .. tostring(_j), "IDLE", "SpawnGroup"), StateSpawnGroup)
		    -- berücksichtige wartezeit
		    if getn(_subgroup.BeginConditions) > 0 then
				foreachi(_subgroup.BeginConditions, function(_, item)
					assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
					%transition:AddCondition(item)
				end)
			end
			local cond = IsNpcTimeElapsed{Name = "RtsSpawnTimer" .. tostring(_i) .. "_" .. tostring(_j), Seconds = _subgroup.WaitTime}
			local updateinterval = _subgroup.WaitTime * 10 * 0.49 + random(0,5)
			if updateinterval < 60 then updateinterval = 58 + random(0,4) end
			cond:SetUpdateInterval(updateinterval)
		    transition:AddCondition(cond)
		    -- füge manuellen "update interval" hinzu ...
			transition:AddAction(SetNpcTimeStamp{Name = "RtsSpawnAllowConditions" .. tostring(_i) .. "_" .. tostring(_j)})
			transition = nil

	-- "update interval" transition von IDLE zur RTS Spawn Group
-- frecherweise einfach mal disabled, ist vermutlich sowieso nicht nötig...
-- eine unti die nicht gespawned werden konnte wartet einfach bis sie das nächste mal dran ist
REM = [[	
			local transition = StateIdle:CreateTransition(CreateTransitionName("RtsSpawnSystem", "SpawnGroupUpdateInterval" .. tostring(_i) .. "_" .. tostring(_j), "IDLE", "SpawnGroup"), StateSpawnGroup)
		    -- berücksichtige "update interval"
		    local seconds = _subgroup.WaitTime / 10
		    if seconds < 6 then seconds = 6 end
			local cond = IsNpcTimeElapsed{Name = "RtsSpawnUpdateInterval" .. tostring(_i) .. "_" .. tostring(_j), Seconds = seconds, UpdateInterval = seconds * 10}
		    transition:AddCondition(cond)
		    -- nur wenn das "update interval" timer flag gesetzt ist
			transition:AddCondition(IsNpcFlagTrue{Name = "RtsSpawnUpdateFlag" .. tostring(_i) .. "_" .. tostring(_j)})
		    -- setze manuellen "update interval" neu ...
			transition:AddAction(SetNpcTimeStamp{Name = "RtsSpawnAllowConditions" .. tostring(_i) .. "_" .. tostring(_j)})
		    -- setze das "update interval" timer flag wieder zurück ...
			transition:AddAction(SetNpcFlagFalse{Name = "RtsSpawnUpdateFlag" .. tostring(_i) .. "_" .. tostring(_j)})
			transition = nil
]]

	-- *erfolgreiche* transition von der Spawn Group zurück zum IDLE
			local transition = StateSpawnGroup:CreateTransition(CreateTransitionName("RtsSpawnSystem", "SpawnGroupSpawnUnit" .. tostring(_i) .. "_" .. tostring(_j), "SpawnGroup", "IDLE"), StateIdle)

			------------------------------------------- CONDITIONS ----------------------------------------------

			-- zusätzliche conditions fürs spawnen dieser _subgroup				
			foreachi(_subgroup.Conditions, function(_, item) 
				assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
				%transition:AddCondition(item)
				-- merk dir die verwendeten conditions zum späteren klonen falls nötig
				--print("used condition item in group for later cloning: " .. tostring(item))
				tinsert(UsedConditions, item)
			end)
			foreachi(_RtsSpawn.Conditions, function(_, item) 
				assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
				%transition:AddCondition(item) 
			end)

		    -- berücksichtige ein oder mehrere vorgesetzte npcs 
		    if _subgroup.Chief ~= nil then
		        if type(_subgroup.Chief) == "table" then
		            foreachi(_subgroup.Chief, function(_, chief)
		            	if chief ~= 0 then
			            	%transition:AddCondition(FigureAlive{NpcId = chief})
			            	tinsert(ChiefList, chief)
			            end
		            end)
		        elseif _subgroup.Chief ~= 0 then
					transition:AddCondition(FigureAlive{NpcId = _subgroup.Chief})
					tinsert(ChiefList, _subgroup.Chief)
		        end
		    end

		    -- gibt es ein spawnlimit? dann die gesamtzahl der zu spawnenden units mit einem counter begrenzen
		    if _subgroup.SpawnLimit > 0 then
				transition:AddCondition(IsNpcCounter{Name = "RtsSpawnLimit" .. tostring(id1) .. "_" .. tostring(id2), Operator = IsLess, Value = _subgroup.SpawnLimit, UpdateInterval = 100})
			-- oder auf die gesamtzahl der angegebenen units, und nicht mehr...
		    elseif _subgroup.SpawnLimit < 0 then
				transition:AddCondition(IsNpcCounter{Name = "RtsSpawnLimit" .. tostring(id1) .. "_" .. tostring(id2), Operator = IsLess, Value = getn(_subgroup.Units), UpdateInterval = 100})
			end

			-- spawnlimit aufgrund clangrösse?
			if clansize > 0 then
				local cond = Negated(IsClanSize{Clan = clan, Size = clansize})
				local interval = _subgroup.WaitTime * 10 * 0.33 + random(0,5) 
				if interval < 50 then
					print("WARNING: RTS Spawn: ClanSize update interval forced to 50 GD steps.")
					cond:SetUpdateInterval(50 + random(0,5))
				else
					cond:SetUpdateInterval(interval)
				end
			    transition:AddCondition(cond)
			end
			
			-- spawnlimit aufgrund clanlevel?
			if clanlevel > 0 then
				local cond = Negated(IsClanLevel{Clan = clan, Level = clanlevel})
				local interval = _subgroup.WaitTime * 10 * 0.33 + random(0,5)
				if interval < 50 then
					print("WARNING: RTS Spawn: ClanLevel update interval forced to 50 GD steps.")
					cond:SetUpdateInterval(50 + random(0,5))
				else
					cond:SetUpdateInterval(interval)
				end
			    transition:AddCondition(cond)
			end

		    -- spawnen nur wenn avatar mind. level X ist?
		    if _subgroup.AvatarMinLevel > 0 then
				transition:AddCondition(AvatarIsLevel{Level = _subgroup.AvatarMinLevel, UpdateInterval = 150})
			end

		    -- spawnen nur wenn avatar höchstens level X ist?
		    if _subgroup.AvatarMaxLevel > 0 then
		    	local cond = AvatarIsLevel{Level = _subgroup.AvatarMaxLevel + 1, UpdateInterval = 150}
				cond:ToggleNegated()
				transition:AddCondition(cond)
			end

			------------------------------------------- ACTIONS ----------------------------------------------

		    -- gibt es ein spawnlimit? dann den spawn limit counter erhöhen
		    if _subgroup.SpawnLimit ~= 0 then
				transition:AddAction(IncreaseNpcCounter{Name = "RtsSpawnLimit" .. tostring(id1) .. "_" .. tostring(id2)})
			end

			-- timestamp wieder zurücksetzen auf aktuelle zeit
	    	transition:AddAction(SetNpcTimeStamp{Name = "RtsSpawnTimer" .. tostring(id1) .. "_" .. tostring(id2)})

		    -- setze das "update interval" timer flag wieder zurück ...
			--transition:AddAction(SetNpcFlagFalse{Name = "RtsSpawnUpdateFlag" .. tostring(_i) .. "_" .. tostring(_j)})
			
			-- spawn effect setzen?
			if _subgroup.SpawnEffect == TRUE then
				transition:AddAction(SetEffect{Effect = "Materialize", Length = 2500, X = _subgroup.X, Y = _subgroup.Y})
			end

REM = [[
		    -- spawn fx auf chief
		    if _subgroup.Chief ~= nil then
		        if type(_subgroup.Chief) == "table" then
		            foreachi(_subgroup.Chief, function(_, chief)
		            	if chief ~= 0 then
			   				print("RTS Spawn: adding spawn effect action to chief: " .. tostring(chief))
							%transition:AddAction(SetEffect{Effect = "SparkleSphere", Length = 25000, NpcId = chief})
						end
		            end)
		        elseif _subgroup.Chief ~= 0 then
		   			print("RTS Spawn_: adding spawn effect action to chief: " .. tostring(_subgroup.Chief))
					transition:AddAction(SetEffect{Effect = "SparkleSphere", Length = 25000, NpcId = _subgroup.Chief})
		        end
		    end
]]

			-- führe den tatsächlichen spawn aus
			local action = Spawn{NpcId = 0, X = _subgroup.X, Y = _subgroup.Y, Range = _subgroup.Range, Clan = clan, NotPersistant = TRUE, UnitId = _subgroup.Units, Effect = _RtsSpawn.Effect, Length = _RtsSpawn.Length, HardMode = HardMode}
			print("RTS Spawn figure at: " .. _subgroup.X .. "," .. _subgroup.Y .. "  Range: " .. _subgroup.Range .. "  to clan: " .. clan)

			-- break down to single unit...
			for _k = 1, getn(_subgroup.Units) do
				--_unit = _subgroup.Units[_k]
				
				--action:AddUnit(_unit)
				--print("\tadding unit: " .. _unit)
				
				-- erzeuge Init Action für jede unit, die den timestamp erstmalig setzt
				lastname = varname
				varname = "RtsSpawnTimer" .. tostring(_i) .. "_" .. tostring(_j)
				if varname ~= lastname then
					TransitionInit:AddAction(SetNpcTimeStamp{Name = varname})
				end
			end -- Units

			transition:AddAction(action)
			transition = nil

	-- nicht erfolgreiche transition von der Spawn Group zurück zum IDLE
			local transition = StateSpawnGroup:CreateTransition(CreateTransitionName("RtsSpawnSystem", "LeaveSpawnGroup" .. tostring(_i) .. "_" .. tostring(_j), "SpawnGroup", "IDLE"), StateIdle)
		    -- berücksichtige "update interval" (nur ein GD step lang)
			local cond = IsNpcTimeElapsed{Name = "RtsSpawnAllowConditions" .. tostring(_i) .. "_" .. tostring(_j), Seconds = 0.3}
			cond:SetUpdateInterval(3)
		    transition:AddCondition(cond)
		    -- setze den spawn timer zurück damit er nicht gleich wieder triggert...
			transition:AddAction(SetNpcTimeStamp{Name = "RtsSpawnTimer" .. tostring(_i) .. "_" .. tostring(_j)})
		    -- setze den "update interval" timer auf 5%
			--transition:AddAction(SetNpcTimeStamp{Name = "RtsSpawnUpdateInterval" .. tostring(_i) .. "_" .. tostring(_j)})
		    -- setze das "update interval" timer flag, damit der update timestamp geprüft wird
			--transition:AddAction(SetNpcFlagTrue{Name = "RtsSpawnUpdateFlag" .. tostring(_i) .. "_" .. tostring(_j)})
			transition = nil

		  end -- Groups
		end -- RtsSpawnData
	end -- RtsSpawnData ~= nil ?

	--------------------------------------------- INIT SPAWN ------------------------------------------------

	if InitSpawnData ~= nil then
		-- create transitions from any state to itself
	    for _i = 1, getn(InitSpawnData) do
		  local _RtsSpawn = InitSpawnData[_i]
		  local Groups = _RtsSpawn.Groups
	
		  -- create transitions for each unit group to be spawned
		  assert(type(Groups) == "table")
		  for _j = 1, getn(Groups) do
			local group = Groups[_j]
			assert(type(group.Units) == "table")
			local Conditions = _RtsSpawn.Conditions
		  	local clan = _RtsSpawn.Clan
	
		  	-- these are useful for creating a unique varname...
		  	local id1 = _i
		  	local id2 = _j
			  	
			-- create a spawn transition in Idle state
			local transitionname = CreateTransitionName("InitSpawn", tostring(id1) .. "_" .. tostring(id2), "IDLE", "IDLE")
			--print("create INITSPAWN: " .. transitionname)
			local transition = StateIdle:CreateTransition(transitionname, StateIdle)
	
			------------------------------------------- CONDITIONS ----------------------------------------------
					
			-- no wait time for init spawn!
			local waittime = 0
			
			-- frage das "only once" flag ab ...
			transition:AddCondition(IsNpcFlagTrue{Name = "InitSpawnOnlyOnce" .. tostring(id1) .. "_" .. tostring(id2), UpdateInterval = 10})

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

		    -- berücksichtige ein oder mehrere vorgesetzte npcs 
		    if group.Chief ~= nil then
		        if type(group.Chief) == "table" then
		            foreachi(group.Chief, function(_, chief)
		            	if chief ~= 0 then
		            		%transition:AddCondition(FigureAlive{NpcId = chief}) 
		            		tinsert(ChiefList, chief)
		            	end
		            end)
		        elseif group.Chief ~= 0 then
		            transition:AddCondition(FigureAlive{NpcId = group.Chief})
	            	tinsert(ChiefList, group.Chief)
		        end
		    end

		    -- spawnen nur wenn avatar mind. level X ist?
		    if group.AvatarMinLevel > 0 then
				transition:AddCondition(AvatarIsLevel{Level = group.AvatarMinLevel, UpdateInterval = 10})
			end

		    -- spawnen nur wenn avatar höchstens level X ist?
		    if group.AvatarMaxLevel > 0 then
		    	local cond = AvatarIsLevel{Level = group.AvatarMaxLevel + 1, UpdateInterval = 10}
				cond:ToggleNegated()
				transition:AddCondition(cond)
			end

			------------------------------------------- ACTIONS ----------------------------------------------

			-- setze das "only once" flag ...
			transition:AddAction(SetNpcFlagFalse{Name = "InitSpawnOnlyOnce" .. tostring(id1) .. "_" .. tostring(id2)})

			-- führe den tatsächlichen spawn aus
			foreachi(group.Units, function(_, unit)
				local action = Spawn{NpcId = 0, X = %group.X, Y = %group.Y, Range = %group.Range, Clan = %clan, NotPersistant = TRUE, UnitId = unit, HardMode = FALSE}
				--action:AddUnit(unit)
				--print("INIT Spawn figure " .. unit .. " at: " .. %group.X .. "," .. %group.Y .. "  Range: " .. %group.Range .. "  to clan: " .. %clan)
				%transition:AddAction(action)
			end) -- foreachi group.Units

			-- nie wieder ausführen:
			--transition:AddAction( CGdsRemoveTransition:new("", transitionname) )
			
		  end -- Groups
		end -- InitSpawnData
	end -- InitSpawnData ~= nil ?
	

	------------------------------------------- SPAWNBOSS EFFECTS ----------------------------------------------

    if getn(ChiefList) > 0 then
    	-- zuerst alle mehrfach vorhandenen NpcIds aussortieren
    	Chiefs = {}
    	foreachi(ChiefList, function(i, id)
    		if id ~= 0 and tfind(%Chiefs, id) == nil then
    			tinsert(Chiefs, id)
    		end
    	end)

		-- dann die spawnboss effect initactions setzen
		foreachi(Chiefs, function(i, id)
   			print("RTS Spawn# -:- FX DISABLED !!! -->> setting Spawnboss effect #" .. i .. " to chief: " .. tostring(id))
       		--TransitionInit:AddAction(SetEffect{Effect = "Spawnboss", Length = 0, NpcId = id})
       	end)
    end

	--------------------------------- UNIT LISTE RAUSSCHREIBEN ----------------------------------------------

	if getn(RtsSpawnUnitList) > 0 then
    	-- zuerst alle mehrfach vorhandenen Units aussortieren
    	local Units = {}
    	for i = 1, getn(RtsSpawnUnitList) do
			local units = RtsSpawnUnitList[i]
			for j = 1, getn(units) do
				local unit = units[j]
    			if tfind(Units, unit) == nil then
    				tinsert(Units, unit)
	    		end
			end
    	end

		local OutString = "\nCategoryName = \"P" .. PlatformId .. "\"\nRtsSpawnNTUnitListP" .. PlatformId .. " = {\n"
		sort(Units)
		for i = 1, getn(Units) do
			OutString = OutString .. "\t[" .. i .. "] = { Unit = " .. Units[i] .. ", Name = \"Unit_" .. Units[i] .. "\",\t\tCreo = nil, CatName = CategoryName },\n"
		end
		OutString = OutString .. "}\n"
		print(OutString)
	end

	-- statemachine freigeben
	RtsSpawnStateMachine = nil
end
