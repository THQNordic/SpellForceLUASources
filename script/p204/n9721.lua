function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 9721},
	}
}

-- Yrmir spawnt und despawnt in der Cutscene mit dem Kaiser
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_YrmirSpawnt", UpdateInterval = 60},
	},
	
	Actions = 
	{

	},
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_YrmirDespawn", UpdateInterval = 60},
	}
}



EndDefinition()

end
