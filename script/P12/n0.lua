function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



dofile("script/p12/n2322_CutsceneUriasTactics.lua")


--Queststatus initialisieren
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 190 , State = StateUnknown},
				},
Actions =		{
				QuestBegin{QuestId = 190},
				QuestBegin{QuestId = 191},
				RevealUnExplored{X = 215 , Y = 282 , Range = 30},
				}
}
--SWindwalls solven
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 142 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 142},
				QuestSolve{QuestId = 124},
				}
}

DebugInitAction(		SetGlobalFlagTrue{Name = "AfterSpawn"} )

--MAIN QUEST GRENZKRIEG Q190 BEGINS HERE
----Betreten der Festung, umschalten auf Urias ansprechen
--OnOneTimeEvent
--{
--Conditions =	{
--				FigureInRange{X = 198 , Y = 280 , NpcId = Avatar , Range = 5},
--				QuestState{QuestId = 191 , State = StateActive},
--				},
--Actions =		{
--				QuestSolve{QuestId = 191},
--				QuestBegin{QuestId = 192},
--				}
--}
--Blockadebruch solven
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 193 , State = StateActive},
				PlayerUnitInRange{X = 269 , Y = 284 , FigureType = FigureAll , Range = 8 , UpdateInterval = 20}
				},
Actions =		{
				QuestSolve{QuestId = 193}
				}
}

--Zihars Tod Solven, weiter nach Osten
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 198 , State = StateActive},
				FigureDead{NpcId = 3257},
				},
Actions =		{
				QuestSolve{QuestId = 198},
				QuestSolve{QuestId = 194},
				QuestSolve{QuestId = 206},
				QuestBegin{QuestId = 483},
				SetRewardFlagTrue{ Name = "Grenzkrieg2Canyon"}
				}
}
--MAIN QUEST GRENZKRIEG Q190 ENDS HERE

--MAIN QUEST MASKE DES BELIAL Q210 BEGINS HERE
OnToggleEvent
{
OnConditions = 	{
				QuestState{QuestId = 219 , State = StateActive},
				},
OnActions =		{
				SetGlobalFlagTrue{Name = "Q210TanGotoChest"}
				},
OffConditions = {
				QuestState{QuestId = 212 , State = StateSolved},
				},
OffActions =	{
				SetGlobalFlagFalse{Name = "Q210TanGotoChest"}
				},
}

--Ist Tan am Chest?
OnToggleEvent
{
OnConditions = 	{
				QuestState{QuestId = 219 , State = StateActive},
				FigureInRange{X = 195 , Y = 299 , NpcId = 2326 , Range = 1},
				},
OnActions =		{
				SetGlobalFlagTrue{Name = "Q210NearMalicorChest"}
				},
OffConditions = {
				QuestState{QuestId = 212 , State = StateSolved},
				},
OffActions =	{
				SetGlobalFlagFalse{Name = "Q210NearMalicorChest"}
				},
}

--Solver Tan
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 219 , State = StateActive},
				PlayerHasItem{ItemId = 2615}
				},
Actions =		{
				QuestSolve{QuestId = 219},
				QuestSolve{QuestId = 212},
				SetRewardFlagTrue{ Name = "MaskeDesBelial1"}
				}
}
--Solver Korhsar
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 216 , State = StateActive},
				PlayerHasItem{ItemId = 2337}
				},
Actions =		{
				QuestSolve{QuestId = 216},
				QuestSolve{QuestId = 215},
				SetRewardFlagTrue{ Name = "MaskeDesBelial2"}
				}
}
--Solver beide Teile
--OnOneTimeEvent
--{
--Conditions = 	{
--				QuestState{QuestId = 211 , State = StateActive},
--				PlayerHasItem{ItemId = 2615},
--				PlayerHasItem{ItemId = 2337},
--				},
--Actions =		{
--				QuestSolve{QuestId = 211},
--				QuestBegin{QuestId = 218},
--				}
--}
-- Solver für Maske gesamt
OnOneTimeEvent
{
Conditions =	{
				PlayerHasItem{ItemId = 2337},
				PlayerHasItem{ItemId = 2615},
				QuestState{QuestId = 212 , State = StateSolved},
				QuestState{QuestId = 215 , State = StateSolved},
				QuestState{QuestId = 218 , State = StateUnknown},
				},
Actions =		{
				QuestSolve{QuestId = 211},
				QuestBegin{QuestId = 218},
				}
}
--Solver und Start für Wisper
OnEvent
{
Conditions =	{
				PlayerHasItem{ItemId = 2337},
				PlayerHasItem{ItemId = 2626},
				PlayerHasItem{ItemId = 2615},
				QuestState{QuestId = 225 , State = StateSolved},
				QuestState{QuestId = 218 , State = StateSolved},
				},
Actions =		{
				QuestBegin{QuestId = 242},
				QuestBegin{QuestId = 247},
				}
}
--MAIN QUEST MASKE DES BELIAL Q210 ENDS HERE

--SIDEQUEST VERRÄTER Q199 BEGINS HERE
--Nach Hinweisen suchen / Karte setzten
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 200 , State = StateActive},
				PlayerHasItem{ItemId = 2616}
				},
Actions =		{
				QuestBegin{QuestId = 201},
				}
}
--Nach Hinweisen suchen / Brief setzten
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2628},
				QuestState{QuestId = 222 , State = StateActive , UpdateInterval = 10},
							},
Actions =		{
				QuestBegin{QuestId = 202}
				}
}
--Morton zu Thurgon gehen lassen
OnToggleEvent
{
OnConditions = 	{
				QuestState{QuestId = 203 , State = StateActive},
				},
OnActions =		{
				SetGlobalFlagTrue{Name = "Q199MortonGotoThurgon"}
				},
OffConditions = {
				QuestState{QuestId = 209 , State = StateSolved},
				},
OffActions =	{
				SetGlobalFlagFalse{Name = "Q199MortonGotoThurgon"}
				},
}
--Thurgon erreicht?
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 203 , State = StateActive},
				FigureInRange{X = 225 , Y = 301 , Range = 3 , NpcId = 2332},
				FigureInRange{X = 223 , Y = 301 , Range = 8 , NpcId = Avatar},
				},
Actions =		{
				QuestSolve{QuestId = 203},
				QuestBegin{QuestId = 204},
				}
}
--Thurgon aggro setzten
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 209 , State = StateActive},
				},
Actions =		{
				ChangeRace{Race = 150 , NpcId = 2324}
				}
}
--Thurgons Tod feststellen
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 209 , State = StateActive},
				FigureDead{NpcId = 2324}
				},
Actions =		{
				QuestSolve{QuestId = 209},
				QuestBegin{QuestId = 205},
				}
}
--SIDEQUEST VERRÄTER Q199 ENDS HERE

----SIDEQUEST QUINTESSENZ Q208 BEGINS HERE
--OnOneTimeEvent
--{
--Conditions = 	{
--				QuestState{QuestId = 223 , State = StateActive},
--				AvatarIsLevel{Level = 22 , Player = self}
--
--				},
--Actions =		{
--				QuestSolve{QuestId = 223},
--				QuestBegin{QuestId = 224},
--				}
--}
----SIDEQUEST QUINTESSENZ Q208 ENDS HERE


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



-- Outcries
OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 180, Y = 283, Range = 10, FigureType = FigureAvatar, UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryRitterGredusk001", NpcId = 2421, String = "Seht! Ein Mensch naht von Westen her! Öffnet das Tor!", Color = ColorWhite },
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 3257},
	},
	Actions =
	{
		Outcry{ Tag = "outcryMalicorGredusk001", NpcId = 2323, String = "Endlich! Befreit mich! Lasst mich hier nicht zurück!", Color = ColorWhite },
	}
}

EndDefinition()
end
