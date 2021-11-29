function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- AriaTor

OnPortalEvent
{
	UpdateInterval = 20,
	X = 284, Y = 276,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_n_P203ResourcenGegeben", UpdateInterval = 10},
	},	
	OpenActions =
	{
		ChangeBuildingOwner {X = 259, Y = 276},
	},
	CloseConditions = {},	
	StayOpen = TRUE,
}
EndDefinition()

end
