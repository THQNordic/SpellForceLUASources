function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--dofile("script/p9/n0_CutsceneSkeletonRush.lua")
dofile("script/p9/n2016_CutsceneMarciaEntry.lua")

--DebugInitAction(		SetGlobalFlagTrue{Name = "AfterSpawn"} )
OneTimeInitAction(	SetGlobalState{Name = "Plot" , State = "JourneyTwo" }	)
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 122 , State = StateUnknown},
			},
Actions = 	{
			QuestBegin{QuestId = 122},
			QuestSolve{QuestId = 123},
			QuestBegin{QuestId = 465},
			}
}

OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 123 , State = StateActive},
			},
Actions = 	{
			QuestSolve{QuestId = 123},
			QuestBegin{QuestId = 465},
			}
}

--Vanish der Verstärkung
OneTimeInitAction(Vanish{NpcId = 2086})
OneTimeInitAction(Vanish{NpcId = 2087})
OneTimeInitAction(Vanish{NpcId = 2088})
OneTimeInitAction(Vanish{NpcId = 2089})
OneTimeInitAction(Vanish{NpcId = 2090})
OneTimeInitAction(Vanish{NpcId = 2091})
OneTimeInitAction(Vanish{NpcId = 2095})
OneTimeInitAction(Vanish{NpcId = 2096})


--Prüfen ob dritte Angriffswelle in los ist
---- -Q112-
OnOneTimeEvent
{
	UpdateInterval = 30,
	Conditions =
	{
		QuestState{QuestId = 112 , State = StateActive},
		IsGlobalFlagTrue{Name = "Q112ThirdWaveAttack"},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "Q112ThirdWaveRunTimer"},
	}
}
--Feststellen ob letzte Angriffswelle vernichtet wurde
---- -Q112-

---ErsteWelle platt?
OnOneTimeEvent
{
	UpdateInterval = 30,
	Conditions =
	{
		QuestState{QuestId = 112 , State = StateActive},
		Negated(IsClanSize{Clan = 27 , Size = 5 }),
		IsGlobalFlagTrue {Name = "Q112FirstWaveGo"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "Q112FirstWaveDefeated"},
	}
}

---Zweite Welle platt?
OnOneTimeEvent
{
	UpdateInterval = 30,
	Conditions =
	{
		QuestState{QuestId = 112 , State = StateActive},
		Negated(IsClanSize{Clan = 26 , Size = 5 }),
		IsGlobalFlagTrue {Name = "Q112SecondWaveGo"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "Q112SecondWaveDefeated"},
	}
}
--dritte welle?
OnOneTimeEvent
{
	UpdateInterval = 30,
	Conditions =
	{
		QuestState{QuestId = 112 , State = StateActive},
		Negated(IsClanSize{Clan = 25 , Size = 5 }),
		IsGlobalFlagTrue {Name = "Q112ThirdWaveGo"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "Q112ThirdWaveDefeated"},
	}
}
--Solven für Gegenangriff
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 112 , State = StateActive},
				IsGlobalFlagTrue{Name = "Q112ThirdWaveDefeated"},
				Negated(QuestState{QuestId = 118 , State = StateActive}),
				},
Actions =		{
				QuestSolve{QuestId = 114},
				QuestSolve{QuestId = 115},
				QuestSolve{QuestId = 116},
				QuestSolve{QuestId = 127},
				QuestBegin{QuestId = 120},
				SetRewardFlagTrue{ Name = "SchlachtUmBrunnenfels1"},
				}
}

--Quest wechseln, wenn Untote in der Stadt sind
---- -Q118-
OnOneTimeEvent
{
	UpdateInterval = 30,
	Conditions =	
	{
		EnemyUnitInRange{X = 263 , Y = 353 , NpcId = 2016, Range = 20 , UnitId = 0},
		FigureDead {NpcId = 2019},
		QuestState{QuestId = 112 , State = StateActive},
	},
	Actions =	
	{
		QuestChangeState{QuestId = 114 , State = StateUnsolvable},
		QuestChangeState{QuestId = 115 , State = StateUnsolvable},
		QuestChangeState{QuestId = 116 , State = StateUnsolvable},
		QuestChangeState{QuestId = 127 , State = StateUnsolvable},
		QuestBegin{QuestId = 118},
		QuestBegin{QuestId = 117},
		QuestBegin{QuestId = 119},
	}
}
--Prüfen ob Verstärkung wieder bereit
---- Q118
OnToggleEvent
{
UpdateInterval = 20 ,
OnConditions = 	{
		QuestState{QuestId = 118 , State = StateActive},
		IsGlobalTimeElapsed{Name = "Q118SupportTimer" , Seconds = 300},
		IsGlobalFlagFalse{Name = "Q118SupportReady"},
		FigureDead{NpcId = 2086},
		FigureDead{NpcId = 2087},
		FigureDead{NpcId = 2088},
		FigureDead{NpcId = 2089},
		FigureDead{NpcId = 2090},
		FigureDead{NpcId = 2091},
		FigureDead{NpcId = 2095},
		FigureDead{NpcId = 2096},
		},
OnActions = 	{
		SetGlobalFlagTrue{Name = "Q118SupportReady"},
		},
OffConditions = {
		IsGlobalFlagTrue{Name = "Q118SupportReady"},
		FigureAlive{NpcId = 2086},
--		FigureAlive{NpcId = 2087},
--		FigureAlive{NpcId = 2088},
--		FigureAlive{NpcId = 2089},
--		FigureAlive{NpcId = 2090},
--		FigureAlive{NpcId = 2091},
--		FigureAlive{NpcId = 2095},
--		FigureAlive{NpcId = 2096},
		},
OffActions = 	{
		SetGlobalFlagFalse{Name = "Q118SupportReady"},
		}
}


--Verstärkung Antreten lassen
---- -Q118-
OnToggleEvent
{
UpdateInterval = 20 ,
OnConditions = 	{
		QuestState{QuestId = 118 , State = StateActive},
		IsGlobalFlagTrue{Name = "Q118CalledForSupport"},
		},
OnActions = 	{
		SetGlobalFlagTrue{Name = "Q118ReinforcementsGetReady"},
		SetGlobalFlagFalse{Name = "Q118ReinforcementsMustChangeOwner"},
		Spawn{X = 259 , Y = 475 , NpcId = 2086},
		Spawn{X = 259 , Y = 475 , NpcId = 2087},
		Spawn{X = 259 , Y = 475 , NpcId = 2088},
		Spawn{X = 259 , Y = 475 , NpcId = 2089},
		Spawn{X = 259 , Y = 475 , NpcId = 2090},
		Spawn{X = 259 , Y = 475 , NpcId = 2091},
		Spawn{X = 259 , Y = 475 , NpcId = 2095},
		Spawn{X = 259 , Y = 475 , NpcId = 2096},
		},
OffConditions = {
		FigureInRange{X = 258 , Y = 466 , NpcId = 2086 ,Range = 0},
		FigureInRange{X = 258 , Y = 465 , NpcId = 2087 ,Range = 0},
		FigureInRange{X = 260 , Y = 466 , NpcId = 2088 ,Range = 0},
		FigureInRange{X = 262 , Y = 466 , NpcId = 2089 ,Range = 0},
		FigureInRange{X = 256 , Y = 466 , NpcId = 2090 ,Range = 0},
		FigureInRange{X = 260 , Y = 465 , NpcId = 2091 ,Range = 0},
		FigureInRange{X = 258 , Y = 464 , NpcId = 2095 ,Range = 0},
		FigureInRange{X = 260 , Y = 464 , NpcId = 2096 ,Range = 0},
		},
OffActions = 	{
		SetGlobalFlagFalse{Name = "Q118ReinforcementsGetReady"},
		SetGlobalFlagFalse{Name = "Q118CalledForSupport"},
		SetGlobalFlagTrue{Name = "Q118ReinforcementsMustChangeOwner"},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 2086},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 2087},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 2088},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 2089},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 2090},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 2091},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 2095},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 2096},
		}
}

for i = 2086, 2093 do
	local npc = i
	if i == 2092 then npc = 2095 elseif i == 2093 then npc = 2096 end
	OnPlatformOneTimeEvent
	{
		Conditions = {
			FigureAlive{NpcId = npc},
			IsGlobalFlagTrue{Name = "Q118ReinforcementsMustChangeOwner", UpdateInterval = 10},
		},
		Actions = {
			ChangeOwner{Owner = OwnerPlayer, NpcId = npc},
		},
	}
end


--Quest für Rückeroberung solven
---- -Q118-
OnOneTimeEvent
{
Conditions =	{
		Negated(EnemyUnitInRange{X = 263 , Y = 353 , NpcId = 2016, Range = 20 , UnitId = 0}),
		QuestState{QuestId = 118 , State = StateActive},
		},
Actions =	{
			QuestSolve{QuestId = 118},
			QuestSolve{QuestId = 117},
			QuestSolve{QuestId = 119},
			QuestBegin{QuestId = 116},
			}
}
--Portalerreichen solven
---- -Q120-
OnOneTimeEvent
{
Conditions =	{
				FigureDead{NpcId = 2093},
				QuestState{QuestId = 120, State = StateActive},
				},
Actions =	{
			QuestSolve{QuestId = 120},
			QuestSolve{QuestId = 468},
			QuestBegin{QuestId = 121},
			}
}



--Vormarsch der Blockadetruppe zum Portal , Timer starten
---- -Q120-
OnOneTimeEvent
{
Conditions =	{
				FigureAlive{NpcId = 2019},
				QuestState{QuestId = 120, State = StateSolved},
				},
Actions =	{
			SetGlobalFlagTrue{Name = "Q120TroopsRetakePortal"}
			}
}
----Vormarsch der Blockadetruppe zum Portal, Marschsignal geben
------ -Q120-
--OnOneTimeEvent
--{
--Conditions =	{
--				FigureAlive{NpcId = 2019},
--				QuestState{QuestId = 120, State = StateActive},
--				IsGlobalTimeElapsed{Name = "Q120TroopsGettingReadyForPursuit" ,  Seconds = 360},
--				},
--Actions =	{
--			SetGlobalFlagTrue{Name = "Q120TroopsRetakePortal"}
--			}
--}

--JONIR BLOCK BEGINS HERE

--JONIR BLOCK ENDS HERE

--JOSHUA BLOCK BEGINS HERE
OnOneTimeEvent
{
Conditions =	{
				IsGlobalFlagTrue{Name = "Q143JoshuaWalkToSWPortal"},
				FigureInRange{X = 71 , Y = 239 , NpcId = 2018 , Range = 2},
				},
Actions =		{
				SetGlobalFlagTrue{Name = "Q143JoshuahasReachedNsidePortal"},
				SetGlobalFlagFalse{Name = "Q143JoshuaWalkToSWPortal"},
				Vanish{NpcId = 2018},
				}
}

--JOSHUA BLOCK ENDS HERE


--------------------------- SCHATTENQUEST -------------

--Checker ob Spieler Schattenmanifest hat und Queste
---- -Q417 -Q419 
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 3201 },
		QuestState{QuestId = 419 , State = StateActive}
		},
Actions =	{
		QuestBegin{QuestId = 420},
		QuestSolve{QuestId = 419}
		}
}
--------- SCHATTENQUEST ends here!

----------------------------


---------------- 
---- Prüfen, ob der Spieler das Blut aller drei Monster hat (Blut-Quest) ---
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 2540 },
		PlayerHasItem {ItemId = 3165 },
		PlayerHasItem {ItemId = 3166 },
	},
	Actions =
	{
		SetPlayerFlagTrue {Name = "Q395AllBlood"},
	}
}
-------



--------------------------- ZAUBERWERKQUEST -------------

--Checker ob Spieler Spinnenseide hat und Queste
---- -Q335 -Q343 -Q345 -Q346 
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 3573},
		QuestState{QuestId = 345 , State = StateActive}
		},
Actions =	{
		QuestBegin{QuestId = 346},
		QuestSolve{QuestId = 345}
		}
}
--------- ZAUBERWERKQUEST ends here!


----------- SEELENSTEIN-Quest -------------------------------------
---- Prüfen, ob der Spieler alle fünf Seelensteine und Quest hat  ---
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 2384 },
		PlayerHasItem {ItemId = 2620 },
		PlayerHasItem {ItemId = 2386 },
		PlayerHasItem {ItemId = 2627 },
		PlayerHasItem {ItemId = 2614 },
		QuestState{QuestId = 470 , State = StateActive}
	},
	Actions =
	{
		QuestBegin{QuestId = 471},
		QuestSolve{QuestId = 470}
	}
}
-------
--------- SEELENSTEIN-Quest ends here


----------------------------
-- Spawnfakes für die Blöden Camps mit blöden ANgriffswellen, die dummerweise sowieso wieder rausgeschmissen werden, aber dann packen wir halt alle 80 Npc noch mal von Hand an und ändern in jedem Skript von Hand das spawning, damit sie auch schön in einer Formation stehen



OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 411, Y = 140, Range = 0},
		IsGlobalTimeElapsed {Name = "NorthernWindwallsClaimedTimer", Seconds = 1},
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 409, Y = 145},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 411, Y = 140, Range = 0}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 409, Y = 145, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 409, Y = 145, Length = 3000},
		StopEffect {TargetType = World, X = 409, Y = 145},
	}
}

--Carts Solven
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 468 , State = StateActive},
				IsGlobalFlagTrue{Name = "Q468MonumentLooted"},
				IsGlobalFlagTrue{Name = "Q468AngstCampLooted"},
				IsGlobalFlagTrue{Name = "Q468LeftEastLooted"},
				IsGlobalFlagTrue{Name = "Q468AshCampLooted"},
				IsGlobalFlagTrue{Name = "Q468BlockerLooted"},
				IsGlobalFlagTrue{Name = "Q468LeftWestLooted"},
				IsGlobalFlagTrue{Name = "Q468SideRampLooted"},
				},
Actions =	{
			QuestSolve{QuestId = 468},
			}
}
--Outcrys Northern Windwalls

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "NorthernWindwallsClaimedTimer" , Seconds =  720, UpdateInterval = 10},
--		QuestState{QuestId = 112 , State = StateActive},
	},
	Actions =
	{
		Outcry{ Tag = "outcryJonirNW001", NpcId = 2017, String = "Bald ist es soweit! Die Späher sind zurück! Ihr Heer sammelt sich!", Color = ColorWhite },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "NorthernWindwallsClaimedTimer" , Seconds = 1000 , UpdateInterval = 10},
		QuestState{QuestId = 112 , State = StateActive, UpdateInterval = 10},
		FigureAlive {NpcId = 2019},
	},
	Actions =
	{
		Outcry{ Tag = "outcryGuntharNW001", NpcId = 2019, String = "Ich kann sie bereits hören! Sie sind nah!", Color = ColorWhite },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "NorthernWindwallsClaimedTimer" , Seconds = 720 , UpdateInterval = 10},
		ODER(FigureHasAggro {NpcId = 2059, UpdateInterval = 10}, FigureHasAggro {NpcId = 2037, UpdateInterval = 10}),
		FigureAlive {NpcId = 2019},
	},
	Actions =
	{
		Outcry{ Tag = "outcryGuntharNW002", NpcId = 2019, String = "Da sind sie! Ihr Götter steht uns bei!", Color = ColorWhite },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Q112FirstWaveDefeated", UpdateInterval = 10},
		FigureAlive {NpcId = 2019},
	},
	Actions =
	{
		Outcry{ Tag = "outcryGuntharNW003", NpcId = 2019, String = "Das war die erste Welle! Schöpft neue Kraft! Sie werden bald wieder kommen!"                 , Color = ColorWhite },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Q112FirstWaveDefeated", UpdateInterval = 10},
		IsGlobalTimeElapsed {Name = "NorthernWindwallsClaimedTimer" , Seconds = 1290 , UpdateInterval = 10},
		FigureAlive {NpcId = 2019},
	},
	Actions =
	{
		Outcry{ Tag = "outcryGuntharNW004", NpcId = 2019, String = "Da sind sie wieder! Haltet durch!", Color = ColorWhite },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Q112ThirdWaveDefeated", UpdateInterval = 10},
		FigureAlive {NpcId = 2019},
	},
	Actions =
	{
		Outcry{ Tag = "outcryGuntharNW005", NpcId = 2019, String = "Es ist vorbei! Wir haben es überstanden!", Color = ColorWhite },
		SetGlobalTimeStamp {Name = "NWWOutcry"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "NWWOutcry", Seconds = 30, UpdateInterval = 10},
		FigureAlive {NpcId = 2019},
	},
	Actions =
	{
		Outcry{ Tag = "outcryGuntharNW006", NpcId = 2019, String = "Zum Gegenangriff! Treibt sie zum Portal zurück!", Color = ColorWhite },
	},
}

EndDefinition()
end
