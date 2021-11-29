--Feuertor1
--gekoppelt mit 6672

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 265, Y = 264, StayOpen = TRUE , Type = FeuerelfenTor, 
	OpenConditions = 
	{ 
		Negated(FigureAlive{NpcId = 6672}),
	} ,
	OpenActions = { },
}


EndDefinition()

end
