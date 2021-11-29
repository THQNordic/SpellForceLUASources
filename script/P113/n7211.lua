function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Cutscene Init Showdown
SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "CutsceneInitShowdown", UpdateInterval = 15},
	},
	Actions =
	{
		SetNoFightFlagTrue {NpcId = _NpcId},
	},
}


EndDefinition()

end
