function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnPortalEvent
{
	X = _X,
	Y = _Y,
	StayOpen = TRUE,
	Type = DunkelelfenTor,
	OpenConditions = 
	{
		IsGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Fuenf_Umgelegt"},
	},
	OpenActions = 
	{		
	},
}

EndDefinition()

end