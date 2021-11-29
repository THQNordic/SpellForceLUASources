-- Stellung für Goblinspiel auswählen

randomseed(tonumber(date("%H%M%S")))
random(100)  -- paarmal durchrandomisieren, da sonst immer dieselbe Zahl rauskommt
random(100)
random(100)
random(100)
random(100)
random(100)
SpielStellung = random(15)
--SpielStellung = 15



function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/Hadeko.lua")

-- Wegpunkte für die Goblins für zum Rumlaufen tuen
g_P208_MonumentX = 114
g_P208_MonumentY = 282
     
g_P208_GraeberNordostenX = 301
g_P208_GraeberNordostenY = 414
     
g_P208_GraeberNordenX = 162
g_P208_GraeberNordenY = 466

g_P208_GraeberSuedenX = 264
g_P208_GraeberSuedenY = 330     

g_P208_GrabWestenX = 75
g_P208_GrabWestenY = 420
     
g_P208_DorfEinsX = 241
g_P208_DorfEinsY = 436
     
g_P208_DorfZweiX = 114 
g_P208_DorfZweiY = 413

g_P208_DorfDreiX = 213
g_P208_DorfDreiY = 377

g_P208_DorfVierX = 179
g_P208_DorfVierY = 329

g_P208_DorfFuenfX = 198
g_P208_DorfFuenfY = 282

-- Die Koordinaten an denen die Vermehrung stattfindet       
g_P208_TeichEinsX = 193
g_P208_TeichEinsY = 437
       
g_P208_TeichZweiX = 224
g_P208_TeichZweiY = 310
       
g_P208_TeichDreiX = 310
g_P208_TeichDreiY = 319
       
g_P208_TeichVierX = 179
g_P208_TeichVierY = 329
       
g_P208_TeichFuenfX = 192
g_P208_TeichFuenfY = 280

-- Da spawnen im Wasser nicht klappt noch mal Koordinaten ausserhalb
g_P208_AmTeichEinsX = 193
g_P208_AmTeichEinsY = 432

g_P208_AmTeichZweiX = 224
g_P208_AmTeichZweiY = 310

g_P208_AmTeichDreiX = 305
g_P208_AmTeichDreiY = 321

g_P208_AmTeichVierX = 179
g_P208_AmTeichVierY = 329

g_P208_AmTeichFuenfX = 192
g_P208_AmTeichFuenfY = 280

OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinEins"},
		SetGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinZwei"},
		SetGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinDrei"},
		SetGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinVier"},
		SetGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinFuenf"},
	}
}


-- Alle Bewacher sind tot also Prinzessinenauftrag gelöst
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 9484},
		FigureDead {NpcId = 9485},
		FigureDead {NpcId = 9486},
		FigureDead {NpcId = 9487},
		FigureDead {NpcId = 9488},
		FigureDead {NpcId = 9489},
		FigureDead {NpcId = 9490},
		FigureDead {NpcId = 9491},
		FigureDead {NpcId = 9492},
		FigureDead {NpcId = 9493},
		FigureDead {NpcId = 9494},
		FigureDead {NpcId = 9495},
		FigureDead {NpcId = 11499},
		FigureDead {NpcId = 11500},
		FigureDead {NpcId = 11501},
		FigureDead {NpcId = 11502},
	},
	Actions =
	{
	}
	
}

-- Gruppe Eins wer ist enthalten
OnToggleEvent
{
	OnConditions =
	{
		FigureDead {NpcId = 9493},
		FigureDead {NpcId = 9494},
		FigureDead {NpcId = 9495},
		FigureDead {NpcId = 11502},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_DemonGruppeEinsTot"},
	},
	OffConditions =
	{
		FigureAlive {NpcId = 9493},
		FigureAlive {NpcId = 9494},
		FigureAlive {NpcId = 9495},
		FigureAlive {NpcId = 11502},
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_DemonGruppeEinsTot"},
	}
}

-- HIermit wird der Respawn für die Gruppe geschaltet
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_DemonGruppeEinsTot"},
		FigureDead {NpcId = 9500},
		IsGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinEins"},
		IsGlobalFlagFalse {Name = "g_P208_PrinzessinEinsTot"}, 
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_RespawnDeBlockerPrinzessinEins"},
	}
}


-- Gruppe Zwei wer ist enthalten
OnToggleEvent
{
	OnConditions =
	{
		FigureDead {NpcId = 9491},
		FigureDead {NpcId = 9492},
		FigureDead {NpcId = 11501},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_DemonGruppeZweiTot"},
	},
	OffConditions =
	{
		FigureAlive {NpcId = 9491},
		FigureAlive {NpcId = 9492},
		FigureAlive {NpcId = 11501},
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_DemonGruppeZweiTot"},
	}
}

-- HIermit wird der Respawn für die Gruppe geschaltet
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_DemonGruppeZweiTot"},
		FigureDead {NpcId = 9499},
		IsGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinZwei"},
		IsGlobalFlagTrue {Name = "g_P208_PrinzessinZweiTot"}, 
		
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_RespawnDeBlockerPrinzessinZwei"}
	}
}




-- Gruppe Drei wer ist enthalten
OnToggleEvent
{
	OnConditions =
	{
		FigureDead {NpcId = 9489},
		FigureDead {NpcId = 9490},
		FigureDead {NpcId = 11500},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_DemonGruppeDreiTot"},
	},
	OffConditions =
	{
		FigureAlive {NpcId = 9489},
		FigureAlive {NpcId = 9490},
		FigureAlive {NpcId = 11500},
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_DemonGruppeDreiTot"},
	}
}
-- HIermit wird der Respawn für die Gruppe geschaltet
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_DemonGruppeDreiTot"},
		FigureDead {NpcId = 9498},
		IsGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinDrei"},
		IsGlobalFlagTrue {Name = "g_P208_PrinzessinDreiTot"}, 
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_RespawnDeBlockerPrinzessinDrei"}
	}
}


-- Gruppe Vier wer ist enthalten

OnToggleEvent
{
	OnConditions =
	{
		FigureDead {NpcId = 9487},
		FigureDead {NpcId = 9488},
		FigureDead {NpcId = 11499},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_DemonGruppeVierTot"},
	},
	OffConditions =
	{
		FigureAlive {NpcId = 9487},
		FigureAlive {NpcId = 9488},
		FigureAlive {NpcId = 11499},
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_DemonGruppeVierTot"},
	}
}

-- HIermit wird der Respawn für die Gruppe geschaltet
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_DemonGruppeVierTot"},
		FigureDead {NpcId = 9497},
		IsGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinVier"},
		IsGlobalFlagTrue {Name = "g_P208_PrinzessinVierTot"}, 
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_RespawnDeBlockerPrinzessinVier"}
	}
}


-- Wenn die Figuren wieder leben darf der DeBlocker nicht mehr aktiv sein
OnToggleEvent
{
	OffConditions =
	{
		FigureAlive {NpcId = 9484},
		FigureAlive {NpcId = 9485},
		FigureAlive {NpcId = 9486},
		
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_DemonGruppeFuenfTot"},
	},
	OnConditions =
	{
		FigureDead {NpcId = 9484},
		FigureDead {NpcId = 9485},
		FigureDead {NpcId = 9486},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_DemonGruppeFuenfTot"},
	}
}


-- HIermit wird der Respawn für die Gruppe geschaltet
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_DemonGruppeFuenfTot"},
		FigureDead {NpcId = 9496},
		IsGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinFuenf"},
		IsGlobalFlagTrue {Name = "g_P208_PrinzessinFuennefTot"}, 
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_RespawnDeBlockerPrinzessinFuenf"}
	}
}


-- Alle Kröten sind frei/auftrag spieler soll es melden starten
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 849, State = StateSolved},
		QuestState {QuestId = 850, State = StateSolved},
		QuestState {QuestId = 851, State = StateSolved},
		QuestState {QuestId = 852, State = StateSolved},
		QuestState {QuestId = 853, State = StateSolved},
		IsGlobalFlagTrue {Name = "g_P208_PrinzessinFuennefTot"},
		IsGlobalFlagTrue {Name = "g_P208_PrinzessinVierTot"},
		IsGlobalFlagTrue {Name = "g_P208_PrinzessinDreiTot"},
		IsGlobalFlagTrue {Name = "g_P208_PrinzessinZweiTot"},
		IsGlobalFlagTrue {Name = "g_P208_PrinzessinEinsTot"},
	},
	Actions =
	{
		QuestBegin {QuestId = 854}
	}
}

-- Erstes Werwolfcamp
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name  = "g_P208_EinsWereWolfCamp"},
		
	},
	Actions =
	{
		QuestBegin {QuestId = 856},
		QuestSolve {QuestId = 856},
		SetRewardFlagTrue {Name = "Wolfcamp1Zerstoert "},
	}
}

-- Zweites Werwolfcamp
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name  = "g_P208_ZweiWereWolfCamp"},
		
	},
	Actions =
	{
		QuestBegin {QuestId = 857},
		QuestSolve {QuestId = 857},
		SetRewardFlagTrue {Name = "Wolfcamp2Zerstoert "},
	}
}

-- Drittes Werwolfcamp
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name  = "g_P208_DreiWereWolfCamp"},
		
	},
	Actions =
	{
		QuestBegin {QuestId = 858},
		QuestSolve {QuestId = 858},
		SetRewardFlagTrue {Name = "Wolfcamp3Zerstoert "},
	}
}

-- Viertes Werwolfcamp
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name  = "g_P208_VierWereWolfCamp"},
		
	},
	Actions =
	{
		QuestBegin {QuestId = 859},
		QuestSolve {QuestId = 859},
		SetRewardFlagTrue {Name = "Wolfcamp4Zerstoert "},
	}
}

-- Fuenftes Werwolfcamp
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name  = "g_P208_FuennefWereWolfCamp"},
		
	},
	Actions =
	{
		QuestBegin {QuestId = 860},
		QuestSolve {QuestId = 860},
		SetRewardFlagTrue {Name = "Wolfcamp5Zerstoert "},
	}
}

-- Sechstes Werwolfcamp
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name  = "g_P208_SechsWereWolfCamp"},
		
	},
	Actions =
	{
		QuestBegin {QuestId = 861},
		QuestSolve {QuestId = 861},
		SetRewardFlagTrue {Name = "Wolfcamp6Zerstoert "},
	}
}

-- Siebtes Werwolfcamp
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name  = "g_P208_SiebenWereWolfCamp"},
		
	},
	Actions =
	{
		QuestBegin {QuestId = 1077},
		QuestSolve {QuestId = 1077},
		SetRewardFlagTrue {Name = "Wolfcamp7Zerstoert "},
	}
}

--
--Alle Camps Kaputt
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 856, State = StateSolved},
		QuestState {QuestId = 857, State = StateSolved},
		QuestState {QuestId = 858, State = StateSolved},
		QuestState {QuestId = 859, State = StateSolved},
		QuestState {QuestId = 860, State = StateSolved},
		QuestState {QuestId = 861, State = StateSolved},
		QuestState {QuestId = 1077, State = StateSolved},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_SchnitterSpawnen"},
		QuestBegin {QuestId = 862},
	}
}

-- QuestBelohnung wenn der Surt tot ist
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 9659},
	},
	Actions =
	{
		SetRewardFlagTrue {Name = "KopfloserTodVernichtet"},
	}
}

-- Ist die Gobblinquest vergeben wird ein kleiner Teil der Map aufgedeckt um dem Spieler das Prinzip des Abschnitts etwas verständlicher zu machen
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 863, State = StateActive}
	},
	Actions =
	{
		RevealUnExplored {X = 193, Y = 433, Range = 10},
		RevealUnExplored {X = 271, Y = 326, Range = 10},
		SetGlobalTimeStamp {Name = "gt_P208_GobllinSpawning"}
	}
}




-- Der Initiator ist verschwunden und die anderen Einheiten sind gespawnt, dann wird das Wasserflag zurückgesetzt
OnToggleEvent
{
	OffConditions =
	{
		FigureDead {NpcId = 9676},
		FigureAlive {NpcId = 9680},
		FigureAlive {NpcId = 9681},
		FigureAlive {NpcId = 9682},
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GoblinEinsAmWasser"},
	},
	OnConditions =
	{
	},
	OnActions =
	{
	}
}

OnToggleEvent
{
	OffConditions =
	{
		ODER9
		{
			FigureAlive {NpcId = 9680},
			FigureAlive {NpcId = 9681},
			FigureAlive {NpcId = 9682}
		}
	},
	OffActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GoblinEinsEinerLebtNoch"},
	},
	OnConditions =
	{
		Negated(
		ODER9
		{
			FigureAlive {NpcId = 9680},
			FigureAlive {NpcId = 9681},
			FigureAlive {NpcId = 9682}
		})
	},
	OnActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GoblinEinsEinerLebtNoch"},
	}
}

-- Hütten zerstört, dann Flag setzen, damit man die Gruppe Goblins ausschalten kann
OnOneTimeEvent
{
	Conditions =
	{
		Negated (BuildingInRange {X = g_P208_DorfEinsX, Y = g_P208_DorfEinsY, Range = 10}),
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_CampEinsKaputt"},
		SetRewardFlagTrue {Name = "Gremlinlager1Zerstoert"},
	}
}


-- Die zweite Gruppe der Goblins, wenn sie tot ist spawnt der kleine wieder
OnToggleEvent
{
	OffConditions =
	{
		ODER9
		{
			UND9
			{
				FigureAlive {NpcId = 9731},
				FigureAlive {NpcId = 9730},
				FigureAlive {NpcId = 9729}
			},
			UND9
			{
				FigureAlive {NpcId = 9728},
				FigureAlive {NpcId = 9727},
				FigureAlive {NpcId = 9726}
			}
		}
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GruppeZweiGoblin"},
	},
	OnConditions =
	{
		ODER9
		{
			UND9
			{
					FigureDead {NpcId = 9731},
					FigureDead {NpcId = 9730},
					FigureDead {NpcId = 9729}
			},
			UND9
			{
					FigureDead {NpcId = 9728},
					FigureDead {NpcId = 9727},
					FigureDead {NpcId = 9726}
			}
		}
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GruppeZweiGoblin"},
	}
}

-- Der Initiator ist verschwunden und die anderen Einheiten sind gespawnt, dann wird das Wasserflag zurückgesetzt
OnToggleEvent
{
	OffConditions =
	{
		FigureDead {NpcId = 9725},
		FigureAlive {NpcId = 9728},
		FigureAlive {NpcId = 9727},
		FigureAlive {NpcId = 9726},
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GoblinZweiAmWasser"},
	},
	OnConditions =
	{
	},
	OnActions =
	{
	}
}

OnToggleEvent
{
	OffConditions =
	{
		ODER9
		{
			FigureAlive {NpcId = 9726},
			FigureAlive {NpcId = 9727},
			FigureAlive {NpcId = 9728}
		}
	},
	OffActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GoblinZweiEinerLebtNoch"},
	},
	OnConditions =
	{
		Negated(
		ODER9
		{
			FigureAlive {NpcId = 9726},
			FigureAlive {NpcId = 9727},
			FigureAlive {NpcId = 9728}
		})
	},
	OnActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GoblinZweiEinerLebtNoch"},
	}
}

-- Hütten zerstört, dann Flag setzen, damit man die Gruppe Goblins ausschalten kann
OnOneTimeEvent
{
	Conditions =
	{
		Negated (BuildingInRange {X = g_P208_DorfZweiX, Y = g_P208_DorfZweiY, Range = 10}),
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_CampZweiKaputt"},
		SetRewardFlagTrue {Name = "Gremlinlager2Zerstoert"},
	}
}

-- Die dritte Gruppe der Goblins, wenn sie tot ist spawnt der kleine wieder
OnToggleEvent
{
	OffConditions =
	{
		ODER9
		{
			UND9
			{
				FigureAlive {NpcId = 9736},
				FigureAlive {NpcId = 9737},
				FigureAlive {NpcId = 9738}
			},
			UND9
			{
				FigureAlive {NpcId = 9733},
				FigureAlive {NpcId = 9734},
				FigureAlive {NpcId = 9735}
			}
		}
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GruppeDreiGoblin"},
	},
	OnConditions =
	{
		ODER9
		{
			UND9
			{
					FigureDead {NpcId = 9736},
					FigureDead {NpcId = 9737},
					FigureDead {NpcId = 9738}
			},
			UND9
			{
					FigureDead {NpcId = 9733},
					FigureDead {NpcId = 9734},
					FigureDead {NpcId = 9735}
			}
		}
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GruppeDreiGoblin"},
	}
}

-- Der Initiator ist verschwunden und die anderen Einheiten sind gespawnt, dann wird das Wasserflag zurückgesetzt
OnToggleEvent
{
	OffConditions =
	{
		FigureDead {NpcId = 9732},
		FigureAlive {NpcId = 9733},
		FigureAlive {NpcId = 9734},
		FigureAlive {NpcId = 9735},
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GoblinDreiAmWasser"},
	},
	OnConditions =
	{
	},
	OnActions =
	{
	}
}

OnToggleEvent
{
	OffConditions =
	{
		ODER9
		{
			FigureAlive {NpcId = 9733},
			FigureAlive {NpcId = 9734},
			FigureAlive {NpcId = 9735}
		}
	},
	OffActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GoblinDreiEinerLebtNoch"},
	},
	OnConditions =
	{
		Negated(
		ODER9
		{
			FigureAlive {NpcId = 9733},
			FigureAlive {NpcId = 9734},
			FigureAlive {NpcId = 9735}
		})
	},
	OnActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GoblinDreiEinerLebtNoch"},
	}
}

-- Hütten zerstört, dann Flag setzen, damit man die Gruppe Goblins ausschalten kann
OnOneTimeEvent
{
	Conditions =
	{
		Negated (BuildingInRange {X = g_P208_DorfDreiX, Y = g_P208_DorfDreiY, Range = 10}),
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_CampDreiKaputt"},
		SetRewardFlagTrue {Name = "Gremlinlager3Zerstoert"},
	}
}


-- Die vierte Gruppe der Goblins, wenn sie tot ist spawnt der kleine wieder
OnToggleEvent
{
	OffConditions =
	{
		ODER9
		{
			UND9
			{
				FigureAlive {NpcId = 9740},
				FigureAlive {NpcId = 9741},
				FigureAlive {NpcId = 9742}
			},
			UND9
			{
				FigureAlive {NpcId = 9743},
				FigureAlive {NpcId = 9744},
				FigureAlive {NpcId = 9745}
			}
		}
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GruppeVierGoblin"},
	},
	OnConditions =
	{
		ODER9
		{
			UND9
			{
					FigureDead {NpcId = 9740},
					FigureDead {NpcId = 9741},
					FigureDead {NpcId = 9742}
			},
			UND9
			{
					FigureDead {NpcId = 9743},
					FigureDead {NpcId = 9744},
					FigureDead {NpcId = 9745}
			}
		}
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GruppeVierGoblin"},
	}
}

-- Der Initiator ist verschwunden und die anderen Einheiten sind gespawnt, dann wird das Wasserflag zurückgesetzt
OnToggleEvent
{
	OffConditions =
	{
		FigureDead {NpcId = 9739},
		FigureAlive {NpcId = 9740},
		FigureAlive {NpcId = 9741},
		FigureAlive {NpcId = 9742},
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GoblinVierAmWasser"},
	},
	OnConditions =
	{
	},
	OnActions =
	{
	}
}

OnToggleEvent
{
	OffConditions =
	{
		ODER9
		{
			FigureAlive {NpcId = 9740},
			FigureAlive {NpcId = 9741},
			FigureAlive {NpcId = 9742}
		}
	},
	OffActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GoblinVierEinerLebtNoch"},
	},
	OnConditions =
	{
		Negated(
		ODER9
		{
			FigureAlive {NpcId = 9740},
			FigureAlive {NpcId = 9741},
			FigureAlive {NpcId = 9742}
		})
	},
	OnActions =
	{
		SetGlobalFlagFalse {Name = "g_P208_GoblinVierEinerLebtNoch"},
	}
}

-- Hütten zerstört, dann Flag setzen, damit man die Gruppe Goblins ausschalten kann
OnOneTimeEvent
{
	Conditions =
	{
		Negated (BuildingInRange {X = g_P208_DorfVierX, Y = g_P208_DorfVierY, Range = 10}),
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_CampVierKaputt"},
		SetRewardFlagTrue {Name = "Gremlinlager4Zerstoert"},
	}
}

-- Hütten zerstört, dann Flag setzen, damit man die Gruppe Goblins ausschalten kann
OnOneTimeEvent
{
	Conditions =
	{
		Negated (BuildingInRange {X = g_P208_DorfFuenfX, Y = g_P208_DorfFuenfY, Range = 10}),
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_CampFuenfKaputt"},
		SetRewardFlagTrue {Name = "Gremlinlager5Zerstoert"},
	}
}

-- Ist der Spieler in der Nähe des Wassers, wenn eine Verwandlung stattfindet wird Questbucheintrag gemacht
OnOneTimeEvent
{
	Conditions =
	{
		AvatarInRange {X = g_P208_TeichEinsX, Y = g_P208_TeichEinsY, Range = 7},
		FigureInRange {X = g_P208_TeichEinsX, Y = g_P208_TeichEinsY, Range = 2, NpcId = 9676},
		QuestState {QuestId = 863, State = StateActive},
		Negated (QuestState {QuestId = 1059, State = StateSolved})
	},
	Actions =
	{
		QuestSolve {QuestId = 1059},
		Outcry {Tag = "oca2argamunP208_001", NpcId = 9506, String = "Hm, das Wasser scheint etwas zu bewirken!", Color = ColorWhite}, 
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		AvatarInRange {X = g_P208_TeichZweiX, Y = g_P208_TeichZweiY, Range = 7},
		FigureInRange {X = g_P208_TeichZweiX, Y = g_P208_TeichZweiY, Range = 2, NpcId = 9725},
		QuestState {QuestId = 863, State = StateActive},
		Negated (QuestState {QuestId = 1059, State = StateSolved})
	},
	Actions =
	{
		QuestSolve {QuestId = 1059},
		Outcry {Tag = "oca2argamunP208_001", NpcId = 9506, String = "Hm, das Wasser scheint etwas zu bewirken!", Color = ColorWhite}, 
	}
	
	
}

OnOneTimeEvent
{
	Conditions =
	{
		AvatarInRange {X = g_P208_TeichDreiX, Y = g_P208_TeichDreiY, Range = 7},
		FigureInRange {X = g_P208_TeichDreiX, Y = g_P208_TeichDreiY, Range = 2, NpcId = 9732},
		QuestState {QuestId = 863, State = StateActive},
		Negated (QuestState {QuestId = 1059, State = StateSolved})
	},
	Actions =
	{
		QuestSolve {QuestId = 1059},
		Outcry {Tag = "oca2argamunP208_001", NpcId = 9506, String = "Hm, das Wasser scheint etwas zu bewirken!", Color = ColorWhite}, 
	}
	
	
}

OnOneTimeEvent
{
	Conditions =
	{
		AvatarInRange {X = g_P208_TeichVierX, Y = g_P208_TeichVierY, Range = 7},
		FigureInRange {X = g_P208_TeichVierX, Y = g_P208_TeichVierY, Range = 2, NpcId = 9739},
		QuestState {QuestId = 863, State = StateActive},
		Negated (QuestState {QuestId = 1059, State = StateSolved})
	},
	Actions =
	{
		QuestSolve {QuestId = 1059},
		Outcry {Tag = "oca2argamunP208_001", NpcId = 9506, String = "Hm, das Wasser scheint etwas zu bewirken!", Color = ColorWhite}, 
	}
	
	
}


-- Wenn sich einer der Gruppe verwandelt und der Avatar in der Nähe ist wird der Eintrag gemacht
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			FigureInRange {X = g_P208_GraeberNordostenX, Y = g_P208_GraeberNordostenY, Range = 2, NpcId = 9743},
			FigureInRange {X = g_P208_GraeberNordostenX, Y = g_P208_GraeberNordostenY, Range = 2, NpcId = 9744},
			FigureInRange {X = g_P208_GraeberNordostenX, Y = g_P208_GraeberNordostenY, Range = 2, NpcId = 9745}
		},
		AvatarInRange {X = g_P208_GraeberNordostenX, Y = g_P208_GraeberNordostenY, Range = 7},
		QuestState {QuestId = 863, State = StateActive},
		Negated (QuestState {QuestId = 1060, State = StateSolved})
	},
	Actions =
	{
		QuestSolve {QuestId = 1060},
		Outcry {Tag = "oca2argamunP208_002", NpcId = 9506, String = "Da, er frisst von der Leiche! Was es wohl bewirkt?", Color = ColorWhite}, 
	}
} 


OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			FigureInRange {X = g_P208_GraeberSuedenX, Y = g_P208_GraeberSuedenY, Range = 2, NpcId = 9729},
			FigureInRange {X = g_P208_GraeberSuedenX, Y = g_P208_GraeberSuedenY, Range = 2, NpcId = 9730},
			FigureInRange {X = g_P208_GraeberSuedenX, Y = g_P208_GraeberSuedenY, Range = 2, NpcId = 9731}
		},
		AvatarInRange {X = g_P208_GraeberSuedenX, Y = g_P208_GraeberSuedenY, Range = 7},
		QuestState {QuestId = 863, State = StateActive},
		Negated (QuestState {QuestId = 1060, State = StateSolved})
	},
	Actions =
	{
		QuestSolve {QuestId = 1060},
		Outcry {Tag = "oca2argamunP208_002", NpcId = 9506, String = "Da, er frisst von der Leiche! Was es wohl bewirkt?", Color = ColorWhite}, 
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			FigureInRange {X = g_P208_GrabWestenX, Y = g_P208_GrabWestenY, Range = 2, NpcId = 9736},
			FigureInRange {X = g_P208_GrabWestenX, Y = g_P208_GrabWestenY, Range = 2, NpcId = 9737},
			FigureInRange {X = g_P208_GrabWestenX, Y = g_P208_GrabWestenY, Range = 2, NpcId = 9738}
		},
		AvatarInRange {X = g_P208_GrabWestenX, Y = g_P208_GrabWestenY, Range = 7},
		QuestState {QuestId = 863, State = StateActive},
		Negated (QuestState {QuestId = 1060, State = StateSolved})
	},
	Actions =
	{
		QuestSolve {QuestId = 1060},
		Outcry {Tag = "oca2argamunP208_002", NpcId = 9506, String = "Da, er frisst von der Leiche! Was es wohl bewirkt?", Color = ColorWhite}, 
	}
}
-- Sind alle Camps befreit gibts noch den Auftrag Argamun davon zu berichten
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_CampEinsKaputt"},
		IsGlobalFlagTrue {Name = "g_P208_CampZweiKaputt"},
		IsGlobalFlagTrue {Name = "g_P208_CampDreiKaputt"},
		IsGlobalFlagTrue {Name = "g_P208_CampVierKaputt"},
		IsGlobalFlagTrue {Name = "g_P208_CampFuenfKaputt"},
		FigureDead {NpcId = 9676},
		FigureDead {NpcId = 9677},
		FigureDead {NpcId = 9678},
		FigureDead {NpcId = 9679},
		FigureDead {NpcId = 9680},
		FigureDead {NpcId = 9681},
		FigureDead {NpcId = 9682},
		FigureDead {NpcId = 9725},
		FigureDead {NpcId = 9726},
		FigureDead {NpcId = 9728},
		FigureDead {NpcId = 9729},
		FigureDead {NpcId = 9730},
		FigureDead {NpcId = 9731},
		FigureDead {NpcId = 9732},
		FigureDead {NpcId = 9734},
		FigureDead {NpcId = 9735},
		FigureDead {NpcId = 9736},
		FigureDead {NpcId = 9737},
		FigureDead {NpcId = 9738},
		FigureDead {NpcId = 9739},
		FigureDead {NpcId = 9740},
		FigureDead {NpcId = 9741},
		FigureDead {NpcId = 9742},
		FigureDead {NpcId = 9743},
		FigureDead {NpcId = 9744},
		FigureDead {NpcId = 9745},
		FigureDead {NpcId = 9732},
	},
	Actions =
	{
		QuestBegin {QuestId = 1079},
	}
}

--!!! fehlt eine Fleischverwandlung ??? im Polishing mal gucken

OnOneTimeEvent
{
	Conditions =
	{
		--IsGlobalFlagTrue {Name = "ArgamunVerwandeltSich"},
		QuestState {QuestId = 1079, State = StateSolved},
	},
	Actions =
	{
		QuestBegin {QuestId = 1078},
		QuestBegin {QuestId = 1086},
	}
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



---IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
---I          Complete Dummy-Event            I
---I           wird nie ausgeführt            I
---I       nur für Scriptparser da            I
---IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII

OnOneTimeEvent
{
	Conditions =
	{	
		IsGlobalFlagTrue{Name = "NonstopNonsens"},
		Negated(IsGlobalFlagTrue{Name = "NonstopNonsens"}),
	},
	Actions =
	{
		Outcry {Tag = "oca2zerbiteghostP208_001",  NpcId = 11464, String = "Das Duell beginnt.", Color = ColorWhite},
		Outcry {Tag = "oca2zerbiteghostP208_002",  NpcId = 11464, String = "Gespielt wird die Stellung des Drachen.", Color = ColorWhite},
		Outcry {Tag = "oca2zerbiteghostP208_003",  NpcId = 11464, String = "Gespielt wird die Stellung des Löwen.", Color = ColorWhite},
		Outcry {Tag = "oca2zerbiteghostP208_004",  NpcId = 11464, String = "Gespielt wird die Stellung des Raben.", Color = ColorWhite},
		Outcry {Tag = "oca2zerbiteghostP208_005",  NpcId = 11464, String = "Gespielt wird die Stellung des Affen.", Color = ColorWhite},
		Outcry {Tag = "oca2zerbiteghostP208_006",  NpcId = 11464, String = "Gespielt wird die Stellung der Ratte.", Color = ColorWhite},
		Outcry {Tag = "oca2zerbiteghostP208_007",  NpcId = 11464, String = "Gespielt wird die Stellung des Widders.", Color = ColorWhite},
		Outcry {Tag = "oca2zerbiteghostP208_008",  NpcId = 11464, String = "Gespielt wird die Stellung des Kraken.", Color = ColorWhite},
		Outcry {Tag = "oca2zerbiteghostP208_009",  NpcId = 11464, String = "Gespielt wird die Stellung der Spinne.", Color = ColorWhite},
		Outcry {Tag = "oca2zerbiteghostP208_010",  NpcId = 11464, String = "Gespielt wird die Stellung des Stiers.", Color = ColorWhite},
		Outcry {Tag =  "oca2zerbiteghostP208_011", NpcId = 11464, String =  "Gespielt wird die Stellung des Greifen.", Color = ColorWhite},
		Outcry {Tag =  "oca2zerbiteghostP208_012", NpcId = 11464, String =  "Gespielt wird die Stellung des Panthers.", Color = ColorWhite},
		Outcry {Tag =  "oca2zerbiteghostP208_013", NpcId = 11464, String =  "Gespielt wird die Stellung der Eidechse.", Color = ColorWhite},
		Outcry {Tag =  "oca2zerbiteghostP208_014", NpcId = 11464, String =  "Gespielt wird die Stellung des Ebers.", Color = ColorWhite},
		Outcry {Tag =  "oca2zerbiteghostP208_015", NpcId = 11464, String =  "Gespielt wird die Stellung des Falken.", Color = ColorWhite},
		Outcry {Tag =  "oca2zerbiteghostP208_016", NpcId = 11464, String =  "Gespielt wird die Stellung der Katze.", Color = ColorWhite}
	}
}


EndDefinition()
end

