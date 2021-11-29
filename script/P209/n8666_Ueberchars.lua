function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen 
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteStart"},
		--IsMonumentInUse {X = 113, Y = 410, Range = 5, UpdateInterval = 20},
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
		IsGlobalFlagTrue {Name = "g_sP209BoteAngriff"},
		Negated(IsMonumentInUse {X = 113, Y = 410, Range = 5}),
	},
	Actions = 
	{
	
	}
}




EndDefinition()

end
