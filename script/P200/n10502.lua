function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 10,
	X = 145, Y = 145,		-- exact position of portal object!
	Type = InnenTor,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue { Name = "g_sGladiatorenTor4Open"},
	},	
	OpenActions = 
	{
		
	},
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}
EndDefinition()

end