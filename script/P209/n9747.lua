function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 415 , Y = 283,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209KeyClockwork",  UpdateInterval = 10},
	},
	OpenActions = 
	{
		SetGlobalFlagTrue{Name = "g_sP209ClockworkGateOpen"},
	},	
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}


EndDefinition()

end
