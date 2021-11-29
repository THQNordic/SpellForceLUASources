function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_YrmirRespawn", UpdateInterval = 10},
	},
	Actions = 
	{
		ChangeRace{Race = 150, NpcId = self},	
		SetGlobalFlagFalse{Name = "g_P204_YrmirRespawn"},	
		SetGlobalFlagTrue{Name = "g_P204_YrmirInGarnison"},
	},
}

OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}

EndDefinition()

end
