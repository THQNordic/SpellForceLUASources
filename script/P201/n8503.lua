function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 63 , Y = 69,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{
		ODER9
		{
			UND9
			{
				IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 60},
				IsGlobalFlagTrue {Name = "g_sP201OpenDoorSouth", UpdateInterval = 10}
			},
			UND9
			{
				IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler", UpdateInterval = 60}, 
				IsGlobalFlagTrue {Name = "g_sP201SkelettCamp1Destroyed", UpdateInterval = 60},
				IsGlobalFlagTrue {Name = "g_sP201SkelettCamp2Destroyed", UpdateInterval = 60},
				IsGlobalFlagTrue {Name = "g_sP201SkelettCamp3Destroyed", UpdateInterval = 60}
			},
			
		},  
	},	
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}
EndDefinition()

end
