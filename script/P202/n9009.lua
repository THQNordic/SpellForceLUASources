-- Oststadt: Tor zum Pentagrammtempel

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 314, Y = 377, StayOpen = TRUE , EnableClosing = FALSE , Type = SteinTorGross,
	OpenConditions = 
	{
		IsGlobalFlagTrue{Name = "g_P202HokanAmTorNord", UpdateInterval = 10},
	} ,
	OpenActions = {},
}


EndDefinition()

end
