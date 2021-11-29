-->INFO: Obstverkaeufer
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

--Outcries Obstverkäufer.
OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		AvatarInRange {X = 86, Y = 150, Range = 10},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9504, String = "Neueröffnung! Kommt her und staunt!" , Tag = "oca2fruitmerchantP200_002" , Delay = TRUE , Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round6Solved"},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9504, String = "Ein neuer Händler hat eröffnet!" , Tag = "oca2fruitmerchantP200_001" , Delay = TRUE , Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round7Solved"},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9504, String = "Ein neuer Händler hat eröffnet!" , Tag = "oca2fruitmerchantP200_001" , Delay = TRUE , Color = ColorWhite},
	}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P200\n9504_Obstverkaeufer.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "known"},
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_001", String = "Ah ihr seid es wieder?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "known"}),
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_002", String = "Seid gegrüßt, mein Freund."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_003", String = "Ihr habt die richte Wahl getroffen, bei mir findet ihr das köslichste Obst auf ganz Xu!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_004", String = "Aber das beste ist, meine Früchte sind nicht nur köstlich, sie haben auch heilende Wirkung! Und das ohne Aufpreis!"},
			Answer{Tag = "fruitmerchantP200_005PC", String = "Heilendes Obst?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_006", String = "Ja, da staunt Ihr, was? Kommt, kauft etwas, dann könnt Ihr seine wundervolle Wirkung bestaunen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_007", String = "Ein Obstkorb kostet 2000 Gold, zwei 3500. Wieviel wollt ihr haben?"},
			Answer{Tag = "fruitmerchantP200_008PC", String = "2000 Goldstücke für einen Obstkorb? Und das nennt Ihr keinen Aufpreis?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_009", String = "Papperlapapp! Wenn Ihr da im Staube liegt und blutet, dann kann mein Obst vielleicht die Heilung geben, die Ihr dringend benötigt! Ist Euch Euer Leben keine 2000 Goldstücke wert?"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name="known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}),
		},
		Actions = {
			Say{Tag = "oca2fruitmerchantP200_003", String = "Tut mir leid Freund, aber soviel Gold habt Ihr gar nicht!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{12;
		Conditions = {
			Negated(ODER(IsGlobalFlagTrue {Name = "g_sP200Obstkorb1gefuellt"}, UND(IsGlobalFlagTrue {Name = "g_sP200Obstkorb1gefuellt"}, IsGlobalFlagTrue {Name = "g_sP200Obstkorb2gefuellt"}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
			ODER(IsGlobalFlagTrue {Name = "g_sP200Obstkorb1gefuellt"}, UND(IsGlobalFlagTrue {Name = "g_sP200Obstkorb1gefuellt"}, IsGlobalFlagTrue {Name = "g_sP200Obstkorb2gefuellt"})),
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_010", String = "Ihr habt ja Euren letzten Einkauf noch gar nicht aufgegessen! Soll es denn runzilg werden und faulen? Esst es erst auf bevor Ihr Neues kauft! Ts, die Jugend von heute ..."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse {Name = "g_sP200Obstschale1Bestellt"}),
			UND9{PlayerHasMoney {Gold = 3500, Silver = 0, Copper = 0}, IsGlobalFlagFalse {Name = "g_sP200Obstschale1Bestellt"}, IsGlobalFlagFalse {Name = "g_sP2002ObstschalenBestellt"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fruitmerchantP200_011PC", String = "Nun gut ich werde einen Korb für 2000 Gold nehmen.", AnswerId = 15},
			OfferAnswer{Tag = "fruitmerchantP200_013PC", String = "Ich werde zwei Körbe zum Preis von 3500 Gold nehmen.", AnswerId = 18},
			OfferAnswer{Tag = "fruitmerchantP200_015PC", String = "Ich werde es mir überlegen, lebt wohl.", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse {Name = "g_sP200Obstschale1Bestellt"}),
			Negated(UND9{PlayerHasMoney {Gold = 3500, Silver = 0, Copper = 0}, IsGlobalFlagFalse {Name = "g_sP200Obstschale1Bestellt"}, IsGlobalFlagFalse {Name = "g_sP2002ObstschalenBestellt"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fruitmerchantP200_011PC", String = "Nun gut ich werde einen Korb für 2000 Gold nehmen.", AnswerId = 15},
			OfferAnswer{Tag = "fruitmerchantP200_015PC", String = "Ich werde es mir überlegen, lebt wohl.", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse {Name = "g_sP200Obstschale1Bestellt"})),
			UND9{PlayerHasMoney {Gold = 3500, Silver = 0, Copper = 0}, IsGlobalFlagFalse {Name = "g_sP200Obstschale1Bestellt"}, IsGlobalFlagFalse {Name = "g_sP2002ObstschalenBestellt"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fruitmerchantP200_013PC", String = "Ich werde zwei Körbe zum Preis von 3500 Gold nehmen.", AnswerId = 18},
			OfferAnswer{Tag = "fruitmerchantP200_015PC", String = "Ich werde es mir überlegen, lebt wohl.", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse {Name = "g_sP200Obstschale1Bestellt"})),
			Negated(UND9{PlayerHasMoney {Gold = 3500, Silver = 0, Copper = 0}, IsGlobalFlagFalse {Name = "g_sP200Obstschale1Bestellt"}, IsGlobalFlagFalse {Name = "g_sP2002ObstschalenBestellt"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fruitmerchantP200_015PC", String = "Ich werde es mir überlegen, lebt wohl.", AnswerId = 21},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_012", String = "Sehr gut! Wenn ihr das nächste mal in die Arena schreitet achtet auf den Steinaltar mit der Schale ... dort findet Ihr Eure Lieferung!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200Obstschale1Bestellt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_014", String = "Vielen Dank! Achtet auf den Steinaltar in der Arena wenn ihr eine neue Runde wagt!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name= "g_sP2002ObstschalenBestellt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fruitmerchantP200_016", String = "Beehrt mich bald wieder!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end