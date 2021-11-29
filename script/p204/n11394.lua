function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 15,
	X = 274, Y = 345,		-- exact position of portal object!
	Type = MetallTorKlein,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen", UpdateInterval = 10},
	},
	CloseConditions = {},
	StayOpen = TRUE,

	OpenActions =
	{

	}
}

EndDefinition()

end
