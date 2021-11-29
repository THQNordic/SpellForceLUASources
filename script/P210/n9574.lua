function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P210_CutsceneGhostSpawn"},
	},
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P210_CutsceneGhostVanish"},
	},
}

EndDefinition()

end
