function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OnPortalEvent
{
	UpdateInterval = 10,
	X = 169, Y = 140,		-- exact position of portal object!
	Type = InnenTor,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue { Name = "g_sMenschenTitanTorOpen"},
	},	
	OpenActions = 
	{
		
	},
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}

EndDefinition()

end
