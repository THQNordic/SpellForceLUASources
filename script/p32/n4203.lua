function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--OnPortalEvent
--{
--	X = 386, Y = 365, StayOpen = TRUE , Type = SteinTorKlein, 
--	OpenConditions = { 
--		IsGlobalFlagTrue{Name = "SoulForgerStageThree", UpdateInterval = 10},
--		FigureDead{NpcId = 4450},
--	},
--	OpenActions = { },
--}

-------------- CUTSCENE ----------------------------------------------------------
OnPortalEvent
{
	X = 386, Y = 365, StayOpen = TRUE , Type = SteinTorKlein,
	OpenConditions = 
	{ 
		IsGlobalFlagTrue {Name = "FinalGateOpen", UpdateInterval = 5},
	},
	OpenActions = { },
}
----------------------------------------------------------------------------------

EndDefinition()

end
