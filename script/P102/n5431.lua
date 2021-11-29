function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 415 , Y = 220,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	
	OpenConditions = 
	{ 
		IsGlobalFlagTrue { Name = "DialogHuluEnded" }, -- Wenn der Hulu Dialog zu Ende ist
	}, 
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
