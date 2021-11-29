-->INFO: DariusFrei
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Darius muss für die Cutscene spawnen, damit er (der Schrein) reden kann

SpawnOnlyWhen
{
	X = 70, Y = 212,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UmspawnIntroBone", UpdateInterval = 2},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "n_P213_DariusGesundheit"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "n_P213_DariusGesundheit"},
	},
	Actions =
	{
		--SetHealth {HitPoints = 10},
		Kill {},
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "UmspawnIntroBone"},
		IsNpcFlagFalse {Name = "n_P213_DariusIntro"},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "n_P213_DariusIntro"},
	}
}

Respawn
{
	X = 213,Y = 144, NoSpawnEffect = TRUE,
	WaitTime = 1,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_DariusFrei"},
	},
	Actions =
	{
		ChangeRace {Race = 152}
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P213DariusSentenceOne"},
		IsGlobalFlagTrue{Name = "g_P213DariusSentenceTwo"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10984"},
	}
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p213\n10984_DariusFrei.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
		},
		Actions = {
			Say{Tag = "dariusP213_001", String = "Ich ... ich danke Euch."},
			Answer{Tag = "dariusP213_002PC", String = "Ruht Euch aus! Ihr habt viel Blut verloren!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "dariusP213_004", String = "Ihr müsst die Vereinigung aufhalten!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_003", String = "Ja ... genug um die ganze Welt zu ertränken ..."},
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
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_005PC", String = "Könnt Ihr heimkehren?", AnswerId = 5},
			OfferAnswer{Tag = "dariusP213_017PC", String = "Ist es wahr? Ihr seid Ereon, der Gerechte?", AnswerId = 16},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_005PC", String = "Könnt Ihr heimkehren?", AnswerId = 5},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_017PC", String = "Ist es wahr? Ihr seid Ereon, der Gerechte?", AnswerId = 16},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_005PC", String = "Könnt Ihr heimkehren?", AnswerId = 5},
			OfferAnswer{Tag = "dariusP213_017PC", String = "Ist es wahr? Ihr seid Ereon, der Gerechte?", AnswerId = 16},
		}}

	OnAnswer{4;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_005PC", String = "Könnt Ihr heimkehren?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_017PC", String = "Ist es wahr? Ihr seid Ereon, der Gerechte?", AnswerId = 16},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_006", String = "Ja. Hokans Bann wird schwächer! Ihr habt ihn fast besiegt! Aber er darf sich nicht mit Belial verbinden!"},
			Answer{Tag = "dariusP213_007PC", String = "Wo ist Hokan jetzt!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_008", String = "Er ist in Zarachs großem Saal! Dort bereitet er zusammen mit dem Zirkel seine Vereinigung mit Belial vor!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_009", String = "Die Maske hat ihre volle Kraft erlangt, er hat bereits begonnen sich in Belial zu verwandeln! Haltet ihn auf! Ihr habt die Mittel dazu!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_010", String = "Aber Ihr müsst zuerst Hokan in seine alte Form zurückzwingen, bevor ihr den Phönix freisetzt! Sonst wird er ihn nicht erkennen!"},
			Answer{Tag = "dariusP213_011PC", String = "Das heisst wir müssen gegen Belial kämpfen? Mit unseren gewöhnlichen Waffen?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_012", String = "Noch ist Belial nicht ganz mit Hokan verschmolzen! Noch ist er verwundbar! Ihr könnt zwar Hokan nicht schlagen, aber Ihr könnt Belial damit aus ihm hinaustreiben!"},
			Answer{Tag = "dariusP213_013PC", String = "Einen Halbgott ... besiegen ... ", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_014", String = "Nie ist Menschen eine schwerere Aufgabe gestellt worden, als Eure. Aber nur so wird Hokan wieder in seine menschliche Form zurückkehren!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_015", String = "Dann erst könnt ihr den Phönix freisetzen! Nur er kann Hokan und den Zirkel mit seinem Allfeuer vernichten! Dies ist der einzige Weg."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_016", String = "Das soll Euer letzer Kampf für Eo sein, Freunde! Alle Götter und Geister blicken nun auf euch!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P213DariusSentenceOne"}, QuestSolve {QuestId = 1009}, QuestBegin {QuestId = 1010},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[5]Abgeschaltet"},
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
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_005PC", String = "Könnt Ihr heimkehren?", AnswerId = 5},
			OfferAnswer{Tag = "dariusP213_017PC", String = "Ist es wahr? Ihr seid Ereon, der Gerechte?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_005PC", String = "Könnt Ihr heimkehren?", AnswerId = 5},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_017PC", String = "Ist es wahr? Ihr seid Ereon, der Gerechte?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_018", String = "So nennen mich Eure Schriften. Darius mein Name in der Sprache der Former."},
			Answer{Tag = "dariusP213_019PC", String = "Dann habt Ihr uns in der Schlacht um Fiara geholfen? Ihr habt das Buch geschrieben, das Rohen verändet hat?", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_020", String = "Ja, ich habe Rohen das Buch der Konvokation gegeben, ich habe ihm von Gerechtigkeit und Güte eingeflüstert und ihn befähigt, all die Portale für Euch zu schaffen."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_021", String = "Ich hatte geglaubt ich könnte unbemerkt die Regeln der Götter beugen. Aber meine Brüder und Schwestern waren unerbittlich und stießen mich aus dem Kreis der Wächter aus!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_022", String = "Einige Zeit floh ich vor ihrem Zorn über die Welt. Bis ich das Erwachen des ZIrkels spürte und beschloss dort zu handeln, wo meine Geschwister erneut nur untätig zusehen würden!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_023", String = "Aber ich war ein Dummkopf! Letzten Endes habe ich immer nur Unheil hervogebracht."},
			Answer{Tag = "dariusP213_024PC", String = "Euer Tun hat uns allen eine Welt zum Leben gegeben! Eine Welt, für die es sich zu kämpfen und zu sterben lohnt, Eereon!", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "dariusP213_025PC", String = "Ihr seid der größte Gott von allen, denn Ihr habt euch selbst aufgegeben damit die Völker eine Zukunft haben!", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dariusP213_026", String = "Etwas, das wir gemeinsam haben, mein runengebundener Freund. Mein Weg endet hier, aber Ihr müsst Eurer Schicksal erfüllen!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P213DariusSentenceTwo"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[16]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_005PC", String = "Könnt Ihr heimkehren?", AnswerId = 5},
			OfferAnswer{Tag = "dariusP213_017PC", String = "Ist es wahr? Ihr seid Ereon, der Gerechte?", AnswerId = 16},
		}}

	OnAnswer{25;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_005PC", String = "Könnt Ihr heimkehren?", AnswerId = 5},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dariusP213_017PC", String = "Ist es wahr? Ihr seid Ereon, der Gerechte?", AnswerId = 16},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P213_DariusFrei"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end