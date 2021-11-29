function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Bombe
-- Der Elementar läuft zum Spieler und detoniert dort
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect  = TRUE,
	Conditions =
	{
		FigureHasAggro {NpcId = 11190},
	},
	Actions =
	{
		AttackTarget {Target = Avatar},
		SetGlobalTimeStamp {Name = "g_P213_SpawnLevelChanger"},
	}
}

OnEvent
{
	Conditions =
	{
		FigureInRangeNpc {TargetNpcId = Avatar, Range = 2, UpdateInterval = 1},
		IsNpcFlagFalse {Name = "n_P213_BomeDespawn", UpdateInterval = 1}
	},
	Actions =
	{
		Stop {},
		--SetNoFightFlagTrue {},
		CastSpell {Spell = 3530, TargetType = Figure, Target = Avatar, X = 0, Y = 0},
		SetNpcFlagTrue {Name = "n_P213_BomeDespawn"}
	} 
}

-- Wenn die Sprengung durch ist geht die Bombe für die nächste
Despawn 
{
	Conditions =
	{
		ODER9
		{
			IsNpcFlagTrue {Name = "n_P213_BomeDespawn", UpdateInterval = 60},
			IsGlobalFlagTrue {Name = "UmspawnExtroBone"},
		}
			
	},
	Actions =
	{
		SetNpcFlagFalse {Name = "n_P213_BomeDespawn"}
	}
}

Respawn
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE, WaitTime = 15,
	Conditions =
	{
		FigureAlive {NpcId = 11190},
		IsGlobalFlagFalse {Name = "UmspawnExtroBone"},
	},
	Actions =
	{
		AttackTarget {Target = Avatar},
	}
	
}

EndDefinition()

end
