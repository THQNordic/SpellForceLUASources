function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- cutscene init herstellung entry
SpawnOnlyWhen
{
	X = 154, Y = 332,
	Conditions =
	{
		IsGlobalFlagTrue {Name =  "RodeSpawnFlag"},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "RodeSpawnFlag"},
	},
}


OnIdleGoHome
{
	WalkMode = Run, X = 143, Y = 380, Direction = 2,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WindjalfFolgt"},
	},
}


EndDefinition()

end
