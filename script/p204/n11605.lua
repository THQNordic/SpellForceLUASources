function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{ 
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
			IsGlobalFlagTrue{Name = "g_P204_StreitWachenSpawn"},
	},
	Actions = 
	{
			ChangeRace{Race = 152, NpcId = self},
	},
}


OnIdleGoHome
{

	X = 259, Y = 254, WalkMode = Run, Direction = South,
	
	Conditions =
	{
			IsGlobalFlagTrue {Name = "g_P204_ZumStreitGehen"},
	},
	
	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_ZumStreitGehen"},
	}
}

OnIdleGoHome
{

	X = 248, Y = 269, WalkMode = Walk, Direction = South,
	
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_Wache2Abgang"},
	},
	
	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_Wache2Abgang"},
		SetGlobalFlagTrue{Name = "g_P204_Wache2Despawn"},		
	}
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Wache2Despawn", UpdateInterval = 60},
	}
}

EndDefinition()

end
