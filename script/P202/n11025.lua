-- Tor nach Wachgeist zim n�chsten Abschnitt

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X, Y = _Y, StayOpen = TRUE, EnableClosing = FALSE, Type = DunkelelfenTor,
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202WachgeistTorAuf", UpdateInterval = 10}
	} ,
	OpenActions = {},
}

EndDefinition()

end
