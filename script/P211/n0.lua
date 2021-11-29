
--P211_Darkwind_Keep


-- Coords für Eingangsportal von Clockwork Crypt aus
--PortalX = 391
--PortalY = 387


-- Coords für Eingangsportal von Kathai aus
--PortalX = 269
--PortalY = 455

-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OneTimeInitAction
( 
	SetRewardFlagTrue {Name = "P211KarteErreicht"}
)

-----------------------------------------------------
-- Cutscenes:
dofile("script/p211/n32530_CutsceneBegin.lua")
dofile("script/p211/n32531_CutsceneIshtar.lua")
dofile("script/p211/n32532_CutsceneAuftretenPhoenix.lua")
dofile("script/p211/n32533_CutsceneBefreiungSchattenklinge.lua")
dofile("script/p211/n32534_CutsceneEndePhoenix.lua")
dofile("script/p211/n32535_CutsceneEndeSchattenklinge.lua")

dofile("script/Hadeko.lua")
dofile("script/HeiligeStaetteWorkaround.lua")


------------------------------------------------------------
--Reset des Timers für Angriffswellen
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = {},
	Actions = 
	{ 
		
		SetGlobalFlagFalse {Name = "g_P211_Monument4Claimed"},
		SetGlobalFlagFalse {Name = "g_P211_Monument5Claimed"}
	}
}

--Angriffswellentimer clearen, wenn Spawncamps noch nicht zerstört
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P211BladesCampOstDestroyed", UpdateInterval = 60},
		IsGlobalFlagFalse {Name = "g_P211EchsenCampOstDestroyed", UpdateInterval = 60},
		IsGlobalFlagFalse {Name = "g_P211BladesCampWestDestroyed", UpdateInterval = 60},
		IsGlobalFlagFalse {Name = "g_P211EchsenCampWestDestroyed", UpdateInterval = 60}
	},
	Actions = 
	{ 
		ClearGlobalTimeStamp{Name = "gt_P211AngriffsWellenTimer"},
	}
}


-- Angriffswellentimer setzen
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		ODER9
		{
			IsMonumentInUse {X = 236, Y = 422, Range = 5, UpdateInterval = 20},
			IsMonumentInUse {X = 199, Y = 338, Range = 5, UpdateInterval = 20},
			IsMonumentInUse {X = 256, Y = 267, Range = 5, UpdateInterval = 20},

			IsMonumentInUse {X = 338, Y = 60, Range = 5, UpdateInterval = 20},
			IsMonumentInUse {X = 394, Y = 104, Range = 5, UpdateInterval = 20},
			
			FigureInRange {X = 250, Y = 366, NpcId = 0, Range = 6},
	
		}
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{Name = "gt_P211AngriffsWellenTimer"},
	}
}

----------------------------------------------------------
--Questmanagement außerhalb von CS / Dialogen:
----------------------------------------------------------

--Flag + Quests, wenn Spieler den richtigen Weg auf die Map gefunden hat
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		FigureInRange{X = 389, Y = 387, NpcId = 0, Range = 4}
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "g_P210_SpielerKommtVonClockwork"},
		SetGlobalFlagTrue{Name = "g_nP211_InitCutsceneBegin"},
		QuestSolve{QuestId = 900, ActivateNextQuest = FALSE }, --Durch die Uhrwerkhallen nach DK
		QuestSolve{QuestId = 913, ActivateNextQuest = FALSE } --Finde ein portal nach DK
	}
}

--Questbegin, nach Monumentclaim Zwerg2
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsMonumentInUse {X = 256, Y = 267, Range = 3, UpdateInterval = 60}
	},
	Actions = 
	{
		QuestBegin{QuestId = 937, SubQuestActivate = FALSE}, -- Camps im Tal am Fluß (cleare die Camps)
		QuestSolve{QuestId = 936, ActivateNextQuest = FALSE }--Die Belagerer von DK (erobere die Monumente)
	}
}

--nach clearen der Camps
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211BladesCampOstDestroyed", UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_P211EchsenCampOstDestroyed", UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_P211BladesCampWestDestroyed", UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_P211EchsenCampWestDestroyed", UpdateInterval = 60},
	},
	Actions = 
	{
		QuestBegin{QuestId = 971, SubQuestActivate = FALSE}, -- Finde einen Weg in den Schlund
		QuestSolve{QuestId = 936, ActivateNextQuest = FALSE}, --lager verteidigen
		QuestSolve{QuestId = 937, ActivateNextQuest = FALSE}, --Die Camps am Fluß cleared
	}
}


-----------------------------------------------------------
-----------------------------------------------------------

--ob erstes Zwergenmonument claimed
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsMonumentInUse {X = 236, Y = 422, Range = 5, UpdateInterval = 20}
	},
	Actions = 
	{
		--SetGlobalFlagTrue {Name = "g_P211_Monument1Claimed"},
		--SetGlobalTimeStamp{Name = "gt_P211MonumentZwerge1"},
		SetRewardFlagTrue {Name = "MonumenteZwerg1Claimed"}
		
	}
}

----ob Elfenmonument claimed
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsMonumentInUse {X = 199, Y = 338, Range = 5, UpdateInterval = 20}
	},
	Actions = 
	{
		--SetGlobalFlagTrue {Name = "g_P211_Monument2Claimed"},
			--SetGlobalTimeStamp{Name = "gt_P211MonumentElfen1"},
		SetRewardFlagTrue {Name = "MonumenteElfClaimed"}
		
	}
}


--ob zweites Zwergenmonument claimed

OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsMonumentInUse {X = 256, Y = 267, Range = 5, UpdateInterval = 20}
	},
	Actions = 
	{
		--SetGlobalFlagTrue {Name = "g_P211_Monument3Claimed"},
		--SetGlobalTimeStamp{Name = "gt_P211MonumentZwerge2"},
		SetRewardFlagTrue {Name = "MonumenteZwerg2Claimed"}
		
	}
}

--------------------------------------------------------
--------------------------------------------------------
--ob zweites Elfenmonument claimed (Aufbauplatz Geheimgang)

OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsMonumentInUse {X = 338, Y = 60, Range = 5, UpdateInterval = 20}
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P211_Monument4Claimed"},
		SetGlobalTimeStamp{Name = "gt_P211MonumentElfen2"},
		
	}
}



--ob drittes Zwergenmonument claimed (Aufbauplatz Geheimgang)
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsMonumentInUse {X = 394, Y = 104, Range = 5, UpdateInterval = 20}
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P211_Monument5Claimed"},
		SetGlobalTimeStamp{Name = "gt_P211MonumentZwerge3"},
		
	}
}



-----------------------------------------------------------
-----------------------------------------------------------
--Gegnerwellen / Angriffe
-----------------------------------------------------------
-----------------------------------------------------------
--Angriffe auf Aufbau 1 ZwergeNord
-----------------------------------------------------------
-- Angriff 1 auf Aufbau 1, 10 Minuten nach Monument1claim

--Goal wechseln, damit Clan Attack funzt
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		
		IsGlobalTimeElapsed {Name = "gt_P211AngriffsWellenTimer", Seconds = 590, UpdateInterval = 30},
		IsClanSize{Clan = 25, Size = 1},
		IsClanSize{Clan = 24, Size = 1},
		
	},
	Actions = 
	{
		ChangeGoal {Clan = 25, Goal = GoalScript},
		ChangeGoal {Clan = 24, Goal = GoalScript},
		
	}
}

--Angriff
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P211AngriffsWellenTimer", Seconds = 600, UpdateInterval = 30},
		IsClanSize{Clan = 25, Size = 1},
		IsClanSize{Clan = 24, Size = 1},
	},
	Actions = 
	{
		ClanAttack {Number = 8, SourceClan = 25, TargetX = 236, TargetY = 420, WalkMode = Run},
		ClanAttack {Number = 7, SourceClan = 24, TargetX = 236, TargetY = 420, WalkMode = Run},
		
		SetGlobalFlagTrue {Name = "g_P211GoalWechsel1"},
		Outcry {NpcId = 9811, String = "Passt auf! Ich glaube ein Angriff steht bevor!", Tag = "oca2jenquaiP211_001", Delay = TRUE, Color = ColorWhite},
		SetGlobalFlagTrue {Name = "g_P211TestFlagAngriff1"},
		
	}
}



--------------------------------------------------------
-- Angriff 2 auf Aufbau 1, 25 Minuten nach Monumentclaim

-- Goal wechseln, damit Clan Attack funzt
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		
		IsGlobalTimeElapsed {Name = "gt_P211AngriffsWellenTimer", Seconds = 1490, UpdateInterval = 30},
		IsClanSize{Clan = 25, Size = 1},
		IsClanSize{Clan = 24, Size = 1}
	},
	Actions = 
	{
		ChangeGoal {Clan = 25, Goal = GoalScript},
		ChangeGoal {Clan = 24, Goal = GoalScript},
		
	}
}

--Angriff
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		
		IsGlobalTimeElapsed {Name = "gt_P211AngriffsWellenTimer", Seconds = 1500, UpdateInterval = 30},
		IsClanSize{Clan = 25, Size = 1},
		IsClanSize{Clan = 24, Size = 1},
	
	},
	Actions = 
	{
		ClanAttack {Number = 10, SourceClan = 25, TargetX = 236, TargetY = 420, WalkMode = Run},
		ClanAttack {Number = 11, SourceClan = 24, TargetX = 236, TargetY = 420, WalkMode = Run},
		
		SetGlobalFlagTrue {Name = "g_P211GoalWechsel2"},
		Outcry {NpcId = 9811, String = "Sie werden bald angreifen! Stärkt die Abwehr!" , Tag = "oca2jenquaiP211_002" , Delay = TRUE , Color = ColorWhite},
		SetGlobalFlagTrue {Name = "g_P211TestFlagAngriff2"},
		
	}
}



--------------------------------------------------------------
--Angriffe auf Aufbau 2 Elfen Nord
--------------------------------------------------------------
--Angriff 1 auf Aufbau 2, --12 Minuten nach Monumentclaim
													--35 Minuten nach Zwergen1Claim


-- Goal wechseln, damit Clan Attack funzt
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		
		IsGlobalTimeElapsed {Name = "gt_P211AngriffsWellenTimer", Seconds = 2090, UpdateInterval = 30},
		IsClanSize{Clan = 25, Size = 1},
		IsClanSize{Clan = 24, Size = 1}
	},
	Actions = 
	{
		ChangeGoal {Clan = 25, Goal = GoalScript},
		ChangeGoal {Clan = 24, Goal = GoalScript},
		
	}
}

--Angriff
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		
		IsGlobalTimeElapsed {Name = "gt_P211AngriffsWellenTimer", Seconds = 2100, UpdateInterval = 30},
		IsClanSize{Clan = 25, Size = 1},
		IsClanSize{Clan = 24, Size = 1},
	},
	Actions = 
	{
		ClanAttack {Number = 10, SourceClan = 25, TargetX = 236, TargetY = 420, WalkMode = Run},
		ClanAttack {Number = 9, SourceClan = 24, TargetX = 236, TargetY = 420, WalkMode = Run},
		
		SetGlobalFlagTrue {Name = "g_P211GoalWechsel3"},
		Outcry {NpcId = 9811, String = "Vorsicht! Sie kommen! Macht euch bereit!", Tag = "oca2jenquaiP211_003", Delay = TRUE, Color = ColorWhite},
		SetGlobalFlagTrue {Name = "g_P211TestFlagAngriff3"},
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P211GoalWechsel3"},
		FigureAlive{NpcId = 10468},
	},
	Actions = 
	{
		-- siege units der blades
		Goto{X = 250, Y = 390, WalkMode = Walk, GotoMode = GotoContinuous, NpcId = 10468},
	}
}




--------------------------------------------------------------
--Geheimgang Angriff von hinten Init
-- 45 Minuten nach Zwergenmonument 1
-- oder 15 Minuten nach Elfenmonument 1
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		
		IsGlobalTimeElapsed {Name = "gt_P211AngriffsWellenTimer", Seconds = 900, UpdateInterval = 30},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P211AngriffGeheimgangLos"},
		SetGlobalTimeStamp {Name = "gt_P211GeheimgangTrupp2"},
		
		SetGlobalFlagTrue {Name = "g_P211TestFlagAngriffGeheimgang"},
	}
}
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211AngriffGeheimgangLos"},
		FigureAlive{NpcId = 9811},
	},
	Actions = 
	{
		Outcry {NpcId = 9811, String = "Sie haben einen Zugang gefunden! Sie fallen uns in den Rücken!", Tag = "oca2jenquaiP211_004", Delay = TRUE, Color = ColorWhite},
	}
}


--------------------------------------------------------------
--Letzter Angriff
--Angriff auf Aufbau 3 Zwerge2Nord
--------------------------------------------------------------
--Angriff 1 auf Aufbau 3, 30 Sekunden nach Monumentclaim Zwerge2
--oder 45 Minuten nach Zwerge1



-- Goal wechseln, damit Clan Attack funzt
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		
		IsGlobalTimeElapsed {Name = "gt_P211AngriffsWellenTimer", Seconds = 2690, UpdateInterval = 30},
		IsClanSize{Clan = 25, Size = 1},
		IsClanSize{Clan = 24, Size = 1}
		
	},
	Actions = 
	{
		ChangeGoal {Clan = 25, Goal = GoalScript},
		ChangeGoal {Clan = 24, Goal = GoalScript},
	}
}

--Angriff
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		
		IsGlobalTimeElapsed {Name = "gt_P211AngriffsWellenTimer", Seconds = 2700, UpdateInterval = 30},
		IsClanSize{Clan = 25, Size = 1},
		IsClanSize{Clan = 24, Size = 1},
	},
	Actions = 
	{
		ClanAttack {Number = 12, SourceClan = 25, TargetX = 236, TargetY = 420, WalkMode = Run},
		ClanAttack {Number = 13, SourceClan = 24, TargetX = 236, TargetY = 420, WalkMode = Run},
		
		SetGlobalFlagTrue {Name = "g_P211GoalWechsel4"},
	
		Outcry {NpcId = 9811, String = "Passt auf! Ich glaube ein Angriff steht bevor!" , Tag = "oca2jenquaiP211_001" , Delay = TRUE , Color = ColorWhite},
		SetGlobalFlagTrue {Name = "g_P211TestFlagAngriffLetzter"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P211GoalWechsel4"},
		FigureAlive{NpcId = 10461},
	},
	Actions = 
	{
		-- siege units der blades
		Goto{X = 250, Y = 390, WalkMode = Walk, GotoMode = GotoContinuous, NpcId = 10461},
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P211GoalWechsel4"},
		FigureAlive{NpcId = 10467},
	},
	Actions = 
	{
		-- siege units der blades
		Goto{X = 250, Y = 390, WalkMode = Walk, GotoMode = GotoContinuous, NpcId = 10467},
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P211GoalWechsel4"},
		FigureAlive{NpcId = 10464},
	},
	Actions = 
	{
		-- siege units der blades
		Goto{X = 250, Y = 390, WalkMode = Walk, GotoMode = GotoContinuous, NpcId = 10464},
	}
}

----------------------------------------------------------------
-----------------------------------------------------------------
--Angfiffe auf Ebenenaufbau, falls geclaimed
------------------------------------------------------------------
-- Angriff 1 auf Aufbau 4 (Geheimgangebene), 15 Minuten nach Monument1claim

-- Goal wechseln, damit Clan Attack funzt

OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		ODER
		(
			IsGlobalTimeElapsed {Name = "gt_P211MonumentElfen2", Seconds = 980, UpdateInterval = 30},
			IsGlobalTimeElapsed {Name = "gt_P211MonumentZwerge3", Seconds = 980, UpdateInterval = 30}
		),
			IsClanSize{Clan = 25, Size = 1},
			IsClanSize{Clan = 24, Size = 1},
	},
	Actions = 
	{
		ChangeGoal {Clan = 25, Goal = GoalScript},
		ChangeGoal {Clan = 24, Goal = GoalScript},
		
	}
}

--Angriff
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P211MonumentElfen2", Seconds = 900, UpdateInterval = 30},
		IsGlobalTimeElapsed {Name = "gt_P211MonumentZwerge3", Seconds = 900, UpdateInterval = 30},
		IsClanSize{Clan = 25, Size = 1},
		IsClanSize{Clan = 24, Size = 1},
	},
	Actions = 
	{
		ClanAttack {Number = 8, SourceClan = 25, TargetX = 338, TargetY = 60, WalkMode = Run},
		ClanAttack {Number = 10, SourceClan = 24, TargetX = 338, TargetY = 60, WalkMode = Run},
		SetGlobalFlagTrue {Name = "g_P211GoalWechsel5"},
		
	}
}


------------------------------------------------

-- Angriff 2 auf Aufbau 4 (Geheimgangebene), 30 Minuten nach Monument1claim       
-- Goal wechseln, damit Clan Attack funzt

OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		ODER
		(
			IsGlobalTimeElapsed {Name = "gt_P211MonumentElfen2", Seconds = 1790, UpdateInterval = 30},
			IsGlobalTimeElapsed {Name = "gt_P211MonumentZwerge3", Seconds = 1790, UpdateInterval = 30}
		),
			IsClanSize{Clan = 25, Size = 1},
			IsClanSize{Clan = 24, Size = 1},
	},
	Actions = 
	{
		ChangeGoal {Clan = 25, Goal = GoalScript},
		ChangeGoal {Clan = 24, Goal = GoalScript},
		
	}
}

--Angriff
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P211MonumentElfen2", Seconds = 1800, UpdateInterval = 30},
		IsGlobalTimeElapsed {Name = "gt_P211MonumentZwerge3", Seconds = 1800, UpdateInterval = 30},
			IsClanSize{Clan = 25, Size = 1},
			IsClanSize{Clan = 24, Size = 1},
	},
	Actions = 
	{
		ClanAttack {Number = 10, SourceClan = 25, TargetX = 393, TargetY = 104, WalkMode = Run},
		ClanAttack {Number = 15, SourceClan = 24, TargetX = 393, TargetY = 104, WalkMode = Run},
		SetGlobalFlagTrue {Name = "g_P211GoalWechsel6"}
		
	}
}


---XXX ENDE ANGRIFFSWELLEN XXX---
-----------------------------------------------------------------------
----------------------------------------------------------------------

--CS Ishtar
---------------------------------------------------------------------
-- Zweite Kathai-Einheit fällt ein
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		FigureInRange {X = 289, Y = 215, NpcId = 0, Range = 10}
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P211_Kathai2FallenEin"}, 
		SetGlobalTimeStamp {Name = "gt_P211_Kathai2Timer"}
	},
}


------------------------------------------------------------------
--------------------------------------------------------------------
--Init für Ishtar Cutscene, wenn Spawncamps platt
--und Avatar in Range
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		FigureInRange {X = 257, Y = 177, NpcId = 0, Range = 4},
		IsGlobalFlagTrue {Name = "g_P211BladesCampOstDestroyed", UpdateInterval = 30},
		IsGlobalFlagTrue {Name = "g_P211EchsenCampOstDestroyed", UpdateInterval = 30},
		IsGlobalFlagTrue {Name = "g_P211BladesCampWestDestroyed", UpdateInterval = 30},
		IsGlobalFlagTrue {Name = "g_P211EchsenCampWestDestroyed", UpdateInterval = 30},
		IsGlobalFlagTrue {Name = "g_P211_KathaiFallenEin", UpdateInterval = 30} --Tor nach Kathai offen
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_nP211_InitCSIshtar"},
	
	}
}

------------------------------------------------------------


--Goal der Clans umstellen bei Cutscene begin Ishtar
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_IshtarFaelltEin", UpdateInterval = 10},
		IsClanSize{Clan = 25, Size = 1},
		IsClanSize{Clan = 24, Size = 1},
		IsClanSize{Clan = 26, Size = 1},
		IsClanSize{Clan = 27, Size = 1}
	},
	Actions = 
	{
		ChangeGoal {Clan = 27, Goal = GoalIdle},
		ChangeGoal {Clan = 26, Goal = GoalIdle},
		ChangeGoal {Clan = 25, Goal = GoalIdle},
		ChangeGoal {Clan = 24, Goal = GoalIdle}
	}
}






------------------------------------------------------------------------
--------------------------------------------------------------------------
--RewardFlags für geclearte Spawncamps Dschungelebene
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211BladesCampOstDestroyed", UpdateInterval = 60}
	},
	Actions = 
	{
		SetRewardFlagTrue {Name = "DschungelCamp1Killed"},
	}
}

OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211EchsenCampOstDestroyed", UpdateInterval = 60}
	},
	Actions = 
	{
		SetRewardFlagTrue {Name = "DschungelCamp2Killed"},
	}
}

OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211BladesCampWestDestroyed", UpdateInterval = 60}
	},
	Actions = 
	{
		SetRewardFlagTrue {Name = "DschungelCamp3Killed"},
	}
}

OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211EchsenCampWestDestroyed", UpdateInterval = 60}
	},
	Actions = 
	{
		SetRewardFlagTrue {Name = "DschungelCamp4Killed"},
	}
}


-----------------------------------------------------------------------
-----------------------------------------------------------------------
--Das Tier und die HoehlenBlades
-----------------------------------------------------------------------
--Timer für Hoehlenspawning Schattenkrieger
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
			IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10}
	},
	Actions = 
	{
		SetGlobalTimeStamp {Name = "gt_P211HoehlenTimer"},
		SetGlobalFlagTrue {Name = "g_P211DasTierGehtUm"}
	},
}


--Timer für Hoehlenspawning Phoenixkrieger
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		PlayerUnitInRange {X = 237, Y = 157, Range = 7, FigureType = FigureAll, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30}
	},
	Actions = 
	{
		SetGlobalTimeStamp {Name = "gt_P211HoehlenTimer"},
		SetGlobalFlagTrue {Name = "g_P211DasTierGehtUm"}
	},
}


--Toggle Events für besetzen der Höhlen
--Höhle 1
OnToggleEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	OnConditions = 
	{
		PlayerUnitInRange {X = 143, Y = 79, Range = 5, FigureType = FigureAll , UpdateInterval = 10},
	},
	OnActions = 
	{
		SetGlobalFlagTrue {Name = "g_P211Hoehle1SpawnEnde"},
		
	},
	
	OffConditions = 
	{
		IsGlobalFlagFalse {Name = "g_P211HoehlenSpawnAusFuerImmer", UpdateInterval = 20},
		Negated(PlayerUnitInRange {X = 143, Y = 79, Range = 5, FigureType = FigureAll , UpdateInterval = 10}),
	},
	OffActions = 
	{
		SetGlobalFlagFalse {Name = "g_P211Hoehle1SpawnEnde"}
	},
}

--Effekt, wenn Höhle besetzt
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211Hoehle1SpawnEnde", UpdateInterval = 30}
	},
	Actions = 
	{
		SetEffect{Effect = "AreaHit", X = 143, Y = 79, Length = 3000},
		SetEffect{Effect = "Lightning", X = 173, Y = 79, Length = 3500}
	},
}


--Höhle 2
OnToggleEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	OnConditions = 
	{
		PlayerUnitInRange {X = 127, Y = 164, Range = 5, FigureType = FigureAll , UpdateInterval = 10},
	},
	OnActions = 
	{
		SetGlobalFlagTrue {Name = "g_P211Hoehle2SpawnEnde"},
	},
	
	OffConditions = 
	{
		IsGlobalFlagFalse {Name = "g_P211HoehlenSpawnAusFuerImmer", UpdateInterval = 20},
		Negated(PlayerUnitInRange {X = 127, Y = 164, Range = 5, FigureType = FigureAll , UpdateInterval = 10}),
	},
	OffActions = 
	{
		SetGlobalFlagFalse {Name = "g_P211Hoehle2SpawnEnde"}
	},
}

--Effekt, wenn Höhle besetzt
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211Hoehle2SpawnEnde", UpdateInterval = 30}
	},
	Actions = 
	{
		SetEffect{Effect = "AreaHit", X = 127, Y = 164, Length = 3000},
		SetEffect{Effect = "Lightning", X = 127, Y = 164, Length = 3500}
	},
}


--Höhle 3
OnToggleEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	OnConditions = 
	{
		PlayerUnitInRange {X = 185, Y = 177, Range = 5, FigureType = FigureAll , UpdateInterval = 10},
	},
	OnActions = 
	{
		SetGlobalFlagTrue {Name = "g_P211Hoehle3SpawnEnde"},
		
	},
	
	OffConditions = 
	{
		IsGlobalFlagFalse {Name = "g_P211HoehlenSpawnAusFuerImmer", UpdateInterval = 20},
		Negated(PlayerUnitInRange {X = 185, Y = 177, Range = 5, FigureType = FigureAll , UpdateInterval = 10}),
	},
	OffActions = 
	{
		SetGlobalFlagFalse {Name = "g_P211Hoehle3SpawnEnde"}
	},
}

--Effekt, wenn Höhle besetzt
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211Hoehle3SpawnEnde", UpdateInterval = 30}
	},
	Actions = 
	{
		SetEffect{Effect = "AreaHit", X = 185, Y = 177, Length = 3000},
		SetEffect{Effect = "Lightning", X = 185, Y = 177, Length = 3500},
	},
}
		
--Höhle 4
OnToggleEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	OnConditions = 
	{
		PlayerUnitInRange {X = 216, Y = 82, Range = 5, FigureType = FigureAll , UpdateInterval = 10},
	},
	OnActions = 
	{
		SetGlobalFlagTrue {Name = "g_P211Hoehle4SpawnEnde"},
		
	},
	
	OffConditions = 
	{
		IsGlobalFlagFalse {Name = "g_P211HoehlenSpawnAusFuerImmer", UpdateInterval = 20},
		Negated(PlayerUnitInRange {X = 216, Y = 82, Range = 5, FigureType = FigureAll , UpdateInterval = 10}),
	},
	OffActions = 
	{
		SetGlobalFlagFalse {Name = "g_P211Hoehle4SpawnEnde"}
	},
}

--Effekt, wenn Höhle besetzt
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211Hoehle4SpawnEnde", UpdateInterval = 30}
	},
	Actions = 
	{
		SetEffect{Effect = "AreaHit", X = 216, Y = 82, Length = 3000},
		SetEffect{Effect = "Lightning", X = 216, Y = 82, Length = 3500},
	},
}


-----------------------------------------
--Das Tier geht um, wenn eine der Höhlen besetzt ist
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_P211Hoehle1SpawnEnde", UpdateInterval = 20},
			IsGlobalFlagTrue {Name = "g_P211Hoehle2SpawnEnde", UpdateInterval = 20},
			IsGlobalFlagTrue {Name = "g_P211Hoehle3SpawnEnde", UpdateInterval = 20},
			IsGlobalFlagTrue {Name = "g_P211Hoehle4SpawnEnde", UpdateInterval = 20}
		},
		IsGlobalFlagFalse {Name = "g_P211HoehlenSpawnAusFuerImmer", UpdateInterval = 20}
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P211DasTierGehtUm"},
	},
}


--Futtertrog beim Tier
-- Trog leer nach 10 Minuten Fuetterungszeit
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P211TierFutter", Seconds = 900}
	},
	Actions = 
	{
		ChangeObject {X = 154, Y = 212, Object = 2894},
		ChangeObject {X = 154, Y = 213, Object = 2894},
		SetGlobalFlagTrue {Name = "g_P211DasTierGehtUm"},
		ClearGlobalTimeStamp {Name = "gt_P211TierFutter"},
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_10613"}, --volle Troege
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_10583"}--Futterplatz
	}
}

OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211HoehlenSpawnAusFuerImmer", UpdateInterval = 20}
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_P211DasTierGehtUm"}
	},
}


-----------------------------------------------------------------------
------------------------------------------------------------------------
--wenn tor auf, Blades + Soulforger spawn
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		FigureInRange {X = 136, Y = 102, NpcId = 0, Range = 4},
		IsGlobalFlagTrue {Name = "g_P211TorZumForgerAuf", UpdateInterval = 20}
	},
	Actions = 
	{
		SetGlobalTimeStamp {Name = "gt_P211_MiniforgerAufAuf"}
	},
}

-----------------------------------------------------------------------
--Rewardflag Soulforger Killed
-----------------------------------------------------------------------
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211Soulforgerlebt", UpdateInterval = 20},
		FigureDead{NpcId = 9719}
	},
	Actions = 
	{
		SetRewardFlagTrue {Name = "EndgegnerSoulforgerKilled"},
		QuestSolve {QuestId = 1097, ActivateNextQuest = FALSE },
	},
}

----------------------------------------------------------------------------
-- Flags für CS Ende
-----------------------------------------
--Phönixsteinspieler
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval  = 30},
		IsGlobalFlagTrue {Name = "g_P211EndgegnerEnde", UpdateInterval  = 20},
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 20},
		Negated(EnemyUnitInRange{X = 103, Y = 103, NpcId = Avatar, Range = 20, UnitId = 0, UpdateInterval = 30}),
		FigureInRange {X = 91, Y = 100, NpcId = 0, Range = 12},
		
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P211CSInitEndePhoenix"},
	},
}


--Schattenklingenspieler
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler", UpdateInterval  = 20},
		IsGlobalFlagTrue {Name = "g_P211EndgegnerEnde", UpdateInterval  = 20},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10},
		Negated(EnemyUnitInRange{X = 103, Y = 103, NpcId = Avatar, Range = 20, UnitId = 0, UpdateInterval = 30}),
		FigureInRange {X = 91, Y = 100, NpcId = 0, Range = 12},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P211CSInitEndeShadowblade"},
	},
}

----------------------------------------------------------
--Nebenquesten:
----------------------------------------------------------

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
		SetEffect{Effect = "FogForever", X = 333, Y = 335, Length = 0, TargetType = World},
		ChangeObject {X = 332, Y = 335, Object = 809}
	}
}


--Spawning Dämonen Ende
--Quest solved
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P211DarkwindBaumWirdKlein", UpdateInterval = 20},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P211DarkwindDämonenSpawnStopHlStätte"},
		QuestSolve {QuestId = 1053, ActivateNextQuest = FALSE} -- hl. Stätte Onyx Shore
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
-- nach 2 sek: kleiner Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P211DarkwindBaumWirdKlein", UpdateInterval = 20},
		IsGlobalTimeElapsed {Name = "gt_P211DarkwindBaumwuchsTimer", Seconds = 2, UpdateInterval = 60},
	},
	Actions = 
	{ 
		ChangeObject {X = 332, Y = 335, Object = 3112},
		SetGlobalFlagTrue{Name = "g_P211DarkwindBaumWirdMittel"},
		StopEffect {X = 333, Y = 335, TargetType = World}, --nebel aus
		SetEffect{Effect = "OccludeWhite", X = 332, Y = 335, Length = 3000, TargetType = World},
		PlaySound{Sound = SoundSacredFreedom},
	}
}


--nach 30 Minuten: mittlerer Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P211DarkwindBaumwuchsTimer", Seconds = 300, UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_P211DarkwindBaumWirdMittel", UpdateInterval = 20}
	},
	Actions = 
	{ 
		ChangeObject {X = 332, Y = 335, Object = 3111},
		SetGlobalFlagTrue{Name = "g_P211DarkwindBaumWirdGross"},
		SetEffect{Effect = "OccludeWhite", X = 332, Y = 335, Length = 3000, TargetType = World}
	}
}


--nach 45 Minuten: großer Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P211DarkwindBaumwuchsTimer", Seconds = 900, UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_P211DarkwindBaumWirdGross", UpdateInterval = 20}
	},
	Actions = 
	{ 
		ChangeObject {X = 332, Y = 335, Object = 3110},
		SetEffect{Effect = "OccludeWhite", X = 332, Y = 335, Length = 3000, TargetType = World}
	}
}

-- _______________________________________
--I                                      I
--I        NQ_Der letzte Dracon          I
--I______________________________________I


--Wenn der Spieler in der NQ Der letzte Dracon auf Craig stösst und der Archonwächter noch lebt, bekommt er den Auftrag ihn zu töten!
OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRange {X = 179, Y = 132, NpcId = 0, Range = 10}, 
		QuestState {State = StateActive, QuestId = 1063},
		FigureAlive {NpcId = 10821},
		IsGlobalFlagTrue {Name = "g_sP211NQDraconArchonGeSpawned"},
	},  
	Actions = 
	{
		QuestSolve { QuestId = 1063},
		QuestBegin { QuestId = 1066},
	},
}

--Wenn der Spieler in der NQ Der letzte Dracon auf Craig stösst und der Archonwächter nicht mehr lebt, bekommt er den Auftrag Craig zu befreien!
OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRange {X = 179, Y = 132, NpcId = 0, Range = 10}, 
		QuestState {State = StateActive, QuestId = 1063},
		FigureDead {NpcId = 10821},
		IsGlobalFlagTrue {Name = "g_sP211NQDraconArchonGeSpawned"},
	},  
	Actions = 
	{
		QuestSolve { QuestId = 1063},
		QuestBegin { QuestId = 1067},
	},
}

--Wenn der Spieler den Wächter getötet hat, bekommt er den Auftrag Craig zu befreien!
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {State = StateActive, QuestId = 1066},
		FigureDead {NpcId = 10821},
		IsGlobalFlagTrue {Name = "g_sP211NQDraconArchonGeSpawned"},
	},  
	Actions = 
	{
		QuestSolve { QuestId = 1066},
		QuestBegin { QuestId = 1067},
	},
}


--Wenn er mit Craig geredet hat, bekommt er den Auftrag nach Empyria zu reisen!
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP211NQDraconAuftragEmpiria"},
	},  
	Actions = 
	{
		QuestSolve { QuestId = 1067},
		QuestBegin { QuestId = 1064},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9801"},
		
	},
}

--Wenn man in die Nähe von Craig kommt und der Wächter tot ist, wird er befreit und der Sidequestdialog wird angeschaltet.
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		--Negated(EnemyUnitInRange{X = 181, Y = 126, NpcId = Avatar, Range = 15, UnitId = 0, UpdateInterval = 10}),
		--Negated(BuildingInRange{X = 181, Y = 126, Range = 15, Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 10}),
		FigureInRange {X = 179, Y = 130, NpcId = 0, Range = 2}, 
		FigureDead {NpcId = 10821},
		QuestState {State = StateActive, QuestId = 1061},
		IsGlobalFlagFalse {Name = "g_P211CraigBefreit"},
	},
	Actions = 
	{
		StopEffect {TargetType = Figure, NpcId = 9801},
		SetGlobalFlagTrue {Name = "g_P211CraigBefreit"},
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_9801"},
		SetRewardFlagTrue {Name = "CraigBefreit"},
		SetGlobalFlagTrue {Name = "g_sP211CraigIstSchonFrei"},
	},
}

--Falls Craig schon befreit wurde, dann wird der MainDialog Removed und der SideQuestdialog angeschaltet.
OnOneTimeEvent
{
	
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_sP211CraigIstSchonFrei"},
		IsGlobalFlagTrue {Name = "g_P211CraigBefreit"},
		
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9801"},
		SetGlobalTimeStamp{Name = "g_tsP211AbfrageSicherungCraig"},
		
	},
}

--Sicherung das tatsächlich das Ausrufezeichen gelöscht wurde bevor das Fragezeichen erscheint.
OnOneTimeEvent
{
	
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "g_tsP211AbfrageSicherungCraig", Seconds = 2}, 
	},
	Actions = 
	{
		
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_9801"},
		
	},
}



---------------------------------------------
-- Fuer die beiden gegenavatare prüfen welcher Bindstone in Use ist
-- Wenn der Spieler die Karte erneut betritt wird die Liste gelöscht und neu angelegt, 
-- damit der Zweitavatar mit über die Bindstones reisen kann
OnPlatformOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "g_P211_BindStoneEins"},
		SetGlobalFlagFalse {Name = "g_P211_BindStoneZwei"},
		SetGlobalFlagFalse {Name = "g_P211_BindStoneDrei"},
		SetGlobalFlagFalse {Name = "g_P211_BindStoneVier"},
		SetGlobalFlagFalse {Name = "g_P211_BindStoneFuenf"},
		SetGlobalTimeStamp {Name = "gt_P211_BindstoneBremse"},
	}
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P211_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 381, Y = 385, Range = 0},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P211_BindStoneEins"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P211_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 381, Y = 4385, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P211_BindStoneEins"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P211_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 257, Y = 437, Range = 0},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P211_BindStoneZwei"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P211_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 257, Y = 437, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P211_BindStoneZwei"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P211_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 258, Y = 262, Range = 0},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P211_BindStoneDrei"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P211_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 258, Y = 262, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P211_BindStoneDrei"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P211_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 176, Y = 109, Range = 0},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P211_BindStoneVier"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P211_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 176, Y = 109, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P211_BindStoneVier"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P211_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 96, Y = 118, Range = 0},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P211_BindStoneFuenf"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P211_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 96, Y = 118, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P211_BindStoneFuenf"},
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

----------------------------------------------------------
--				Storyquest Part.
----------------------------------------------------------


--- In den Dschungel
OnOneTimeEvent
{
	Conditions = 
	{
	QuestState{QuestId = 1087, State = StateActive}, 
	QuestState{QuestId = 1093, State = StateActive}, 
	},
	Actions = 
	{ 
	QuestSolve{QuestId = 1093},
	QuestBegin{QuestId = 1094},
	}
}
EndDefinition()
end
