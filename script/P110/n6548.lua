function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 186 , Y = 314,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue { Name = "P110_MoonGateOpened"},
	},	
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
