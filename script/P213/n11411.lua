function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- !!! Kann man das zur Performanceoptimierung evtl. Auslagern? 
-- Bei Kartenstart wird die Figur erst mal Despawned, damit sie Per respawn gesetzt werden kann
Despawn
{
	Conditions =
	{
		IsNpcFlagFalse {Name = "n_P213_DespawnBlocker"},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "n_P213_DespawnBlocker"},
	}
}

-- Wenn Belial die Unit Castet spawnt sie in seiner Nähe
Respawn
{
	WaitTime = 20, Target = 11190,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_P213_SpawnLevelChanger", Seconds = 10},
		IsGlobalFlagFalse {Name = "UmspawnIntroBone"},
		FigureAlive {NpcId = 11190}
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "g_P213_SpawnLevelChanger"},
		ResetGlobalCounter {Name = "gc_P213_ChangerLevel"},
		SetEffect {Effect = "IceShieldOld", TargetType = Figure, Length = 2000},
		SetGlobalFlagTrue {Name = "g_P213_OutcryPet"}
	}
	
}

-- Alle X Sekunden wird die Unit gechanged
localChangeTime = 7
OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_P213_SpawnLevelChanger", Seconds = localChangeTime, UpdateInterval = 2},
		IsGlobalCounter {Name = "gc_P213_ChangerLevel", Value = 0, UpdateInterval = 2},
	},
	Actions =
	{
		ChangeUnit {Unit = 2731, ChangeLevel = TRUE},
		IncreaseGlobalCounter {Name = "gc_P213_ChangerLevel"},
		SetGlobalTimeStamp {Name = "g_P213_SpawnLevelChanger"},
		SetEffect {Effect = "IceShieldOld", TargetType = Figure, Length = 500},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_P213_SpawnLevelChanger", Seconds = localChangeTime, UpdateInterval = 2},
		IsGlobalCounter {Name = "gc_P213_ChangerLevel", Value = 1, UpdateInterval = 2},
	},
	Actions =
	{
		ChangeUnit {Unit = 2732, ChangeLevel = TRUE},
		SetGlobalTimeStamp {Name = "g_P213_SpawnLevelChanger"},
		IncreaseGlobalCounter {Name = "gc_P213_ChangerLevel"},
		SetEffect {Effect = "IceShieldOld", TargetType = Figure, Length = 500},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_P213_SpawnLevelChanger", Seconds = localChangeTime, UpdateInterval = 2},
		IsGlobalCounter {Name = "gc_P213_ChangerLevel", Value = 2, UpdateInterval = 2},
	},
	Actions =
	{
		ChangeUnit {Unit = 2733, ChangeLevel = TRUE},
		SetGlobalTimeStamp {Name = "g_P213_SpawnLevelChanger"},
		IncreaseGlobalCounter {Name = "gc_P213_ChangerLevel"},
		SetEffect {Effect = "IceShieldOld", TargetType = Figure, Length = 500},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_P213_SpawnLevelChanger", Seconds = localChangeTime, UpdateInterval = 2},
		IsGlobalCounter {Name = "gc_P213_ChangerLevel", Value = 3, UpdateInterval = 2},
	},
	Actions =
	{
		ChangeUnit {Unit = 2734, ChangeLevel = TRUE},
		SetGlobalTimeStamp {Name = "g_P213_SpawnLevelChanger"},
		IncreaseGlobalCounter {Name = "gc_P213_ChangerLevel"},
		SetEffect {Effect = "IceShieldOld", TargetType = Figure, Length = 500},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_P213_SpawnLevelChanger", Seconds = localChangeTime, UpdateInterval = 2},
		IsGlobalCounter {Name = "gc_P213_ChangerLevel", Value = 4, UpdateInterval = 2},
	},
	Actions =
	{
		ChangeUnit {Unit = 2735, ChangeLevel = TRUE},
		SetGlobalTimeStamp {Name = "g_P213_SpawnLevelChanger"},
		IncreaseGlobalCounter {Name = "gc_P213_ChangerLevel"},
		SetEffect {Effect = "IceShieldOld", TargetType = Figure, Length = 500},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_P213_SpawnLevelChanger", Seconds = localChangeTime, UpdateInterval = 2},
		IsGlobalCounter {Name = "gc_P213_ChangerLevel", Value = 5, UpdateInterval = 2},
	},
	Actions =
	{
		ChangeUnit {Unit = 2736, ChangeLevel = TRUE},
		SetGlobalTimeStamp {Name = "g_P213_SpawnLevelChanger"},
		IncreaseGlobalCounter {Name = "gc_P213_ChangerLevel"},
		SetEffect {Effect = "IceShieldOld", TargetType = Figure, Length = 500},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_P213_SpawnLevelChanger", Seconds = localChangeTime, UpdateInterval = 2},
		IsGlobalCounter {Name = "gc_P213_ChangerLevel", Value = 6, UpdateInterval = 2},
	},
	Actions =
	{
		ChangeUnit {Unit = 2737, ChangeLevel = TRUE},
		SetGlobalTimeStamp {Name = "g_P213_SpawnLevelChanger"},
		IncreaseGlobalCounter {Name = "gc_P213_ChangerLevel"},
		SetEffect {Effect = "IceShield", TargetType = Figure, Length = 500},
	}
}


OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_P213_SpawnLevelChanger", Seconds = localChangeTime, UpdateInterval = 2},
		IsGlobalCounter {Name = "gc_P213_ChangerLevel", Value = 7, UpdateInterval = 2},
	},
	Actions =
	{
		ChangeUnit {Unit = 2738, ChangeLevel = TRUE},
		SetGlobalTimeStamp {Name = "g_P213_SpawnLevelChanger"},
		IncreaseGlobalCounter {Name = "gc_P213_ChangerLevel"},
		SetEffect {Effect = "IceShield", TargetType = Figure, Length = 500},
	}
}

Despawn
{
	PlayDeathAnim = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UmspawnExtroBone", UpdateInterval = 2},
	},
}

EndDefinition()

end
