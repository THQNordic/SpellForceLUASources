function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnPortalEvent
{
	UpdateInterval = 30,
	X = _X, Y = _Y,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P210_OpenFiveHeadGate"},
	},
	OpenActions = 
	{ 
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
