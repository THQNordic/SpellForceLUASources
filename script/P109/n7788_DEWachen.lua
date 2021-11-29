function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


Respawn
{
	X = 268, Y = 148, NoSpawnEffect = FALSE, WaitTime = 180,
	Conditions = 
	{ 
		BuildingInRange {X = 244, Y = 155, Range = 30, Owner = OwnerNpc},
	},
	Actions =
	{
	},
	DeathActions = 
	{
	
	},
}


EndDefinition()

end