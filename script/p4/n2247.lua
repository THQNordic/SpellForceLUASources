function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn 
{
	WaitTime = 30,
	Conditions =
	{
		BuildingInRange {X = 218, Y = 358, Range = 3, BuildingId = 106, Owner = Npc},
	}
}

EndDefinition()

end
