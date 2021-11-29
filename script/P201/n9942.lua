function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 108 , Y = 63,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{
		ODER9
		{
			UND9{IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 10}, Negated(BuildingInRange {X = 154, Y = 61, Range = 3, Owner = OwnerAll, BuildingId = 0 , UpdateInterval = 10}), Negated(BuildingInRange {X = 151, Y = 53, Range = 3, Owner = OwnerNpc, BuildingId = 0 , UpdateInterval = 10}), IsGlobalFlagTrue {Name = "g_sP201CutszeneStartEnded"}},
			UND9{IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler", UpdateInterval = 10}, IsGlobalFlagTrue {Name = "g_sP201SkelettCamp1Destroyed", UpdateInterval = 10},IsGlobalFlagTrue {Name = "g_sP201SkelettCamp2Destroyed", UpdateInterval = 10},IsGlobalFlagTrue {Name = "g_sP201SkelettCamp3Destroyed", UpdateInterval = 10}},
			
		},  
	},	
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}

EndDefinition()

end
