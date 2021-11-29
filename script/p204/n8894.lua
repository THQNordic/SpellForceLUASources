-->INFO: Arenator

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 273, Y = 229,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P204_ArenatorAufmachen", UpdateInterval = 10},
	},
	CloseConditions = {},
	StayOpen = TRUE,

	OpenActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_ArenawachePosition"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8840"},
		RemoveDialog {},
		
	}
}

EndDefinition()

end
