--Feuertor1
--gekoppelt mit 6671

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 256, Y = 288, StayOpen = TRUE , Type = FeuerelfenTor, 
	OpenConditions = 
	{ 
		Negated(FigureAlive{NpcId = 6671}),
	} ,
	OpenActions = { },
}



EndDefinition()

end
