-->INFO: Zerbo
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--- Der Hadeko-Counter
--- 0: Spieler hat noch nicht mit dem Tisch gesprochen
--- 1: Tisch angesprochen, Zerbo erscheint und ist dialogbereit
--- 2: Mit Zerbo gesprochen, ihn zum Duell herausgefordert
--- 3: Zerbo ist despawnt und hat am anderen Hadeko-Tisch Stellung bezogen
--- 4: Das Spiel läuft! Zerbos Zug!
--- 5: Das Spiel läuft! Spielers Zug!
--- 6: Jetzt wird gekämpft bis einer stirbt
--- 7: Nach der Runde ist vor der Runde. Alle Werte zurücksetzen.
--- 8: Schauen, ob 5 Runden vorbei sind. Falls ja, dann Endgame
--- 9: Endgame: Der Kampf tobt
--- 10: Zerbo verschwindet von seinem Tisch
--- 11: Zerbo gibt Belohnung
--- 12: Die Arena wird ausgefegt, Blut und Gedärm mit dicken Schläuchen weggespült


Despawn
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 0, Operator = IsEqual},
	},
	Actions =
	{
	}
}

Respawn
{
	WaitTime = 5, X =_X, Y =_Y,
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 1, Operator = IsEqual},
	},
	Actions =
	{
		RandomizeGlobalCounter{Name = "g_P202_ZerbosNextChoice", MaxValue = 4}, -- der nächste Zug wird immer
																	   			-- einige Zeit im voraus festgelegt
																	   			-- um F7/F9-Cheating zu verhindern
	},
}


OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 2, Operator = IsEqual},
		IsNpcFlagFalse {Name = "SecurityFlag"},
	},
	Actions =
	{
		SetEffect {Effect ="DeMaterialize", TargetType = Figure, NpcId = Self},
		SetNpcFlagTrue {Name = "Dematerializing"},
		SetNpcFlagTrue {Name = "SecurityFlag"},
	}
}


Despawn
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 2, Operator = IsEqual},
		IsNpcFlagTrue {Name = "Dematerializing"},
	},
	Actions =
	{
		SetNpcFlagFalse {Name = "Dematerializing"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		SetNpcFlagFalse {Name = "SecurityFlag"},
	}
}


Respawn
{
	WaitTime = 5, X = 141, Y = 347, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name ="g_P202_PuppetsDurchzaehlen", Value = 12, Operator = IsEqual}, -- Seid ihr alle da?
	},
	Actions =
	{
		RemoveDialog{ NpcId = self},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
	},
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_P202_ZerbosNextChoice", Value = 0, Operator = IsEqual},
		FigureAlive{NpcId = 10815}
	},
	Actions =
	{
		Outcry {NpcId = 10807, String = "Ich spiele den Trickster!", Tag = "oca2zerboP202_001"},
		SetGlobalFlagTrue{Name = "g_P212_EvilTricksterInBattle"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		RandomizeGlobalCounter{Name = "g_P202_ZerbosNextChoice", MaxValue = 4}
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_P202_ZerbosNextChoice", Value = 1, Operator = IsEqual},
		FigureAlive{NpcId = 10816}
	},
	Actions =
	{
		Outcry {NpcId = 10807, String = "Ich spiele den Mentor!", Tag = "oca2zerboP202_002"},
		SetGlobalFlagTrue{Name = "g_P212_EvilMentorInBattle"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		RandomizeGlobalCounter{Name = "g_P202_ZerbosNextChoice", MaxValue = 4}
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_P202_ZerbosNextChoice", Value = 2, Operator = IsEqual},
		FigureAlive{NpcId = 10817},
		Negated(IsGlobalFlagTrue{Name = "g_P212_EvilHeroWasUsed"}),
	},
	Actions =
	{
		Outcry {NpcId = 10807, String = "Ich spiele den Helden!", Tag = "oca2zerboP202_003"},
		SetGlobalFlagTrue{Name = "g_P212_EvilHeroInBattle"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		RandomizeGlobalCounter{Name = "g_P202_ZerbosNextChoice", MaxValue = 4}
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_P202_ZerbosNextChoice", Value = 3, Operator = IsEqual},
		FigureAlive{NpcId = 10818}
	},
	Actions =
	{
		Outcry {NpcId = 10807, String = "Ich spiele den Schatten!", Tag = "oca2zerboP202_004"},
		SetGlobalFlagTrue{Name = "g_P212_EvilShadowInBattle"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		RandomizeGlobalCounter{Name = "g_P202_ZerbosNextChoice", MaxValue = 4}
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_P202_ZerbosNextChoice", Value = 4, Operator = IsEqual},
		FigureAlive{NpcId = 10819}
	},
	Actions =
	{
		Outcry {NpcId = 10807, String = "Ich spiele den Torwächter!", Tag = "oca2zerboP202_005"},
		SetGlobalFlagTrue{Name = "g_P212_EvilDoorkeeperInBattle"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		RandomizeGlobalCounter{Name = "g_P202_ZerbosNextChoice", MaxValue = 4}
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 4, Operator = IsEqual},
		ODER9
		{
		UND9{IsGlobalCounter{Name = "g_P202_ZerbosNextChoice", Value = 4, Operator = IsEqual},
			Negated(FigureAlive{NpcId = 10819})},
		UND9{IsGlobalCounter{Name = "g_P202_ZerbosNextChoice", Value = 3, Operator = IsEqual},
			Negated(FigureAlive{NpcId = 10818})},
		UND9{IsGlobalCounter{Name = "g_P202_ZerbosNextChoice", Value = 2, Operator = IsEqual},
			ODER9{
			Negated(FigureAlive{NpcId = 10817}),
			IsGlobalFlagTrue{Name = "g_P212_EvilHeroWasUsed"}
			}
			},
		UND9{IsGlobalCounter{Name = "g_P202_ZerbosNextChoice", Value = 1, Operator = IsEqual},
			Negated(FigureAlive{NpcId = 10816})},
		UND9{IsGlobalCounter{Name = "g_P202_ZerbosNextChoice", Value = 0, Operator = IsEqual},
			Negated(FigureAlive{NpcId = 10815})},
		},
	},
	Actions =
	{
		RandomizeGlobalCounter{Name = "g_P202_ZerbosNextChoice", MaxValue = 4},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 6, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "g_P212_GoodPuppetDead"},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		SetGlobalFlagFalse{ Name = "g_P212_GoodPuppetDead"},
		Outcry {NpcId = 10807, String = "Diese Runde habe ich gewonnen!", Tag = "oca2zerboP202_006"},
	}
	
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 6, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "g_P212_EvilPuppetDead"},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		SetGlobalFlagFalse{ Name = "g_P212_EvilPuppetDead"},
		Outcry {NpcId = 10807, String = "Diese Runde habt Ihr gewonnen!", Tag = "oca2zerboP202_007"},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 7, Operator = IsEqual},
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P212_PuppetsGetAngry"},
		SetGlobalFlagFalse{Name = "g_P212_EvilDoorkeeperInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_EvilShadowInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_EvilMentorInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_EvilTricksterInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_EvilHeroInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodDoorkeeperInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodShadowInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodMentorInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodTricksterInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodHeroInBattle"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoRundenZaehler"},
	}
	
}


OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 8, Operator = IsEqual},
		IsGlobalCounter{Name ="g_P202_HadekoRundenZaehler", Value = 4, Operator = IsLessOrEqual},
	},
	Actions =
	{
		ResetGlobalCounter{Name = "g_P202_HadekoCounter"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter", Step = 4 },
	}
	
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 8, Operator = IsEqual},
		IsGlobalCounter{Name ="g_P202_HadekoRundenZaehler", Value = 5, Operator = IsEqual},
	},
	Actions =
	{
		Outcry {NpcId = 10807, String = "Fünf Runden sind vorbei. Nun beginnt das Endspiel!", Tag = "oca2zerboP202_008"},
		SetGlobalFlagTrue {Name ="g_P202_HadekoEndgameOn"},
		SetGlobalFlagTrue{Name = "g_P212_EvilDoorkeeperInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_EvilShadowInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_EvilMentorInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_EvilTricksterInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_EvilHeroInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_GoodDoorkeeperInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_GoodShadowInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_GoodMentorInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_GoodTricksterInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_GoodHeroInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_PuppetsGetAngry"},
		SetGlobalFlagTrue{Name = "g_P212_GoodArchmageInBattle"},
		SetGlobalFlagTrue{Name = "g_P212_EvilArchmageInBattle"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
	}	
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 9, Operator = IsEqual},
		Negated(FigureAlive{NpcId = 10814}),
		Negated(FigureAlive{NpcId = 10815}),
		Negated(FigureAlive{NpcId = 10816}),
		Negated(FigureAlive{NpcId = 10817}),
		Negated(FigureAlive{NpcId = 10818}),
		Negated(FigureAlive{NpcId = 10819}),
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		SetGlobalFlagFalse{Name = "g_P212_PuppetsGetAngry"},
		Outcry {NpcId = 10807, String = "All meine Figuren sind geschlagen. Ihr habt das Spiel gewonnen!", Tag = "oca2zerboP202_009"},
		SetGlobalFlagTrue{Name ="g_P202_PlayerWonHadekoGame"},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 9, Operator = IsEqual},
		Negated(FigureAlive{NpcId = 10809}),
		Negated(FigureAlive{NpcId = 10810}),
		Negated(FigureAlive{NpcId = 10811}),
		Negated(FigureAlive{NpcId = 10812}),
		Negated(FigureAlive{NpcId = 10813}),
		Negated(FigureAlive{NpcId = 10808}),
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		SetGlobalFlagFalse{Name = "g_P212_PuppetsGetAngry"},
		Outcry {NpcId = 10807, String = "All Eure Figuren sind geschlagen. Ich habe das Spiel gewonnen!", Tag = "oca2zerboP202_010"},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 10, Operator = IsEqual},
		IsNpcFlagFalse {Name = "SecurityFlag"},
	},
	Actions =
	{
		SetEffect {Effect ="DeMaterialize", TargetType = Figure, NpcId = Self},
		SetNpcFlagTrue {Name = "Dematerializing"},
		SetNpcFlagTrue {Name = "SecurityFlag"},
	}
}


Despawn
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 10, Operator = IsEqual},
		IsNpcFlagTrue {Name = "Dematerializing"},
	},
	Actions =
	{
		SetNpcFlagFalse {Name = "Dematerializing"},
		IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
		SetNpcFlagFalse {Name = "SecurityFlag"},
	}
}

Respawn  -- Zerbo erscheint wieder am Spielertisch und bietet Belohnung an
{
	WaitTime = 5, X =_X, Y =_Y,
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 11, Operator = IsEqual},
	},
	Actions =
	{
	},
}


OnEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 12, Operator = IsEqual},
		IsNpcFlagFalse {Name = "SecurityFlag"},
	},
	Actions =
	{
		SetEffect {Effect ="DeMaterialize", TargetType = Figure, NpcId = Self},
		SetNpcFlagTrue {Name = "Dematerializing"},
		SetNpcFlagTrue {Name = "SecurityFlag"},
	}
}


Despawn
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 12, Operator = IsEqual},
		IsNpcFlagTrue {Name = "Dematerializing"},
	},
	Actions =
	{
		SetNpcFlagFalse {Name = "Dematerializing"},
		SetNpcFlagFalse {Name = "SecurityFlag"},
		SetGlobalFlagTrue {Name = "g_P202_ResetHadekoGame"},
		ResetGlobalCounter{Name = "g_P202_HadekoCounter"},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n10807_Zerbo.txt


	

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
			IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 11, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 11, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P202_PlayerWonHadekoGame"}),
		},
		Actions = {
			Say{Tag = "zerboP202_003", String = "Hm, schade, Ihr habt verloren. Vielleicht habt Ihr das nächste mal mehr Glück? Lasst uns doch noch eine Partie wagen?"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{2;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P202_PlayerWonHadekoGame"},
		},
		Actions = {
			Say{Tag = "zerboP202_001", String = "Gratulation! Ihr habt gesiegt! Ah, wie herrlich gegen einen würdigen Gegner zu spielen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_002", String = "Dafür sollt Ihr reich belohnt werden! Nehmt dies!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 7308, Flag = Give},
			RemoveDialog{NpcId = self},
			RemoveDialog{NpcId = 10806},
			QuestSolve{ QuestId = 1001},
			QuestSolve{ QuestId = 993},
			IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_004", String = " Auf jeden Fall sollt Ihr erst einmal Eure Entlohnung erhalten! Hier!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2907, Flag = Give},
			RemoveDialog{NpcId = self},
			IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_P202_ZerboKnown"},
		},
		Actions = {
			Say{Tag = "zerboP202_005", String = "Ah! Ihr interessiert Euch für das Hadeko-Spiel? Eine gute Wahl!"},
			Answer{Tag = "zerboP202_006PC", String = "Was treibt Ihr hier?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_P202_ZerboKnown"}),
		},
		Actions = {
			Say{Tag = "zerboP202_010", String = "Ah, Ihr seid es wieder!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_007", String = "Seit Generationen warte ich darauf, endlich einmal wieder eine Partie Hadeko zu spielen! Diese Kreaturen hier sind einfach zu ... humorlos dafür!"},
			Answer{Tag = "zerboP202_008PC", String = "Ich habe keine Zeit für Spiele!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_009", String = "Oh, bitte! Ich will nicht wieder Jahrzehnte lang warten! Ich werde Euch auch belohnen! Mein Wort darauf!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			QuestBegin{ QuestId = 993},
			QuestBegin{ QuestId = 994},
			QuestBegin{ QuestId = 995},
			QuestBegin{ QuestId = 996},
			QuestBegin{ QuestId = 997},
			QuestBegin{ QuestId = 998},
			QuestBegin{ QuestId = 999},
			QuestBegin{ QuestId = 1000},
			QuestBegin{ QuestId = 1001},
			SetGlobalFlagTrue{Name = "g_P202_ZerboKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_011", String = "Wollt Ihr eine Partie Hadeko wagen?"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerboP202_012PC", String = "Was ist Hadeko?", AnswerId = 21, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerboP202_025PC", String = "Gut, treten wir gegen einander an!", AnswerId = 35},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_013", String = "Ein uraltes Spiel, das noch von den Formern gespielt wurde! Leider ist es mitsamt Ihrem Volk untergegangen. Schreckliches Pech!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_014", String = "Dies hier ist das letzte Exemplar! Die Fremden, die diese Stadt erbaut hatten, haben es damals zu Studienzwecken hierher gebracht."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_015", String = "Das Spiel ist für zwei Spieler gemacht. Jeder Spieler hat sechs Figuren, die auf dem Spielbrett gegeneinander kämpfen."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_016", String = "Zuerst werden fünf Zweikämpfe ausgefochten, bei denen der Herausforderer eine Figur aufstellt und der andere Spieler einen Kämpfer dagegen schickt."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_017", String = "Nachdem die fünf Zweikämpfe ausgefochten sind, werden alle überlebenden Figuren in einem Endkampf gegeneinander geschickt. Wer zuerst alle Figuren verliert hat auch das Spiel verloren!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_018", String = "Die Figuren sind der Held, der Trickster, der Mentor, der Torwächter, der Schatten und der Erzmagier. Jede Figur hat Stärken und Schwächen, die Ihr erlernen müsst."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_019", String = "Aber ein paar Besonderheiten vorweg: Der Erzmagier tritt nie im Zweikampf auf, er ist Euer Avatar, wenn Ihr so wollt. Er tritt nur im Endkampf an!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_020", String = "Der Held tötet jeden im Zweikampf, scheidet dadurch aber selbst aus!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_021", String = "Der Trickster ist launisch! Er kann schwach und stark erscheinen! Ist er schwach, verliert er gegen die anderen, ist er aber stark gewinnt er gegen alle! nur der Held kann ihn dann noch töten!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_022", String = "An diesem Spielbrett bin ich der Herausforderer, ich stelle also eine Kämpfer auf und Ihr könnt am Hadeko-Spieltisch entscheiden, welche Figur Ihr der meinen entgegen setzen wollt."},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_023", String = "Nach fünf Zweikämpfen beginnt der Endkampf! Wer dann noch siegrech bleibt, hat gewonnen!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_024", String = "Ach ja ... natürlich müsst Ihr erst einmal alle sechs Figuren haben, bevor Ihr spielen könnt! Es sind kleine Puppen, Ihr erkennt sie an ihrer wundervollen Detailtreue!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
			
					Negated(
						UND9{
							PlayerHasItem {ItemId = 7076 },
							PlayerHasItem {ItemId = 7077 },
							PlayerHasItem {ItemId = 7078 },
							PlayerHasItem {ItemId = 7079 },
							PlayerHasItem {ItemId = 7080 },
							PlayerHasItem {ItemId = 7081 },
							}
						)
					,
		},
		Actions = {
			Say{Tag = "zerboP202_026", String = "Ihr habt nicht alle sechs Hadeko Puppen! So können wir nicht spielen!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(
					Negated(
						UND9{
							PlayerHasItem {ItemId = 7076 },
							PlayerHasItem {ItemId = 7077 },
							PlayerHasItem {ItemId = 7078 },
							PlayerHasItem {ItemId = 7079 },
							PlayerHasItem {ItemId = 7080 },
							PlayerHasItem {ItemId = 7081 },
							}
						)
					),
		},
		Actions = {
			Say{Tag = "zerboP202_028", String = "Ihr habt alle Hadeko-Puppen, sehr gut!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_027", String = "Hier in den Landen von Xu sollten noch einige von ihnen zu finden sein! Sucht danach und kommt wieder, wenn Ihr alle habt!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP202_029", String = "Nun zeigt, ob Ihr auch zu spielen wißt! Die Partie beginnt!"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			RemoveDialog{NpcId = self},
			IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}


	EndDefinition()
end