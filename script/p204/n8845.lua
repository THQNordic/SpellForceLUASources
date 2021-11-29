-->INFO: Oberstadtwache

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}

OnIdleGoHome
{
X = _X, Y = _Y, Direction = 2, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P204_TurmwacheHomepoint"},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


--- Despawn nach Dialog Ehemann ---
Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_WacheDespawntImTurm", UpdateInterval = 10},
	}
}


--- Erster Hinterhalt ---
Respawn
{
	WaitTime = 2, UnitId = self , X = 308, Y = 276, NoSpawnEffect = TRUE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_OberstadtwacheHilfe", UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_OberstadtwacheHilfe"},
	}
}


--- Wache wird agro nach cutscene Alyah Dryade ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert"},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8845"},
	}
}
EndDefinition()

end
