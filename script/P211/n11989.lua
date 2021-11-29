function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X, Y = _Y, StayOpen = TRUE, EnableClosing = FALSE, Type = MetallTorKlein,
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_KathaiFallenEin", UpdateInterval = 20},
	} ,
	OpenActions = {},
}

EndDefinition()

end
