function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 327 , Y = 238,		-- exact position of portal object!
	Type = DunkelelfenTor,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue { Name = "OeffneSchatzkammer1P110"},
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}
EndDefinition()

end
