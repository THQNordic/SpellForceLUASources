-->INFO: Oberstadtwache

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 8841},
	}
}

OnIdleGoHome
{
X = _X, Y = _Y, Direction = 2, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P204_KollegenGehenZumTisch"},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}

-- Wache wird agro, wenn Tor geöffnet wird und sie nicht abgelenkt wurde
OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterOberstadttorLinks", Seconds = 2, UpdateInterval = 10}, 
	   IsGlobalFlagTrue {Name = "g_P204_OberstadttorLinksOffen"},
	   IsGlobalFlagFalse {Name = "g_P204_KollegenGehenZumTisch"},
	},

	Actions =
	{
		Outcry { NpcId = 8841, Tag = "oca2sergeantP204_001", String = "Ein Eindringling! Alarm!" },
		ChangeRace{Race = 150, NpcId = self},
	}
}

-- Wache geht zum Tisch, sobald der Spieler das Bier dort abgestellt hat
OnIdleGoHome
{
	X = 214, Y = 279, WalkMode = Run, Direction = North,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_KollegenGehenZumTisch", UpdateInterval = 10},
	},

	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_OberstadttorLinksBewacht"},
		SetGlobalFlagFalse{Name = "g_P204_BierHinstellen"},
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
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8841"},
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
