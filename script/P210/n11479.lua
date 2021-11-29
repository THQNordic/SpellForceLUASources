function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 20,
	X = _X, Y = _Y,		-- exact position of portal object!
	Type = InnenTor,		-- type of portal
	OpenConditions = 
	{ 
		ODER9
		{
			IsGlobalCounter{Name = "g_P210_Binaercounter", Value = 24, Operator = IsEqual, UpdateInterval = 20},
			IsGlobalCounter{Name = "g_P210_Binaercounter", Value = 5, Operator = IsEqual,UpdateInterval = 20},
			IsGlobalCounter{Name = "g_P210_Binaercounter", Value = 12, Operator = IsEqual, UpdateInterval = 20},
		},
	},
	OpenActions = 
	{ 
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
