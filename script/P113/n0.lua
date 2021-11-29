function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- cutscene rename
--dofile("script/p113/n6654_CutsceneAnfang.lua")
--dofile("script/p113/n6626_CutsceneShowdown.lua")

dofile("script/p113/n32021_CutsceneAnfang.lua")
dofile("script/p113/n32022_CutsceneShowdown.lua")

dofile("script/p113/n6626_Endkampf.lua")	


--Reward Flag bei Betreten der Map
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = {},
	Actions = 
	{
		QuestSolve { QuestId = 746},
		QuestSolve { QuestId = 751},
		SetRewardFlagTrue { Name = "P113KarteErreicht" },
	}
}

-- skergs in cutscene friendly zu dunkelelfen
OnOneTimeEvent
{
	Actions =
	{
		ChangeRace {NpcId = 6959, Race = 190},
		ChangeRace {NpcId = 6960, Race = 190},
		ChangeRace {NpcId = 6961, Race = 190},
		ChangeRace {NpcId = 6962, Race = 190},
		ChangeRace {NpcId = 6963, Race = 190},
		
		ChangeRace {NpcId = 6964, Race = 190},
		ChangeRace {NpcId = 6965, Race = 190},
		ChangeRace {NpcId = 6966, Race = 190},
		ChangeRace {NpcId = 6967, Race = 190},																
	},
}

------------------------------------
-- Taktschläger für Patrouillen
------------------------------------
--Auftakt
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = {},
	Actions = 
	{
		SetGlobalTimeStamp{Name = "P113PatrolTime"},
	}
}

--Nach 550 Sekunden Counter hoch
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{ 
		IsGlobalTimeElapsed{Name = "P113PatrolTime", Seconds = 520, UpdateInterval = 20 },
	},
	Actions = 
	{ 
		IncreaseGlobalCounter{Name = "P113PatrolCounter", Step = 1},
		
		SetGlobalTimeStamp{Name = "P113PatrolTime"},
	}
}

-- wenn Counter = 2, dann alles reset und von vorn
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{ 
		IsGlobalCounter{Name = "P113PatrolCounter", Value = 3, Operator = IsEqual, UpdateInterval = 20},
	},
	Actions = 
	{ 
		ResetGlobalCounter{Name = "P113PatrolCounter"},
		SetGlobalTimeStamp{Name = "P113PatrolTime"},
	}
}






-- Questmanagement Bosse

--Boss1
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		FigureDead{NpcId = 6671},

	},
	Actions = 
	{
		QuestSolve {QuestId = 625, ActivateNextQuest = FALSE },
		SetRewardFlagTrue { Name = "Boss1Getoetet" },
	}
}


--Boss2
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		FigureDead{NpcId = 6672},

	},
	Actions = 
	{
		QuestSolve {QuestId = 628, ActivateNextQuest = FALSE },
		SetRewardFlagTrue { Name = "Boss2Getoetet" },
	}
}

--Boss3
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		FigureDead{NpcId = 6681},

	},
	Actions = 
	{
		QuestSolve {QuestId = 629, ActivateNextQuest = FALSE },
		SetRewardFlagTrue { Name = "Boss3Getoetet" },
	}
}

--Boss4
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		FigureDead{NpcId = 6682},

	},
	Actions = 
	{
		QuestSolve {QuestId = 630, ActivateNextQuest = FALSE },
		SetRewardFlagTrue { Name = "Boss4Getoetet" },
	}
}

--Alle 4 Bosse tot Q 622 Feuerwand und Q 711 Nutzt die Scwächen der Gegner solved
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		FigureDead{NpcId = 6682},
		FigureDead{NpcId = 6681},
		FigureDead{NpcId = 6672},
		FigureDead{NpcId = 6671},

	},
	Actions = 
	{
		QuestSolve {QuestId = 622, ActivateNextQuest = FALSE },
		QuestSolve {QuestId = 711, ActivateNextQuest = FALSE },
	}
}


EndDefinition()

end
