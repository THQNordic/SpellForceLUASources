-- _______________________________________
--I                                      I
--I             P209_Kathai              I
--I______________________________________I



----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


------------------------------------------------------------------
------------------------------------------------------------------
--Quest Heilige Stätten Q 844
------------------------------------------------------------------
--Nebel am Anfang
OnOneTimeEvent
{
	Conditions = {},
	Actions = 
	{ 
		SetEffect{Effect = "FogForever", X = 187, Y = 75, Length = 0, TargetType = World},
		ChangeObject {X = 186, Y = 75, Object = 809}
	}
}


--Spawning Dämonen Ende
--Quest solved
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P209KathaiBaumWirdKlein", UpdateInterval = 20},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P209KathaiDämonenSpawnStopHlStätte"},
		QuestSolve {QuestId = 1054, ActivateNextQuest = FALSE} -- hl. Stätte Onyx Shore
	}
}


--wenn schon alle gepflanzt, zurück zur Dryade Quest begin
OnOneTimeEvent
{
	Conditions = 
	{ 
		QuestState {QuestId = 1051, State = StateSolved, UpdateInterval = 30}, -- red Waste
		QuestState {QuestId = 1052, State = StateSolved, UpdateInterval = 30}, -- Onyx shore
		QuestState {QuestId = 1053, State = StateSolved, UpdateInterval = 30}, -- darkwind keep
		QuestState {QuestId = 1054, State = StateSolved, UpdateInterval = 30}, --kathai
		QuestState {QuestId = 1055, State = StateUnknown, UpdateInterval = 30}
	},
	Actions = 
	{ 
		QuestBegin {QuestId = 1055}, --zurück zur Dryade1
		SetGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed"}
	}
}



--Baum wächst nach Lösen der Quest
-- nach 2 Sekunden: kleiner Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P209KathaiBaumWirdKlein", UpdateInterval = 20},
		IsGlobalTimeElapsed {Name = "gt_P209KathaiBaumwuchsTimer", Seconds = 2, UpdateInterval = 10},
	},
	Actions = 
	{ 
		ChangeObject {X = 186, Y = 75, Object = 3112},
		SetGlobalFlagTrue{Name = "g_P209KathaiBaumWirdMittel"},
		StopEffect {X = 187, Y = 75, TargetType = World}, --nebel aus
		SetEffect{Effect = "OccludeWhite", X = 186, Y = 75, Length = 3000, TargetType = World},
		PlaySound{Sound = SoundSacredFreedom},
	}
}


--nach  Minuten: mittlerer Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P209KathaiBaumwuchsTimer", Seconds = 300, UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "g_P209KathaiBaumWirdMittel", UpdateInterval = 20}
	},
	Actions = 
	{ 
		ChangeObject {X = 186, Y = 75, Object = 3111},
		SetGlobalFlagTrue{Name = "g_P209KathaiBaumWirdGross"},
		SetEffect{Effect = "OccludeWhite", X = 186, Y = 75, Length = 3000, TargetType = World}
	}
}


--nach Minuten: großer Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P209KathaiBaumwuchsTimer", Seconds = 900, UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "g_P209KathaiBaumWirdGross", UpdateInterval = 20}
	},
	Actions = 
	{ 
		ChangeObject {X = 186, Y = 75, Object = 3110},
		SetEffect{Effect = "OccludeWhite", X = 186, Y = 75, Length = 3000, TargetType = World}
	}
}



EndDefinition()
end
