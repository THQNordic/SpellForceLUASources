function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 10,
	X = 383 , Y = 112,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "DialogJaninaEnded"},
		PlayerUnitInRange { X = 383, Y = 112, Range = 8 , FigureType = FigureAll , UpdateInterval = 10},
	},	
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}
EndDefinition()

end
