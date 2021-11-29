function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Damit der Respawn funzt, direkt zu beginnn despawnen
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

-- Wenn Belial stirbt wird dieser Helfer für den Umspawn von Hokan gespawned
Respawn
{
	WaitTime = 1, Target = 11190,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UmspawnExtroBone"},
		--IsGlobalTimeElapsed {Name = "g_P213_SpawnLevelChanger", Seconds = 10, UpdateInterval = 1},
		--FigureAlive {NpcId = 11190}
	},
	Actions =
	{
		SetEffect {Effect = "OccludeBlack", TargetType = Figure, Length = 2000},
		SetNpcFlagTrue {Name = "n_P213_HokanErscheint"},
		
	}
}

-- Tauschen auf Hokan Mesh
OnOneTimeEvent 
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "n_P213_HokanErscheint", UpdateInterval = 1},
	},
	Actions =
	{
		ChangeUnit {Unit = 2294}
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_HokanWiederDa", UpdateInterval = 2},
	}
}

EndDefinition()

end
