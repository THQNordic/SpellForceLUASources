function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnPortalEvent
{
	X = 324, Y = 401, StayOpen = TRUE , Type = PortalKeep , UpdateInterval = 1 ,
	OpenConditions = { } ,
	OpenActions = { },
}


EndDefinition()

end
