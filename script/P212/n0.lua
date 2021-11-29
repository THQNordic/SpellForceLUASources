

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


dofile("script/P212/n32560_CutsceneEntry.lua")
dofile("script/Hadeko.lua")


--- Entry-Cutscene zeigen

OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_nP212_ShowEntryCutscene"},
		
	},
}
---------------


OnPlatformOneTimeEvent -- Wenn der Spieler die Karte verläßt,
					   -- während die MQ noch aktiv ist, sind bei Wiederbetreten alle Spawnpoints
					   -- wieder an
{
	Conditions =
	{
		IsGlobalFlagTrue{Name ="P212EntryCutsceneEnded"},
		QuestState{QuestId = 956, State = StateActive},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "P212Spawnpoint01On"},
		SetGlobalFlagTrue{Name = "P212Spawnpoint02On"},
		SetGlobalFlagTrue{Name = "P212Spawnpoint03On"},
		SetGlobalFlagTrue{Name = "P212Spawnpoint04On"},
		SetGlobalFlagTrue{Name = "P212Spawnpoint05On"},
		SetGlobalFlagTrue{Name = "P212Spawnpoint06On"},
	},
}

------------------------------------------------------------------------------
------------------------- MAINQUEST-MANAGEMENT -------------------------------
------------------------------------------------------------------------------

-- zu Beginn Quests geben
OnOneTimeEvent
{
	Actions =
	{
		QuestSolve{QuestId = 971}, -- Darkwind-Keep-Quest gesolved 
		QuestSolve{QuestId = 892}, --In den schwarzen Dschungel (Darkwind Keep)
		QuestBegin {QuestId = 956}, -- Mainquest begonnen "Durch den Dschungel"
		QuestBegin {QuestId = 958}, -- Subquest begonnen "Töte die Seelenschmiede"
		QuestBegin {QuestId = 959}, -- Subquest begonnen "Alle Steine ausschalten"
		QuestBegin {QuestId = 960}, -- Subsubquest begonnen "Stein 1 ausschalten"
		QuestBegin {QuestId = 961}, -- Subsubquest begonnen "Stein 2 ausschalten"
		QuestBegin {QuestId = 962}, -- Subsubquest begonnen "Stein 3 ausschalten"
		QuestBegin {QuestId = 963}, -- Subsubquest begonnen "Stein 4 ausschalten"
		QuestBegin {QuestId = 964}, -- Subsubquest begonnen "Stein 5 ausschalten"
		QuestBegin {QuestId = 965}, -- Subsubquest begonnen "Stein 6 ausschalten"
		QuestBegin {QuestId = 957}, -- Subquest begonnen "Durchquere den Dschungel"
		SetRewardFlagTrue { Name = "P212KarteErreicht" },
	},
}

-- Wenn alle Miniforger tot sind
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 10687}, -- Miniforger 1 tot
		FigureDead {NpcId = 10688}, -- Miniforger 2 tot
		FigureDead {NpcId = 10689}, -- Miniforger 3 tot
		FigureDead {NpcId = 10690}, -- Miniforger 4 tot
		FigureDead {NpcId = 11243}, -- Miniforger 5 tot
		FigureDead {NpcId = 11244}, -- Miniforger 6 tot
	},
	Actions =
	{
		QuestSolve {QuestId = 958}, -- Subquest begonnen "Töte die Seelenschmiede"
		SetRewardFlagTrue { Name = "MiniforgersKilled" },
	},
}

-- Wenn alle Stelen ausgeschaltet wurden
-- muß ein OnEvent statt OneTimeEvent sein, da Stelen jederzeit wieder eingeschaltet werden könnten

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name ="P212EntryCutsceneEnded"}, -- erst prüfen, sobald Cutscene vorbei ist
		QuestState {QuestId = 959, State = StateActive}, -- Quest noch offen
		IsGlobalFlagFalse{Name = "P212Spawnpoint01On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint02On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint03On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint04On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint05On"},
		IsGlobalFlagFalse{Name = "P212Spawnpoint06On"},
	},
	Actions =
	{
		QuestSolve {QuestId = 959}, -- Subquest begonnen "Schalte alle Steine ab"
		SetRewardFlagTrue { Name = "AlleStelenOff" },
	},
}


----------------------------------  MINIFORGER  ------------------------------
---  Das n0 schlägt den Takt und die Miniforger laufen zum entsprechenden Camp
------------------------------------------------------------------------------

OnOneTimeEvent
{
	Conditions=
	{
		IsGlobalFlagTrue{Name ="P212EntryCutsceneEnded"},
	},
	Actions =
	{
		 SetGlobalTimeStamp{Name = "g_P212_MiniforgerTimer"},
	}
}

OnEvent
{
	Conditions = 
	{	
		IsGlobalTimeElapsed {Name = "g_P212_MiniforgerTimer", Seconds = 140},
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 5, Operator = IsLessOrEqual},
	 },
	Actions = 
	{
		 IncreaseGlobalCounter{Name = "g_P212_MiniforgerCounter"},
		 SetGlobalTimeStamp{Name = "g_P212_MiniforgerTimer"},
	},
}


OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "g_P212_MiniforgerTimer", Seconds = 140},
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 6, Operator = IsEqual},
	 },
	Actions = 
	{
		 ResetGlobalCounter{Name = "g_P212_MiniforgerCounter"},
		 IncreaseGlobalCounter{Name = "g_P212_MiniforgerCounter"},
		 SetGlobalTimeStamp{Name = "g_P212_MiniforgerTimer"},
	},
}

----------------------------------------------------------


------------------------------------------------------------
--- Wenn die Stele in einem der 6 Camps von den Miniforgern
--- erreicht wird, schaltet diese jene wieder an
------------------------------------------------------------

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P212_Stele01Reached" },
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "P212Spawnpoint01On"},
		SetGlobalFlagFalse{ Name = "g_P212_Stele01Reached" },
	},
}

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P212_Stele02Reached" },
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "P212Spawnpoint02On"},
		SetGlobalFlagFalse{ Name = "g_P212_Stele02Reached" },
	},
}

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P212_Stele03Reached" },
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "P212Spawnpoint03On"},
		SetGlobalFlagFalse{ Name = "g_P212_Stele03Reached" },
	},
}

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P212_Stele04Reached" },
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "P212Spawnpoint04On"},
		SetGlobalFlagFalse{ Name = "g_P212_Stele04Reached" },
	},
}


OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P212_Stele05Reached" },
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "P212Spawnpoint05On"},
		SetGlobalFlagFalse{ Name = "g_P212_Stele05Reached" },
	},
}


OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P212_Stele06Reached" },
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "P212Spawnpoint06On"},
		SetGlobalFlagFalse{ Name = "g_P212_Stele06Reached" },
	},
}



----I---------------------------------------I
----I                                       I
----I           Bank von Empyria            I
----I           Schatzbrief-Zähler          I
----I         (muß auf alle Karten!)        I
----I                                       I
----I---------------------------------------I



OnEvent
{
	Conditions =
	{
		PlayerHasItem{ItemId = 7357},
		IsGlobalTimeElapsed{Name = "g_SchatzbriefTimer", Seconds = 7000}
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "g_P204_SchatzbriefZins"},
		SetGlobalTimeStamp{Name = "g_SchatzbriefTimer"},
	}
}

EndDefinition()
end
