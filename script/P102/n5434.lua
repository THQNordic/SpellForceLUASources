function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 156 , Y = 322,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = {
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = FALSE,
}

EndDefinition()

end
