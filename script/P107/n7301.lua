function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 95 , Y = 64,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
			{
				IsGlobalFlagTrue { Name = "TorOeffnetSichP107" , UpdateInterval = 10},
				
			},
	OpenActions = 
			{
				QuestSolve {QuestId = 752},
			},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
