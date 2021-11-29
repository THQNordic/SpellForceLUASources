-->INFO: Stadtwache
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 9099},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9099"},
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = West, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = {},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}

-- Wache wird agro, wenn Tor geöffnet wird
OnOneTimeEvent
{	
	Conditions =
	{
		ODER9
		{
	   		IsGlobalTimeElapsed{Name = "c_P204_CounterUnterstadttorRechts", Seconds = 2, UpdateInterval = 10}, 
	   		IsGlobalFlagTrue {Name = "g_P204_StadtwachenAngriff"}
		}
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9099"},
		ChangeRace{Race = 150, NpcId = self},
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
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9099"},
	}
}


--- Wache wird lieb wenn Alyah Kaiserin ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_AlyahKaiserin"},
	},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}



	EndDefinition()
end