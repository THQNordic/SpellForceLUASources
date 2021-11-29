function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Laden der Cutscenes
dofile("script/p6/n1984_CutsceneRohen.lua")
dofile("script/p6/n3609_CutsceneFinalBattle.lua")

DebugInitAction(SetGlobalState{Name = "Plot", State = "JourneyOne"})

--Shiel Solven
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 99 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 99},
		QuestSolve{QuestId = 86}
		}
}

--DebugInitAction(		SetGlobalFlagTrue{Name = "AfterSpawn"} )

--MainQuest starten
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 101 , State = StateUnknown}
		},
Actions =	{
		QuestBegin{QuestId = 101},
		QuestBegin{QuestId = 102},
		}
}

--Solver für KnightQuest
---- -Q103-
OnOneTimeEvent
{
Conditions =	{
--		QuestState{QuestId = 103 , State = StateActive},
--		QuestState{QuestId = 348 , State = StateActive},
		PlayerBuildingExists{BuildingId = 34 , Player = self , UpdateInterval = 60}
		},
Actions =	{
		QuestSolve{QuestId = 102},
		QuestSolve{QuestId = 103},
		QuestSolve{QuestId = 348},
		QuestBegin{QuestId = 104},
		}
}
--Solver für Canyonbreak
---- -Q104-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 104 , State = StateActive},
		Negated(EnemyUnitInRange{X = 239 , Y = 246 , NpcId = 1986, Range = 10 , UnitId = 0}),
		FigureDead{NpcId = 2147}
		},
Actions =	{
		QuestSolve{QuestId = 104},
		QuestBegin{QuestId = 105},
		SetRewardFlagTrue{ Name = "AmWildlandPass1"}
		}
}

---Solver für Portalerreichen
---- -Q105-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 105 , State = StateActive},
		FigureDead{NpcId = 3609}
		},
Actions =	{
		QuestSolve{QuestId = 105},
		QuestBegin{QuestId = 106},
		SetRewardFlagTrue{ Name = "AmWildlandPass2"}
		}
}
--SWANSONG BLOCK BEGINS HERE
--Timer für Truppenbereitschaft
OnEvent
{
Conditions = 	{
		QuestState{QuestId = 103 , State = StateActive},
		IsGlobalFlagTrue{Name = "Q103TroopsNotReady"},
		IsGlobalFlagTrue{Name = "Q103TroopsDied"},
		FigureAlive{NpcId = 1990},
		FigureAlive{NpcId = 1991},
		FigureAlive{NpcId = 1992},
		FigureAlive{NpcId = 1993},
		},
Actions = 	{
		SetGlobalFlagFalse{Name = "Q103TroopsNotReady"},
		}
}
--Ritter tot?
OnEvent
{
Conditions = 	{
		QuestState{QuestId = 103 , State = StateActive},
		IsGlobalFlagFalse{Name = "Q103TroopsDied"},
		FigureDead{NpcId = 1990},
		FigureDead{NpcId = 1991},
		FigureDead{NpcId = 1992},
		FigureDead{NpcId = 1993},
		},
Actions = 	{
		SetGlobalFlagTrue{Name = "Q103TroopsDied"},
		SetGlobalFlagFalse{Name = "Q103KnightsGoingToMonument"}	
		}
}


--Truppenaufmarsch auslösen
---- -Q103-
OnToggleEvent
{
UpdateInterval = 10 ,
OnConditions = 	{
		QuestState{QuestId = 103 , State = StateActive},
		IsGlobalFlagTrue{Name = "Q103AttackCommandGiven" , UpdateInterval = 15},
		FigureAlive{NpcId = 1990},
		FigureAlive{NpcId = 1991},
		FigureAlive{NpcId = 1992},
		FigureAlive{NpcId = 1993},
		},
OnActions = 	{
		SetGlobalFlagTrue{Name = "Q103KnightsFormUp"},
		SetGlobalFlagFalse{Name = "Q103AttackCommandGiven"},
		SetGlobalFlagTrue{Name = "Q103TroopsNotReady"},
		SetGlobalFlagFalse{Name = "Q103TroopsDied"}
		},
OffConditions = {
		FigureInRange{X = 109, Y = 304 , NpcId = 1990 ,Range = 0 , UpdateInterval = 15},
		FigureInRange{X = 109, Y = 302 , NpcId = 1991 ,Range = 0 , UpdateInterval = 15},
		FigureInRange{X = 105, Y = 301 , NpcId = 1992 ,Range = 0 , UpdateInterval = 15},
		FigureInRange{X = 107, Y = 300 , NpcId = 1993 ,Range = 0 , UpdateInterval = 15},
		IsGlobalFlagTrue{Name = "Q103KnightsFormUp"},
		},
OffActions = 	{
		SetGlobalFlagFalse{Name = "Q103KnightsFormUp"},
		SetGlobalFlagTrue{Name = "Q103KnightReadyForMarch"},
		},
}

--Knight marschieren
---- -Q103-
OnEvent
{
Conditions = 	{
		QuestState{QuestId = 103 , State = StateActive},
		IsGlobalFlagTrue{Name = "Q103KnightReadyForMarch"},	
		},
Actions = 	{
		SetGlobalFlagFalse{Name = "Q103KnightReadyForMarch"},
		Goto{X = 166 , Y = 323 , NpcId = 1990 , Range = 1 , WalkMode = Run , GotoMode = GotoContinous},
		Goto{X = 166 , Y = 321 , NpcId = 1991 , Range = 1 , WalkMode = Run , GotoMode = GotoContinous},
		Goto{X = 162 , Y = 323 , NpcId = 1992 , Range = 1 , WalkMode = Run , GotoMode = GotoContinous},
		Goto{X = 162 , Y = 321 , NpcId = 1993 , Range = 1 , WalkMode = Run , GotoMode = GotoContinous},
		SetGlobalFlagTrue{Name = "Q103KnightsGoingToMonument"}	
		},
}


--SWANSONG BLOCK ENDS HERE

--SPIDERKING BLOCK BEGINS HERE
--Spinnenmann anschalten
---- -Q104-
--OnOneTimeEvent
--{
--UpdateInterval = 20,
--Conditions =	{
--		IsGlobalFlagFalse{Name = "Q104SpiderkingReady"},
--		QuestState{QuestId = 104 , State = StateActive},
--		},
--Actions =	{
--		SetGlobalFlagTrue{Name = "Q104SpiderkingReady"},
--		}
--}
--Spinnen fertig werden
---- -Q104-
OnOneTimeEvent
{
UpdateInterval = 20,
Conditions =	{
		IsGlobalFlagTrue{Name = "Q104SpidersGetReady"},
		FigureAlive{NpcId = 1996},
		FigureAlive{NpcId = 1997},
		FigureAlive{NpcId = 1998},
		FigureAlive{NpcId = 1999},
		FigureAlive{NpcId = 2000},
		FigureAlive{NpcId = 2001},
		FigureAlive{NpcId = 2002},
		FigureAlive{NpcId = 2003},
		FigureAlive{NpcId = 2004},
		FigureAlive{NpcId = 2005},
		},
Actions =	{
		SetGlobalFlagFalse{Name = "Q104SpidersGetReady"},
		SetGlobalFlagTrue{Name = "Q104SpidersReady"},
		ChangeRace{Race = 155 , NpcId = 1996},
		ChangeRace{Race = 155 , NpcId = 1997},
		ChangeRace{Race = 155 , NpcId = 1998},
		ChangeRace{Race = 155 , NpcId = 1999},
		ChangeRace{Race = 155 , NpcId = 2000},
		ChangeRace{Race = 155 , NpcId = 2001},
		ChangeRace{Race = 155 , NpcId = 2002},
		ChangeRace{Race = 155 , NpcId = 2003},
		ChangeRace{Race = 155 , NpcId = 2004},
		ChangeRace{Race = 155 , NpcId = 2005},
		}
}

--Spinnen starten
---- -Q104-
OnOneTimeEvent
{
UpdateInterval = 20,
Conditions =	{
		IsGlobalFlagTrue{Name = "Q104SpidersReady"},
		IsGlobalFlagTrue{Name = "Q104LaunchSpiders"},
		},
Actions =	{
		SetGlobalFlagTrue{Name = "Q104SpidersGo"},
		SetGlobalFlagFalse{Name = "Q104SpidersReady"},
		SetGlobalFlagFalse{Name = "Q104LaunchSpiders"},
		}
}

--Flöte mit Quest
---Q408
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2371},
		QuestState{QuestId = 409 , State = StateActive},
		},
Actions =	{
		QuestSolve{QuestId = 409},
		QuestBegin{QuestId = 410},
		}
}

--Spiderking wird böse
---- -Q108-
OnOneTimeEvent
{
UpdateInterval = 20, 
Conditions =	{
		IsGlobalFlagTrue{Name = "Q107SpiderkingAgressive"}
		},
Actions =	{
		ChangeRace{Race = 109 , NpcId = 1989},
		ChangeRace{Race = 109 , NpcId = 1996},
		ChangeRace{Race = 109 , NpcId = 1997},
		ChangeRace{Race = 109 , NpcId = 1998},
		ChangeRace{Race = 109 , NpcId = 1999},
		ChangeRace{Race = 109 , NpcId = 2000},
		ChangeRace{Race = 109 , NpcId = 2001},
		ChangeRace{Race = 109 , NpcId = 2002},
		ChangeRace{Race = 109 , NpcId = 2003},
		ChangeRace{Race = 109 , NpcId = 2004},
		ChangeRace{Race = 109 , NpcId = 2005},
		}
}

OnOneTimeEvent
{
UpdateInterval = 20,
Conditions =	{
		IsGlobalFlagTrue{Name = "Q107SpiderkingAgressive" , UpdateInterval = 15},
		FigureAlive{NpcId = 1996},
		FigureAlive{NpcId = 1997},
		FigureAlive{NpcId = 1998},
		FigureAlive{NpcId = 1999},
		FigureAlive{NpcId = 2000},
		FigureAlive{NpcId = 2001},
		FigureAlive{NpcId = 2002},
		FigureAlive{NpcId = 2003},
		FigureAlive{NpcId = 2004},
		FigureAlive{NpcId = 2005},
		},
Actions =	{
		SetGlobalFlagFalse{Name = "Q107SpiderkingAgressive"},
		SetGlobalFlagTrue{Name = "Q107SpiderAttack"},
		}
}
--SPIDERKING BLOCK ENDS HERE

--MARKWART BLOCK BEGINS HERE
--Prüfen ob Kleid und Quest da
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 108 , State = StateActive},
		PlayerHasItem{ItemId = 2382}
		},
Actions = 	{
		QuestSolve{QuestId = 108},
		QuestBegin{QuestId = 109}
		}
}
--MARKWART BLOCK ENDS HERE

--Amra und Lea Start

OnOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagTrue {Name = "Quest393Helper"},
		FigureDead {NpcId = 2899},
		FigureDead {NpcId = 2900},
		FigureDead {NpcId = 2901},
	},
	Actions = 	
	{
		QuestSolve{QuestId = 393},
		QuestBegin{QuestId = 386},
		SetGlobalFlagTrue {Name = "AllHelpersDead"},
	}
}

--Amra und Lea Ende

--Q134 PURPURNES BANNER BEGINS HERE
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 392 , State = StateActive},
		PlayerHasItem{ItemId = 2488},
			},
	Actions =
	{
		QuestSolve{QuestId = 392},
		QuestBegin{QuestId = 137}
	}
}
--Q134 PURPURNES BANNER ENDS HERE

--!!! Fake Spawning für Blockadetrupp

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 253, Y = 271, Range = 4},
		IsGlobalTimeElapsed{Name = "WildlandpassMonumentClaimedTimer", Seconds = 1},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "WildlandpassFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 257, Y = 269},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 253, Y = 271, Range = 4}),
		ODER (IsMonumentInUse {X = 303, Y = 303, Range = 0}, IsMonumentInUse {X = 160,Y = 326, Range = 0}), 
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "WildlandpassFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 257, Y = 269, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 257, Y = 269, Length = 3000},
		StopEffect {TargetType = World, X = 257, Y = 269},
	}
}

--!!! Fake Spawning für Feuertrupp

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 413, Y = 292, Range = 0},
		ODER(IsMonumentInUse {X = 303, Y = 303, Range = 0}, IsMonumentInUse {X = 160,Y = 326, Range = 0}),
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "WildlandpassFeuerFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 412, Y = 290},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 413, Y = 292, Range = 0}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "WildlandpassFeuerFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 412, Y = 290, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 412, Y = 290, Length = 3000},
		StopEffect {TargetType = World, X = 412, Y = 290},
	}
}


-- Outcries
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "Q103KnightsGoingToMonument", UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "SperreWildLand", UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryRitterWP001", NpcId = 1990, String = "Los Männer! Zum Monument!", Color = ColorWhite },
		SetGlobalFlagTrue{Name = "SperreWildLand"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureHasAggro {NpcId = 3609, UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "SperreWildLandBrannigan1", UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryBranniganWP001", NpcId = 3609, String = "Steht nicht so rum! Tötet irgendwas!", Color = ColorWhite },
		SetGlobalFlagTrue{Name = "SperreWildLandBrannigan1"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth {NpcId = 3609, Percent = 25, UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "SperreWildLandBrannigan2", UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryBranniganWP002", NpcId = 3609, String = "Nein! Die Götter mögen Euch verfluchen, Runensklave! Aargh!", Color = ColorWhite },
		SetGlobalFlagTrue{Name = "SperreWildLandBrannigan2"},
	}
}

-- !!! Test
--
--OnOneTimeEvent
--{
--	UpdateInterval = 10,
--	Conditions =
--	{
--		PlayerUnitInRange {X = 33, Y = 198, Range = 4},
--	},
--	Actions =
--	{
--		SetEffect{Effect = "AreaHit", X = 257, Y = 269, Length = 3000},
--		ChangeGoal {Clan = 23, Goal = GoalAggressive},
--	}
--}
--
---- !!! Test Ende
--
EndDefinition()
end
