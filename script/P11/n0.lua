function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Cutscene Scripte Aufrufen
dofile("script/p11/n2664_GorinCutscene.lua")
dofile("script/p11/n2266_DeepOneCutscene.lua")

--Flags initialisieren
DebugInitAction(	SetGlobalFlagFalse{Name = "Q166GuardiansDead"}	)
DebugInitAction(	SetGlobalFlagFalse{Name = "Q166GuardiansHaveSpawned"} )
DebugInitAction(	SetGlobalFlagFalse{Name = "Q166TimeUp"}	)
OneTimeInitAction( SetPlayerFlagTrue{Name = "WasOnStoneblade"}	)
DebugInitAction( SetGlobalFlagFalse{Name = "184KragaAggro"}	)
DebugInitAction( QuestBegin{QuestId = 12})
DebugInitAction( QuestSolve{QuestId = 12})



--DEEP ONE BLOCK BEGINS HERE
--MainStarter Für Ringqueste
---- -Q166-
OnPlatformOneTimeEvent
{
	UpdateInterval = 1,
	Conditions =	
	{
		QuestState{QuestId = 167 , State = StateActive, UpdateInterval = 1},
		IsGlobalFlagFalse{Name = "Q166BeginQuestOn", UpdateInterval = 1},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "Q166BeginQuestOn"},
		SetGlobalTimeStamp{Name = "Q166ConjurationTimer"},
		SetGlobalTimeStamp{Name = "Q166CastTimer"},
		SetGlobalFlagFalse{Name = "Q166GuardiansDead"},
		SetGlobalFlagTrue{Name = "Q166GolemStarter"},
	}
}

--Timer Schwellwert
OnOneTimeEvent
{
	Conditions	=	
	{
		-- !TO DO! checken ob Timer so ok 
		IsGlobalTimeElapsed{Name = "Q166ConjurationTimer" , Seconds = 1200, UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 10},
		QuestState{QuestId = 167 , State = StateActive, UpdateInterval = 10},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "Q166TimeUp"},
		Outcry{ Tag = "outcryDeepOneStonebl001", NpcId = 2266, String = "Es ist beinahe vollendet! Der Zorn nimmt bereits Gestalt an!", Color = ColorWhite },
	}
}


---- -Q166-
OnOneTimeEvent
{
	Conditions	=	
	{
		-- !TO DO! checken ob Timer so ok 
		IsGlobalTimeElapsed{Name = "Q166ConjurationTimer" , Seconds = 1800, UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 10},
		QuestState{QuestId = 167 , State = StateActive, UpdateInterval = 10},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "Q166TimeUp"},
		Outcry{ Tag = "outcryDeepOneStonebl002", NpcId = 2266, String = "Er ist erschienen! Ihr habt versagt! Flieht, oder Ihr werdet vernichtet!", Color = ColorWhite },
	}
}

OnPlatformOneTimeEvent
{
	Conditions	=	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
	Actions =		
	{
		ClanAttack {Number = 7, SourceClan = 17, TargetX = 270, TargetY = 100},
	}
}
-- Die Wächter beginnen zu casten
OnToggleEvent 
{
	UpdateInterval = 5,
	OnConditions =
	{
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 5},
		Negated(FigureHasAggro {NpcId = 2268, UpdateInterval = 5}),
		FigureAlive{NpcId = 2268},
	},
	OnActions	=
	{
		CastSpell{Spell = 1556, Target = 2268, TargetType = Figure, X = 0, Y = 0, NpcId = 2268},
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 5},
		Negated(FigureHasAggro {NpcId = 2268, UpdateInterval = 5}),
		FigureAlive{NpcId = 2268},
	},
	OffActions	=
	{
		CastSpell{Spell = 1556, Target = 2268, TargetType = Figure, X = 0, Y = 0, NpcId = 2268},
	}
}

-- Die Wächter beginnen zu casten
OnToggleEvent 
{
	UpdateInterval = 5,
	OnConditions =
	{
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 5},
		Negated(FigureHasAggro {NpcId = 2269, UpdateInterval = 5}),
		FigureAlive{NpcId = 2269},
	},
	OnActions	=
	{
		CastSpell{Spell = 1556, Target = 2269, TargetType = Figure, X = 0, Y = 0, NpcId = 2269},
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 5},
		Negated(FigureHasAggro {NpcId = 2269, UpdateInterval = 5}),
		FigureAlive{NpcId = 2269},
	},
	OffActions	=
	{
		CastSpell{Spell = 1556, Target = 2269, TargetType = Figure, X = 0, Y = 0, NpcId = 2269},
	}
}

-- Die Wächter beginnen zu casten
OnToggleEvent 
{
	UpdateInterval = 5,
	OnConditions =
	{
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 5},
		Negated(FigureHasAggro {NpcId = 2270, UpdateInterval = 5}),
		FigureAlive{NpcId = 2270},
	},
	OnActions	=
	{
		CastSpell{Spell = 1556, Target = 2270, TargetType = Figure, X = 0, Y = 0, NpcId = 2270},
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 5},
		Negated(FigureHasAggro {NpcId = 2270, UpdateInterval = 5}),
		FigureAlive{NpcId = 2270},
	},
	OffActions	=
	{
		CastSpell{Spell = 1556, Target = 2270, TargetType = Figure, X = 0, Y = 0, NpcId = 2270},
	}
}


-- Die Wächter beginnen zu casten
OnToggleEvent 
{
	UpdateInterval = 5,
	OnConditions =
	{
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 5},
		Negated(FigureHasAggro {NpcId = 2271, UpdateInterval = 5}),
		FigureAlive{NpcId = 2271},
	},
	OnActions	=
	{
		CastSpell{Spell = 1556, Target = 2271, TargetType = Figure, X = 0, Y = 0, NpcId = 2271},
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 5},
		Negated(FigureHasAggro {NpcId = 2271, UpdateInterval = 5}),
		FigureAlive{NpcId = 2271},
	},
	OffActions	=
	{
		CastSpell{Spell = 1556, Target = 2271, TargetType = Figure, X = 0, Y = 0, NpcId = 2271},
	}
}

-- Die Wächter beginnen zu casten
OnToggleEvent 
{
	UpdateInterval = 5,
	OnConditions =
	{
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 5},
		Negated(FigureHasAggro {NpcId = 2272, UpdateInterval = 5}),
		FigureAlive{NpcId = 2272},
	},
	OnActions	=
	{
		CastSpell{Spell = 1556, Target = 2272, TargetType = Figure, X = 0, Y = 0, NpcId = 2272},
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "Q166TimeUp", UpdateInterval = 5},
		Negated(FigureHasAggro {NpcId = 2272, UpdateInterval = 5}),
		FigureAlive{NpcId = 2272},
	},
	OffActions	=
	{
		CastSpell{Spell = 1556, Target = 2272, TargetType = Figure, X = 0, Y = 0, NpcId = 2272},
	}
}

--Prüfen, ob die Wächter alle Hin sind
---- -Q166-
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagTrue{Name = "Q166GuardiansHaveSpawned"},
		IsGlobalFlagFalse{Name = "Q166GuardiansDead"},
		FigureDead{NpcId = 2268},
		FigureDead{NpcId = 2269},
		FigureDead{NpcId = 2270},
		FigureDead{NpcId = 2271},
		FigureDead{NpcId = 2272},
		QuestState{QuestId = 167 , State = StateActive},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "Q166GuardiansDead"},
		SetGlobalFlagFalse{Name = "Q166GuardiansHaveSpawned"},
	}
}

--Erfolgreiches Ende
---- -Q166-
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagTrue{Name = "Q166GuardiansDead"},
		IsGlobalFlagFalse{Name = "Q166TimeUp"},
		QuestState{QuestId = 167 , State = StateActive},
	},
	Actions =		
	{
		QuestSolve{QuestId = 167},
		QuestBegin{QuestId = 168},
		SetGlobalFlagFalse{Name = "Q166BeginQuestOn"},
	}
}
--OhneErfolg
---- -Q166-
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagFalse{Name = "Q166GuardiansDead"},
		IsGlobalFlagTrue{Name = "Q166TimeUp"},
		QuestState{QuestId = 167 , State = StateActive},
	},
	Actions =		
	{
		QuestChangeState{QuestId = 167 , State = StateUnsolvable},
		SetGlobalFlagFalse{Name = "Q166BeginQuestOn"},
		SetGlobalFlagFalse{Name = "Q166TimeUp"},
		SetGlobalFlagTrue {Name = "Q166ConjurationSuccess"},
	}
}	
--Solver für steinernes Herz
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 167 , State = StateUnsolvable},
		PlayerHasItem{ItemId = 2815},
	},
	Actions =		
	{
		QuestBegin{QuestId = 323},
	}
}

--DEEP ONE BLOCK ENDS HERE

--KRAGA BLOCK BEGINS HERE
--ErsteGesprächsoption freigeben
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		Negated(QuestState{QuestId = 184 , State = StateActive})
	},
	Actions =		
	{
		SetPlayerFlagTrue{Name = "Q184FirstQuestion"}
	}
}
--Checken ob Spieler Braga gesehen hat
---- -Q184-
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		IsPlayerFlagTrue{Name = "Q184AvatarHasSeenBraga"},
		QuestState{QuestId = 185 , State = StateActive , UpdateInterval = 4},
	},
	Actions =		
	{
		QuestSolve{QuestId = 185},
		QuestBegin{QuestId = 186},
	}
}
--Flag setzen für Braga, geschieht jetzt nur einmal
---- -Q184-
--OnPlatformOneTimeEvent
--{
--	Conditions =	
--	{
--		IsPlayerFlagFalse{Name = "Q185AvatarHasSeenBraga"},
--		FigureAlive{NpcId = 2265},
--		FigureInRange{X = 228 , Y = 282 , NpcId = Avatar , Range = 15},
--	},
--	Actions =		
--	{
--		SetPlayerFlagTrue{Name = "Q184AvatarHasSeenBraga"},
--	}
--}

--Kraga hat Braga alle gemacht
---- -Q184-
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 188 , State = StateActive},
		FigureDead{NpcId = 2265},
		FigureInRange{X = 228 , Y = 282 , NpcId = 2264 , Range = 10},
		IsGlobalFlagFalse{Name = "Q184KragaKilledBraga"},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
		ChangeUnit{Unit = 925 , NpcId = 2264},
		EnableDialog{NpcId = 2264},
	}
}
--Spieler hat Feinstein
---- -Q184-
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 184 , State = StateActive},
		PlayerHasItem{ItemId = 2543},
		QuestState{QuestId = 189 , State = StateUnknown},
	},
	Actions =		
	{
		QuestBegin{QuestId = 189},
		QuestChangeState{QuestId = 186 , State = StateUnsolvable},
	}
}

--Subquests solven je nach Zustand
---- -Q184-
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 189 , State = StateSolved},
		QuestState{QuestId = 185 , State = StateActive},
	},
	Actions =		
	{
		QuestSolve{QuestId = 185},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 189 , State = StateSolved},
		QuestState{QuestId = 186 , State = StateActive},
	},
	Actions =		
	{
		QuestSolve{QuestId = 186},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 189 , State = StateSolved},
		QuestState{QuestId = 187 , State = StateActive},
	},
	Actions =		
	{
		QuestSolve{QuestId = 187},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 189 , State = StateSolved},
		QuestState{QuestId = 188 , State = StateActive},
	},
	Actions =		
	{
		QuestSolve{QuestId = 188},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 189 , State = StateSolved},
		QuestState{QuestId = 188 , State = StateSolved},
		QuestState{QuestId = 187 , State = StateSolved},
		QuestState{QuestId = 186 , State = StateSolved},
		QuestState{QuestId = 185 , State = StateSolved},
	},
	Actions =		
	{
		QuestSolve{QuestId = 184},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 188 , State = StateSolved},
		QuestState{QuestId = 187 , State = StateSolved},
		QuestState{QuestId = 186 , State = StateSolved},
		QuestState{QuestId = 185 , State = StateSolved},
	},
	Actions =		
	{
		QuestSolve{QuestId = 184},
	}
}
--War der Spieler am Schatz?
---- -Q184-
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagFalse{Name = "184KragaAggro"},
		PlayerUnitInRange{X = 411 , Y = 366 , FigureType = FigureAll , Range = 5 , UpdateInterval = 20},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "184KragaAggro"},
		ChangeRace{Race = 113 , NpcId = 2264},
		Goto{X = 411 , Y = 366 , NpcId = 2264 , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		QuestSolve{QuestId = 188},
		RemoveDialog{NpcId = 2264},
	}
}


--Trolle abfragen
---- -Q184-
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		FigureInRange{X = 411 , Y = 366 , NpcId = 2775 , Range = 3},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "184KragaAggro"},
		QuestSolve{QuestId = 188},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		FigureInRange{X = 411 , Y = 366 , NpcId = 2776 , Range = 3},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "184KragaAggro"},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		FigureInRange{X = 411 , Y = 366 , NpcId = 2777 , Range = 3},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "184KragaAggro"},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		FigureInRange{X = 411 , Y = 366 , NpcId = 2778 , Range = 3},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "184KragaAggro"},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		FigureInRange{X = 411 , Y = 366 , NpcId = 2779 , Range = 3},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "184KragaAggro"},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		FigureInRange{X = 411 , Y = 366 , NpcId = 2780 , Range = 3},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "184KragaAggro"},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		FigureInRange{X = 411 , Y = 366 , NpcId = 2781 , Range = 3},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "184KragaAggro"},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		FigureInRange{X = 407 , Y = 386 , NpcId = 2782 , Range = 3},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "184KragaAggro"},
	}
}
--Kraga Aggro Event
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagTrue{Name = "184KragaAggro" , UpdateInterval = 20},
	},
	Actions =		
	{
		ChangeRace{Race = 113 , NpcId = 2264},
		Goto{X = 413 , Y = 362 , NpcId = 2264 , Range = 5 , WalkMode = Run , GotoMode = GotoNormal},
		SetGlobalFlagTrue{Name = "Q184KragaHomeOff"},
		RemoveDialog{NpcId = 2264},
	}
}
--Kraga wird böse auf MainChar wenn er alles gekillt hat und die Quest aktiv ist
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		FigureJob{Job = idle , NpcId = 2264},
		IsGlobalFlagTrue{Name = "184KragaAggro"},
		QuestState{QuestId = 188 , State = StateActive}
	},
	Actions =		
	{
		AttackTarget{Target = Avatar , NpcId = 2264 , FriendlyFire = TRUE},
	}
}
--Kragas IdleGoHome wieder an
OnEvent
{
	Conditions =	
	{
		IsGlobalFlagTrue{Name = "Q184KragaHomeOff"},
		Negated(PlayerUnitInRange{X = 411 , Y = 366 , FigureType = FigureAll , Range = 5}),
	},
	Actions =		
	{
		SetGlobalFlagFalse{Name = "Q184KragaHomeOff"},
	}
}
--Kraga Aggro Outcry

----Kraga schimpft
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagTrue{Name = "184KragaAggro" , UpdateInterval = 5},
		FigureAlive{NpcId = 2264},
	},
	Actions =		
	{
		Outcry{ Tag = "outcryKragaStonebl001", NpcId = 2264, String = "Arr! Diebe! Mein Schatz! Menschling schlecht! Kraga ihn töten und zermalmen wird!", Color = ColorWhite },
	}
}


--KRAGA BLOCK ENDS HERE
--TROLLBANDE (KRAGA) BEGINS HERE
--Spawnen sobald Kraga losgeht, Timer starten
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 188 , State = StateActive},
		IsGlobalFlagFalse{Name = "Q184TrollsSpawning"},
		IsGlobalFlagFalse{Name = "CutsceneRunning"},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalTimeStamp{Name = "Q184TrollsWaitTimer"},
		SetGlobalFlagTrue{Name = "Q184TrollsSpawning"},
	}
}
--Timer up Cutscene starten und IdleGoHome setzen.
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		IsGlobalTimeElapsed{Name = "Q184TrollsWaitTimer" , Seconds = 15 , UpdateInterval = 20}, 
		IsGlobalFlagFalse{Name = "Q184TrollsRunToTreasure"},
		FigureAlive{NpcId = 2775},
		IsGlobalFlagFalse{Name = "184KragaAggro"},
	},
	Actions =		
	{
		SetGlobalTimeStamp{Name = "Q184TrollsCutsceneTimer"},
		SetGlobalFlagTrue{Name = "Q184TrollsRunToTreasure"}, --Reset required
	}
}
--Satz 1 Orgok
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagTrue{Name = "Q184TrollsRunToTreasure", UpdateInterval = 10},
		IsGlobalTimeElapsed{Name = "Q184TrollsCutsceneTimer" , Seconds = 1 , UpdateInterval = 5},
		FigureAlive{NpcId = 2775}, 
	},
	Actions =		
	{
		Outcry{ Tag = "outcryOrgokStonebl001", NpcId = 2775, String = "Da! Dummer Riese ist fort! Jetzt holen wir die Glitzersteine! Los, los!", Color = ColorWhite },
	}
}

--TROLLBANDE (KRAGA) ENDS HERE

-- Quest 395 --- Finde Admantinumsplitter, damit Skarvig ein Gefäß daraus machen kann
-- Q395 / Q402 / Q 404
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 404 , State = StateActive},
		PlayerHasItem{ItemId = 2539},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "Q395PlayerHasShard"}
	}
}
-- ADAMANTINUMSPLITTER-QUEST ENDS HERE


-----------------------------------------------
---------------- PILZQUEST / TWORSNIK ---------

--- Elfenspreizling
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 501 , State = StateActive},
		PlayerHasItem{ItemId = 2697},
	},
	Actions =		
	{
		QuestSolve{ QuestId = 501 }
	}
}

--- Giftstacheling
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 502 , State = StateActive},
		PlayerHasItem{ItemId = 2698},
	},
	Actions =		
	{
		QuestSolve{ QuestId = 502 }
	}
}

--- Weißer Röhrling
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 500 , State = StateActive},
		PlayerHasItem{ItemId = 2696},
	},
	Actions =		
	{
		QuestSolve{ QuestId = 500 }
	}
}

--- Roter Waldling
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 503 , State = StateActive},
		PlayerHasItem{ItemId = 2692},
	},
	Actions =		
	{
		QuestSolve{ QuestId = 503 }
	}
}

--- Gelber Speiling
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 504 , State = StateActive},
		PlayerHasItem{ItemId = 2695},
	},
	Actions =		
	{
		QuestSolve{ QuestId = 504 }
	}
}

--- Schwefelkopf
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 505 , State = StateActive},
		PlayerHasItem{ItemId = 2693},
	},
	Actions =		
	{
		QuestSolve{ QuestId = 505 }
	}
}

--- Magenkrempling
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 508 , State = StateActive},
		PlayerHasItem{ItemId = 2694},
	},
	Actions =		
	{
		QuestSolve{ QuestId = 508 }
	}
}

--- Alle Pilze bis auf Magenkrempling
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 508 , State = StateActive},
		PlayerHasItem{ItemId = 2697},
		PlayerHasItem{ItemId = 2698},
		PlayerHasItem{ItemId = 2696},
		PlayerHasItem{ItemId = 2692},
		PlayerHasItem{ItemId = 2695},
		PlayerHasItem{ItemId = 2693},
	},
	Actions =		
	{
		QuestBegin{ QuestId = 506 },
	}
}

----- Ende Pilzquest / Twornsik
-------------------------------


-------------------------------------------------------
--
--	!!!  II Reaveal Unexplored für Gegner Kamps
--
-------------------------------------------------------
OnPlatformOneTimeEvent
{
	Conditions =	
	{
	},
	Actions =		
	{
		RevealUnExplored {X = 372,Y = 263, Range = 30},
		RevealUnExplored {X = 91,Y = 174, Range = 30},
	}
}
--OneTimeInitAction(		Vanish {NpcId = 2637} )


------------------- EARTHBLADE SOLVER BEGIN
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2544 , Amount = 4},
				QuestState{QuestId = 172 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 172},
				}
}
--Alles
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 172 , State = StateSolved},
				QuestState{QuestId = 173 , State = StateSolved},
				QuestState{QuestId = 174 , State = StateSolved},
				QuestState{QuestId = 175 , State = StateSolved},
				QuestState{QuestId = 176 , State = StateUnknown},
				},
Actions =		{
				QuestBegin{QuestId = 176},
				}
}
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 482 , State = StateActive},
				QuestState{QuestId = 269 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 482},
				}
}
------------------- EARTHBLADE SOLVER END	

EndDefinition()
end
