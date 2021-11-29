function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 10,
	X = 334 , Y = 107,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "DialogJaninaEnded"},
		PlayerUnitInRange { X = 334, Y = 107, Range = 8 , FigureType = FigureAll , UpdateInterval = 10},
		
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}
EndDefinition()

end
