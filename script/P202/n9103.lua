--Tor vor Grabmal

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 375, Y = 260, StayOpen = TRUE , EnableClosing = FALSE, Type = DunkelelfenTor,
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 20}
	} ,
	OpenActions = {},
}


EndDefinition()

end
