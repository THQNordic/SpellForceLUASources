-->INFO: Zerbitengeist
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	Conditions =
	{
		QuestState{ QuestId = 1070, State = StateActive},
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_AllGoHome"}
	},
}

---- Spieler hat verloren ------

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name ="g_Mastergame_YouScrewedUp"},
	},
	Actions =
	{
		Outcry {NpcId = 11464, String = "Zwei Goblins derselben Farbe in ein und derselben Spalte oder Reihe!", Tag = "oca2zerbiteghostP208_017"},
		SetNpcTimeStamp{Name = "npc_OutcryCounter"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name ="g_Mastergame_YouScrewedUp"},
		IsNpcTimeElapsed{Name = "npc_OutcryCounter", Seconds = 10},
	},
	Actions =
	{
		Outcry {NpcId = 11464, String = "Ihr habt verloren und seid als Lügner überführt. Tuomi ist die rechtmäßige Erbin unseres Vermächtnisses!", Tag = "oca2zerbiteghostP208_018"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name ="g_Mastergame_YouScrewedUp"},
		IsNpcTimeElapsed{Name = "npc_OutcryCounter", Seconds = 20},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_Mastergame_AllGoHome"},
		QuestSolve{QuestId = 1070 },
		QuestSolve{QuestId = 1033 },	
	}
}

----------------------------

---- Spieler & Tuomi patt -----

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_PlayerDidFine"},
	},
	Actions =
	{
		Outcry {NpcId = 11464, String = "Patt! Keiner hat gewonnen!", Tag = "oca2zerbiteghostP208_019"},
		SetNpcTimeStamp{Name = "npc_OutcryCounter"},	
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_PlayerDidFine"},
		IsNpcTimeElapsed{Name = "npc_OutcryCounter", Seconds = 10},
	},
	Actions =
	{
		Outcry {NpcId = 11464, String = "Also gebührt auch keinem von Euch Zugang zu unserem Vermächtnis!", Tag = "oca2zerbiteghostP208_020"},	
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_PlayerDidFine"},
		IsNpcTimeElapsed{Name = "npc_OutcryCounter", Seconds = 20},
	},
	Actions =
	{
		Outcry {NpcId = 11464, String = "Gib die Artefakte des blutenden Auges wieder heraus, Schwindlerin.", Tag = "oca2zerbiteghostP208_021"},
		SetGlobalFlagTrue{Name = "g_Mastergame_TuomiUndress"}		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_PlayerDidFine"},
		IsNpcTimeElapsed{Name = "npc_OutcryCounter", Seconds = 30},
	},
	Actions =
	{
		Outcry {Tag = "oca2zerbiteghostP208_022" , NpcId = 11464, String = "Wir werden sie wieder verstecken."},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_PlayerDidFine"},
		IsNpcTimeElapsed{Name = "npc_OutcryCounter", Seconds = 40},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_Mastergame_AllGoHome"},
		QuestSolve{QuestId = 1070 },
		QuestSolve{QuestId = 1033 },
		SetRewardFlagTrue{Name ="MasterGameWon"}
	}
}

----------------------------------


OnOneTimeEvent
{
	Conditions =
	{
		ODER
			(
			ODER9
			{	
				IsGlobalCounter{Name = "g_Mastergame_Spalte1Gruen", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte2Gruen", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte3Gruen", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte4Gruen", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte5Gruen", Value = 2, Operator = IsEqualOrGreater}
		  	},
		  	ODER9
			{
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile1Gruen", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile2Gruen", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile3Gruen", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile4Gruen", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile5Gruen", Value = 2, Operator = IsEqualOrGreater},
			}
		 	)
	},
	Actions =
	{
		SetGlobalFlagTrue{Name ="g_Mastergame_YouScrewedUp"}
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		ODER
			(
			ODER9
			{	
				IsGlobalCounter{Name = "g_Mastergame_Spalte1Gelb", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte2Gelb", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte3Gelb", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte4Gelb", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte5Gelb", Value = 2, Operator = IsEqualOrGreater}
		  	},
		  	ODER9
			{
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile1Gelb", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile2Gelb", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile3Gelb", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile4Gelb", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile5Gelb", Value = 2, Operator = IsEqualOrGreater},
			}
		 	)
	},
	Actions =
	{
		SetGlobalFlagTrue{Name ="g_Mastergame_YouScrewedUp"}
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		ODER
			(
			ODER9
			{	
				IsGlobalCounter{Name = "g_Mastergame_Spalte1Rot", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte2Rot", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte3Rot", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte4Rot", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte5Rot", Value = 2, Operator = IsEqualOrGreater}
		  	},
		  	ODER9
			{
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile1Rot", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile2Rot", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile3Rot", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile4Rot", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile5Rot", Value = 2, Operator = IsEqualOrGreater},
			}
		 	)
	},
	Actions =
	{
		SetGlobalFlagTrue{Name ="g_Mastergame_YouScrewedUp"}
	}
}                                                            

OnOneTimeEvent
{
	Conditions =
	{
		ODER
			(
			ODER9
			{	
				IsGlobalCounter{Name = "g_Mastergame_Spalte1Weiss", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte2Weiss", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte3Weiss", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte4Weiss", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte5Weiss", Value = 2, Operator = IsEqualOrGreater}
		  	},
		  	ODER9
			{
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile1Weiss", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile2Weiss", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile3Weiss", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile4Weiss", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile5Weiss", Value = 2, Operator = IsEqualOrGreater},
			}
		 	)
	},
	Actions =
	{
		SetGlobalFlagTrue{Name ="g_Mastergame_YouScrewedUp"}
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		ODER
			(
			ODER9
			{	
				IsGlobalCounter{Name = "g_Mastergame_Spalte1Braun", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte2Braun", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte3Braun", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte4Braun", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Spalte5Braun", Value = 2, Operator = IsEqualOrGreater}
		  	},
		  	ODER9
			{
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile1Braun", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile2Braun", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile3Braun", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile4Braun", Value = 2, Operator = IsEqualOrGreater},
		  		IsGlobalCounter{Name = "g_Mastergame_Zeile5Braun", Value = 2, Operator = IsEqualOrGreater},
			}
		 	)
	},
	Actions =
	{
		SetGlobalFlagTrue{Name ="g_Mastergame_YouScrewedUp"}
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p208\n11464_Zerbitengeist.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostP208_001", String = "Seid Ihr bereit, Eure Geisteskraft zu beweisen?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerbiteghostP208_002PC", String = "Wie lauten die Regeln dieses Duells?", AnswerId = 4},
			OfferAnswer{Tag = "zerbiteghostP208_012PC", String = "Ich bin bereit. Beginnt das Duell.", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostP208_003", String = "Ihr seht auf dem Feld fünfundzwanzig geschlossene Augen. Von Runde zu Runde werden sich all diese Augen öffnen."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostP208_004", String = "In jeder Runde öffnen sich fünf Augen und Ihr erhaltet fünf Spielfiguren."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostP208_005", String = "Auf jedes der geöffneten Augen müsst Ihr eine Spielfigur platzieren. Das Licht zeigt, auf welches offene Auge die nächste Spielfigur zu stellen ist."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostP208_006", String = "Die Spielfiguren haben verschiedene Farben: grün, gelb, rot, braun und weiß."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostP208_007", String = "Beim Platzieren müsst Ihr darauf achten, dass niemals zwei Spielfiguren derselben Farbe in ein und derselben Reihe oder ein und derselben Spalte stehen dürfen."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostP208_008", String = "Derjenige Spieler, der diese Regel bricht oder aufgrund des Spielverlaufs nicht mehr erfüllen kann, hat das Spiel verloren."},
			Answer{Tag = "zerbiteghostP208_009PC", String = "Das klingt nicht allzu schwierig.", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostP208_010", String = "Generationen von Zerbiten schärften mit diesem Rätsel ihren Geist. Die Reihenfolge, in der sich die Augen öffnen, nennen wir Stellung. Es gibt Hunderte davon, jede von Ihnen bietet eine neue Herausforderung."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostP208_011", String = "Ich werde die passende für Euch heraussuchen."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostP208_013", String = "Wohlan denn! Prüft die Wahrheit Eurer Worte und siegt!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P208_Mastergame_StartMastergame"},
				   RemoveDialog{NpcId = self} ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end