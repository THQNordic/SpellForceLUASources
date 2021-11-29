function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 375 , Y = 83,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_PortalKathaiAuf"}, --Flag von Darkwind_Keep
	},
	OpenActions = 
	{
		
	},	
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}


EndDefinition()

end
