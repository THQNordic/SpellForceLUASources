function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn 
{
	WaitTime = 30,
	Conditions =
	{
		BuildingInRange {X = 202, Y = 351, Range = 3, BuildingId = 108, Owner = Npc},
	}
}

EndDefinition()

end
