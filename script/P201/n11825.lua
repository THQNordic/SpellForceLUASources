function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 10},			
	},
	Actions =
	{
		SetEffect {Effect = "SimpleInvis", Length = 0, TargetType = Figure, NpcId = self},
	}
}

Despawn
{
	
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201CutszeneGrabEnded"},
	},
	Actions = 
	{
		
	}
}


EndDefinition()

end
