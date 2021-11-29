function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 202 , Y = 121,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{
		ODER9
		{
			UND9
			{
				IsGlobalFlagTrue {Name = "g_sP201PalisadentorSkeletteOeffnen", UpdateInterval = 10},
				IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 10},
			},
			IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler", UpdateInterval = 60}, 
		},  
	},	
	OpenActions = 
	{
		
	},
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}
EndDefinition()

end

