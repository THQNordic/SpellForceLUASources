function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Cutscene Init ElfDiscovered
SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "CutsceneInitAryn", UpdateInterval = 30},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "CutsceneInitAryn"},
	},
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ArynDespawn", UpdateInterval = 30},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "ArynDespawn"},
	},
}


EndDefinition()

end
