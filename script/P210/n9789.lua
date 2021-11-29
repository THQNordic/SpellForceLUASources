function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 20,
	X = _X, Y = _Y,		-- exact position of portal object!
	Type = InnenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P210_Room3GateBOpen"},
	},
	OpenActions = 
	{ 
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
