function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Das Portal des fliegenden Händlers
OnPortalEvent
{
	UpdateInterval = 20,
	X = 348, Y = 176,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{ 
		PlayerHasItem {ItemId = 4233},
		PlayerUnitInRange {X = 345, Y = 175, Range = 15, FigureType = FigureAvatar, UpdateInterval = 20},
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}
EndDefinition()

end
