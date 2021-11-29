function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		Negated(AvatarLevel {Level = 28, Player = self , UpdateInterval = 60}),
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions = 
	{
	
	}
} 

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions = 
	{
	
	}
}

EndDefinition()

end
