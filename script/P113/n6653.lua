-- Dunkelelfentor vor Fial Darg

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 176, Y = 205, StayOpen = TRUE , Type = DunkelelfenTor, 
	OpenConditions = 
	{
		Negated (EnemyUnitInRange{X = 177, Y = 205, NpcId = Avatar, Range = 5 , UnitId = 0 , UpdateInterval = 30}),
		Negated (BuildingInRange{X = 184, Y = 213, Range = 0 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 30}),
		Negated (BuildingInRange{X = 188, Y = 212, Range = 0 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 30}),
		Negated (BuildingInRange{X = 193, Y = 212, Range = 0 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 30}),
		Negated (BuildingInRange{X = 214, Y = 210, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 30}),
		Negated (BuildingInRange{X = 186, Y = 194, Range = 0 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 30}),
		Negated (BuildingInRange{X = 184, Y = 198, Range = 0 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 30}),
	} ,
	OpenActions = {},
}




EndDefinition()

end
