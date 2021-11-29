-->INFO: gate
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 337, Y = 408,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = { 
		IsGlobalFlagTrue{Name ="Froschtor_aufmachen", UpdateInterval = 10 },
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