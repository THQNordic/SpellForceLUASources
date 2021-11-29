function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X, Y = _Y, StayOpen = TRUE, EnableClosing = FALSE, Type = DunkelelfenTor,
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "P202Aschetaenzer1Monster50Tot", UpdateInterval = 10}
	} ,
	OpenActions = {},
}

EndDefinition()

end
