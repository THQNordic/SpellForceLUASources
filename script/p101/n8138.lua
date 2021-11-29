function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "PlayerWarAufFleeToIce", UpdateInterval = 5},
	},
	Actions = 
	{
		Follow{Target = 8136, NpcId = self},
	},

}

EndDefinition()

end
