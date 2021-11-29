function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{}

--------------------------------------------------------
-- Spawnen, und greifen an, wenn Timer abgelaufen ist --
--------------------------------------------------------

Despawn
{
	Conditions = 
	{		
		IsGlobalFlagFalse {Name = "g_P207_attackers_are_not_on_map"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P207_attackers_are_not_on_map"},
	},
}

Respawn -- 0 bis 19 Einheiten, Gegnerspawn nach 10 Minuten
{
	X = _X, 
	Y = _Y,
	WaitTime = 10,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsNpcFlagFalse {Name = "n_p207_Unit_stop_respawn_0_19"},
		PlayerUnitExists {UnitId = 0, Amount = 0, NoWorkers = TRUE},
		Negated(PlayerUnitExists {UnitId = 0, Amount = 20, NoWorkers = TRUE}),
		IsGlobalTimeElapsed {Name = "g_p207_defend_second_base", Seconds = 600}, -- 10 Minuten
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "n_p207_Unit_stop_respawn_0_19"},
		SetGlobalFlagTrue {Name = "g_P207_Zweite_Festung_Angreifer_Gespawnt"},
		SetGlobalTimeStamp {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt"},
	},
}

Respawn -- 20 bis 39 Einheiten, Gegnerspawn nach 7 Minuten
{
	X = _X, 
	Y = _Y, 
	WaitTime = 10,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsNpcFlagFalse {Name = "n_p207_Unit_stop_respawn_20_39"},		
		PlayerUnitExists {UnitId = 0, Amount = 20, NoWorkers = TRUE},
		Negated(PlayerUnitExists {UnitId = 0, Amount = 40, NoWorkers = TRUE}),
		IsGlobalTimeElapsed {Name = "g_p207_defend_second_base", Seconds = 420}, -- 7 Minuten
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "n_p207_Unit_stop_respawn_20_39"},
		SetGlobalFlagTrue {Name = "g_P207_Zweite_Festung_Angreifer_Gespawnt"},
		SetGlobalTimeStamp {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt"},
	},
}

Respawn -- 40 bis 59 Einheiten, Gegnerspawn nach 5 Minuten
{
	X = _X, 
	Y = _Y, 
	WaitTime = 10,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsNpcFlagFalse {Name = "n_p207_Unit_stop_respawn_40_59"},
		PlayerUnitExists {UnitId = 0, Amount = 40, NoWorkers = TRUE},
		Negated(PlayerUnitExists {UnitId = 0, Amount = 60, NoWorkers = TRUE}),
		IsGlobalTimeElapsed {Name = "g_p207_defend_second_base", Seconds = 300}, -- 5 Minuten
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "n_p207_Unit_stop_respawn_40_59"},
		SetGlobalFlagTrue {Name = "g_P207_Zweite_Festung_Angreifer_Gespawnt"},
		SetGlobalTimeStamp {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt"},
	},
}

Respawn -- 60 bis 69 Einheiten, Gegnerspawn nach 2 Minuten
{
	X = _X, 
	Y = _Y, 
	WaitTime = 10,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsNpcFlagFalse {Name = "n_p207_Unit_stop_respawn_60_69"},
		PlayerUnitExists {UnitId = 0, Amount = 60, NoWorkers = TRUE},
		Negated(PlayerUnitExists {UnitId = 0, Amount = 70, NoWorkers = TRUE}),
		IsGlobalTimeElapsed {Name = "g_p207_defend_second_base", Seconds = 120}, -- 2 Minuten
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "n_p207_Unit_stop_respawn_60_69"},
		SetGlobalFlagTrue {Name = "g_P207_Zweite_Festung_Angreifer_Gespawnt"},
		SetGlobalTimeStamp {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt"},
	},
}

Respawn -- 70 und mehr Einheiten, Gegnerspawn nach 1 Minute
{
	X = _X, 
	Y = _Y, 
	WaitTime = 10,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsNpcFlagFalse {Name = "n_p207_Unit_stop_respawn_70up"},
		PlayerUnitExists {UnitId = 0, Amount = 70, NoWorkers = TRUE},
		IsGlobalTimeElapsed {Name = "g_p207_defend_second_base", Seconds = 60}, -- 1 Minuten
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "n_p207_Unit_stop_respawn_70up"},
		SetGlobalFlagTrue {Name = "g_P207_Zweite_Festung_Angreifer_Gespawnt"},
		SetGlobalTimeStamp {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt"},
	},
}

OnIdleEvent
{
	Conditions = 
	{
	},
	Actions = 
	{ 
		Goto {X = 441, Y = 260, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoContinuous},
	}, 
}

EndDefinition()

end
