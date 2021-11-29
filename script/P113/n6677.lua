--Feuertor1
--gekoppelt mit 6682

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 272, Y = 322, StayOpen = TRUE , Type = FeuerelfenTor, 
	OpenConditions = 
	{ 
		Negated(FigureAlive{NpcId = 6682}),
	} ,
	OpenActions = { },
}


EndDefinition()

end
