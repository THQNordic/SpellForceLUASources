function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Spawning direkt beginnen, da Rpg-Karte

PlatformInitAction(		SetGlobalTimeStamp{Name = "SouthernWindwallsTimer"} )

--Queststatus initialisieren

OnOneTimeEvent
{
Conditions	=	{
				QuestState{QuestId = 124 , State = StateUnknown}
				},
Actions =		{
				QuestBegin{QuestId = 124},
				QuestBegin{QuestId = 125},
				QuestBegin{QuestId = 139}
				}
}
OnOneTimeEvent
{
Conditions	=	{
				QuestState{QuestId = 124 , State = StateActive},
				QuestState{QuestId = 139, State = StateUnknown}
				},
Actions =		{
				QuestBegin{QuestId = 139}
				}
}
OnOneTimeEvent
{
Conditions	=	{
				QuestState{QuestId = 125 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 464},
				QuestSolve{QuestId = 125},
				}
}
--DebugInitAction(		SetGlobalFlagTrue{Name = "AfterSpawn"} )

--Rückkehr von Stoneblade? UNNÖTIG, da jetzt nicht mehr NP
---- -Q166-
--OnEvent
--{
--Conditions =	{
--				IsPlayerFlagTrue{Name = "WasOnStoneblade"},
--				QuestState{QuestId = 167 , State = StateActive},
--				},
--Actions =		{
--				SetPlayerFlagFalse{Name = "WasOnStoneblade"},
--				QuestChangeState{QuestId = 167 , State = StateUnknown},
--				QuestChangeState{QuestId = 166 , State = StateUnsolvable},
--				}
--}
--OnEvent
--{
--Conditions =	{
--				IsPlayerFlagTrue{Name = "WasOnStoneblade"},
--				QuestState{QuestId = 168 , State = StateActive},
--				},
--Actions =		{
--				SetPlayerFlagFalse{Name = "WasOnStoneblade"},
--				QuestChangeState{QuestId = 166 , State = StateUnsolvable},
--				QuestChangeState{QuestId = 168 , State = StateUnknown},
--				QuestChangeState{QuestId = 167 , State = StateUnknown},
--				}
--}
--OnEvent
--{
--Conditions =	{
--				IsPlayerFlagTrue{Name = "WasOnStoneblade"},
--				IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
--				},
--Actions =		{
--				SetGlobalFlagFalse{Name = "Q166SetReadyForWrath"},
--				}
--}
--OnEvent
--{
--Conditions =	{
--				QuestState{QuestId = 323 , State = StateActive},
--				PlayerHasItem{ItemId = 2815},
--				},
--Actions =		{
--				SetPlayerFlagFalse{Name = "WasOnStoneblade"},
--				QuestChangeState{QuestId = 323 , State = StateUnknown},
--				TransferItem{TakeItem = 2815, Amount = 1 , Flag = Take},
--				}
--}
--
----KragaQueste fertig Zustand 1
--OnEvent
--{
--Conditions =	{
--				IsPlayerFlagTrue{Name = "WasOnStoneblade"},
--				QuestState{QuestId = 184 , State = StateActive},
--				QuestState{QuestId = 188 , State = StateActive},
--				IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}
--				},
--Actions =		{
--				SetPlayerFlagFalse{Name = "WasOnStoneblade"},
--				SetGlobalFlagFalse{Name = "Q184KragaKilledBraga"},
--				QuestSolve{QuestId = 188},
--				QuestSolve{QuestId = 184},				
--				}
--}
----KragaQueste fertig Zustand 2
--OnEvent
--{
--Conditions =	{
--				IsPlayerFlagTrue{Name = "WasOnStoneblade"},
--				QuestState{QuestId = 184 , State = StateActive},
--				QuestState{QuestId = 188 , State = StateSolved},
--				IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}
--				},
--Actions =		{
--				SetPlayerFlagFalse{Name = "WasOnStoneblade"},
--				SetGlobalFlagFalse{Name = "Q184KragaKilledBraga"},
--				QuestSolve{QuestId = 184},				
--				}
--}
----KragaQueste nicht fertig?
--OnEvent
--{
--Conditions =	{
--				IsPlayerFlagTrue{Name = "WasOnStoneblade"},
--				QuestState{QuestId = 184 , State = StateActive},
--				Negated(QuestState{QuestId = 188 , State = StateSolved}),
--				Negated(QuestState{QuestId = 188 , State = StateActive}),
--				Negated(QuestState{QuestId = 189 , State = StateActive}),
--				},
--Actions =		{
--				SetPlayerFlagFalse{Name = "WasOnStoneblade"},
--				SetGlobalFlagFalse{Name = "Q184KragaKilledBraga"},
--				QuestChangeState{QuestId = 184 , State = StateUnsolvable},
--				QuestChangeState{QuestId = 185 , State = StateUnknown},
--				QuestChangeState{QuestId = 186 , State = StateUnknown},
--				QuestChangeState{QuestId = 187 , State = StateUnknown},
--				}
--}
--
----Trolltruppe zurücksetzen
--OnEvent
--{
--Conditions =	{
--				IsPlayerFlagTrue{Name = "WasOnStoneblade"},
--				IsGlobalFlagTrue{Name = "Q184TrollsRunToTreasure"},
--				IsGlobalFlagTrue{Name = "Q184TrollsSpawning"},
--				},
--Actions =		{
--				SetGlobalFlagFalse{Name = "Q184TrollsRunToTreasure"},
--				SetGlobalFlagFalse{Name = "Q184TrollsSpawning"},
--				}
--}

-- SKARVIG BLOCK BEGINS HERE

--Schalter für Kaltmark_Frage
---- -Q139-
OnToggleEvent
{
OnConditions =	{
				IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
				QuestState{QuestId = 139 , State = StateActive}
				},
OnActions =		{
				SetPlayerFlagTrue{Name = "Q139ColdmarkQuestion"}
				},
OffConditions =	{
				QuestState{QuestId = 139 , State = StateSolved}
				},
OffActions =	{
				SetPlayerFlagFalse{Name = "Q139ColdmarkQuestion"}
				}
}

--Hat er Earthblade und Quest
---- -Q166-
OnToggleEvent
{
OnConditions =	{
				PlayerHasItem{ItemId = 2535},
				QuestState{QuestId = 169 , State = StateActive}
				},
OnActions =		{
				SetPlayerFlagTrue{Name = "Q166HasEarthBlade"}
				},
OffConditions =	{
				Negated(PlayerHasItem{ItemId = 2535}),
				},
OffActions =	{
				SetPlayerFlagFalse{Name = "Q166HasEarthBlade"}
				}
}

-- SKARVIG BLOCK ENDS HERE

-- SKELD BLOCK BEGINS HERE

--Mit Joshua angetreten zum Abmarsch?
---- -Q166-
OnToggleEvent
{
OnConditions =	{
				IsGlobalFlagTrue{Name = "Q138JoshuaAtThane"},
				QuestState{QuestId = 143 , State = StateActive}
				},
OnActions =		{
				SetGlobalFlagTrue{Name = "Q138JoshuaThereForDeparture"}
				},
OffConditions =	{
				Negated(FigureInRange{X = 360 , Y = 475 , NpcId = 2184 , Range = 5}),
				},
OffActions =	{
				SetGlobalFlagFalse{Name = "Q138JoshuaThereForDeparture"}
				}
}
-- SKELD BLOCK ENDS HERE

-- JOSHUA BLOCK BEGINS HERE
--Joshi am Portal halten
OnOneTimeEvent
{
Conditions	=	{
				IsGlobalFlagTrue{Name = "Q138PlayerGotJoshua"}
				},
Actions =		{
				SetGlobalFlagTrue{Name = "Q138JoshuaGotoPortal"}
				}
}
--Joshi am Portal?
OnToggleEvent
{
OnConditions =	{
				FigureInRange{X = 295 , Y = 656 , NpcId = 2184 , Range = 5},
				QuestState{QuestId = 143 , State = StateActive},
				IsGlobalFlagTrue{Name = "Q138JoshuaGotoPortal"}
				},
OnActions =		{
				SetGlobalFlagTrue{Name = "Q138JoshuaAtPortal"}
				},
OffConditions =	{
				Negated(FigureInRange{X = 295 , Y = 656 , NpcId = 2184 , Range = 5}),
				},
OffActions =	{
				SetGlobalFlagFalse{Name = "Q138JoshuaAtPortal"}
				}
}
--Joshi beim Thanen?
OnToggleEvent
{
OnConditions =	{
				FigureInRange{X = 360 , Y = 475 , NpcId = 2184 , Range = 5},
				QuestState{QuestId = 143 , State = StateActive},
				IsGlobalFlagTrue{Name = "Q138JoshuaWalkToThane"}
				},
OnActions =		{
				SetGlobalFlagTrue{Name = "Q138JoshuaAtThane"}
				},
OffConditions =	{
				Negated(FigureInRange{X = 360 , Y = 475 , NpcId = 2184 , Range = 5}),
				},
OffActions =	{
				SetGlobalFlagFalse{Name = "Q138JoshuaAtThane"}
				}
}




--Joshi zurück zum thanen nach getaner Arbeit?
OnOneTimeEvent
{
Conditions =	{
				IsGlobalFlagTrue{Name = "Q138JoshuaRunBackToThane"},
				FigureInRange{X = 360 , Y = 475 , NpcId = 2184 , Range = 2},
				},
Actions =		{
				SetGlobalFlagFalse{Name = "Q138JoshuaRunBackToThane"},
				SetGlobalTimeStamp{Name = "Q138JoshiWaitingForDespawn"},
				}
}
--Und Joshi despawnen
OnOneTimeEvent
{
Conditions =	{
				IsGlobalTimeElapsed{Name = "Q138JoshiWaitingForDespawn" , Seconds = 300},
				QuestState{QuestId = 138 , State = StateSolved},
				},
Actions =		{
				Vanish{NpcId = 2184},
				SetGlobalFlagFalse{Name = "Q143JoshuahasReachedNsidePortal"},
				}
}
---Drachling besiegt?
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 145 , State = StateActive},
				FigureDead{NpcId = 3329},
				},
Actions =		{
				QuestSolve{QuestId = 145},
				QuestBegin{QuestId = 146},
				}
}
	
-- JOSHUA BLOCK ENDS HERE

-- RAGNAR BLOCK BEGINS HERE


--Bei Hoergrs Tod Flag für Rewardabholung setzen
OnOneTimeEvent
{
Conditions =	{
				FigureDead{NpcId = 2189},
				QuestState{QuestId = 159 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 159},
				QuestSolve{QuestId = 148},
				}
}				


--Truppe zur Attacke antreten lassen (flag im Dialog
OnOneTimeEvent
{
Conditions =	{
				IsGlobalFlagTrue{Name = "Q148BeginNightAttack"},
				FigureInRange{X = 269 , Y = 563 , NpcId = 2232 , Range = 0},
				FigureInRange{X = 271 , Y = 563 , NpcId = 2233 , Range = 0},
				FigureInRange{X = 270 , Y = 564 , NpcId = 2234 , Range = 0},
				FigureInRange{X = 269 , Y = 565 , NpcId = 2235 , Range = 0},
				FigureInRange{X = 271 , Y = 565 , NpcId = 2236 , Range = 0},
				FigureInRange{X = 272 , Y = 564 , NpcId = 2237 , Range = 0},
				FigureInRange{X = 270 , Y = 566 , NpcId = 2238 , Range = 0},
				FigureInRange{X = 271 , Y = 567 , NpcId = 2239 , Range = 0},
				FigureInRange{X = 273 , Y = 565 , NpcId = 2240 , Range = 0},
				FigureInRange{X = 272 , Y = 566 , NpcId = 2241 , Range = 0},
				},
Actions =		{
				SetGlobalFlagFalse{Name = "Q148BeginNightAttack"},
				SetGlobalFlagTrue{Name = "Q148NightAttackersMustAttack"},
				}
}

for i = 2232, 2241 do
	OnPlatformOneTimeEvent
	{
	Conditions =	{
				FigureAlive{NpcId = i},
				IsGlobalFlagTrue{Name = "Q148NightAttackersMustAttack", UpdateInterval = 10},
					},
	Actions =		{
				AttackTarget{Target = 2189 , NpcId = i , FriendlyFire = TRUE},
					},
	}
end

-- RAGNAR BLOCK ENDS HERE

-- GUARDIAN BLOCK BEGINS HERE
--Nach öffnen des Tores weiter zum Drachling
---- -Q138-
OnOneTimeEvent
{
Conditions = 	{
				IsGlobalFlagTrue{Name = "Q138GuardianOpeningGate"}, 
				QuestState{QuestId = 144 , State = StateSolved}
				
				},
Actions =		{
				QuestBegin{QuestId = 145},
				}
}
-- GUARDIAN BLOCK ENDS HERE

-- LORDRIM BLOCK BEGINS HERE



--Sammeln der Zutaten für Gift solven
---- -Q151-
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 152 , State = StateSolved , UpdateInterval = 15},
				QuestState{QuestId = 153 , State = StateSolved , UpdateInterval = 15},
				QuestState{QuestId = 154 , State = StateSolved , UpdateInterval = 15},
				QuestState{QuestId = 155 , State = StateSolved , UpdateInterval = 15},
				QuestState{QuestId = 177 , State = StateSolved , UpdateInterval = 15},
								},
Actions =		{
				QuestBegin{QuestId = 178},
				}
}
--Einzelne Zutaten solven
--Beißfarn
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2477},
				QuestState{QuestId = 152 , State = StateActive , UpdateInterval = 15},
				
				},
Actions =		{
				QuestSolve{QuestId = 152},
				}
}
--Weberkraut
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2478},
				QuestState{QuestId = 153 , State = StateActive , UpdateInterval = 15},
				
				},
Actions =		{
				QuestSolve{QuestId = 153},
				}
}
--Silberwind 
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2479},
				QuestState{QuestId = 154 , State = StateActive , UpdateInterval = 15},
				
				},
Actions =		{
				QuestSolve{QuestId = 154},
				}
}
--Schwarzhalm
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2480},
				QuestState{QuestId = 155 , State = StateActive , UpdateInterval = 15},
				
				},
Actions =		{
				QuestSolve{QuestId = 155},
				}
}
--Gift des Dunkelläufers
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2510},
				QuestState{QuestId = 177 , State = StateActive , UpdateInterval = 15},
				
				},
Actions =		{
				QuestSolve{QuestId = 177},
				}
}
-- LORDRIM BLOCK ENDS HERE

-- URIM BLOCK BEGINS HERE
--Zutaten zum Adamntinum solven , Events wegen wiederholbarkeit
---- -Q171-
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
--Einzelne Teile
--Adamantinumsplitter !TO DO! 4 Stück !TO DO! Diesen Solver auch auf die PF des Drops
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
--Steine des ewigen Feuers !TO DO! Diesen Solver auch auf die PF des Drops
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2200 , Amount = 2},
				QuestState{QuestId = 173 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 173},
				}
}
--Dämonenblut !TO DO! Diesen Solver auch auf die PF des Drops
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2540},
				QuestState{QuestId = 174 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 174},
				}
}
--Tränen einses seelenlosen Wesens !TO DO! Diesen Solver auch auf die PF des Drops
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2541},
				QuestState{QuestId = 175 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 175},
				}
}
-- URIM BLOCK ENDS HERE


--MIRIA BLOCK BEGINS HERE
---Prüfen ob der Übergabesatz angezeigt werden kann
OnToggleEvent
{
OnConditions =	{
				IsPlayerFlagTrue{Name = "RipperFurTalkedAbout"},
				PlayerHasItem{ItemId = 2514},
				PlayerHasItem{ItemId = 2320 , Amount = 3},
				},
OnActions =		{
				SetPlayerFlagTrue{Name = "RipperFurTalkAndManes"}
				},
OffConditions =	{
				Negated(PlayerHasItem{ItemId = 2320 , Amount = 3}),
				},
OffActions =	{
				SetPlayerFlagFalse{Name = "RipperFurTalkAndManes"}
				}
}
--Reißerfell gelootet?
OnOneTimeEvent
{
Conditions =	{
				PlayerHasItem{ItemId = 2514},
				},
Actions =		{
				QuestBegin{QuestId = 479},
				QuestBegin{QuestId = 480},
				}
}
--MIRIA BLOCK ENDS HERE

------Q161 WIESSE SCHATTEN BEGINS HERE-------------
OnOneTimeEvent
{
Conditions =	{
				FigureInRangeNpc{TargetNpcId = Avatar, NpcId = 2261 , Range = 5 , UpdateInterval = 20},
				},
Actions =		{
				SetPlayerFlagTrue{Name = "Q161HasSeenWolf"},
				}
}
--Welpe gefunden mit Quest
OnOneTimeEvent
{
Conditions =	{
				IsPlayerFlagTrue{Name = "Q161HasSeenWelp"},
				QuestState{QuestId = 162 , State = StateActive},
				},
Actions =		{
				QuestBegin{QuestId = 163},
				QuestSolve{QuestId = 162},
				}
}
--Welpe gefunden ohne Quest
OnOneTimeEvent
{
Conditions =	{
				IsPlayerFlagTrue{Name = "Q161HasSeenWelp"},
				QuestState{QuestId = 162 , State = StateUnknown},
				},
Actions =		{
				QuestBegin{QuestId = 161},
				QuestBegin{QuestId = 163},
				}
}
------Q161 WIESSE SCHATTEN ENDS HERE-------------

------Q515 DRACHENPANZER BEGINS HERE-------------
--Drachlingschuppen gelooted
OnOneTimeEvent
{
Conditions =	{
				PlayerHasItem{ItemId = 2516},
				QuestState{QuestId = 515 , State = StateUnknown},
				},
Actions =		{
				QuestBegin{QuestId = 515},
				QuestBegin{QuestId = 516},
				}
}
------Q515 DRACHENPANZER ENDS HERE-------------

------Q255 FEINE STOFFE BEGINS HERE-------------
--Dunkle Seide gefunden?
OnOneTimeEvent
{
Conditions =	{
				PlayerHasItem{ItemId = 2511},
				QuestState{QuestId = 524 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 524},
				}
}
--alles da?
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 525 , State = StateSolved},
				QuestState{QuestId = 524 , State = StateSolved},
				QuestState{QuestId = 526 , State = StateUnknown},
				},
Actions =		{
				QuestBegin{QuestId = 526},
				}
}
------Q255 FEINE STOFFE ENDS HERE-------------
EndDefinition()
end
