function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 99 , Y = 84,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{
		ODER9
		{ 
			UND9{
				IsGlobalFlagTrue { Name = "g_sP201PalisadentorOeffnen"},
				IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
				},
			IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
		},
	},	
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}


EndDefinition()

end
