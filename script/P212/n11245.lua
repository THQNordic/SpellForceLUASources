function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
	X = 276, Y = 445 ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalFlagTrue{Name ="P212EntryCutsceneEnded"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint01On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint02On"}
	},
}

OnIdleGoHome
{
	X = _X, Y = _Y ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		ODER9
		{
		IsGlobalFlagFalse{Name ="P212EntryCutsceneEnded"},
		IsGlobalFlagTrue{Name = "P212Spawnpoint01On"},
		IsGlobalFlagTrue{Name = "P212Spawnpoint02On"}
		}
	},
}

EndDefinition()

end
