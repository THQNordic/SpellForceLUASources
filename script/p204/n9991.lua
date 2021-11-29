function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 337, Y = 169,		-- exact position of portal object!
	Type = EmpyriaTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P204_TorNachRedWasteAufmachen"},
	},
	CloseConditions = {},
	StayOpen = TRUE,

	OpenActions =
	{
		RemoveDialog {},
		
	}
}
EndDefinition()

end
