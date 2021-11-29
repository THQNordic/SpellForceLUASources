function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = 87 , Y = 55 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint05On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint01On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint02On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint03On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint04On"},
	},
}

Respawn
{
	WaitTime = (random(100)+25) ,
	X = 87 , Y = 55 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint05On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint01On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint02On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint03On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint04On"},
	},
}



-- Figur stört den Aufbau
OnIdleGoHome
{
	X = 313, Y = 426,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		ODER9
		{
		IsMonumentInUse {X = 313, Y = 423, Range = 5},
		IsMonumentInUse {X = 207, Y = 473, Range = 5},
		}
	},
}


EndDefinition()

end
