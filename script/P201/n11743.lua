--> GebäudeKiller1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		BuildingInRange {X = 175, Y = 165, Range = 3, Owner = OwnerNpc , BuildingId = 0},
		BuildingInRange {X = 187, Y = 159, Range = 3, Owner = OwnerNpc , BuildingId = 0},
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"},
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
		Negated(BuildingInRange {X = 175, Y = 165, Range = 3, Owner = OwnerNpc , BuildingId = 0}),
		Negated(BuildingInRange {X = 187, Y = 159, Range = 3, Owner = OwnerNpc , BuildingId = 0}),
	},
	Actions = 
	{
	
	}
}


EndDefinition()

end
