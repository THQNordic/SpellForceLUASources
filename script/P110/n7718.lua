function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 10,
	X = _X, Y = _Y,		-- exact position of portal object!
	Type = DunkelelfenTor,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "P110_DialogCraigEnded"},
--		FigureInRange { X = 145 , Y = 273, NpcId = Avatar , Range = 5},
		FigureDead { NpcId = 6631}, 

	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}


EndDefinition()

end
