--Feuertor2
--gekoppelt mit 6681

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 263, Y = 310, StayOpen = TRUE , Type = FeuerelfenTor, 
	OpenConditions = 
	{ 
		Negated(FigureAlive{NpcId = 6681}),
	} ,
	OpenActions = { },
}

EndDefinition()

end
