function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 320, Y = 331,		-- exact position of portal object!
	Type = EmpyriaTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert"},
	},
	CloseConditions = {},
	StayOpen = TRUE,

	OpenActions =	{}
}
	EndDefinition()
end