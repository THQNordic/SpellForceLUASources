

-->INFO: gate
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 209, Y = 188,		-- exact position of portal object!
	Type = EmpyriaTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P204_StadttorAufmachen", UpdateInterval = 60},
	},
	CloseConditions = {},
	StayOpen = TRUE,

	OpenActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_StadttorAuf"},
		RemoveDialog {},
		
	}
}
	

	EndDefinition()
end