function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Eisentor

OnPortalEvent
{
	UpdateInterval = 20,
	X = 288, Y = 292,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_n_P203ZweitesMalResourcenGegeben", UpdateInterval = 10},
	},
	OpenActions =
	{
		ChangeBuildingOwner {X = 282, Y = 325},
	},	
	CloseConditions = {},	
	StayOpen = TRUE,
}
EndDefinition()

end
