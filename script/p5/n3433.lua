function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)
SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Q484SpawnDryads"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "OtherDryadsMaySpawn"},
	}
}

OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "OtherDryadsMaySpawn", UpdateInterval = 10},
	},
	Actions = 
	{
		ChangeOwner{Owner = OwnerPlayer , NpcId = self},
	}
}

EndDefinition()

end
