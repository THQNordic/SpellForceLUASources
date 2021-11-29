function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- For Final Cutscene
Despawn
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "UnkillableGrimDespawn", UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "UnkillableGrimDespawn"},
	}
}


EndDefinition()

end
