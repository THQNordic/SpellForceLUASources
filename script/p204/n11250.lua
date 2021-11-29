

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 364, Y = 195,		-- exact position of portal object!
	Type = MetallTorKlein,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P204_IrfitSpawnIrfit"}

	},
	CloseConditions = {},
	StayOpen = TRUE,

	OpenActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_IrfitPortal"},		
	}
}
	EndDefinition()
end