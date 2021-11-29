function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{}

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_p207_Cutscene_Beginning_Played"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P207_Saurian_Has_Spawned"},
	},
}

EndDefinition()

end
