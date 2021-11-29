function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P212_UramDespawn", UpdateInterval = 15},
	},
}

EndDefinition()

end
