function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 20,
	X = 136, Y = 175,		-- exact position of portal object!
	Type = MetallTorGross,		-- type of portal
	OpenConditions = 
	{ 
			FigureInRange {NpcId = 11007, X = 135, Y = 175, Range = 0, UpdateInterval = 2},
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}


EndDefinition()

end
