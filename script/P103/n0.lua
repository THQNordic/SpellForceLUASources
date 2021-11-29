-- P103 ... Hero-Rune 02



-- Coords für eingangsportal
PortalX = 99		
PortalY = 176

----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- cutscene rename
--dofile("script/p103/n5641_CutsceneReowysEntry.lua")	
--dofile("script/p103/n5640_CutsceneHortarAndTheFrogs.lua")

dofile("script/p103/n32011_CutsceneReowysEntry.lua")	
dofile("script/p103/n32012_CutsceneHortarAndTheFrogs.lua")
	
	
dofile("script/p103/n0_ItemScript.lua")
dofile("script/FahrendeHaendler.lua")

-- Prüfen, ob alle Quests auf der Karte gelöst wurden und dann die Hauptquest lösen

--OnOneTimeEvent
--{
--	Conditions =
--	{
--		QuestState {QuestId = 590, State = StateSolved, UpdateInterval = 10},
--		QuestState {QuestId = 591, State = StateSolved, UpdateInterval = 10},
--		QuestState {QuestId = 592, State = StateSolved, UpdateInterval = 10},
--		QuestState {QuestId = 593, State = StateSolved, UpdateInterval = 10},
--		QuestState {QuestId = 594, State = StateSolved, UpdateInterval = 10},
--	 },
--	Actions =
--	{
--		QuestSolve {QuestId = 623},
--	}
--}

-- bei Betreten der Map 
-- Quest 601 ausschalten (Auf nach Rune2)
-- Quest Eiselfenpatrouillen ausweichen lösen

OnOneTimeEvent
{
	Conditions = {},
	Actions =
	{
		SetGlobalFlagTrue{Name = "IchWarAufRune2" },
		SetRewardFlagTrue {Name = "P103Erreicht"}, 
	},
}

OnOneTimeEvent
{
	Conditions = {},
	Actions =
	{
		QuestSolve{QuestId = 601, ActivateNextQuest = FALSE }, --ich war auf Rune2
		QuestSolve{QuestId = 754, ActivateNextQuest = FALSE }, --Eiselfenpatrouillen ausweichen
		
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureDead { NpcId = 5641 } --, UpdateInterval = 10
	 },
	Actions =
	{
		Outcry { NpcId = 5942 , String = "Befreit meine Rune!" , Tag = "ocReowysP103_001" },	
		RevealUnExplored { X = 413 , Y = 339 , Range = 10 },
		SetGlobalFlagTrue {Name = "Kill den doppelten Reowys"},
		QuestBegin{QuestId = 594},
		QuestBegin{QuestId = 590},
	}
}

--- wenn Whorim noch 25% heath hat kommt outcry ---

OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth { Percent = 80 , NpcId = 5639 , UpdateInterval = 10},
	 },
	Actions =
	{
		Outcry { NpcId = 5639 , String = "Verdammt! Verraten und besiegt! Mögt ihr in Zarachs feurigem Schlund enden, Runenknecht!" , Tag = "ocWhorimP103_003" },	

	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Hortar_Quests", UpdateInterval = 10},
	 },
	Actions =
	{
		Outcry { NpcId = 5639 , String = "Hortar! Ah, Verrat überall! Svera, schick deine Leute los! Macht sie nieder!" , Tag = "ocWhorimP103_002" },
		RevealUnExplored {X = 56, Y = 346, Range = 10},	
		RevealUnExplored {X = 311, Y = 349, Range = 10},	
		RevealUnExplored {X = 327, Y = 293, Range = 10},
		QuestSolve{QuestId = 590, ActivateNextQuest = FALSE},
		SetGlobalFlagTrue {Name = "OrkTor_offen"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureDead{ NpcId = 6322},
		FigureDead{ NpcId = 6324},
		FigureDead{ NpcId = 6325},
		FigureDead{ NpcId = 6326},
		FigureDead{ NpcId = 6328},
		FigureDead{ NpcId = 6330},
		FigureDead{ NpcId = 6331},
		FigureDead{ NpcId = 6332},
	 },
	Actions =
	{
		SetGlobalFlagTrue{Name = "Waldschrate_tot"},
		SetGlobalFlagTrue {Name = "Hortar_geht_zum_Froschtor"},
		QuestSolve{QuestId = 593 , ActivateNextQuest = FALSE},
		SetRewardFlagTrue {Name = "WaldschrateKilled"},

	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{Name = "PlayerHasItemFroschitem", UpdateInterval = 20},
	 },
	Actions =
	{
		QuestSolve{QuestId = 592 , ActivateNextQuest = FALSE},
		SetGlobalFlagTrue {Name = "Froschitem_dabei"},
	}
}

-- Abfrage of Orkposten 1 im Flussbett tot ist
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead{ NpcId = 6428},
		FigureDead{ NpcId = 6429},
		FigureDead{ NpcId = 6430},
		FigureDead{ NpcId = 6431},
		FigureDead{ NpcId = 6432},
		FigureDead{ NpcId = 6433},
		FigureDead{ NpcId = 6434},
		FigureDead{ NpcId = 6435},
		FigureDead{ NpcId = 6436},
		FigureDead{ NpcId = 6437},
		FigureDead{ NpcId = 6438},
		FigureDead{ NpcId = 6439},
		FigureDead{ NpcId = 6440},
		FigureDead{ NpcId = 6441},
		FigureDead{ NpcId = 6442},
		FigureDead{ NpcId = 6443},
	 },
	Actions =
	{
		SetGlobalFlagTrue{Name = "Orkposten1_tot"},
	}
}
-- Abfrage of Orkposten 2 im Flussbett tot ist
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead{ NpcId = 6444},
		FigureDead{ NpcId = 6445},
		FigureDead{ NpcId = 6446},
		FigureDead{ NpcId = 6447},
		FigureDead{ NpcId = 6448},
		FigureDead{ NpcId = 6449},
		FigureDead{ NpcId = 6450},
		FigureDead{ NpcId = 6451},
		FigureDead{ NpcId = 6452},
		FigureDead{ NpcId = 6453},
		FigureDead{ NpcId = 6454},
		FigureDead{ NpcId = 6455},
	 },
	Actions =
	{
		SetGlobalFlagTrue{Name = "Orkposten2_tot"},
	}
	
}
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead{ NpcId = 6428},
		FigureDead{ NpcId = 6429},
		FigureDead{ NpcId = 6430},
		FigureDead{ NpcId = 6431},
		FigureDead{ NpcId = 6432},
		FigureDead{ NpcId = 6433},
		FigureDead{ NpcId = 6434},
		FigureDead{ NpcId = 6435},
		FigureDead{ NpcId = 6436},
		FigureDead{ NpcId = 6437},
		FigureDead{ NpcId = 6438},
		FigureDead{ NpcId = 6439},
		FigureDead{ NpcId = 6440},
		FigureDead{ NpcId = 6441},
		FigureDead{ NpcId = 6442},
		FigureDead{ NpcId = 6443},
		FigureDead{ NpcId = 6444},
		FigureDead{ NpcId = 6445},
		FigureDead{ NpcId = 6446},
		FigureDead{ NpcId = 6447},
		FigureDead{ NpcId = 6448},
		FigureDead{ NpcId = 6449},
		FigureDead{ NpcId = 6450},
		FigureDead{ NpcId = 6451},
		FigureDead{ NpcId = 6452},
		FigureDead{ NpcId = 6453},
		FigureDead{ NpcId = 6454},
		FigureDead{ NpcId = 6455},
	 },
	Actions =
	{
		QuestSolve{QuestId = 591 , ActivateNextQuest = FALSE},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{Name = "PlayerHasItemRune02", UpdateInterval = 20},
	 },
	Actions =
	{
		QuestSolve{QuestId = 594 , ActivateNextQuest = FALSE},
		QuestBegin{QuestId = 753},
		SetRewardFlagTrue {Name = "RuneReowysGenommen"},

	}
}

--------------------------------------------------
----------------- Knochenwaffen-Quest ------------
----         Wenn Player auf Karte kommt      ----
----            Kampfgebiet aufdecken         ---- 

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "P103_KnochenquestSpawn"},
	 },
	Actions =
	{
		RevealUnExplored { X = 385 , Y = 342 , Range = 30 },
		Outcry { NpcId = 7059 , String = "Haltet durch Krieger! Wir müssen aushalten, bis Hilfe kommt!" , Tag = "ocNazoshP103_001" },
	}
}

--------------------------------------------------
----     Wenn Player in Range um Obelisk      ----
----    Respawning von Orks und Schraten aus    --

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "P103_KnochenquestSpawn"},
		FigureInRange{X = 385, Y = 342, NpcId = Avatar, Range = 10 },
	 },
	Actions =
	{
		SetGlobalFlagTrue {Name = "P103_PlayeInRangeBoneOrc"},
	}
}

-----------------------------------------------------
--	Fahrender Händler sieht Spieler
--
-----------------------------------------------------
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc {NpcId = 7228, TargetNpcId = Avatar, Range = 15},
	},
	Actions =
	{
		Outcry {NpcId = 7228, String = "Ihr da! Hier herüber!", Tag = "ocMaskedOneP103_001" },
		SetGlobalFlagTrue {Name = "BeginnDenHaendler"},
		EnableDialog {NpcId = 7228},
	}
}




EndDefinition()
end
