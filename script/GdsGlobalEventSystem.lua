-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}

-- **DOC** --------------------------------------------------------------------------------
function BeginScript(params)
	local FuncName = "GDS: BeginScript(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Conditions, FuncName .. "MISSING PARAMETER: Conditions = ")
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = ")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	foreachi(params.Conditions, function(i, condition)
		tinsert(InitConditions, condition)
	end)

	foreachi(params.Actions, function(i, action)
		tinsert(InitActions, action)
	end)
end

doc[numdoc] = [[Syntax:<br><code>BeginScript<br>{<br>Conditions = {},<br>Actions = {},<br>}</code><br>Wartet mit der Ausführung des Scripts solange bis die Conditions erfüllt wurden! Wenn das ein NPC verwendet sollte er bis dahin NIE sterben können! Vorwiegend für Plattformscripte gedacht.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function KillScript(params)
	local FuncName = "GDS: KillScript(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Conditions, FuncName .. "MISSING PARAMETER: Conditions = ")
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = ")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	NewState{Name = "ScriptKilled"}
	
	AddTransition
	{
		From = "_IDLE", To = "ScriptKilled", RemoveTransitionAfterUse = TRUE,
		Conditions = params.Conditions,
		Actions = params.Actions,
	}
end

doc[numdoc] = [[Syntax:<br><code>KillScript<br>{<br>Conditions = {},<br>Actions = {},<br>}</code><br>Beendet die Ausführung eines Scripts. Sollte nicht eingesetzt werden bei NPCs die sterben können! Hauptsächlich für Platform scripte gedacht!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnWakeUpEvent(params)
	local FuncName = "GDS: OnWakeUpEvent(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.SleepOnlyOnce = params.SleepOnlyOnce or TRUE
	params.SleepConditions = params.SleepConditions or {}
	if params.SleepOnlyOnce == TRUE then
		assert2(params.SleepConditions, FuncName .. "INVALID PARAMETER: SleepConditions must have Condition(s) if SleepOnlyOnce == TRUE !")
	end
	params.SleepActions = params.SleepActions or {}
	assert2(params.WakeUpConditions, FuncName .. "MISSING PARAMETER: WakeUpConditions = ")
	assert2(getn(params.WakeUpConditions) > 0, FuncName .. "INVALID PARAMETER: WakeUpConditions must have Condition(s)!")
	params.WakeUpActions = params.WakeUpActions or {}
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	NewState{Name = "SleepState"}
	
	AddTransition
	{
		From = "_IDLE", To = "SleepState", RemoveTransitionAfterUse = params.SleepOnlyOnce,
		Conditions = params.SleepConditions,
		Actions = params.SleepActions,
	}

	AddTransition
	{
		From = "SleepState", To = "_IDLE", RemoveTransitionAfterUse = params.SleepOnlyOnce,
		Conditions = params.WakeUpConditions,
		Actions = params.WakeUpActions,
	}
end

doc[numdoc] = [[Syntax:<br><code>OnWakeUpEvent<br>{<br>SleepOnlyOnce = TRUE,<br>SleepConditions = {},<br>SleepActions = {},<br>WakeUpConditions = {},<br>WakeUpActions = {},<br>}</code><br>Versetzt den NPC in den Schlafzustand wenn die SleepConditions zutreffen, und weckt ihn wieder auf wenn die WakeUpConditions zutreffen.<br>Was heisst "schlafen"? Das bedeutet, der NPC wird die performance nicht durch seine globalen Events beeinträchtigen solange er schläft. Er wird keine Events prüfen und keinen Dialog führen können. Er prüft nur die WakeUpConditions!<br>WICHTIG: wenn SleepOnlyOnce == TRUE ist und der NPC stirbt und einen Respawn hat, dann wird er nach dem Respawn nicht mehr im sleep modus sein! Umgekehrt muss man darauf achten wenn SleepOnlyOnce == FALSE ist, das die SleepConditions nicht mehr zutreffen sobald die WakeUpConditions wahr sind (sonst: EndlosSchleife!).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnFollowForever(params)
	local FuncName = "GDS: OnFollowForever(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.NpcId = params.NpcId or NpcId
	assert2(params.NpcId == NpcId, FuncName .. "must be used in NPC who is to follow the target!")
	assert2(params.Target, FuncName .. "MISSING PARAMETER: Target = ")
	params.Conditions = params.Conditions or {}
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	params.Actions = params.Actions or {}
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- save data for respawn reactivation of follow
	local data = {}
	data.NpcId = params.NpcId
	data.Target = params.Target
	data.Conditions = params.Conditions
	tinsert(FollowData, data)
	
	local Off = {}
	foreachi(params.Conditions, function (i,condition)
		if PlatformId >= 200 and PlatformId <= 215 then
			tinsert (%Off, condition:Clone ())
		else
			tinsert (%Off, Negated(condition:Clone ()))
		end
	end)
	tinsert (Off, FigureAlive { NpcId = Avatar})

	tinsert(params.Conditions, FigureAlive{NpcId = params.Target})
	tinsert(params.Conditions, FigureJob{NpcId = params.NpcId})
	if PlatformId >= 200 and PlatformId <= 213 then
		tinsert(params.Conditions, Negated(FigureDominated{}))
	end
	tinsert(params.Conditions, Negated(FigureHasAggro{NpcId = params.NpcId}))

	tinsert(params.Actions, Follow{Target = params.Target, NpcId = params.NpcId})
	tinsert(params.Actions, SetNpcFlagTrue{Name = "NpcHasActiveFollowMode"})

	OnPlatformOneTimeEvent
	{
		Conditions = params.Conditions,
		Actions = params.Actions,
	}
	
	OnToggleEvent
	{
	NotInDialog = FALSE ,
 	UpdateInterval = 60 ,
	OnConditions = 
	{
		FigureDead { NpcId = Avatar},
	},
	OnActions = { },
	
	OffConditions = Off, 
		
	OffActions = 
	{
		Follow { Target = params.Target, NpcId = params.NpcId},
	},
	}
	
end

doc[numdoc] = [[Syntax:<br><code>OnFollowForever<br>{<br>Target = , NpcId = self,<br>Conditions = {},<br>Actions = {},<br>}</code><br>Persistenter Follow Modus. Werden die Conditions wahr beginnt der NPC mit dem Follow. Der Follow wird nach einem Kartenwechsel wieder aufgenommen, vorausgesetzt die Conditions sind weiterhin wahr (das sollten sie auch sein)!]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** --------------------------------------------------------------------------------
function OnFollowToggle(params)
	local FuncName = "GDS: OnFollowToggle(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.FollowOnlyOnce = params.FollowOnlyOnce or FALSE
	params.NpcId = params.NpcId or NpcId
	assert2(params.NpcId == NpcId, FuncName .. "must be used in NPC who is to follow the target!")
	assert2(params.Target, FuncName .. "MISSING PARAMETER: Target = ")
	params.FollowConditions = params.FollowConditions or {}
	assert2(type(params.FollowConditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: FollowConditions = ")
	assert2(params.StopFollowConditions, FuncName .. "MISSING PARAMETER: StopFollowConditions = ")
	params.FollowActions = params.FollowActions or {}
	assert2(type(params.FollowActions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: FollowActions = ")
	params.StopFollowActions = params.StopFollowActions or {}
	assert2(type(params.StopFollowActions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: StopFollowActions = ")
	assert2(getn(tkeys(params)) == 7, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- save data for respawn reactivation of follow
	local data = {}
	data.NpcId = params.NpcId
	data.Target = params.Target
	data.Conditions = params.FollowConditions
	tinsert(FollowData, data)
	
	local Off = {}
	foreachi(params.StopFollowConditions, function (i,condition)
		tinsert (%Off, Negated(condition:Clone ()) )
	end)
	tinsert (Off, FigureAlive { NpcId = Avatar})
	
	tinsert(params.FollowConditions, FigureAlive{NpcId = params.Target})
	tinsert(params.FollowConditions, FigureJob{NpcId = params.NpcId})
	if PlatformId >= 200 and PlatformId <= 213 then
		tinsert(params.FollowConditions, Negated(FigureDominated{}))
	end
	tinsert(params.FollowConditions, Negated(FigureHasAggro{NpcId = params.NpcId}))
	if params.FollowOnlyOnce == TRUE then
		tinsert(params.FollowConditions, 1, IsNpcFlagFalse{Name = "DoNotFollowAgain"})
	end

	tinsert(params.FollowActions, Follow{Target = params.Target, NpcId = params.NpcId})
	tinsert(params.FollowActions, SetNpcFlagTrue{Name = "NpcHasActiveFollowMode"})

	tinsert(params.StopFollowConditions, FigureAlive{NpcId = params.Target})
	tinsert(params.StopFollowConditions, FigureJob{NpcId = params.NpcId})
	if PlatformId >= 200 and PlatformId <= 213 then
		tinsert(params.StopFollowConditions, Negated(FigureDominated{}))
	end
	tinsert(params.StopFollowConditions, Negated(FigureHasAggro{NpcId = params.NpcId}))

	tinsert(params.StopFollowActions, StopFollow{Target = params.Target, NpcId = params.NpcId})
	tinsert(params.StopFollowActions, SetNpcFlagFalse{Name = "NpcHasActiveFollowMode"})
	if params.FollowOnlyOnce == TRUE then
		tinsert(params.StopFollowActions, SetNpcFlagTrue{Name = "DoNotFollowAgain"})
	end

	OnToggleEvent
	{
		NotInDialog = FALSE , UpdateInterval = 30 , ResetOnPlatformLoad = TRUE ,
		OnConditions = params.FollowConditions,
		OnActions = params.FollowActions,
		OffConditions = params.StopFollowConditions,
		OffActions = params.StopFollowActions,
	}
	
	OnToggleEvent
	{
	NotInDialog = FALSE ,
 	UpdateInterval = 60 ,
	OnConditions = 
	{
		FigureDead { NpcId = Avatar},
	},
	OnActions = { },
	
	OffConditions = Off, 
		
	OffActions = 
	{
		Follow { Target = params.Target, NpcId = params.NpcId},
	},
	}
end

doc[numdoc] = [[Syntax:<br><code>OnFollowToggle<br>{<br>Target = , NpcId = self, FollowOnlyOnce = FALSE,<br>FollowConditions =	{},<br>FollowActions = {},<br>StopFollowConditions =	{},<br>StopFollowActions = {},<br>}</code><br>Persistenter Follow Toggle, bzw. auf NP Karten automatisch nicht-persistent! Wenn die FollowConditions zutreffen geht der NPC in den Follow Mode, wenn die StopFollowConditions zutreffen hört er auf mit dem follow. Mit FollowOnlyOnce kann man angeben das der NPC nach wahr werden der StopFollowConditions nie mehr wieder einen follow macht (ausser NP Karten), wenn FollowOnlyOnce == FALSE ist dann würde nach dem StopFollow wieder auf die FollowConditions geprüft werden.<br>HINWEIS: es wird immer zusätzlich abgefragt ob das target lebt, der follow NPC kein aggro hat und idle ist!<br>HINWEIS: die persistenz des follow mode bleibt solange erhalten, wie die FollowConditions wahr sind. Wurde kein StopFollow ausgeführt, aber die FollowConditions sind nicht mehr wahr dann wird der NPC nach Plattformwechsel seinen Follow nicht wieder aufnehmen! (Ausnahme: NP Plattformen)]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** --------------------------------------------------------------------------------
function OnFollowMe(params)
	local FuncName = "GDS: OnFollowMe(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	params.Direction = params.Direction or random(0,7)
	params.LeadRange = params.LeadRange or 20
	if params.LeadRange < 15 then params.LeadRange = 15 end
	params.Conditions = params.Conditions or {}
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	params.Actions = params.Actions or {}
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	params.HomeActions = params.HomeActions or {}
	if getn(params.HomeActions) == 0 then
		params.NoWalkToBasepoint = TRUE
	else
		params.NoWalkToBasepoint = FALSE
	end
	assert2(type(params.HomeActions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: HomeActions = ")
	assert2(getn(tkeys(params)) == 8, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local FollowMeRange = 6
	NumFollowMe = NumFollowMe + 1
	local Prefix = "OnFollowMe#" .. NumFollowMe .. "_"

	tinsert(params.Conditions, IsNpcFlagFalse{Name = Prefix .. "MeFollowingPlayer", UpdateInterval = 10})
	tinsert(params.Conditions, Negated(FigureHasAggro{}))
	tinsert(params.Conditions, IsNpcFlagFalse{Name = Prefix .. "DoneWithFollowMe"})

	tinsert(params.Actions, SetNpcFlagTrue{Name = Prefix .. "PlayerFollowsMe"})
	tinsert(params.Actions, SetNpcFlagFalse{Name = Prefix .. "MeFollowingPlayer"})
	--tinsert(params.Actions, Outcry{Tag = "outcryEinarShiel001", NpcId = NpcId, String = "Kommt! Folgt mir!", Color = ColorWhite})
	--tinsert(params.Actions, SetEffect{Effect = "Spawnboss", Length = 3000})

	--tinsert(params.HomeActions, SetEffect{Effect = "BuildingFire", Length = 13000, NpcId = Avatar})
	--tinsert(params.HomeActions, Outcry{ Tag = "outcryGuntharNW005", NpcId = NpcId, String = "Es ist vorbei! Wir haben es überstanden!", Color = ColorWhite })
	tinsert(params.HomeActions, SetNpcFlagFalse{Name = Prefix .. "PlayerFollowsMe"})
	tinsert(params.HomeActions, SetNpcFlagFalse{Name = Prefix .. "MeFollowingPlayer"})
	tinsert(params.HomeActions, SetNpcFlagTrue{Name = Prefix .. "DoneWithFollowMe"})
	tinsert(params.HomeActions, StopFollow{NpcId = NpcId, Target = Avatar})

	-- zum ersten punkt laufen
	OnIdleGoHome{
		WalkMode = Run, X = params.X, Y = params.Y, Direction = params.Direction, Range = 0,
		--CheckOnlyAggro = TRUE,
		Conditions = params.Conditions,
		Actions = params.Actions,
		HomeActions = params.HomeActions,
		AbortConditions = {
			Negated(FigureInRangeNpc{TargetNpcId = Avatar, Range = params.LeadRange, UpdateInterval = 20}),
		},
		AbortActions = {
			Stop{},
			LookAtFigure{Target = Avatar},
			SetNpcTimeStamp{Name = Prefix .. "WoRenntDerDennHin"},
			SetNpcFlagFalse{Name = Prefix .. "PlayerFollowsMe"},
			SetNpcFlagTrue{Name = Prefix .. "MeFollowingPlayer"},
			--Outcry{Tag = "outcryEinarLeaf001" , NpcId = NpcId, String = "He! Ihr da! Hier herüber!", Color = ColorRoyalBlue},
			--Outcry{ Tag = "outcryUriasIceG001" , NpcId = NpcId, String = "Freund! Hier herüber!", Color = ColorWhite },
			--SetEffect{Effect = "Spawnboss", Length = 3000},
		},
	}
	
	OnFollowToggle
	{
		Target = Avatar, NpcId = self , FollowOnlyOnce = FALSE ,
		FollowConditions = {
			IsNpcFlagFalse{Name = Prefix .. "DoneWithFollowMe"},
			IsNpcFlagTrue{Name = Prefix .. "MeFollowingPlayer"},
			IsNpcTimeElapsed{Name = Prefix .. "WoRenntDerDennHin", Seconds = 5, UpdateInterval = 10},
		},
		FollowActions = {
		},
		StopFollowConditions = {
			IsNpcFlagFalse{Name = Prefix .. "DoneWithFollowMe"},
			--FigureJob{},
			FigureInRangeNpc{TargetNpcId = Avatar, Range = FollowMeRange, UpdateInterval = 10},
			Negated(FigureInRange{X = params.X, Y = params.Y, Range = 0})
		},
		StopFollowActions = {
			ClearNpcTimeStamp{Name = Prefix .. "WoRenntDerDennHin"},
			SetNpcFlagTrue{Name = Prefix .. "PlayerFollowsMe"},
			SetNpcFlagFalse{Name = Prefix .. "MeFollowingPlayer"},
		},
	}

	-- verursacht sonst probleme mit nicht ausgeführten home actions...
	--if params.NoWalkToBasePoint == TRUE then
	--	OnToggleEvent
	--	{
	--		OnConditions = {
	--			IsNpcFlagFalse{Name = Prefix .. "DoneWithFollowMe"},
	--			FigureHasAggro{},
	--			IsNpcFlagTrue{Name = Prefix .. "PlayerFollowsMe"},
	--		},
	--		OnActions = {
	--		},
	--		OffConditions = {
	--			IsNpcFlagFalse{Name = Prefix .. "DoneWithFollowMe"},
	--			Negated(FigureHasAggro{}),
	--			IsNpcFlagTrue{Name = Prefix .. "PlayerFollowsMe"},
	--		},
	--		OffActions = {
	--			SetEffect{Effect = "BuildingFire", Length = 13000},
	--			Goto{X = params.X, Y = params.Y, Range = FollowMeRange, WalkMode = Run},
	--			Outcry{Tag = "outcryEinarShiel001", NpcId = NpcId, String = "Kommt! Folgt mir!", Color = ColorYellow},
	--		},
	--	}
	--end
end

doc[numdoc] = [[Syntax:<br><code>OnFollowMe<br>{<br>X = , Y = , Direction = zufall, LeadRange = 20,<br>Conditions =	{},<br>Actions = {},<br>HomeActions = {},<br>}</code><br>Follow "Marcus-Style". Also NPC fordert Spieler auf zu folgen. NPC rennt voran. Wenn NPC ausserhalb LeadRange ist, dann bleibt er stehen und ruft "Hier herüber". Wenn der Spieler dann nicht angedackelt kommt geht der NPC in follow modus und "sucht" den Spieler.]]
doc[numdoc] = nil
numdoc = numdoc + 1


REM = [[
OnAttackPattern
{
	PatternAlpha = {
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionSouthEastX, Y = JunctionSouthEastY, Direction = West, WalkMode = Walk},
		[2] = {X = AttackTroll1X, Y = AttackTroll1Y, Direction = East, WalkMode = Run},
	},
	PatternDelta = {
		Retries = 3,
		GuardTime = 5,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionSouthX, Y = JunctionSouthY, Direction = NorthWest, WalkMode = Walk},
	},
	PatternOmega = {
		Retries = 1,
		GuardTime = 20,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionEastX, Y = JunctionEastY, Direction = South, WalkMode = Walk},
		[2] = {X = JunctionNorthX, Y = JunctionNorthY, Direction = South, WalkMode = Run},
	},
	CommonGoal = {X = AttackOrkMonumentX, Y = AttackOrkMonumentY, GuardTime = 10},
}
]]
-- **DOC** --------------------------------------------------------------------------------
function OnAttackPattern(params)
	local FuncName = "GDS: OnAttackPattern(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.PatternAlpha, FuncName .. "MISSING PARAMETER: PatternAlpha = ")
	params.PatternDelta = params.PatternDelta or {}
	params.PatternOmega = params.PatternOmega or {}
	params.CommonGoal = params.CommonGoal or {}
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.RestartAfterCommonGoal = params.RestartAfterCommonGoal or FALSE
	assert2(getn(tkeys(params)) == 6, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- ================================================================================================
	-- Patterns:
	-- ================================================================================================
	local Counter = 0
	local LastCounter = 0
	local NumWaypoints = 0
	
	-- es sind nur 3 patterns definiert/erlaubt:
	for i = 1, 3 do
		if i == 1 then
			ThisPattern = params.PatternAlpha
		elseif i == 2 then
			ThisPattern = params.PatternDelta
		elseif i == 3 then
			ThisPattern = params.PatternOmega
		end
		
		-- early out
		if not ThisPattern then break end
		if getn(ThisPattern) == 0 then break end
		
		print("Attack Pattern " .. i)
		
		LastCounter = Counter
		Counter = Counter + ThisPattern.Retries
		NumWaypoints = getn(ThisPattern)

		foreachi(ThisPattern, function(k, pattern)
			local conditions = {}
			local actions = {}
			local homeactions = {}

			print("\tWaypoint " .. k)

			tinsert(conditions, Negated(FigureDominated{}))
			tinsert(conditions, IsGlobalFlagTrue{Name = %params.Name})
			--tinsert(conditions, IsNpcFlagFalse{Name = %params.Name .. "AttackPatternCommonGoalPointActive"})
			tinsert(conditions, IsNpcCounter{Name = %params.Name .. "AttackPatternCounter", Operator = IsLess, Value = %Counter})
			tinsert(conditions, IsNpcCounter{Name = %params.Name .. "AttackPatternCounter", Operator = IsGreaterOrEqual, Value = %LastCounter})
			tinsert(conditions, IsNpcCounter{Name = %params.Name .. "AttackPatternWaypointNum", Value = k - 1})
			tinsert(conditions, IsNpcTimeElapsed{Name = %params.Name .. "AttackPatternGuardTimer", Seconds = %ThisPattern.GuardTime or 0.1})
	
			-- am letzten wegpunkt den common goal point aktivieren			
			if k == %NumWaypoints then
				tinsert(homeactions, SetNpcFlagTrue{Name = %params.Name .. "AttackPatternCommonGoalPointActive"})
				print("\tabove is the last Waypoint ...")
			end

			tinsert(homeactions, IncreaseNpcCounter{Name = %params.Name .. "AttackPatternWaypointNum"})
			tinsert(homeactions, SetNpcTimeStamp{Name = %params.Name .. "AttackPatternGuardTimer"})

			OnIdleGoHome
			{
				X = pattern.X, Y = pattern.Y, Range = 6,
				Direction = pattern.Direction, WalkMode = pattern.WalkMode,
				Conditions = conditions,
				Actions = actions,
				HomeActions = homeactions,
			}
		end)
	end

	-- ================================================================================================
	-- common goal:
	-- ================================================================================================
	if getn(tkeys(params.CommonGoal)) > 0 then	
		print("Common Goal Point")
		
		local ResetActions = params.CommonGoal.HomeActions or {}
		
		tinsert(ResetActions, SetNpcFlagTrue{Name = params.Name .. "CommonGoalPointConquered"})
		tinsert(ResetActions, SetNpcTimeStamp{Name = params.Name .. "AttackPatternGuardTimer"})
	
		if params.RestartAfterCommonGoal == TRUE then
			tinsert(ResetActions, IncreaseNpcCounter{Name = params.Name .. "AttackPatternCounter"})
			tinsert(ResetActions, ResetNpcCounter{Name = params.Name .. "AttackPatternWaypointNum"})
			tinsert(ResetActions, SetNpcFlagFalse{Name = params.Name .. "AttackPatternCommonGoalPointActive"})
		end
		
		OnIdleGoHome
		{
			X = params.CommonGoal.X, Y = params.CommonGoal.Y, Range = 6,
			Direction = params.CommonGoal.Direction, WalkMode = params.CommonGoal.WalkMode,
			Conditions = {
				Negated(FigureDominated{}),
				IsGlobalFlagTrue{Name = params.Name},
				IsNpcFlagTrue{Name = params.Name .. "AttackPatternCommonGoalPointActive"},
				IsNpcTimeElapsed{Name = params.Name .. "AttackPatternGuardTimer", Seconds = params.CommonGoal.GuardTime or 5},
			},
			HomeActions = ResetActions,
		}
	end

	-- ================================================================================================
	-- reset flags etc.
	-- ================================================================================================
	OneTimeInitAction( SetNpcTimeStamp{Name = params.Name .. "AttackPatternGuardTimer"} )

	-- nach dem letzten pattern wieder beim ersten beginnen
	OnEvent
	{
		Conditions = {
			IsGlobalFlagTrue{Name = params.Name},
			IsNpcCounter{Name = params.Name .. "AttackPatternCounter", Operator = IsGreaterOrEqual, Value = Counter},
		},
		Actions = {
			ResetNpcCounter{Name = params.Name .. "AttackPatternCounter"},
		},
	}

	local ResetActions = {}
	tinsert(ResetActions, IncreaseNpcCounter{Name = params.Name .. "AttackPatternCounter"})
	tinsert(ResetActions, ResetNpcCounter{Name = params.Name .. "AttackPatternWaypointNum"})
	tinsert(ResetActions, SetNpcFlagFalse{Name = params.Name .. "AttackPatternCommonGoalPointActive"})
	OnDeath
	{
		Actions = ResetActions,
	}	
end

doc[numdoc] = [[Syntax:<br><code>OnAttackPattern<br>{<br><br>}</code><br>...]]
doc[numdoc] = nil
numdoc = numdoc + 1



REM = [[
-- wenn spieler das item neu bekommt, wird das entspr. playerhas(had)item flag auf TRUE gesetzt (einmalig!)
	-- es werden 2 flags gesetzt: "PlayerHasItemErdklinge" und "PlayerHasHadItemErdklinge" (bleibt immer TRUE)
-- wenn spieler das item nicht mehr hat, wird das entspr. playerhasitem flag wieder auf FALSE gesetzt (einmalig!)
-- wenn das item flag auf FALSE gesetzt wurde, dann wird dem spieler das item genommen (einmalig!)
-- ein Amount Parameter wird vorerst nicht unterstützt, wir sollten lieber unique items nehmen (z.b. FeuerOpal, EisOpal und SumpfOpal statt "bring mir 3 hellblau-karierte Opale mit rosa Herzchen drauf")
OnQuestItemFound	-- spieler findet ein neues item (neu im inventar)
{
	ItemId = 1234,	-- dieses item im inventar?
	Amount = 1,		-- mind. soviele items
	ItemFlagName = "PlayerHasItem" .. "Erdklinge",	-- dann dieses flag und "PlayerHasHadItem..." auf TRUE setzen
	Actions = {
	},
}
OnQuestItemLost		-- item nicht im inventar, aber item flag ist wahr? (item fehlt, aber flag TRUE)
{
	ItemId = 1234,	-- dieses item nicht im inventar?
	Amount = 1,
	ItemFlagName = "PlayerHasItem" .. "Erdklinge",	-- dann dieses flag auf FALSE setzen
	Actions = {
	},
}
OnQuestItemRemove	-- spieler soll ein item entfernt werden (item vorhanden, aber flag FALSE)
{
	ItemId = 1234,	-- dieses item im inventar?
	Amount = 1,
	ItemFlagName = "PlayerHasItem" .. "Erdklinge",	-- und dieses flag FALSE? dann item entfernen
	Actions = {
	},
}
]]

-- **DOC** --------------------------------------------------------------------------------
function OnQuestItemFound(params)
	local FuncName = "GDS: OnQuestItemFound(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(NpcId == 0, FuncName .. "ONLY ALLOWED IN PLATFORM SCRIPT (n0.lua) !!")
	assert2(params.ItemId, FuncName .. "MISSING PARAMETER: ItemId = ")
	assert2(params.ItemFlagName, FuncName .. "MISSING PARAMETER: ItemFlagName = ")
	params.Amount = params.Amount or 1
	params.Actions = params.Actions or {}
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	local has = "PlayerHasItem"
	local had = "PlayerHasHadItem"

	local actions = {}
--tinsert(actions, SetEffect{Effect = "GlowingTube", NpcId = Avatar, Length = 2000})
--tinsert(actions, SetEffect{Effect = "GroundWave", NpcId = Avatar, Length = 5000})
	tinsert(actions, SetItemFlagTrue{Name = has .. params.ItemFlagName})
	tinsert(actions, SetItemFlagTrue{Name = had .. params.ItemFlagName})
	tinsert(actions, SetGlobalTimeStamp {Name = "QuestItemFoundTimer" .. params.ItemFlagName})
	
	OnOneTimeEvent
	{
		Conditions = {
			PlayerHasItem{ItemId = params.ItemId, Amount = params.Amount},
		},
		Actions = actions,
	}
end

doc[numdoc] = [[Syntax:<br><code>OnQuestItemFound<br>{<br>ItemId = , ItemFlagName = , Amount = ,<br>Actions = { ... },<br>}</code><br>Wenn die angegebene Menge (default: 1) des angegebenen Items im Inventar des Spielers ist (und es sollte ein QuestItem sein sonst könnte es der Spieler equippen oder verkaufen), dann setzt dieser Befehl 2 ItemFlags auf TRUE: "PlayerHasItem" + ItemFlagName und "PlayerHasHadItem" + ItemFlagName die man dann an anderer Stelle abfragen kann. Ersteres Flag bedeutet "Spieler hat das Item noch im Inventar", zweiteres sagt aus das der Spieler das Item irgendwann mal im Inventar hatte, egal ob es noch im Inventar ist oder längst entfernt wurde. Anhand diesem flag sollte man die Dialoge entsprechend steuern.<br>Beispiel für ItemFlags: wenn ItemFlagName = "Erdklinge" dann bedeutet "PlayerHasItem" + ItemFlagName einen ItemFlag Name = "PlayerHasItemErdklinge"<br>WICHTIG: nur im n0.lua einsetzen!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnQuestItemRemove(params)
	local FuncName = "GDS: OnQuestItemRemove(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(NpcId == 0, FuncName .. "ONLY ALLOWED IN PLATFORM SCRIPT (n0.lua) !!")
	assert2(params.ItemId, FuncName .. "MISSING PARAMETER: ItemId = ")
	assert2(params.ItemFlagName, FuncName .. "MISSING PARAMETER: ItemFlagName = ")
	params.Amount = params.Amount or 1
	params.Actions = params.Actions or {}
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local has = "PlayerHasItem"
	local lost = "PlayerHasLostItem"
	local actions = {}
--tinsert(actions, SetEffect{Effect = "AreaHit", NpcId = Avatar, Length = 4000})
--tinsert(actions, SetEffect{Effect = "BuildingFire", NpcId = Avatar, Length = 1000})
	tinsert(actions, TransferItem{TakeItem = params.ItemId, Flag = Take, Amount = params.Amount})
	tinsert(actions, SetItemFlagTrue{Name = lost .. params.ItemFlagName})
	tinsert(actions, DebugLog{String = "QuetsItem Remove !!!" .. params.ItemFlagName})

	OnOneTimeEvent
	{
		Conditions = {
			Negated(IsItemFlagTrue{Name = has .. params.ItemFlagName}),
			PlayerHasItem{ItemId = params.ItemId, Amount = params.Amount},
			IsGlobalTimeElapsed {Name = "QuestItemFoundTimer" .. params.ItemFlagName, Seconds = 10},
		},
		Actions = actions,
	}
end

doc[numdoc] = [[Syntax:<br><code>OnQuestItemRemove<br>{<br>ItemId = , ItemFlagName = , Amount = ,<br>Actions = { ... },<br>}</code><br>Wenn man das ItemFlag "PlayerHasItem" + ItemFlagName an anderer Stelle auf FALSE setzt, dann führt diese Abfrage dazu das die angegebene Anzahl Items aus dem Inventar entfernt werden. Items sollte man grundsätzlich nur noch über diese Funktion aus dem Inventar entfernen!! Es wird ausserdem das ItemFlag "PlayerHasLostItem" + ItemFlagName auf TRUE gesetzt.<br>Beispiel für ItemFlags: wenn ItemFlagName = "Erdklinge" dann bedeutet "PlayerHasItem" + ItemFlagName einen ItemFlag Name = "PlayerHasItemErdklinge"<br>WICHTIG: nur im n0.lua einsetzen!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnQuestItemLost(params)
	local FuncName = "GDS: OnQuestItemLost(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(NpcId == 0, FuncName .. "ONLY ALLOWED IN PLATFORM SCRIPT (n0.lua) !!")
	assert2(params.ItemId, FuncName .. "MISSING PARAMETER: ItemId = ")
	assert2(params.ItemFlagName, FuncName .. "MISSING PARAMETER: ItemFlagName = ")
	params.Amount = params.Amount or 1
	params.Actions = params.Actions or {}
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local has = "PlayerHasItem"
	local lost = "PlayerHasLostItem"
	local actions = {}
--tinsert(actions, SetEffect{Effect = "AreaHit1", NpcId = Avatar, Length = 3000})
--tinsert(actions, SetEffect{Effect = "Spawnboss", NpcId = Avatar, Length = 6000})
	tinsert(actions, SetItemFlagFalse{Name = has .. params.ItemFlagName})
	tinsert(actions, SetItemFlagTrue{Name = lost .. params.ItemFlagName})

	OnOneTimeEvent
	{
		Conditions = {
			IsItemFlagTrue{Name = has .. params.ItemFlagName},
			Negated(PlayerHasItem{ItemId = params.ItemId, Amount = 1}),
		},
		Actions = actions,
	}
end

doc[numdoc] = [[Syntax:<br><code>OnQuestItemLost<br>{<br>Actions = { ... },<br>}</code><br>WICHTIG: nur im n0.lua einsetzen!]]
doc[numdoc] = nil
numdoc = numdoc + 1


------------------------------------------------------------------------------------------------------------------------
-- Spellforce Kram below, add-on kram above this line !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
------------------------------------------------------------------------------------------------------------------------


-- **DOC** --------------------------------------------------------------------------------
function OnPlayerDeathOrPlatformChange(params)
	local FuncName = "GDS: OnPlayerDeathOrPlatformChange(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(NpcId == 0, FuncName .. "ONLY ALLOWED IN PLATFORM SCRIPT (n0.lua) !!")
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	assert2(getn(params.Actions) > 0, FuncName .. "INVALID PARAMETER: Actions table is empty!")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	tinsert(PlayerEvents.DeathActions, params.Actions)
end

doc[numdoc] = [[Syntax:<br><code>OnPlayerDeathOrPlatformChange<br>{<br>Actions = { ... },<br>}</code><br>Actions die jedes mal auf dieser Karte ausgeführt werden, wenn der Spieler stirbt. ACHTUNG: Actions werden auch beim Plattformwechsel ausgeführt! Lässt sich leider nicht verhindern... Nur im n0.lua verwenden!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnPlayerReviveOrPlatformEnter(params)
	local FuncName = "GDS: OnPlayerReviveOrPlatformEnter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(NpcId == 0, FuncName .. "ONLY ALLOWED IN PLATFORM SCRIPT (n0.lua) !!")
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	assert2(getn(params.Actions) > 0, FuncName .. "INVALID PARAMETER: Actions table is empty!")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	tinsert(PlayerEvents.ReviveActions, params.Actions)
end

doc[numdoc] = [[Syntax:<br><code>OnPlayerReviveOrPlatformEnter<br>{<br>Actions = { ... },<br>}</code><br>Actions die jedes mal auf dieser Karte ausgeführt werden, wenn der Spieler am Monument wiederbelebt wird. Nur im n0.lua verwenden!<br>WICHTIGER HINWEIS: der Spieler könnte auf einer anderen Plattform wiederbelebt werden, in diesem Fall würde dieses Event erst wahr werden wenn der Spieler die Plattform erneut betritt, auf der er gestorben ist!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnSharrowDaleSuicideBooth(params)
	local FuncName = "GDS: OnSharrowDaleSuicideBooth(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(getn(tkeys(params)) == 0, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local AvatarRangeToBoss = 12
	
	SpawnOnlyWhen
	{
		X = NpcX, Y = NpcY,
		Conditions = {
			FigureInRange{X = 182, Y = 274, NpcId = Avatar, Range = AvatarRangeToBoss, UpdateInterval = 10},
		} , 
		Actions = {
			SetNpcFlagTrue{Name = "AttackNow"},
			SetNpcFlagFalse{Name = "DoNotCheckHealth"},
			SetNpcTimeStamp{Name = "CheckIdle"},
		},
	}
	
	Respawn
	{
		WaitTime = 5,
		Conditions = {
			Negated(FigureInRange{X = NpcX, Y = NpcY, NpcId = Avatar, Range = AvatarRangeToBoss, UpdateInterval = 20}),
			BuildingInRange{X = NpcX, Y = NpcY, Range = 6, UpdateInterval = 20},
		}, 
		Actions = {
			SetNpcFlagTrue{Name = "AttackNow"},
			SetNpcFlagFalse{Name = "DoNotCheckHealth"},
			SetNpcTimeStamp{Name = "CheckIdle"},
		}, 
		DeathActions = {
		} 
	}

	-- angriff event
	OnEvent
	{
		Conditions = {
			IsNpcFlagTrue{Name = "AttackNow", UpdateInterval = 10},
		},
		Actions = {
			ChangeRace{Race = 124},
			SetNpcFlagFalse{Name = "AttackNow"},
			SetNpcFlagTrue{Name = "ContinueAttack"},
			SetFreezeFlagFalse{},
			--SetEffect{Effect = "Spawnboss"},
		},
	}

	OnIdleEvent
	{
		Conditions = {
			FigureAlive{NpcId = Avatar},
			IsNpcFlagTrue{Name = "ContinueAttack", UpdateInterval = 10},
			IsNpcTimeElapsed{Name = "CheckIdle", Seconds = 2},
		},
		Actions = {
			AttackTarget{Target = Avatar},
			SetNpcTimeStamp{Name = "CheckIdle"},
		},
	}

	-- verschwinden event
	OnEvent
	{
		Conditions = {
			IsNpcFlagFalse{Name = "DoNotCheckHealth", UpdateInterval = 20},
			FigureHasHealth{Percent = 98, UpdateInterval = 3},
		},
		Actions = {
			SetNpcFlagFalse{Name = "ContinueAttack"},
			SetNpcFlagTrue{Name = "DoNotCheckHealth"},
			ChangeRace{Race = 152},
			StopEffect{},
			SetEffect{Effect = "DeMaterialize", Length = 1550},
			SetNpcTimeStamp{Name = "DespawnTimer"},
		},
	}
	
	Despawn
	{
		Conditions = {
			IsNpcTimeElapsed{Name = "DespawnTimer", Seconds = 1.5, UpdateInterval = 5},
		},
		Actions = {
			ClearNpcTimeStamp{Name = "DespawnTimer"},
		},
	}
end

doc[numdoc] = [[Nur für Sharrowdale, Endkampf und so...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnSharrowDaleOgreFx(params)
	local FuncName = "GDS: OnSharrowDaleOgreFx(): "
	--assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	--assert2(getn(tkeys(params)) == 0, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- fx für ogre
	OneTimeInitAction( SetEffect{Effect = "Gladiator"} )
	--PlatformInitAction( SetEffect{Effect = "GlowingTube"} )
	--PlatformInitAction( SetEffect{Effect = "SimpleInvis"} )
end

doc[numdoc] = [[Nur für Sharrowdale, Endkampf und so...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnSharrowDaleBladeArmyAttack(params)
	local FuncName = "GDS: OnSharrowDaleBladeArmyAttack(): "
	--assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	--assert2(getn(tkeys(params)) == 0, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- angriff event
	OnOneTimeEvent
	{
		Conditions = {
			IsGlobalFlagTrue{Name = "BladeArmyAttackNow!", UpdateInterval = 10},
			--PlayerUnitInRange{X = 294, Y = 392, Range = 8 , FigureType = FigureAll , UpdateInterval = 10},
		},
		Actions = {
			Goto{X = 292, Y = 392, GotoMode = GotoContinous, WalkMode = Run, Range = 10},
			SetGlobalFlagTrue{Name = "SoulforgerWantsToFight"},
		},
	}
end

doc[numdoc] = [[Nur für Sharrowdale, Endkampf und so...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnMulandirGargoyle(params)
	local FuncName = "GDS: OnMulandirGargoyle(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.Direction = params.Direction or random(0,7)
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	OneTimeInitAction(	ChangeRace{Race = 168} )	-- Clan Human 12 (merchant test neutral)
	OneTimeInitAction(	ChangeUnit{Unit = 1329} )

	OnOneTimeEvent
	{
		Conditions = {
		},
		Actions = {
			--LookAtFigure{Target = Avatar},
			LookAtDirection{Direction = params.Direction},
			SetFreezeFlagTrue{},
		},
	}
	
	GargoylesMinActiveTime = 15
	
	-- map placed home
	OnIdleGoHome
	{
		WalkMode = Walk, X = NpcX, Y = NpcY, Direction = params.Direction,
		Conditions = {
			Negated(FigureHasAggro{}),
			ODER(
				IsGlobalFlagFalse{Name = "GargoylesWakeUpAlready!"},
				IsGlobalTimeElapsed{Name = "GargoylesMinActiveTime", Seconds = GargoylesMinActiveTime}
				),
		},
		HomeActions = {
			SetNpcFlagTrue{Name = "GargoyleWaitingToGetStoned"},
			LookAtFigure{Target = Avatar},
		},
	}
	
	OnToggleEvent
	{
		OnConditions = {
			IsGlobalFlagTrue{Name = "GargoylesWakeUpAlready!", UpdateInterval = 15},
		},
		OnActions = {
			ChangeRace{Race = 102},	-- Gargoyles
			ChangeUnit{Unit = 1067},
			SetFreezeFlagFalse{},
		},
		OffConditions = {
			FigureInRange{X = NpcX, Y = NpcY, Range = 0},
			IsGlobalTimeElapsed{Name = "GargoylesMinActiveTime", Seconds = GargoylesMinActiveTime, UpdateInterval = 30},
			ODER(
				IsNpcFlagTrue{Name = "GargoyleWaitingToGetStoned", UpdateInterval = 20},
				IsGlobalFlagFalse{Name = "GargoylesWakeUpAlready!", UpdateInterval = 20}
				),
		},
		OffActions = {
			SetNpcFlagFalse{Name = "GargoyleWaitingToGetStoned"},
			ChangeRace{Race = 168},	-- Clan Human 12 (merchant test neutral)
			ChangeUnit{Unit = 1329},
			SetFreezeFlagTrue{},
		},
	}

end

doc[numdoc] = [[Syntax:<br><code>OnMulandirGargoyle{}</code><br> ...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnMulandirMedusa(params)
	local FuncName = "GDS: OnMulandirMedusa(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Path, FuncName .. "MISSING PARAMETER: Path = ")
	assert2(getn(params.Path) > 0, FuncName .. "INVALID PARAMETER: Path is an empty table!")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	OneTimeInitAction(	ChangeRace{Race = 103})	-- orc generic faction, race golem

	-- wenn gestorben, schau das die gargoyles zumindest noch ein paar sekunden aktiv bleiben
	OnDeath
	{
		Actions = {
			--ShowDebugText{String = ""},
			--ShowDebugText{String = "I AM DIED, PROLONG MY FRIENDS!"},
			SetGlobalTimeStamp{Name = "GargoylesMinActiveTime"},
			SetGlobalFlagFalse{Name = "GargoylesWakeUpAlready!"},
		},
	}
	
	-- wenn aggro, dann alarm
	OnToggleEvent
	{
		OnConditions = {
			FigureHasAggro{},
		},
		OnActions = {
			--ShowDebugText{String = ""},
			--ShowDebugText{String = "IEEEEEEEEEK!!! (kreisch) (zeter) (fluch) (rumzick) (tellerwerf) (nudelholzschwing)"},
			SetGlobalFlagTrue{Name = "GargoylesWakeUpAlready!"},
			SetGlobalTimeStamp{Name = "GargoylesMinActiveTime"},
		},
		OffConditions = {
			Negated(FigureHasAggro{}),
		},
		OffActions = {
			--ShowDebugText{String = ""},
			--ShowDebugText{String = "THE ANGSTLING IS GONE, CALM DOWN MY FRIENDS!"},
			SetGlobalFlagFalse{Name = "GargoylesWakeUpAlready!"},
		},
	}
	
	OneTimeInitAction( SetNpcTimeStamp{Name = "MedusaWaitTime"} )
	OneTimeInitAction( IncreaseNpcCounter{Name = "MedusaGotoHome"} )

	foreachi(params.Path, function(i, point)
		local MedusaIdleHomeNum = i - 1
		local MedusaWaitTime = 30

		local actions = {}
		tinsert(actions, SetNpcTimeStamp{Name = "MedusaWaitTime"} )
		tinsert(actions, LookAtFigure{Target = Avatar} )
		if i == getn(%params.Path) then
			tinsert(actions, ResetNpcCounter{Name = "MedusaGotoHome"} )
		else
			tinsert(actions, IncreaseNpcCounter{Name = "MedusaGotoHome"} )
		end
		
		OnIdleGoHome
		{
			WalkMode = Run, X = point.X, Y = point.Y, Direction = random(0,7),
			Conditions = {
				IsNpcTimeElapsed{Name = "MedusaWaitTime", Seconds = MedusaWaitTime, UpdateInterval = 30},
				IsNpcCounter{Name = "MedusaGotoHome", Value = MedusaIdleHomeNum},
			},
			HomeActions = actions,
		}
	end)
end

doc[numdoc] = [[Syntax:<br><code>OnMulandirMedusa{}</code><br> ...]]
doc[numdoc] = nil
numdoc = numdoc + 1


REM = [[
OnSkeletalAnimation
{
	GotoX = 100, GotoY = 200,			-- despawn destination
	SpawnX = 333, SpawnY = 444,			-- newspawn destination
	RunnerClan = 9,						-- runner unit's clan
	MaxClanSizeRunner = 3,				-- runner clansize
	NewUnits = { 1184, 1184, 1184 },	-- spawn all of these units at destination
	NewUnitsClan = 10,					-- welchen clan die neuen units haben sollen
	MaxClanSizeNew = 40,				-- wie gross der clan maximal sein darf
	TransitDelay = 60,					-- time in s it takes for skeletons to walk through tunnels
	SpawnDelay = 3,						-- spawn delay between each new unit
	RespawnDelay = 90,					-- delay for this unit's respawn, should be > TransitDelay + SpawnDelay
	BeginConditions = {},				-- begin conditions (initial spawn of unit)
	BeginActions = {},
	RespawnConditions = {},				-- suppress respawn (death automatically stops it)
	RespawnActions = {},
}
]]

-- einmal global definieren:
--SkeletalAnimationUnitList = { 1184, 1184, 1184 }

-- **DOC** --------------------------------------------------------------------------------
function OnSkeletalAnimation(params)
	local FuncName = "GDS: OnSkeletalAnimation(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.GotoX, FuncName .. "MISSING PARAMETER: GotoX = ")
	assert2(params.GotoY, FuncName .. "MISSING PARAMETER: GotoY = ")
	assert2(params.SpawnX, FuncName .. "MISSING PARAMETER: SpawnX = ")
	assert2(params.SpawnY, FuncName .. "MISSING PARAMETER: SpawnY = ")
	assert2(params.NewUnits, FuncName .. "MISSING PARAMETER: NewUnits = ")
	assert2(type(params.NewUnits) == "table", FuncName .. "PARAMETER IS NOT A TABLE: NewUnits = ")
	assert2(getn(params.NewUnits) > 0, FuncName .. "EMPTY TABLE: NewUnits = ")
	params.RunnerClan = params.RunnerClan or 0
	--params.MaxClanSizeRunner = params.MaxClanSizeRunner or 3
	-- FORCE OVERRIDE:
	params.MaxClanSizeRunner = 2
	params.NewUnitsClan = params.NewUnitsClan or 0
	--params.MaxClanSizeNew = params.MaxClanSizeNew or 20
	-- FORCE OVERRIDE:
	params.MaxClanSizeNew = 15
	params.TransitDelay = params.TransitDelay or 60
	--params.SpawnDelay = params.SpawnDelay or 3
	-- FORCE OVERRIDE:
	params.SpawnDelay = 5
	--params.RespawnDelay = params.RespawnDelay or 90
	-- FORCE OVERRIDE:
	params.RespawnDelay = 60 * 4
	params.BeginConditions = params.BeginConditions or {}
	params.BeginActions = params.BeginActions or {}
	params.RespawnConditions = params.RespawnConditions or {}
	params.RespawnActions = params.RespawnActions or {}
	if getn(tkeys(params)) < 16 then print(FuncName .. "TOO FEW PARAMS!") end
	if getn(tkeys(params)) > 16 then print(FuncName .. "TOO MANY PARAMS!") end
	--dump(params)
	assert2(getn(tkeys(params)) == 16, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- disable respawn system, gets in the way
	CreateNoDeathEventPlease = TRUE

	-- firsttime spawn timer
	OneTimeInitAction( SetNpcTimeStamp{Name = "SkeletalAnimationStartTimer"} )

	-- create some "truely" random numbers (at least for each Npc)
	randomseed(NpcId * PlatformId + NpcX * NpcY + 1)
	
	-- unit is initially despawned
	tinsert(params.BeginConditions, IsNpcTimeElapsed{Name = "SkeletalAnimationStartTimer", Seconds = floor(random(30,300))})
	tinsert(params.BeginConditions, IsGlobalCounter{Name = "SkeletalAnimationRunner#" .. params.RunnerClan, Operator = IsLess, Value = params.MaxClanSizeRunner, UpdateInterval = 10})
	--tinsert(params.BeginActions, SetEffect{X = NpcX, Y = NpcY, Effect = "Materialize", Length = 2500})
	--tinsert(params.BeginActions, Spawn{X = params.SpawnX, Y = params.SpawnY, UnitId = params.NewUnits[random(1,3)], Clan = params.NewUnitsClan})
	tinsert(params.BeginActions, IncreaseGlobalCounter{Name = "SkeletalAnimationRunner#" .. params.RunnerClan})
	SpawnOnlyWhen
	{
		X = NpcX, Y = NpcY, Clan = params.RunnerClan,
		Conditions = params.BeginConditions,
		Actions = params.BeginActions,
	}

	-- create skeletal animation states
	NewState{Name = "SkeletalAnimationGotoTomb"}
	NewState{Name = "SkeletalAnimationClanFullGoBack"}
	NewState{Name = "SkeletalAnimationTransit"}
	for i = 1, getn(params.NewUnits) do
		NewState{Name = "SkeletalAnimationNewSpawn#" .. i}
	end
	NewState{Name = "SkeletalAnimationWaitForRespawn"}
	
	-- just go into our neat little state system here
	AddTransition{From = "_IDLE", To = "SkeletalAnimationGotoTomb",	Conditions = {}, Actions = {},}

	-- when idle, goto was interrupted (or not started), so goto tomb again...
	AddTransition
	{
		From = "SkeletalAnimationGotoTomb", To = "SkeletalAnimationGotoTomb",
		Conditions = { 
			FigureJob{},
			Negated(FigureInRange{X = params.GotoX, Y = params.GotoY, Range = 1}),
		 },
		Actions = { Goto{X = params.GotoX, Y = params.GotoY, WalkMode = Run} },
	}

REM = [[
	-- when in range but maxclansize reached just go back
	AddTransition
	{
		From = "SkeletalAnimationGotoTomb", To = "SkeletalAnimationGotoTomb",
		Conditions = { 
			FigureJob{},
			FigureInRange{X = params.GotoX, Y = params.GotoY, Range = 1},
			IsClanSize{Clan = params.NewUnitsClan, Size = params.MaxClanSizeNew, UpdateInterval = 30},
		},
		Actions = { Goto{X = NpcX, Y = NpcY, WalkMode = Run} },
	}
]]

	-- when dying, wait for respawn
	AddTransition
	{
		From = "SkeletalAnimationGotoTomb", To = "SkeletalAnimationWaitForRespawn",
		--RemoveTransitionAfterUse = TRUE,
		Conditions = { FigureDying{} },
		Actions = { 
			--SetEffect{NpcId = Avatar, Effect = "Lightning", Length = 2500},
			ResetGlobalCounter{Name = "SkeletalAnimationRunnerVanish#" .. params.RunnerClan},
			ResetGlobalCounter{Name = "SkeletalAnimationRunner#" .. params.RunnerClan},
			SetNpcTimeStamp{Name = "SkeletalAnimationTransitTimer"},
			--IncreaseGlobalCounter{Name = "SkeletalAnimationRunnerVanish#" .. params.RunnerClan},
		},
	}

	-- when in range of tomb, despawn and set timer
	AddTransition
	{
		From = "SkeletalAnimationGotoTomb", To = "SkeletalAnimationTransit",
		Conditions = { 
			FigureJob{},
			FigureInRange{X = params.GotoX, Y = params.GotoY, Range = 1},
			--Negated(IsClanSize{Clan = params.NewUnitsClan, Size = params.MaxClanSizeNew, UpdateInterval = 30}),
		},
		Actions = {
			SetNpcTimeStamp{Name = "SkeletalAnimationTransitTimer"},
			--SetEffect{X = params.GotoX, Y = params.GotoY, Effect = "Fog", Length = 2500},
			IncreaseGlobalCounter{Name = "SkeletalAnimationRunnerVanish#" .. params.RunnerClan},
			Vanish{}, 
		},
	}

	-- check counters
	AddTransition
	{
		From = "SkeletalAnimationTransit", To = "SkeletalAnimationTransit",
		Conditions = { 
			IsGlobalFlagFalse{Name = "SkeletalAnimationCheckCounter"},
			IsGlobalCounter{Name = "SkeletalAnimationRunnerVanish#" .. params.RunnerClan, Operator = IsGreaterOrEqual, Value = params.MaxClanSizeRunner},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "SkeletalAnimationCheckCounter"},
			ResetGlobalCounter{Name = "SkeletalAnimationRunnerVanish#" .. params.RunnerClan},
			ResetGlobalCounter{Name = "SkeletalAnimationRunner#" .. params.RunnerClan},
		},
	}

	-- when transit timer is elapsed, but maxclansize reached, don't spawn but attack
	AddTransition
	{
		From = "SkeletalAnimationTransit", To = "SkeletalAnimationWaitForRespawn",
		Conditions = { 
			IsNpcTimeElapsed{Name = "SkeletalAnimationTransitTimer", Seconds = params.TransitDelay, UpdateInterval = 30}, 
			IsClanSize{Clan = params.NewUnitsClan, Size = params.MaxClanSizeNew * 1.5, UpdateInterval = 30},
		},
		Actions = {
			SetGlobalFlagFalse{Name = "SkeletalAnimationCheckCounter"},
			--ClanAttack{Number = 2, SourceClan = params.NewUnitsClan, TargetX = 215, TargetY = 285, WalkMode = Run},
		},
	}

	-- when transit timer is elapsed, but maxclansize reached, spawn and attack #2
	AddTransition
	{
		From = "SkeletalAnimationTransit", To = "SkeletalAnimationWaitForRespawn",
		Conditions = { 
			IsNpcTimeElapsed{Name = "SkeletalAnimationTransitTimer", Seconds = params.TransitDelay, UpdateInterval = 30}, 
			IsClanSize{Clan = params.NewUnitsClan, Size = params.MaxClanSizeNew, UpdateInterval = 30},
			Negated(IsClanSize{Clan = params.NewUnitsClan, Size = params.MaxClanSizeNew * 1.5, UpdateInterval = 30}),
		},
		Actions = {
			SetGlobalFlagFalse{Name = "SkeletalAnimationCheckCounter"},
			--SetEffect{X = params.SpawnX, Y = params.SpawnY, Effect = "Materialize", Length = 2500},
			Spawn{X = params.SpawnX, Y = params.SpawnY, UnitId = params.NewUnits[random(1,3)], Clan = params.NewUnitsClan}, 
			--ClanAttack{Number = 2, SourceClan = params.NewUnitsClan, TargetX = 215, TargetY = 285, WalkMode = Run},
		},
	}

	-- when transit timer is elapsed, begin spawning
	AddTransition
	{
		From = "SkeletalAnimationTransit", To = "SkeletalAnimationNewSpawn#1",
		Conditions = { 
			IsNpcTimeElapsed{Name = "SkeletalAnimationTransitTimer", Seconds = params.TransitDelay, UpdateInterval = 30},
			Negated(IsClanSize{Clan = params.NewUnitsClan, Size = params.MaxClanSizeNew, UpdateInterval = 30}),
		},
		Actions = {
			SetGlobalFlagFalse{Name = "SkeletalAnimationCheckCounter"},
			SetNpcTimeStamp{Name = "SkeletalAnimationNewSpawnTimer"},
			--SetEffect{X = params.SpawnX, Y = params.SpawnY, Effect = "Materialize", Length = 2500},
			Spawn{X = params.SpawnX, Y = params.SpawnY, UnitId = params.NewUnits[1], Clan = params.NewUnitsClan}, 
		},
	}

	-- create spawn transition for each unit to spawn
	for i = 2, getn(params.NewUnits) do
		if i < getn(params.NewUnits) then
			AddTransition
			{
				From = "SkeletalAnimationNewSpawn#" .. i-1, To = "SkeletalAnimationNewSpawn#" .. i,
				Conditions = { IsNpcTimeElapsed{Name = "SkeletalAnimationNewSpawnTimer", Seconds = params.SpawnDelay, UpdateInterval = 10} },
				Actions = {
					SetNpcTimeStamp{Name = "SkeletalAnimationNewSpawnTimer"},
					--SetEffect{X = params.SpawnX, Y = params.SpawnY, Effect = "Materialize", Length = 2500},
					Spawn{X = params.SpawnX, Y = params.SpawnY, UnitId = params.NewUnits[i], Clan = params.NewUnitsClan}, 
				},
			}
		else	-- this is the last transition, wait for respawn
			AddTransition
			{
				From = "SkeletalAnimationNewSpawn#" .. i-1, To = "SkeletalAnimationWaitForRespawn",
				Conditions = { IsNpcTimeElapsed{Name = "SkeletalAnimationNewSpawnTimer", Seconds = params.SpawnDelay, UpdateInterval = 10} },
				Actions = {
					SetNpcTimeStamp{Name = "SkeletalAnimationNewSpawnTimer"},
					--SetEffect{X = params.SpawnX, Y = params.SpawnY, Effect = "Materialize", Length = 2500},
					Spawn{X = params.SpawnX, Y = params.SpawnY, UnitId = params.NewUnits[i], Clan = params.NewUnitsClan},
				},
			}
		end
	end
		
	-- wait for respawn of initial unit, and close the loop
	tinsert(params.RespawnConditions, FigureAlive{NpcId = 3257})
	tinsert(params.RespawnConditions, IsNpcTimeElapsed{Name = "SkeletalAnimationTransitTimer", Seconds = params.RespawnDelay + random(0, params.SpawnDelay), UpdateInterval = 30})
	tinsert(params.RespawnConditions, IsGlobalCounter{Name = "SkeletalAnimationRunner#" .. params.RunnerClan, Operator = IsLess, Value = params.MaxClanSizeRunner, UpdateInterval = 10})
	tinsert(params.RespawnActions, Spawn{X = NpcX, Y = NpcY, NpcId = NpcId, Range = 0, Clan = params.RunnerClan})
	tinsert(params.RespawnActions, SetEffect{X = NpcX, Y = NpcY, Effect = "Materialize", Length = 2500})
	tinsert(params.RespawnActions, IncreaseGlobalCounter{Name = "SkeletalAnimationRunner#" .. params.RunnerClan})
	AddTransition
	{
		From = "SkeletalAnimationWaitForRespawn", To = "SkeletalAnimationGotoTomb",
		Conditions = params.RespawnConditions,
		Actions = params.RespawnActions,
	}
end

doc[numdoc] = [[Syntax:<br><code>OnSkeletalAnimation{}</code><br>Greydusk - Hardcore-Gamer only! Note: never use this function together with any other function!]]
doc[numdoc] = nil
numdoc = numdoc + 1


REM = [[
OnPortalEvent
{
	X = 100, Y = 200,		-- position of portal object
	CenterX = 105, CenterY = 203,		-- center of portal pathway
	Type = StadtTor,		-- type of portal
	OpenConditions = {},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
}
]]

-- min range == 6 !!
StadtTor		= { Open = 2014, Closed = 2114, Range = 8, OpenFx = "GateLargeOpen", CloseFx = "GateLargeClose", }
PortalKeep		= { Open = 2024, Closed = 2013, Range = 6, OpenFx = "GateSmallOpen", CloseFx = "GateSmallClose", }
SteinTorGross	= { Open = 2162, Closed = 2141, Range = 8, OpenFx = "StoneGateLargeOpen", CloseFx = "StoneGateLargeClose", }
SteinTorKlein	= { Open = 2163, Closed = 2142, Range = 6, OpenFx = "StoneGateSmallOpen", CloseFx = "StoneGateSmallClose", }
ElfenTor		= { Open = 2584, Closed = 2583, Range = 8, OpenFx = "ElfGateOpen", CloseFx = "ElfGateClose", }
DunkelelfenTor	= { Open = 2603, Closed = 2602, Range = 8, OpenFx = "DarkElfGateOpen", CloseFx = "DarkElfGateClose", }
PalisadenTor	= { Open = 2608, Closed = 2607, Range = 8, OpenFx = "PalisadeOpen", CloseFx = "PalisadeClose", }
FeuerelfenTor	= { Open = 2756, Closed = 2772, Range = 8, OpenFx = "FireGateOpen", CloseFx = "FireGateClose", }
InnenTor		= { Open = 3072, Closed = 3071, Range = 8, OpenFx = "IndoorGateOpen", CloseFx = "IndoorGateClose", }
EmpyriaTor		= { Open = 3014, Closed = 3022, Range = 8, OpenFx = "EmpyriaOpen", CloseFx = "EmpyriaClose", }
MetallTorGross	= { Open = 3159, Closed = 3158, Range = 8, OpenFx = "FenceLargeOpen", CloseFx = "FenceLargeClose", }
MetallTorKlein	= { Open = 3161, Closed = 3160, Range = 8, OpenFx = "FenceOpen", CloseFx = "FenceClose", }
MetallTorWinzig	= { Open = 3241, Closed = 3240, Range = 8, OpenFx = "FenceSmallOpen", CloseFx = "FenceSmallClose", }

-- **DOC** --------------------------------------------------------------------------------
function OnPortalEvent(params)
	local FuncName = "GDS: OnPortalEvent(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(NpcId ~= 0, FuncName .. "can not be used in Platform script, this function must be in every Portal's own script.")
	params.UpdateInterval = params.UpdateInterval or 60
	-- force 1 step update interval!
	params.UpdateInterval = 1
	params.StayOpen = params.StayOpen or TRUE
	-- always stay open!!
	params.StayOpen = TRUE
	params.EnableClosing = params.EnableClosing or FALSE
	assert2(params.Type, FuncName .. "MISSING PARAMETER: Type = ")
	--assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	--assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	params.X = NpcX
	params.Y = NpcY
	params.OpenConditions = params.OpenConditions or {}
	assert2(type(params.OpenConditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: OpenConditions = ")
	if getn(params.OpenConditions) == 0 then 
		print(FuncName .. "No OpenConditions given, door will open for all approaching player units!") 
		tinsert(params.OpenConditions, PlayerUnitInRange{X = params.X, Y = params.Y, Range = params.Type.Range - 1 , UpdateInterval = 1})
	end
	params.CloseConditions = params.CloseConditions or {}
	assert2(type(params.CloseConditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: CloseConditions = ")
	params.OpenActions = params.OpenActions or {}
	assert2(type(params.OpenActions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: OpenActions = ")
	params.CloseActions = params.CloseActions or {}
	assert2(type(params.CloseActions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: CloseActions = ")
	if params.StayOpen ~= FALSE then
		assert2(getn(params.CloseConditions) == 0, FuncName .. "INVALID PARAMETER: CloseConditions used with StayOpen == TRUE!")
		assert2(getn(params.CloseActions) == 0, FuncName .. "INVALID PARAMETER: CloseActions used with StayOpen == TRUE!")
	end
	assert2(getn(tkeys(params)) == 10, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")


	OneTimeInitAction( ChangeObject{X = params.X, Y = params.Y, Object = params.Type.Closed} )
	OneTimeInitAction( SetEffect{Effect = params.Type.CloseFx} )

	tinsert(params.OpenActions, ChangeObject{X = params.X, Y = params.Y, Object = params.Type.Open})
	tinsert(params.OpenActions, StopEffect{})
	tinsert(params.OpenActions, SetEffect{Effect = params.Type.OpenFx})

	if params.StayOpen == FALSE or params.EnableClosing == TRUE then
		--tinsert(params.OpenConditions, PlayerUnitInRange{X = params.X, Y = params.Y, Range = params.Type.Range - 1 , UpdateInterval = 1})
		tinsert(params.CloseConditions, Negated(PlayerUnitInRange{X = params.X, Y = params.Y, Range = params.Type.Range , UpdateInterval = 1}))
		tinsert(params.CloseConditions, Negated(EnemyUnitInRange{X = params.X, Y = params.Y, Range = params.Type.Range , UpdateInterval = 1}))

		tinsert(params.CloseActions, ChangeObject{X = params.X, Y = params.Y, Object = params.Type.Closed})
		tinsert(params.CloseActions, StopEffect{})
		tinsert(params.CloseActions, SetEffect{Effect = params.Type.CloseFx})
	
		OnToggleEvent
		{
			UpdateInterval = params.UpdateInterval ,
			OnConditions = params.OpenConditions,
			OnActions = params.OpenActions,
			OffConditions = params.CloseConditions,
			OffActions = params.CloseActions,
		}
	else
		OnOneTimeEvent
	    {
	    	Conditions = params.OpenConditions,
	    	Actions = params.OpenActions,
	    }
	end
end

doc[numdoc] = [[Syntax:<br><code>OnPortalEvent<br>{<br>X = , Y = , StayOpen = TRUE, EnableClosing = FALSE (experimentell !!) , Type =  , <br>OpenConditions = { ... } ,<br>OpenActions = { ... },<br>}</code><br>Dient zum Öffnen bzw. Schliessen von Stadttoren, Landschaftstoren, Portalen usw. Macht einfach nur ein ChangeObject, und dabei wird ein Effekt abgespielt. Wenn keine OpenConditions angegeben werden, öffnet das Tor automatisch für alle herannahenden Spielereinheiten (nicht: friendly NPCs). Die CloseConditions prüfen zusätzlich das sich keine Player und keine Enemy Unit im Range befinden, bevor das Tor schliesst. Wenn StayOpen wahr ist, dürfen keine CloseConditions oder CloseActions verwendet werden, das Tor kann dann nur einmal aufgehen und geht auch nie wieder zu. X,Y müssen die EXAKTEN Koordinaten des im Editor gesetzten Tor-Objekts (der Rotationspunkt) sein! Der Punkt muss entsprechend auf der vorderseite des portals und in der mitte des durchgangs liegen. Type ist eins der vordefinierten Tore, im Moment existieren folgende:<br><code>StadtTor<br>SteinTorKlein<br>SteinTorGross<br>PortalKeep<br>ElfenTor<br>DunkelelfenTor<br>PalisadenTor<br>FeuerelfenTor<br>EmpyriaTor<br>InnenTor<br>MetallTorGross<br>MetallTorKlein<br>MetallTorWinzig<br></code>]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** --------------------------------------------------------------------------------
function ClearGotoLocations()
	WalkPathLocs = {}
	WalkPathActions = {}
	WalkPathConditions = {}
	TrigCnd = {}
	TrigAct = {}
	GotoCnd = {}
	GotoAct = {}
	DestCnd = {}
	DestAct = {}
	WPCnd	= {}
	WPAct	= {}
	LookCnd = {}
	LookAct = {}
end

doc[numdoc] = [[Wird benutzt um nach einem set von AddGotoLocation neue setzen zu können für einen weiteren OnIdleWalkPath...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function AddGotoLocation(params)
	local FuncName = "GDS: AddWalkPathLocation(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
	params.NpcId = params.NpcId or NpcId
	if params.Radius then
		params.Range = params.Radius
		params.Radius = nil
	else
		params.Range = params.Range or 1
	end
	params.WalkMode = params.WalkMode or Walk
	params.XRand = params.XRand or 0
	params.YRand = params.YRand or 0
	params.Conditions = params.Conditions or {}
	params.Actions = params.Actions or {}
	assert2(getn(tkeys(params)) == 9, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- insert conditions and actions into tables
	tinsert(WalkPathConditions, params.Conditions)
	params.Conditions = nil
	tinsert(WalkPathActions, params.Actions)
	params.Actions = nil
	
	-- insert "goto" params into walkpath locations table
	tinsert(WalkPathLocs, params)
end

doc[numdoc] = [[<code>Params: X = , Y = , NpcId = self, Radius = 1, WalkMode = Walk, XRand = 0, YRand = 0,<br>Conditions = { ... } , Actions = { ... } ,</code><br>Fügt einen neuen Wegpunkt der OnIdleWalkPath Funktion hinzu. Die Punkte werden dann in der gegebenen Reihenfolge angelaufen. Die Parameter sind mit Goto{} identisch, bis auf die zusätzlich angebbaren Conditions und Actions. Erst wenn die Conditions einer GotoLocation wahr sind, wird die Figur zum nächsten angegebenen Punkt laufen. Dort angekommen, führt sie die Actions aus.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnIdleWalkPath(params)
	local FuncName = "GDS: OnIdleWalkPath(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(getn(WalkPathLocs) > 0, FuncName .. "NO GOTO LOCATIONS DEFINED! .. use AddGotoLocation{}")
	params.Loop = params.Loop or 0
	params.WaitForIdle = params.WaitForIdle or FALSE
	if StopEffect then
		params.Length = params.Length or 5000
	else
		params.Length = params.Length or 0
	end
	params.SetEffect = params.SetEffect or ""
	params.StopEffect = params.StopEffect or ""
	params.UpdateInterval = params.UpdateInterval or 60
	params.Conditions = params.Conditions or {}
	params.Actions = params.Actions or {}
	params.EndConditions = params.EndConditions or {}
	params.EndActions = params.EndActions or {}
	params.NotInDialog = params.NotInDialog or FALSE
	params.WaitForPlayerInRange = params.WaitForPlayerInRange or 0
	assert2(getn(tkeys(params)) == 12, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- create VarSuffix that makes variable names absolutely unique (NpcId + Number of WalkPath)
	NumIdleWalkPath = NumIdleWalkPath + 1
	local VarSuffix = "_WPNum" .. tostring(NumIdleWalkPath)

	-- create the trigger event
	local WaypointVar = "WalkPathWaypoint" .. VarSuffix
	local IsWalking = "IsWalkingWaypoints" .. VarSuffix
	-- create trigger conditions
	tinsert(TrigCnd, IsNpcFlagFalse{Name = IsWalking, UpdateInterval = params.UpdateInterval})
	if getn(params.Conditions) ~= 0 then foreachi(params.Conditions, function(j, cond) tinsert(%TrigCnd, cond) end) end
	-- create trigger actions
	tinsert(TrigAct, SetNpcFlagTrue{Name = IsWalking})
	tinsert(TrigAct, ResetNpcCounter{Name = WaypointVar})
	tinsert(TrigAct, IncreaseNpcCounter{Name = WaypointVar})
	if getn(params.Actions) ~= 0 then foreachi(params.Actions, function(j, act) tinsert(%TrigAct, act) end) end

	----------------------------------------------------------------------------

	local NumPathPoints = getn(WalkPathLocs)

	for i = 1, NumPathPoints do
		-- create OnIdle Goto event
		GotoCnd[i] = {}
		GotoAct[i] = {}
		local Loc = WalkPathLocs[i]
		local NextLoc = WalkPathLocs[i+1]
		local Cnd = WalkPathConditions[i]
		local Act = WalkPathActions[i]
		-- goto conditions
		tinsert(GotoCnd[i], IsNpcCounter{Name = WaypointVar, Value = i, UpdateInterval = params.UpdateInterval})
		tinsert(GotoCnd[i], IsNpcFlagTrue{Name = IsWalking, UpdateInterval = params.UpdateInterval})
		-- goto current point action
--		tinsert(GotoAct[i], Goto{X = Loc.X, Y = Loc.Y, NpcId = Loc.NpcId, Range = Loc.Range, WalkMode = Loc.WalkMode})
		tinsert(GotoAct[i], Goto{X = Loc.X, Y = Loc.Y, NpcId = Loc.NpcId, Range = 5, WalkMode = Loc.WalkMode})

		----------------------------------------------------------------------------

		-- create FigureInRange destination check event
		DestCnd[i] = {}
		DestAct[i] = {}
		-- in range conditions
--		tinsert(DestCnd[i], FigureInRange{X = Loc.X, Y = Loc.Y, NpcId = Loc.NpcId, Range = Loc.Range})
		tinsert(DestCnd[i], FigureInRange{X = Loc.X, Y = Loc.Y, NpcId = Loc.NpcId, Range = 5})
		tinsert(DestCnd[i], IsNpcCounter{Name = WaypointVar, Value = i, UpdateInterval = params.UpdateInterval})
		tinsert(DestCnd[i], IsNpcFlagTrue{Name = IsWalking, UpdateInterval = params.UpdateInterval})
		-- idle conditions
		if params.WaitForIdle ~= 0 then
			tinsert(DestCnd[i], FigureJob{Job = JobIdle})
		end
		-- player in range conditions
		if params.WaitForPlayerInRange ~= 0 then
			tinsert(DestCnd[i], FigureInRange{X = Loc.X, Y = Loc.Y, NpcId = Avatar, Range = params.WaitForPlayerInRange})
		end
		-- user conditions
		if getn(Cnd) ~= 0 then foreachi(Cnd, function(j, cnd) tinsert(%DestCnd[%i], cnd) end) end


		-- effect actions
		if params.SetEffect ~= "" then
			tinsert(DestAct[i], SetEffect{Effect = params.SetEffect, Length = params.Length, X = Loc.X, Y = Loc.Y, TargetType = World})
		end
		if params.StopEffect ~= "" then
			tinsert(DestAct[i], StopEffect{X = Loc.X, Y = Loc.Y, TargetType = World})
			tinsert(DestAct[i], SetEffect{Effect = params.StopEffect, Length = params.Length, X = Loc.X, Y = Loc.Y, TargetType = World})
		end
		
		-- goto next point action
		if i ~= NumPathPoints then
--			tinsert(DestAct[i], Goto{X = NextLoc.X, Y = NextLoc.Y, NpcId = NextLoc.NpcId, Range = Loc.Range, WalkMode = NextLoc.WalkMode})
			tinsert(DestAct[i], Goto{X = NextLoc.X, Y = NextLoc.Y, NpcId = NextLoc.NpcId, Range = 5, WalkMode = NextLoc.WalkMode})
		end

		-- in range actions
		tinsert(DestAct[i], IncreaseNpcCounter{Name = WaypointVar})
		if i == NumPathPoints and params.Loop ~= 0 then
			tinsert(DestAct[i], SetNpcFlagFalse{Name = IsWalking})
			tinsert(DestAct[i], ResetNpcCounter{Name = WaypointVar})
			NextLoc = WalkPathLocs[1]
--			tinsert(DestAct[i], Goto{X = NextLoc.X, Y = NextLoc.Y, NpcId = NextLoc.NpcId, Range = Loc.Range, WalkMode = NextLoc.WalkMode})
			tinsert(DestAct[i], Goto{X = NextLoc.X, Y = NextLoc.Y, NpcId = NextLoc.NpcId, Range = 5, WalkMode = NextLoc.WalkMode})
		end
		
		----------------------------------------------------------------------------
		-- create Look At Player event
		LookCnd[i] = {}
		LookAct[i] = {}

		--tinsert(LookCnd[i], Negated(FigureInRange{X = Loc.X, Y = Loc.Y, NpcId = Avatar, Range = params.WaitForPlayerInRange}))
		--tinsert(LookCnd[i], IsNpcCounter{Name = WaypointVar, Value = i, UpdateInterval = params.UpdateInterval})
		--tinsert(LookCnd[i], IsNpcFlagTrue{Name = IsWalking, UpdateInterval = params.UpdateInterval})
		--tinsert(LookAct[i], LookAtFigure{Target = Avatar})
		
		----------------------------------------------------------------------------

comment = [[
		-- das macht nur probleme ..........
		
		-- create FigureInRange destination check event
		WPCnd[i] = {}
		WPAct[i] = {}

		tinsert(WPCnd[i], FigureInRange{X = Loc.X, Y = Loc.Y, NpcId = Loc.NpcId, Range = Loc.Range * 2 + 1})
		tinsert(WPCnd[i], IsNpcCounter{Name = WaypointVar, Value = i, UpdateInterval = floor(params.UpdateInterval / 4)})
		tinsert(WPCnd[i], IsNpcFlagTrue{Name = IsWalking, UpdateInterval = floor(params.UpdateInterval / 4)})
--		tinsert(WPCnd[i], IsNpcCounter{Name = WaypointVar, Value = i, UpdateInterval = params.UpdateInterval})
--		tinsert(WPCnd[i], IsNpcFlagTrue{Name = IsWalking, UpdateInterval = params.UpdateInterval})
		tinsert(WPAct[i], IncreaseNpcCounter{Name = WaypointVar})
--		if i ~= NumPathPoints then
--			tinsert(WPAct[i], SetEffect{Effect = "Fog", Length = 1000, X = NextLoc.X, Y = NextLoc.Y, TargetType = World})
--		end
]]

		----------------------------------------------------------------------------
		
		-- End Conditions & Actions
		if i == NumPathPoints then
			if getn(params.EndConditions) ~= 0 then foreachi(params.EndConditions, function(j, act) tinsert(%DestCnd[%i], act) end) end
			if getn(params.EndActions) ~= 0 then foreachi(params.EndActions, function(j, act) tinsert(%DestAct[%i], act) end) end
		end
		-- user actions
		if getn(Act) ~= 0 then foreachi(Act, function(j, act) tinsert(%DestAct[%i], act) end) end
	end

	-- create trigger OnEvent:
	OnEvent{NotInDialog = params.NotInDialog, Conditions = TrigCnd, Actions = TrigAct}
	
	if PlatformId >= 100 then
		OnToggleEvent
		{
			NotInDialog = FALSE , UpdateInterval = 5 ,
			OnConditions = {FigureHasAggro {UpdateInterval = 5}},
			OnActions = {},
			OffConditions = {Negated(FigureHasAggro {UpdateInterval = 5})},
			OffActions = {SetNpcFlagTrue {Name = "WalkToBasePoint"}},
		}
		
		
	end
	
	
	-- goto and range OnEvents:
	for i = 1, NumPathPoints do
		OnEvent{ NotInDialog = params.NotInDialog, Conditions = DestCnd[i], Actions = DestAct[i] }
		tinsert(GotoCnd[i], 1, ODER(FigureJob{}, IsNpcFlagTrue {Name = "WalkToBasePoint", UpdateInterval = 5}))
		tinsert(GotoAct[i], SetNpcFlagFalse{Name = "WalkToBasePoint"})
		--tinsert(GotoAct[i], SetEffect{Effect = "AreaHit", Length = 2000})
		OnEvent{ NotInDialog = params.NotInDialog, Conditions = GotoCnd[i], Actions = GotoAct[i] }
		
		-- look at player erstmal gedissed...
		--OnIdleEvent{ NotInDialog = params.NotInDialog, Conditions = LookCnd[i], Actions = LookAct[i] }
		--OnEvent{ NotInDialog = params.NotInDialog, Conditions = WPCnd[i], Actions = WPAct[i] }
	end
end

doc[numdoc] = [[Syntax:<br><code>OnIdleWalkPath<br>{<br>SetEffect = "", StopEffect = "", Length = 0, WaitForIdle = FALSE, WaitForPlayerInRange = 0, Loop = 0, NotInDialog = FALSE, UpdateInterval = 60,<br>Conditions = {},<br>Actions = {},<br>EndConditions = {},<br>EndActions = {},<br>}</code><br>Die Figur steuert einen oder mehrere Punkte der Reihe nach an wenn sie Idle ist und die (Start) Conditions erfüllt sind. Die Punkte müssen zuvor mit AddGotoLocation{} (selbe Syntax wie Goto{}) definiert worden sein. Wenn die (Start) Conditions erfüllt sind, läuft die Figur zum ersten Wegpunkt.<br>Die Figur wird die Actions ausführen, sobald sie sich auf den Weg zum ersten Wegpunkt macht, und auch nur ein einziges mal. Man kann aber mit AddGotoLocation Conditions und Actions an einen beliebigen Wegpunkt hängen. Zu beachten ist dabei, das die Actions bei gesetztem Loop Flag jedesmal ausgeführt werden (und vorher die conditions geprüft werden), wenn die Figur diesen Wegpunkt erreicht.<br>Wenn Loop grösser 0 ist dann läuft die Figur wieder zum ersten Wegpunkt wenn die (Start) Conditions dann immer noch (oder wieder) wahr sind.<br> Die Figur kann übrigens unterwegs z.b. von einer Attacke abgelenkt werden, wird aber ihren Wegpunktlauf wieder aufnehmen sobald sie wieder Idle ist. Mit EndConditions und EndActions kann man bei Ankunft am letzten Wegpunkt noch Actions ausführen. Bei loopendem Pfad würden die bei jeder Ankunft am Ende ausgeführt werden.<br>NEU: SetEffect und StopEffect können benutzt werden um an jedem Punkt einen Effect zu setzen oder zu stoppen (TargetType = World, Length = 0). Nützlich fürs Fackeln an/ausschalten!<br>Wenn WaitForIdle an ist, dann wartet die Figur an jedem Punkt bis sie dort einen Idle Job hat, bevor sie weiterläuft.<br>Wenn WaitForPlayerInRange grösser 0 ist dann wird am jeweiligen Punkt gewartet bis der Spieler in Range ist, wobei WaitForPlayerInRange den Range angibt.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function ResetWalkPath(params)
	local FuncName = "GDS: ResetWalkPath(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.Num = params.Num or 1
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local Flag = "IsWalkingWaypoints_WPNum" .. params.Num

	return SetNpcFlagFalse{Name = Flag}
end

doc[numdoc] = [[Params: <code>Num = 1,</code><br>Startet einen OnIdleWalkPath des aktuellen NPC neu (beginnt von vorne). Num ist die Nummer des WalkPath, gezählt von oben nach unten beginnend mit 1.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnIdleDoTorchJob(params)
	local FuncName = "GDS: OnIdleTorchOn(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	assert2(params.Direction, FuncName .. "MISSING PARAMETER: Direction = ")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(type(params.Name) == "string", FuncName .. "INVALID PARAMETER: Name is not a string!")
	params.TurnOff = params.TurnOff or FALSE
	if params.TurnOff == TRUE then
		params.Effect = params.Effect or "TorchOff"
		params.Length = params.Length or 5000
	else
		params.Effect = params.Effect or "Torch"
		params.Length = params.Length or 0
	end
	params.WaitForIdle = params.WaitForIdle or TRUE
	params.UpdateInterval = params.UpdateInterval or 30
	params.NotInDialog = params.NotInDialog or FALSE
	assert2(getn(tkeys(params)) == 10, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local WalkPathParams = {}
	WalkPathParams.Conditions = {}
	WalkPathParams.Actions = {}
	WalkPathParams.EndConditions = {}
	WalkPathParams.EndActions = {}

	if params.TurnOff == TRUE then
		tinsert(WalkPathParams.Conditions, TimeTorchOff{})
		tinsert(WalkPathParams.Conditions, IsGlobalFlagTrue{Name = "FackelnAnBei_" .. params.Name})
		WalkPathParams.StopEffect = params.Effect
		tinsert(WalkPathParams.EndActions, SetGlobalFlagFalse{Name = "FackelnAnBei_" .. params.Name})
	else
		tinsert(WalkPathParams.Conditions, TimeTorchOn{})
		tinsert(WalkPathParams.Conditions, IsGlobalFlagFalse{Name = "FackelnAnBei_" .. params.Name})
		WalkPathParams.SetEffect = params.Effect
		tinsert(WalkPathParams.EndActions, SetGlobalFlagTrue{Name = "FackelnAnBei_" .. params.Name})
		tinsert(WalkPathParams.Actions, ChangeEquipment{Slot = SlotLeftHand, Item = 2329})
		tinsert(WalkPathParams.EndActions, ChangeEquipment{Slot = SlotLeftHand, Item = 0})
	end
	
	WalkPathParams.Length = params.Length
	WalkPathParams.WaitForIdle = params.WaitForIdle
	WalkPathParams.UpdateInterval = params.UpdateInterval
	WalkPathParams.NotInDialog = params.NotInDialog
	tinsert(WalkPathParams.Actions, SetNpcFlagTrue{Name = "_IchBinMitAbsichtUnterwegs"})
	tinsert(WalkPathParams.EndActions, SetNpcFlagFalse{Name = "_IchBinMitAbsichtUnterwegs"})
	tinsert(WalkPathParams.EndActions, ResetWalkPath{})
	
	OnIdleWalkPath(WalkPathParams)

	OnIdleGoHome{
		NotInDialog = params.NotInDialog,
		Conditions = {IsNpcFlagFalse{Name = "_IchBinMitAbsichtUnterwegs", UpdateInterval = 8},},
		X = params.X, Y = params.Y, Direction = params.Direction,}
end

doc[numdoc] = [[Params: <code>Name = , X = , Y = , Direction = , <br>Effect = "Torch"/"TorchOff", Length = 0/5000, TurnOff = FALSE, WaitForIdle = TRUE, NotInDialog = FALSE, UpdateInterval = 60</code><br>Dies ist ein spezieller OnIdleWalkPath der für die Torch-Jobs verwendet wird. Voraussetzungen sind: einige AddGotoLocation wobei die Location die Zielkoordinate für den Effect vorgibt, die Punkte sollten also alle exakt auf den Fackeln liegen. Ausserdem benötigt man immer 2 Figuren, eine die abends die Fackeln anschaltet, und eine die sie morgens wieder ausmacht.<br>Name ist ein Variablenname für dieses Paar von "Fackel-Beauftragten". Es muss jeweils einen On und Off Fackel Job mit diesem Namen geben.<br>X, Y und Direction sind die OnIdleGoHome Parameter zu der sich ein Fackelträger ausserhalb seines Jobs begibt, damit er nicht wie ein Depp an der letzten Fackel stehenbleibt.<br>Effect ist der zu spielende Effect, per Default ist es beim Anschalten der "Torch" Effekt und beim Ausschalten der "TorchOff" Effect. Die Länge ist entsprechend default auf 0 (immer an) und 5000 (5s lang Rauch).<br>Mit dem Parameter TurnOff kann man angeben ob es ein Fackel Anmachen (default) oder Fackel Ausmachen (TurnOff = TRUE) Job sein soll. WaitForIdle besagt das die Figur an jedem Punkt kurz inne halten soll, das sieht besser aus weil es den Eindruck vermittelt als ob das Anzünden/Ausmachen immer einen kleinen Moment dauert.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

comment = [[
-- OnDelayCommand simuliert folgenden code (pseudo code!):

-- der Event setzt den timestamp, und zwar zu beginn der map:
OnEvent
{	Conditions = {
		DbVariable{Name = "DelayCommand_NpcId_xxxx_CmdNum_y", Operator = IsLess, Value = 1}
		-- hier werden noch die DelayCommand conditions reingehängt, sofern vorhanden...	},
	Actions = {
		SetTimeStamp{Name = "DelayCommandTimeStamp_NpcId_xxxx_CmdNum_y"},
		SetDbVariable{Name = "DelayCommand_NpcId_xxxx_CmdNum_y", Value = 1},	}}

-- dieser Event führt die delayed Actions aus, und setzt ggfs. den TimeStamp neu:
OnEvent
{	Conditions = {
		DbVariable{Name = "DelayCommand_NpcId_xxxx_CmdNum_y", Operator = IsLessOrEqual, Value = params.ReRuns},
		TimeElapsed{Name = "DelayCommandTimeStamp_NpcId_xxxx_CmdNum_y", Seconds = params.Seconds},	},
	Actions = {
		ChangeDbVariable{Name = "DelayCommand_NpcId_xxxx_CmdNum_y", Operator = Add, Value = 1},
		SetTimeStamp{Name = "DelayCommandTimeStamp_NpcId_xxxx_CmdNum_y"},
		-- und hier die DelayCommand Actions reinhängen, z.b.:
		CastSpell{Spell = 76, Target = 11, TargetType = Area, X = 140, Y = 80},	}}
]]
comment = nil


-- **DOC** --------------------------------------------------------------------------------
function OnDelayCommand(params)
	-- sanity checks
	local FuncName = "GDS: OnDelayCommand(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Actions, "MISSING PARAMETER: Actions =  ... don't know what to do, hmm? ;)")
	params.Conditions = params.Conditions or {}
	params.Type = params.Type or NpcVariable
	params.ReRuns = params.ReRuns or 1
	params.Seconds = params.Seconds or 1
	params.UpdateInterval = params.UpdateInterval or 60
	params.NotInDialog = params.NotInDialog or FALSE
	assert2(getn(tkeys(params)) == 7, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- create VarSuffix that makes variable names absolutely unique (NpcId + Number of DelayCommand)
	NumDelayCommands = NumDelayCommands + 1
	local VarSuffix = "_NpcId" .. tostring(NpcId) .. "_CmdNum" .. tostring(NumDelayCommands)

	if params.Type == GlobalVariable then
		IsCounter		= IsGlobalCounter
		IncreaseCounter	= IncreaseGlobalCounter
		SetTimeStamp	= SetGlobalTimeStamp
		IsTimeElapsed	= IsGlobalTimeElapsed
	elseif params.Type == PlayerVariable then
		IsCounter		= IsPlayerCounter
		IncreaseCounter	= IncreasePlayerCounter
		SetTimeStamp	= SetPlayerTimeStamp
		IsTimeElapsed	= IsPlayerTimeElapsed
	else
		IsCounter		= IsNpcCounter
		IncreaseCounter	= IncreaseNpcCounter
		SetTimeStamp	= SetNpcTimeStamp
		IsTimeElapsed	= IsNpcTimeElapsed
	end

	-- first construct the trigger event, which creates the initial time stamp when all conditions are met
	local Trig = {}
	Trig.Conditions = params.Conditions
	tinsert(Trig.Conditions, 1, IsCounter{Name = "DelayCommandCounter" .. VarSuffix, Value = 0, UpdateInterval = params.UpdateInterval})
	Trig.Actions = {}
	tinsert(Trig.Actions, IncreaseCounter{Name = "DelayCommandCounter" .. VarSuffix})
	tinsert(Trig.Actions, SetTimeStamp{Name = "DelayCommandTimeStamp" .. VarSuffix})
	Trig.NotInDialog = params.NotInDialog

	local DoCmd = {}
	DoCmd.Conditions = {}
	tinsert(DoCmd.Conditions, IsCounter{Name = "DelayCommandCounter" .. VarSuffix, Operator = IsLessOrEqual, Value = params.ReRuns, UpdateInterval = params.UpdateInterval})
	tinsert(DoCmd.Conditions, IsTimeElapsed{Name = "DelayCommandTimeStamp" .. VarSuffix, Seconds = params.Seconds, UpdateInterval = params.UpdateInterval})
	DoCmd.Actions = params.Actions
	tinsert(DoCmd.Actions, IncreaseCounter{Name = "DelayCommandCounter" .. VarSuffix})
	tinsert(DoCmd.Actions, SetTimeStamp{Name = "DelayCommandTimeStamp" .. VarSuffix})
	DoCmd.NotInDialog = params.NotInDialog

	-- insert into list
	OnEvent(Trig)
	OnEvent(DoCmd)
end

doc[numdoc] = [[Syntax:<br><code>OnDelayCommand<br>{<br>Seconds = 1, Type = NpcVariable, ReRuns = 1, NotInDialog = FALSE, UpdateInterval = 60,<br>Conditions = { ... },<br>Actions = { ... }<br>}</code><br>Führt die gewünschten Actions nach dem angegebenen Delay aus. Seconds gibt die Anzahl der Sekunden an die verstreichen müssen bis die Actions ausgeführt werden. Der Timer startet allerdings erst, wenn alle angegebenen Conditions zutreffen. Type (= PlayerVariable oder = GlobalVariable) sagt aus, ob die benutzten TimeStamps und Variablen nur für den lokalen Player (default) oder Global für alle Spieler gespeichert werden. ReRuns gibt dazu noch an wie oft der OnDelayCommand wiederholt werden soll, wobei der Delay bei den Wiederholungen immer derselbe bleibt.<br>Conditions, die sehr aufwändig sind abzufragen werden per default nur jede Minute abgefragt. Dies kann man mit dem Parameter UpdateInterval der Conditions regeln.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

-- **DOC** --------------------------------------------------------------------------------
function OnDeath(params)
	local FuncName = "GDS: OnDeath(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = { ... },")
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- Death actions zur dead state transition hinzufügen
	if getn(params.Actions) > 0 then
		foreachi(params.Actions, function(_, action)
			tinsert(%DeathActionData, action)
		end)
	end
end

doc[numdoc] = [[Syntax:<br><code>OnDeath<br>{<br>Actions = { ... }<br>}</code><br>Führt einfach nur Actions aus wenn der NPC stirbt, unabhängig davon ob er ein Respawn hat oder nicht.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnToggleEvent(params)
	local FuncName = "GDS: OnToggleEvent(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.OnConditions = params.OnConditions or {}
	params.OffConditions = params.OffConditions or {}
	assert2(params.OnActions, FuncName .. "MISSING PARAMETER: OnActions = { ... },")
	assert2(params.OffActions, FuncName .. "MISSING PARAMETER: OffActions = { ... },")
	params.UpdateInterval = params.UpdateInterval or 60
	params.NotInDialog = params.NotInDialog or FALSE
	params.ResetOnPlatformLoad = params.ResetOnPlatformLoad or FALSE
	params.ResetOnDeath = params.ResetOnDeath or FALSE
	assert2(getn(tkeys(params)) == 8, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- create VarSuffix that makes variable names absolutely unique (NpcId + Number of Toggle Events)
	NumToggleEvents = NumToggleEvents + 1
	local VarSuffix = "Num" .. tostring(NumToggleEvents)

	-- füge switch variable ein
	local ToggleSwitch = "Toggle" .. VarSuffix
	if params.ResetOnPlatformLoad == TRUE then
		OnPlatformOneTimeEvent
		{
			Actions = {
				SetNpcFlagFalse{Name = ToggleSwitch},
			},
		}
	end
	if params.ResetOnDeath == TRUE then
		OnDeath
		{
			Actions = {
				SetNpcFlagFalse{Name = ToggleSwitch},
			},
		}
	end

	tinsert(params.OnConditions, 1, IsNpcFlagFalse{Name = ToggleSwitch, UpdateInterval = params.UpdateInterval})
	if params.OffConditions ~= nil then
		tinsert(params.OffConditions, 1, IsNpcFlagTrue{Name = ToggleSwitch, UpdateInterval = params.UpdateInterval})
	end
	tinsert(params.OnActions, SetNpcFlagTrue{Name = ToggleSwitch})
	tinsert(params.OffActions, SetNpcFlagFalse{Name = ToggleSwitch})
	
	local OnCnd = params.OnConditions
	local OnAct = params.OnActions

	local OffCnd = {}
	if params.OffConditions == nil then
		-- negate conditions for "off" event
		foreachi(params.OnConditions, function(i, cnd)
			local newcondition = cnd:Clone()
			newcondition:ToggleNegated()
			tinsert(%OffCnd, newcondition)
		end)
	else
		OffCnd = params.OffConditions
	end
	local OffAct = params.OffActions

	OnEvent{NotInDialog = params.NotInDialog, Conditions = OnCnd, Actions = OnAct}
	OnEvent{NotInDialog = params.NotInDialog, Conditions = OffCnd, Actions = OffAct}
end

doc[numdoc] = [[Syntax:<br><code>OnToggleEvent<br>{<br>NotInDialog = FALSE , ResetOnPlatformLoad = FALSE , ResetOnDeath = FALSE , UpdateInterval = 60 ,<br>OnConditions = { ... },<br>OnActions = { ... },<br>OffConditions = { ... },<br>OffActions = { ... },<br>}</code><br>Funktioniert als Toggle Event. Zu Beginn ist der Toggle auf Off und wird bei zutreffen der OnConditions auf "On" gesetzt, wobei die OnActions einmal ausgeführt werden. Wenn OffConditions nicht angegeben wurden dann wird einfach geprüft ob alle OnConditions negiert wahr sind, und dann werden die OffActions einmal ausgeführt. Wenn man OffConditions angibt werden direkt die OffConditions geprüft und dann die OffActions einmal ausgeführt. Der Toggle kann beliebig oft "umgelegt" werden, die Actions werden jeweils nur einmal beim Wechsel des Zustands von "On" nach "Off" bzw. "Off" nach "On" ausgeführt.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnOneTimeEvent(params)
	local FuncName = "GDS: OnOneTimeEvent(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.Conditions = params.Conditions or {}
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = { ... },")
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.Type = nil
	params.NotInDialog = params.NotInDialog or FALSE
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- create VarSuffix that makes variable names absolutely unique (NpcId + Number of DelayCommand)
	NumOneTimeEvents = NumOneTimeEvents + 1
--	local VarSuffix = "Num" .. tostring(NumOneTimeEvents)

--	tinsert(params.Conditions, 1, IsNpcFlagFalse{Name = "OneTimeEvent" .. VarSuffix, UpdateInterval = params.UpdateInterval})
--	tinsert(params.Actions, SetNpcFlagTrue{Name = "OneTimeEvent" .. VarSuffix})
	
	local EventParams = {}
	EventParams.Conditions = params.Conditions
	EventParams.Actions = params.Actions
	EventParams.NotInDialog = params.NotInDialog
	EventParams.RemoveTransition = TRUE
	OnEvent(EventParams)
end

doc[numdoc] = [[Syntax:<br><code>OnOneTimeEvent<br>{<br>NotInDialog = FALSE, UpdateInterval = 60,<br>Conditions = { ... },<br>Actions = { ... }<br>}</code><br>Wie OnEvent, wird aber global nur einmal ausgeführt. Also ein absolut einmaliges event im Spiel und für alle Player. Dieses Event sollte man für alles benutzen was nur einmal getriggert werden sollte, wie z.b. den Wert einer Variable ändern. Sonst kann es schnell passieren das man ein Event hat das plötzlich für einen längeren Zeitraum (oder immer) wahr ist und dadurch andere Events "blockiert" weil sie gar nicht mehr abgefragt werden. Da die NPC scripte von oben nach unten ausgeführt werden, beträfe das fast ausschliesslich die events *nach* so einem "Immer-Wahr" event.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnPlatformOneTimeEvent(params)
	local FuncName = "GDS: OnPlatformOneTimeEvent(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.Conditions = params.Conditions or {}
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = { ... },")
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	params.UpdateInterval = params.UpdateInterval or 10
	params.Type = nil
	params.NotInDialog = params.NotInDialog or FALSE
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- create VarSuffix that makes variable names absolutely unique (NpcId + Number of DelayCommand)
	NumOneTimeEvents = NumOneTimeEvents + 1
	local VarSuffix = "Num" .. tostring(NumOneTimeEvents)

	tinsert(params.Conditions, 1, IsNpcFlagTrue{Name = "PlatformOneTimeEvent" .. VarSuffix, UpdateInterval = params.UpdateInterval})
	tinsert(params.Conditions, 1, FigureAlive{NpcId = Avatar})
	tinsert(params.Actions, SetNpcFlagFalse{Name = "PlatformOneTimeEvent" .. VarSuffix})
	-- one time var beim laden der map zurücksetzen:
	PlatformInitAction(SetNpcFlagTrue{Name = "PlatformOneTimeEvent" .. VarSuffix}, TRUE)
	if SpawnDead == TRUE then
		tinsert(BornDeadData.Actions, SetNpcFlagTrue{Name = "PlatformOneTimeEvent" .. VarSuffix})
	end

	local EventParams = {}
	EventParams.Conditions = params.Conditions
	EventParams.Actions = params.Actions
	EventParams.NotInDialog = params.NotInDialog
	OnEvent(EventParams)
end

doc[numdoc] = [[Syntax:<br><code>OnPlatformOneTimeEvent<br>{<br>NotInDialog = FALSE, UpdateInterval = 10,<br>Conditions = { ... },<br>Actions = { ... }<br>}</code><br>Wie OnOneTimeEvent, wird aber nach jedem map betreten genau einmal ausgeführt, ist also wiederholbar wenn der Spieler die map zuvor verlassen und wieder betreten hat.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function KillOnDominate(params)
	local FuncName = "GDS: KillOnDominate(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	params.Conditions = {}
	tinsert(params.Conditions, FigureDominated{NpcId = params.NpcId})
	params.Actions = {}
	tinsert(params.Actions, SetEffect{Effect = "Explo", Length = 300, NpcId = params.NpcId})
	tinsert(params.Actions, Kill{NpcId = params.NpcId})
	params.NpcId = nil
	OnEvent(params)
end

doc[numdoc] = [[Syntax:<br><code>KillOnDominate{NpcId = self}</code><br>Wenn die Figur dominated wird, stirbt sie einfach. Verhindert, das FigureDead Abfragen nicht greifen wenn die figur dominated ist. Ausserdem sind manche NPCs problematisch wenn sie dominated sind (z.b. wenn figur ein attacktarget auf avatar hat wird sie ihn weiter angreifen, aber der Avatar kann sich nicht wehren!).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnIdleEvent(params)
	local FuncName = "GDS: OnIdleEvent(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.Conditions = params.Conditions or {}
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = { ... },")
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	params.NotInDialog = params.NotInDialog or FALSE
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	tinsert(params.Conditions, 1, FigureJob{JobClass = Idle, NpcId = NpcId})
	tinsert(params.Conditions, 2, Negated(FigureHasAggro{NpcId = NpcId}))
	if PlatformId >= 200 and PlatformId <= 213 then
		tinsert(params.Conditions, 3, Negated(FigureDominated{}))
	end
	OnEvent(params)
end

doc[numdoc] = [[Syntax:<br><code>OnIdleEvent<br>{<br>NotInDialog = FALSE,<br>Conditions = { ... },<br>Actions = { ... }<br>}</code><br>Wie OnEvent, hat aber standardmässig als zusätzliche condition eine FigureJob{Idle} Abfrage, d.h. das Event findet nur statt wenn der Npc im Idle mode ist.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnDeadPlayerGoHome(params)
	local FuncName = "GDS: OnDeadPlayerGoHome(): "
	params.KeepFollowing = params.KeepFollowing or FALSE
	if params.X == nil and NpcX then params.X = NpcX end
	if params.Y == nil and NpcY then params.Y = NpcY end
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	assert2(params.Direction, FuncName .. "MISSING PARAMETER: Direction = ")
	params.Conditions = params.Conditions or {}
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	params.Actions = params.Actions or {}
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	params.HomeActions = params.HomeActions or {}
	assert2(type(params.HomeActions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: HomeActions = ")
	assert2(getn(tkeys(params)) == 7, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- wird über NoIdle geregelt, entweder Idle ODER FigureDead ...
	--tinsert(params.Conditions, 1, FigureDead{NpcId = Avatar})
	--tinsert(params.Conditions, 1, IsNpcFlagFalse{Name = "DeadPlayerGoHome", UpdateInterval = 10})
	--tinsert(params.Actions, EnableDialog{})
	tinsert(params.Actions, SetNpcFlagTrue{Name = "DeadPlayerGoHome"})

	OnIdleGoHome
	{
		WalkMode = Run, GotoMode = GotoForced, NoIdle = TRUE,
		X = params.X, Y = params.Y, Direction = params.Direction,
		Conditions = params.Conditions,
		Actions = params.Actions,
	}
	
	if params.KeepFollowing == TRUE then
		OnEvent
		{
			Conditions = {
				IsNpcFlagTrue{Name = "DeadPlayerGoHome", UpdateInterval = 30},
				FigureAlive{NpcId = Avatar},
			},
			Actions = {
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				Stop{},
				Follow{Target = Avatar},
			},
		}
	end
end

doc[numdoc] = [[Syntax:<br><code>OnDeadPlayerGoHome<br>{<br>X = _X, Y = _Y, Direction = , KeepFollowing = FALSE,<br>Conditions = { ... },<br>Actions = { ... },<br>HomeActions = { ... },<br>}</code><br>Wenn Spieler tot, dann gehe forced nach Hause und setze das NPC flag "DeadPlayerGoHome". Man sollte ggfs. noch den Dialog wieder enablen wenn man den NPC (erneut) ansprechen können soll. Das DeadPlayerGoHome flag muss im Dialog wieder auf FALSE gesetzt werden! Wenn KeepFollowing = TRUE dann geht der NPC sofort wieder in den Follow Modus sobald der Spieler am Leben ist, und setzt in dem Moment auch das DeadPlayerGoHome flag zurück!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnIdleGoHome(params)
	local FuncName = "GDS: OnIdleGoHome(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	if params.X == nil and %_X then params.X = %_X end
	if params.Y == nil and %_Y then params.Y = %_Y end
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	params.Direction = params.Direction or random(0,7)
	params.WalkMode = params.WalkMode or Walk
	params.GotoMode = params.GotoMode or GotoNormal
	params.Range = params.Range or 0
	if params.WalkMode == Walk then
		params.WalkRange = 0
	else
		params.WalkRange = params.WalkRange or 10
	end
	params.Conditions = params.Conditions or {}
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	params.AbortConditions = params.AbortConditions or {}
	assert2(type(params.AbortConditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: AbortConditions = ")
	params.Actions = params.Actions or {}
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	params.AbortActions = params.AbortActions or {}
	assert2(type(params.AbortActions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: AbortActions = ")
	params.HomeActions = params.HomeActions or {}
	assert2(type(params.HomeActions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: HomeActions = ")
--	params.NotInDialog = params.NotInDialog or FALSE
	params.NotInDialog = nil
--	params.UpdateInterval = params.UpdateInterval or 60
	params.UpdateInterval = nil
	params.WaitTime = params.WaitTime or 0  -- random() * 4 + 2
	if params.WaitTime ~= 0 then
		params.WaitTime = 0
		print(FuncName .. "FORCED WaitTime to 0 because not implemented...")
	end
	params.NoIdle = params.NoIdle or FALSE
	params.CheckOnlyAggro = params.CheckOnlyAggro or FALSE
	assert2(getn(tkeys(params)) == 15, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if NpcHasIdleGoHome ~= TRUE then
		OneTimeInitAction(LookAtDirection{Direction = params.Direction})
		-- flag fürs dialogsystem-ende
		NpcHasIdleGoHome = TRUE
	end

	tinsert(IdleHomeData, params)

	-- alter code:
	REM = [[
	-- wenn nicht im home range dann heimgehen
	tinsert(params.Conditions, Negated(FigureInRange{X = params.X, Y = params.Y, Range = 0}))
	tinsert(params.Actions, Goto{X = params.X, Y = params.Y, WalkMode = params.WalkMode, Range = params.Range})
	tinsert(params.Actions, SetNpcFlagFalse{Name = "OnIdleGoHomeDirection"})

	params2 = {}
	params2.Conditions = {}
	params2.Actions = {}
	-- wenn zuhause dann in die angegebene richtung blicken
	tinsert(params2.Conditions, FigureInRange{X = params.X, Y = params.Y, Range = 0})
	tinsert(params2.Conditions, IsNpcFlagFalse{Name = "OnIdleGoHomeDirection", UpdateInterval = params.UpdateInterval})
	tinsert(params2.Actions, LookAtDirection{Direction = params.Direction})
	tinsert(params2.Actions, SetNpcFlagTrue{Name = "OnIdleGoHomeDirection"})
	params2.NotInDialog = TRUE

	-- delete obsolete parameters
	params.X = nil
	params.Y = nil
	params.WalkMode = nil
	params.Direction = nil
	params.Range = nil
	params.UpdateInterval = nil
	OnIdleEvent(params)
	OnIdleEvent(params2)

	-- flag fürs dialogsystem-ende
	NpcHasIdleGoHome = TRUE
	]] REM = nil
end

doc[numdoc] = [[Syntax:<br><code>OnIdleGoHome<br>{<br>X = , Y = , Direction = , Range = 5, WalkRange = 10, WaitTime = 0, WalkMode = Walk, GotoMode = GotoNormal<br>Conditions = { ... },<br>Actions = { ... },<br>HomeActions = { ... },<br>AbortConditions = { ... },<br>AbortActions = { ... },<br>}</code><br>Wenn sich der Npc nicht mehr an seiner X,Y Position befindet und Idle ist, wird er zu der X,Y Position laufen oder rennen, und sich in die angegebene Direction ausrichten. Nützlich für Quest NPCs die möglichst immer an der selben Stelle zu finden sein sollten. Actions werden beim zurücklaufen ausgeführt, HomeActions erst bei Ankunft am Zielpunkt. WalkRange gibt den Range an, innerhalb dessen der NPC noch zum Zielpunkt geht anstatt zu rennen. Vor allem wichtig für das hektische zurückswappen wenn die Figur nur ein Feld neben dran steht, da die Figur dann nur geht statt das eine Feld zu rennen.<br>HINWEIS: die Direction des ERSTEN IdleGoHome im script bestimmt die direction der figur wenn sie beim erstmaligen laden der karte bereits an ihrer X,Y Homeposition steht, daher sollte das erste IdleGoHome auch ganz oben im script stehen...<br><code>East<br>SouthEast<br>South<br>SouthWest<br>West<br>NorthWest<br>North<br>NorthEast</code><br>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** --------------------------------------------------------------------------------
function OnEvent(params)
	local FuncName = "GDS: OnEvent(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.Conditions = params.Conditions or {}
	assert2(params.Actions, FuncName .. "MISSING PARAMETER: Actions = { ... },")
	assert2(type(params.Conditions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Conditions = ")
	assert2(type(params.Actions) == "table", FuncName .. "PARAMETER IS NOT A TABLE: Actions = ")
	params.NotInDialog = params.NotInDialog or FALSE
	params.RemoveTransition = params.RemoveTransition or FALSE
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- insert into list
	tinsert(GlobalEvents, params)
end

doc[numdoc] = [[Syntax:<br><code>OnEvent<br>{<br>NotInDialog = FALSE,<br>Conditions = { ... },<br>Actions = { ... }<br>}</code><br>Prüft in regelmässigen Abständen, ob die angegebenen Conditions wahr sind. Wenn ja - oder wenn keine Conditions angegeben sind - dann werden die Actions ausgeführt.<br>ACHTUNG: OnEvent ist sehr powerful, aber man muss hier auch aufpassen da dies zu Lasten der Performance gehen kann. Darüber hinaus sind Events, die keine Conditions haben, problematisch da dies den NPC davon abhalten wird von der KI kontrolliert werden zu können. D.h. ggfs. wird der Npc ständig zu seinem Goto Point laufen, ein Feld später umdrehen um den Spieler zu attackieren, und nach einem Feld wieder zum Goto Point zu laufen usw. Conditions, die sehr aufwändig sind abzufragen werden per default nur jede Minute abgefragt. Dies kann man mit dem Parameter UpdateInterval der Conditions regeln.<br>WICHTIG: OnEvent lösen State Wechsel bei einem NPC aus. Wenn man ein OnEvent ohne Conditions benutzt, wird es immer wahr werden und somit wird keins der anderen, unter diesem Event stehenden Events je ausgeführt !!!]]
doc[numdoc] = nil
numdoc = numdoc + 1


----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

function InitGlobalEventSystem()
	GlobalEvents = {}

	-- nur für playerdeath/revive
	PlayerEvents = {}
	PlayerEvents.DeathActions = {}
	PlayerEvents.ReviveActions = {}

	-- für OnIdleWalkPath
	NumIdleWalkPath = 0
	ClearGotoLocations()

	NpcHasIdleGoHome = nil

	NumDelayCommands = 0

	NumOneTimeEvents = 0
	
	NumToggleEvents = 0
	
	NumFollowMe = 0
	FollowData = {}
end

function CreateGlobalEventSystem()
    assert(StateMachine ~= nil)
    assert(NpcId ~= nil)
	assert(getn(States) > 0)

	FuncName = "GlobalEventSystem: "

	-- Player Death/Revive toggle
	if NpcId == 0 then
		local DeathActions = {}
		tinsert(DeathActions, SetGlobalFlagFalse{Name = "GDS_PlayerIsTalking"} )
		tinsert(DeathActions, CGdsFigureSetTalkingFlag:new(NpcId, FALSE) )
		--tinsert(DeathActions, ShowDebugText{String = "You were no match for the enemy hordes!", Color = ColorLilac} )
		foreachi(PlayerEvents.DeathActions, function(i, action)
			tinsert(%DeathActions, action )
		end)

		local ReviveActions = {}
		--tinsert(ReviveActions, ShowDebugText{String = "Back again so soon? Better luck this time!", Color = ColorMint} )
		foreachi(PlayerEvents.ReviveActions, function(i, action)
			tinsert(%ReviveActions, action )
		end)

		OnToggleEvent
		{
			OnConditions = { FigureDead{NpcId = Avatar} },
			OnActions = DeathActions,
			OffConditions = { FigureAlive{NpcId = Avatar} },
			OffActions = ReviveActions,
		}
	end


	-- early out, if there are no global events to watch
	if getn(GlobalEvents) == 0 then
		return
	end

	-- create transitions from any state to itself using the global event parems
	foreachi(GlobalEvents, function(e, _event)
		local first = { 1 }
		transition = nil

		-- flag that prevents event from being checked during a dialog
		StateDialog = "_$%&§_this_string_should_never_be_found_in_a_State's_Name_§$%&_"
		if _event.NotInDialog == TRUE then
			StateDialog = "DialogSystem"
		end

		foreachi(States, function(i, state)
			if	  state ~= StateInit 
			  and state ~= StateDead 
			  and state ~= StateDying 
			  and strfind(state:GetName():CMbStr(), "RespawnWait") == nil
			  and strfind(state:GetName():CMbStr(), "NIRVANA") == nil
			  and state ~= StateBornDead 
			  and strfind(state:GetName():CMbStr(), StateDialog) == nil 
			  and strfind(state:GetName():CMbStr(), "SSS:") == nil 
			  and strfind(state:GetName():CMbStr(), "RTSSPAWNGROUP") == nil 
			  then
				if %first[1] then
					assert(%transition == nil)
					-- bei jedem sinnvollen state für alle globalen events übergänge einbauen
					transitionname = CreateTransitionName("GlobalEvent", %e, "FromCurrentState", "ToCurrentState")
					transition = state:CreateTransition(transitionname, state)
					foreachi(%_event.Conditions, function(i, item) 
						assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
						transition:AddCondition(item) 
					end)
					foreachi(%_event.Actions, function(i, item)
						assert2(type(item) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(item)))
						transition:AddAction(item)
					end)
					if %_event.RemoveTransition == TRUE then
						--print("["..NpcId.."] STATE: " .. state:GetName():CMbStr() .. "\n\tTRANSITION: " .. transitionname)
						transition:AddAction( CGdsRemoveTransition:new("", transitionname) )
					end
					%first[1] = nil
				else
					assert(transition ~= nil)
					state:CreateTransitionFromTemplate(transition, state)
				end
			end
		end)
	end)
	transition = nil
end
