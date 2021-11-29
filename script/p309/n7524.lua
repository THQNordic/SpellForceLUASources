function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1000,
	X = 391, Y = 225,		-- exact position of portal object!
	Type = StadtTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue {Name = "Haendlermap_Nie_Wahr"},
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
