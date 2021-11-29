function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--- Spawn wenn Wein auf dem Tisch ---
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_WacheKommtAusKneipe"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P204_WacheGehtZumTisch"},
	},
}

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}


--- Zum Tisch gehen ---
OnIdleGoHome
{
X = 217, Y = 281, Direction = 4, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_WacheGehtZumTisch"},
	},
	Actions = {},
	HomeActions = 
	{
		SetGlobalFlagTrue {Name = "g_P204_WacheRuftDieAnderen"},
	},
}

--- Die anderen Wachen rufen ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_WacheRuftDieAnderen"},
	},

	Actions =
	{
		Outcry { NpcId = 10416, Tag ="oca2gatekeeper_syrioP204_001", String = "Hoppla, da hat jemand Wein hingestellt! Na den lassen wir uns doch nicht entgehen! Kommt!" },
		SetGlobalTimeStamp{Name = "c_P204_CounterWacheRuftKollegen"},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterWacheRuftKollegen", Seconds = 6, UpdateInterval = 10}, 
	},

	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P204_KollegenGehenZumTisch"},
	}
}

EndDefinition()

end
