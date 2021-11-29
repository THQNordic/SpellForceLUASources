function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = 76 , Y = 235 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint03On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint01On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint02On"},
	},
}

Respawn
{
	WaitTime = (random(100)+25) ,
	X = 76 , Y = 235 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint03On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint01On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint02On"},
	},
}



-- Figur stört den Aufbau
OnIdleGoHome
{
	X = 213, Y = 426,
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