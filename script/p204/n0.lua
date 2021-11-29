function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



dofile("script/p204/n32320_CutsceneOpener1.lua")	
dofile("script/p204/n32322_CutsceneFlinkundAlyah.lua")	
dofile("script/p204/n32321_CutsceneAlyahNachDryade.lua")
dofile("script/p204/n32323_CutsceneShowdownEmpyria.lua")
dofile("script/p204/n32324_CutscenePalastgarten.lua")
dofile("script/Hadeko.lua")
dofile("script/p204/n0_ItemScript.lua")




--- Quest lösen: Gehe nach Emypria ---
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 809, State = StateActive, UpdateInterval = 10}, 
	},

	Actions =
	{
		QuestSolve {QuestId = 801},
		QuestSolve {QuestId = 809},
		QuestBegin {QuestId = 810},
		QuestBegin {QuestId = 1081},		
		SetRewardFlagTrue { Name = "P204KarteErreicht" },
	}
}


--- Quest lösen: Der Schlüssel des Wachmanns ---
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerHasItem{ItemId = 7052} 
	},

	Actions =
	{
		QuestSolve {QuestId = 864},
	}
}


--- Quest lösen: Gelange in den Palastgarten ---
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 171, Y = 284, Range = 2 , FigureType = Avatar , UpdateInterval = 10}, 
	},

	Actions =
	{
		QuestSolve {QuestId = 816},
		SetRewardFlagTrue {Name = "PalastgartenErreicht"},	
	}
}


--- Quest unlösbar machen: Fluchmünze für Borgo ---
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 1073, State = StateActive, UpdateInterval = 10}, 
		QuestState{QuestId = 1072, State = StateSolved, UpdateInterval = 10}, 
	},
	
	Actions =
	{
		QuestChangeState {QuestId = 1073, State = StateUnsolvable},
	}
}


--- Quest unlösbar machen: Jemanden zum Ablenken der Tempelwache suchen ---
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 943, State = StateActive, UpdateInterval = 10}, 
		IsGlobalFlagTrue{Name = "g_P204_TempeltorOffen"},
	},
	
	Actions =
	{
		QuestChangeState {QuestId = 943, State = StateUnsolvable},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8683"},		
	}
}


--- Quest unlösbar machen: Betrogenen Ehemann ---
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 940, State = StateActive, UpdateInterval = 10}, 
	    IsGlobalFlagTrue {Name = "g_P204_OberstadttorRechtsOffen"},
	},
	
	Actions =
	{
		QuestChangeState {QuestId = 940, State = StateUnsolvable},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10092"},
	}
}


--- Quest unlösbar machen: Wein für die Wachen ---
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 877, State = StateActive, UpdateInterval = 10}, 
	    IsGlobalFlagTrue {Name = "g_P204_OberstadttorLinksOffen"},
	},
	
	Actions =
	{
		QuestChangeState {QuestId = 877, State = StateUnsolvable},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10489"},
	}
}


--- Quest unlösbar machen: Basartor Süd ohne Quest öffnen ---
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 876, State = StateActive, UpdateInterval = 10}, 
	    IsGlobalFlagTrue {Name = "g_P204_BasartorSuedOffen"},
	},
	
	Actions =
	{
		QuestChangeState {QuestId = 876, State = StateUnsolvable},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9023"},
		TransferItem {TakeItem = 7219, Flag = Take},
	}
}


--- Quest unlösbar machen: Basartor Ost ohne Quest öffnen ---
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 881, State = StateActive, UpdateInterval = 10}, 
	    IsGlobalFlagTrue {Name = "g_P204_BasartorOstOffen"},
	},
	
	Actions =
	{
		QuestChangeState {QuestId = 881, State = StateUnsolvable},
		SetGlobalFlagTrue {Name = "g_P204_UrkundeSchonGegeben"},
	}
}


--- Quest lösen: Hauptmann Ishtars Sorgen ---
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 1025, State = StateSolved, UpdateInterval = 10}, 
		QuestState{QuestId = 1026, State = StateSolved, UpdateInterval = 10}, 
	},
	
	Actions =
	{
		QuestSolve {QuestId = 1024},
	}
}

--- Quest lösen: Hauptmann Ishtars Sorgen ---
OnOneTimeEvent
{
	Conditions = 
	{ 
		QuestState{QuestId = 1025, State = StateSolved, UpdateInterval = 10}, 
		QuestState{QuestId = 1026, State = StateUnsolvable, UpdateInterval = 10}, 
	},
		
	Actions =
	{
		QuestSolve {QuestId = 1024},
	}
}


--- Quest lösen: Bardabar ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_BardabarSidequest"},	
		QuestState{QuestId = 967, State = StateSolved, UpdateInterval = 10}, 
		QuestState{QuestId = 968, State = StateSolved, UpdateInterval = 10}, 
		QuestState{QuestId = 969, State = StateSolved, UpdateInterval = 10},		
	},
	
	Actions =
	{
		QuestSolve {QuestId = 966},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10805"},		
	}
}

--- Wachen beim Dryadengarten greifen an ---
OnOneTimeEvent
{
	Conditions = 
	{
	   	PlayerUnitInRange {X = 193, Y = 307, Range = 3, FigureType = Avatar , UpdateInterval = 10},
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_GartenwacheAttacke"},
	}
}

--- Alle Tore zur Oberstadt bewachen anschalten ---
OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_TempeltorBewacht"},
		SetGlobalFlagTrue{Name = "g_P204_UnterstadttorRechtsBewacht"},
		SetGlobalFlagTrue{Name = "g_P204_OberstadttorLinksBewacht"},
		SetGlobalFlagTrue{Name = "g_P204_OberstadttorRechtsBewacht"},
		SetGlobalFlagTrue{Name = "g_P204_BasartorSuedBewacht"},
		SetGlobalFlagTrue{Name = "g_P204_BasartorWestBewacht"},
		SetGlobalFlagTrue{Name = "g_P204_BasartorOstBewacht"},				
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9667"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9668"},
	}
}


--- ArenaKampf abschalten wenn beide Gegner tot sind ---
OnOneTimeEvent
{
	Conditions = 
	{	
		UND9 {FigureDead{ NpcId = 9100}, FigureDead{ NpcId = 9101}, IsGlobalFlagTrue{Name = "g_P204_ArenaKampf"}},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_RundeEinsGeschafft"},
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9102"},
	}
}
 
 
 --- Cutscene Flink & Alyah starten ---
OnOneTimeEvent
{
	Conditions = 
	{
	   	PlayerUnitInRange {X = 168, Y = 197, Range = 6, FigureType = Avatar , UpdateInterval = 10},
		IsGlobalFlagTrue{Name = "g_P204_FlinkHomepointAlyah"},
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_CutsceneFlinkUndAlyah"},
	}
}
 
 
--- Cutscene nach Dryadengarten starten ---
OnOneTimeEvent
{
	Conditions = 
	{
	   	PlayerUnitInRange {X = 183, Y = 197, Range = 6, FigureType = Avatar , UpdateInterval = 10},
		IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"},
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_CutsceneAlyahNachDryadeStart"},
	}
}


--- Cutscene Showdown starten ---
OnOneTimeEvent
{
	Conditions = 
	{
	   	PlayerUnitInRange {X = 327, Y = 167, Range = 10, FigureType = Avatar , UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P204_AlyahAngekommen"},
		IsGlobalFlagTrue {Name = "g_P204_UriasAngekommen"},
		IsGlobalFlagTrue {Name = "g_P204_HaranAngekommen"},		   	
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_CutsceneShowdownStart"},
	}
}


--- Cutscene Palastgarten starten ---
OnOneTimeEvent
{
	Conditions = 
	{
		UND9 {PlayerUnitInRange {X = 162, Y = 315, Range = 7, FigureType = Avatar , UpdateInterval = 10},
			  Negated(PlayerHasItem{ItemId = 7052}),
			  FigureAlive {NpcId = 9964},
    	      FigureAlive {NpcId = 9965}},
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_PalastgartenCutsceneStart"},
	}
}


--- Alle Tore aufmachen und Empyria in Alarm versetzen ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert"},
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_BasartorSuedAufmachen"},
		SetGlobalFlagTrue{Name = "g_P204_UnterstadttorRechtsOffen"},
		SetGlobalFlagTrue{Name = "g_P204_OberstadttorRechtsOffen"},
		SetGlobalFlagTrue{Name = "g_P204_OberstadttorLinksOffen"},
		SetGlobalFlagTrue{Name = "g_P204_BasartorWestAufmachen"},
		SetGlobalFlagTrue{Name = "g_P204_BasartorOstAufmachen"},
		SetGlobalFlagTrue{Name = "g_P204_TempeltorOffen"},	
	}
}


--- Flag setzen wenn der Spieler die Traumweinzutaten hat
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerHasItem{ItemId = 7220},
		PlayerHasItem{ItemId = 7272},
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_SpielerHatTraumweinzutaten"},
	}
}


--- Quest geben "Gelange in den Palastgarten" wenn eins der drei Tore auf ist ---
---Quest lösen "Gelang in den Basar" ---
OnOneTimeEvent
{
	Conditions = 
	{
		ODER9
		{
			IsGlobalFlagTrue{Name = "g_P204_BasartorWestAufmachen"},
			IsGlobalFlagTrue{Name = "g_P204_BasartorSuedAufmachen"},
			IsGlobalFlagTrue{Name = "g_P204_BasartorOstAufmachen"}
		}

	},
	
	Actions =
	{
		QuestBegin{QuestId = 816},
		QuestBegin{QuestId = 949},
		QuestBegin{QuestId = 950},
		QuestSolve{QuestId = 939},
	}
}


--- Counter für besoffenen Gladiator setzen ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_CounterBesoffen"},
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_GladiatorBesoffen"},
		SetGlobalTimeStamp{Name = "c_P204_CounterGladiatorBesoffen"},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterGladiatorBesoffen", Seconds = 15, UpdateInterval = 10},
	},
	
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_GladiatorBesoffen"},
	}
}


--- XP geben, wenn Alle am Portal angekommen sind ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_AlyahAngekommen"},
		IsGlobalFlagTrue {Name = "g_P204_UriasAngekommen"},
		IsGlobalFlagTrue {Name = "g_P204_HaranAngekommen"},		   	
	},
	
	Actions =
	{
		SetRewardFlagTrue {Name = "TruppenZumPortalGesandt"},	
	}
}


--- Krötenspawn wieder aufheben ---
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerHasItem{ItemId = 7303} 
	},

	Actions =
	{
		SetGlobalFlagFalse {Name = "g_P204_KroeteSpawnen"},
	}
}


--- Wachen im Showdown gehen nach 60 Sekunden zurueck in den Palast ---
OnOneTimeEvent
{
	Conditions =
	{
	   	IsGlobalTimeElapsed{Name = "c_P204_CounterShowdownWachenZurueck", Seconds = 60, UpdateInterval = 10}, 
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_Wache1ShowdownZurueck"},
		SetGlobalFlagTrue{Name = "g_P204_Wache2ShowdownZurueck"},
		SetGlobalFlagTrue{Name = "g_P204_Wache3ShowdownZurueck"},
		SetGlobalFlagTrue{Name = "g_P204_Wache4ShowdownZurueck"},
		SetGlobalFlagTrue{Name = "g_P204_Wache5ShowdownZurueck"},
		SetGlobalFlagTrue{Name = "g_P204_Wache6ShowdownZurueck"},										
		SetGlobalFlagTrue{Name = "g_P204_YrmirZurueck"},		
	}
}


--- Borgo ist tot ---
OnOneTimeEvent
{
	Conditions =
	{
	   	FigureDead {NpcId = 11199}, 
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
	}
}


--- Wenn Torwachen bei Arena tot sind Flag für Gladiator setzen ---
OnOneTimeEvent
{
	Conditions =
	{
	   	FigureDead {NpcId = 9098}, 
	   	FigureDead {NpcId = 9099}, 	  
		IsGlobalFlagTrue{Name = "g_P204_UnterstadttorRechtsOffen"},	   	 	
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_ArenawachenTotUndTorAuf"},
	}
}


--- Flag für Haran setzen, wenn er tot ist ---
OnOneTimeEvent
{
	Conditions =
	{
	   	FigureDead {NpcId = 8794}, 
		IsGlobalFlagTrue{Name = "g_P204_HaranKampf"},	   	 	
	},

	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P205_HaranUmspawn"},	
		SetGlobalFlagTrue{Name = "g_P204_HaranTot"},
	}
}


--- Flag für Gladiator setzen, wenn beide Arenawachen tot sind ---
OnOneTimeEvent
{
	Conditions =
	{
	   	FigureDead {NpcId = 9098}, 
	   	FigureDead {NpcId = 9099}, 	  
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_ArenawachenTot"},
	}
}


--- Alarmanlage Bank deaktivieren ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Stein1Deaktiviert"},
		IsGlobalFlagTrue{Name = "g_P204_Stein2Deaktiviert"},
		IsGlobalFlagTrue{Name = "g_P204_Stein3Deaktiviert"},
		IsGlobalFlagTrue{Name = "g_P204_Stein4Deaktiviert"},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_TresortorKeinAlarm"},
		QuestSolve {QuestId = 1027},
		QuestSolve {QuestId = 1082},	
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Stein1Deaktiviert"},
		IsGlobalFlagTrue{Name = "g_P204_Stein2Deaktiviert"},
	},

	Actions =
	{
		ChangeObject{X = 376, Y = 265, Object = 3050}
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Stein3Deaktiviert"},
		IsGlobalFlagTrue{Name = "g_P204_Stein4Deaktiviert"},
	},

	Actions =
	{
		ChangeObject{X = 384, Y = 265, Object = 3050}
	}
}


--- Flag wenn Brigor tot ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_BrigorLebt"},	
		QuestState{QuestId = 1026, State = StateActive},
	   	FigureDead {NpcId = 11185}
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_BrigorKilled"},
	}
}


--- Quest solven Traumstaub für Ishtar ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "gc_P204_CounterTraumstaub", Value = 3, Operator = IsEqual},
	},

	Actions =
	{
		QuestSolve {QuestId = 1025},
	}
}

--- ARNE : Palastqueste wieder abschalten, falls zufälliger Restart nach Erreichen des Dryadenhains ---
OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 810 , State = StateActive},
		Negated(QuestState{QuestId = 846 , State = StateUnknown}),
	},

	Actions =
	{
		QuestSolve {QuestId = 810},
	}
}



----I---------------------------------------I
----I                                       I
----I                                       I
----I              Nebenquest               I
----I                                       I
----I            Stab und Schild            I
----I                                       I
----I                                       I
----I---------------------------------------I

OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 1002, State = StateActive},
		QuestState{QuestId = 1003, State = StateSolved},
		QuestState{QuestId = 1004, State = StateSolved},
		IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 0, Operator = IsEqual}
		
	},
	Actions =
	{
		QuestSolve{QuestId = 1002},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10961"},
	},
}



----I---------------------------------------I
----I                                       I
----I                                       I
----I              Nebenquest               I
----I                                       I
----I            Assassinengilde            I
----I                                       I
----I                                       I
----I---------------------------------------I

--- Yrmir getötet (Quest 1021 "Töte Yrmir")
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 1021, State = StateActive},
		Negated(FigureAlive{NpcId = 11467}),
		IsGlobalFlagTrue{Name = "g_P204_YrmirInGarnison"}
	},
	Actions =
	{
		TransferItem{TakeItem = 7318 , Flag = Take},
		QuestSolve{QuestId = 1021},
		QuestBegin{QuestId = 1022},
	},
}

--- Seth getötet (Quest 1020 "Töte Seth")
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 1020, State = StateActive},
		Negated(FigureAlive{NpcId = 11175 })
	},
	Actions =
	{
		QuestSolve{QuestId = 1020},
		QuestBegin{QuestId = 1023},
		TransferItem{TakeItem = 7318 , Flag = Take}
	}
}


----I---------------------------------------I
----I                                       I
----I                                       I
----I              Nebenquest               I
----I                                       I
----I       Vermächtnis der Zerbiten        I
----I                                       I
----I                                       I
----I---------------------------------------I

OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1036, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 0, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2697, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1036, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 0, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2941, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1036, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 0, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2943, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1036, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 0, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2942, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1037, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 1, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2696, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1037, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 1, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2950, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1037, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 1, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2951, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1037, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 1, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2944, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1037, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 1, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2952, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1037, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 1, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2953, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}



OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1038, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 2, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2695, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1038, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 2, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2947, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1038, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 2, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2946, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1038, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 2, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagFalse{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2945, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		--QuestState{QuestId = 1039, State = StateSolved},
--		IsGlobalCounter{Name ="g_P204_TuomiEquipped", Value = 3, Operator = IsEqual},
		FigureAlive{NpcId = 11251},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotStaff"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotRobe"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotHelmet"},
		IsGlobalFlagTrue{Name = "g_204_TuomiGotShield"},
	},
	Actions = 
	{
		ChangeUnit {Unit = 2694, NpcId = 11251 },
		IncreaseGlobalCounter{Name ="g_P204_TuomiEquipped"}
	},
}


----I---------------------------------------I
----I                                       I
----I                                       I
----I              Nebenquest               I
----I                                       I
----I            Der letzte Dracon          I
----I                                       I
----I                                       I
----I---------------------------------------I


OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 1064, State = StateActive},
		
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11159"},
		SetGlobalFlagTrue {Name = "g_sP204PlayerHasSigil"},
		SetGlobalTimeStamp{Name = "g_tsP204AbfrageSicherungDorkhan"},
	},
}

--Sicherung das tatsächlich das Ausrufezeichen gelöscht wurde bevor das Fragezeichen erscheint.
OnOneTimeEvent
{
	
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "g_tsP204AbfrageSicherungDorkhan", Seconds = 2}, 
	},
	Actions = 
	{
		
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11159"},
		
	},
}

--Wenn man in die Nähe von Dorkhan kommt, bekommt man den Questbucheintrag mit ihm zu sprechen.
OnOneTimeEvent
{
	
	Conditions = 
	{
		
		FigureInRange {X = 153, Y = 249, NpcId = 0, Range = 5}, 
		QuestState {State = StateActive, QuestId = 1064},
	
	},
	Actions = 
	{
		QuestSolve { QuestId = 1064},
		SetRewardFlagTrue { Name = "SQBotschafterGefunden" },
		QuestBegin { QuestId = 1068},
	
	},
}

--Sobald der Spieler das Siegel dem Botschafter nicht übergibt, wird dieser Aggro und verliert seinen Dialog.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP204DorkharAggroAndAssassinsSpawn"},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11159"},
	},
}

--Wenn man Dorkhan das Siegel überlässt.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP204PlayerHasLostSigil", UpdateInterval = 10},
		
	},
	Actions = 
	{
		TransferItem{ TakeItem = 7368, Amount = 1, Flag = Take},
		
		
	},
}

--Wenn Dorkhan und seine Schergen besiegt wurde.
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 11159},
		FigureDead {NpcId = 11483},
		FigureDead {NpcId = 11484},
		FigureDead {NpcId = 11485},
		FigureDead {NpcId = 11486},
		IsGlobalFlagTrue{Name = "g_sP204DorkharAggroAndAssassinsSpawn"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP204SQBotschafterTot"}, 
		QuestSolve { QuestId = 1068},
		SetRewardFlagTrue { Name = "SQBotschafterTot" },
		QuestBegin { QuestId = 1065},
	},
}


--Wenn man Craig das Siegel gibt.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP204NQDraconErfolgreich"},
	},
	Actions = 
	{
		QuestSolve { QuestId = 1068},
		QuestSolve { QuestId = 1065},
		QuestSolve { QuestId = 1061},
		TransferItem{ TakeItem = 7368, Amount = 1, Flag = Take},
		SetRewardFlagTrue { Name = "SQCraigIstBotschafter" },
		
	},
}

--Wenn man Dorkhan das Siegel überlässt und mit Craig geredet hat.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP204NQDraconUnsolveable"},
	},
	Actions = 
	{
		QuestSolve { QuestId = 1068},
		QuestSolve {QuestId = 1065},
		QuestSolve { QuestId = 1061},
		SetRewardFlagTrue { Name = "SQAuftragGescheitert" },
		
	},
}


----I---------------------------------------I
----I                                       I                    I
----I           Bank von Empyria            I
----I                                       I
----I      Adamantinum-Kurs-Bestimmung      I
----I                                       I
----I---------------------------------------I


OnOneTimeEvent
{
	Actions =
	{
		SetGlobalTimeStamp{Name = "g_P204_AdamantiumKurs"},
		RandomizeGlobalCounter {Name = "g_P204_Wechselkurs", MaxValue = 3 },
	},
}


OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "g_P204_AdamantiumKurs", Seconds = 7000},
		Negated(QuestState{QuestId = 972 , State = StateSolved})
	},
	Actions =
	{
		RandomizeGlobalCounter {Name = "g_P204_Wechselkurs", MaxValue = 3 },
		SetGlobalTimeStamp{Name = "g_P204_AdamantiumKurs"},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "g_P204_AdamantiumKurs", Seconds = 7000},
		QuestState{QuestId = 972 , State = StateSolved}
	},
	Actions =
	{
		RandomizeGlobalCounter {Name = "g_P204_Wechselkurs", MaxValue = 3 },
		IncreaseGlobalCounter {Name = "g_P204_Wechselkurs", Step = 4 },
		SetGlobalTimeStamp{Name = "g_P204_AdamantiumKurs"},
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


------------------------------------------------------------------------------
---------------------------- BÜRGER VON EMPYRIA  -----------------------------
---  Das n0 schlägt den Takt und die Bürger laufen zum entsprechenden Punkt
------------------------------------------------------------------------------

OnOneTimeEvent
{
	Conditions=
	{
	},
	Actions =
	{
		 SetGlobalTimeStamp{Name = "g_P204_BuergerTimer"},
	}
}

OnEvent
{
	Conditions = 
	{	
		IsGlobalTimeElapsed {Name = "g_P204_BuergerTimer", Seconds = 50},
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 14, Operator = IsLessOrEqual},
	 },
	Actions = 
	{
		 IncreaseGlobalCounter{Name = "g_P204_BuergerCounter"},
		 SetGlobalTimeStamp{Name = "g_P204_BuergerTimer"},
	},
}


OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "g_P204_BuergerTimer", Seconds = 50},
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 15, Operator = IsEqual},
	 },
	Actions = 
	{
		 ResetGlobalCounter{Name = "g_P204_BuergerCounter"},
		 SetGlobalTimeStamp{Name = "g_P204_BuergerTimer"},
	},
}

----------------------------------------------------------


--- I----------------------------------------I
--- I               Sidequest                I
--- I        Vermächtnis der Zerbiten        I
--- I----------------------------------------I
---
--- 

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_RuneAnktharReturned"},
		QuestState{QuestId = 1034, State = StateActive}

	},
	Actions = 
	{
		QuestSolve{QuestId = 1034}
	}
}


EndDefinition()
end