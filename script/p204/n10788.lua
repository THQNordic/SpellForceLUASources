-->INFO: Gauner

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}

OnIdleGoHome
{
X = _X, Y = _Y, Direction = 6, Range = 0 , WalkRange = 2 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = {},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
	 	SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10788"},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_GaunerDialogeAn"},
	},

	Actions =
	{
	 	SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10788"},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_Gauner2Kampf"},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10788"},
	}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10788_Gauner.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_Gauner2HatVerkauft"},
		},
		Actions = {
			Say{Tag = "alchemistP204_001", String = "Ah, Ihr! Was gibt es?"},
			Answer{Tag = "alchemistP204_002PC", String = "Ich brauche mehr Traumstaub!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_Gauner2HatVerkauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_003", String = "Na, na, nicht so gierig! ich habe keinen mehr! Zumindest keinen, den ich verkaufen würde."},
			OfferAnswer{Tag = "alchemistP204_004PC", String = "Redet nicht, gebt ihn mir!", AnswerId = 2},
			OfferAnswer{Tag = "alchemistP204_011PC", String = "Ich verstehe. Lebt wohl.", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_005", String = "Beherrscht Euch! Ihr sucht wohl Streit?"},
			OfferAnswer{Tag = "alchemistP204_006PC", String = "Wenn ich dann an den Staub komme, ja, du Wanze!", AnswerId = 3},
			OfferAnswer{Tag = "alchemistP204_009PC", String = "Nein, schon gut, ich gehe.", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_007", String = "Wanze?"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_008", String = "Den Staub bekommt Ihr nicht! Aber den Streit könnt Ihr haben!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_Gauner2Kampf"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_010", String = "Und denkt immer daran, tief durchatmen ..."},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_Gauner2Angebot"}),
		},
		Actions = {
			Say{Tag = "alchemistP204_012", String = "Nun, Freund, Ihr seht so aus, als suchtet Ihr jemand?"},
			Answer{Tag = "alchemistP204_013PC", String = "Ich suche jemand, der sich mit ... Träumen auskennt!", AnswerId = 13},
		}}

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_Gauner2Angebot"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_014", String = "Da seid Ihr bei mir genau richtig, Freund! Ich kann Euch bei all Euren Träumen helfen! Vorausgesetzt Ihr zahlt meinen Preis ..."},
			Answer{Tag = "alchemistP204_015PC", String = "Wieviel kostet etwas Traumstaub?", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_016", String = "Gleich zur Sache, hm? Also gut ..."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_Gauner2Angebot"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_017", String = "Eine Prise Traumstaub kostet Euch 30 Goldstücke, Freund."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 30}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "alchemistP204_031PC", String = "Ich habe keine 30 Goldstücke.", AnswerId = 31},
		}}

	OnAnswer{17;
		Conditions = {
			PlayerHasMoney{Gold = 30},
			IsGlobalFlagTrue {Name = "DiesesFlagWirdNiemalsTrue"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alchemistP204_018PC", String = "30 Goldstücke? Seid Ihr des Wahnsinns fette Beute?", AnswerId = 18},
			OfferAnswer{Tag = "alchemistP204_021PC", String = "Hm, waren auf Euren Kopf nicht 50 Goldstücke ausgesetzt ... ?", AnswerId = 21},
			OfferAnswer{Tag = "alchemistP204_025PC", String = "Ihr seid entlarvt, Made! Ich melde Euch der Wache!", AnswerId = 25},
		}}

	OnAnswer{17;
		Conditions = {
			PlayerHasMoney{Gold = 30},
			Negated(IsGlobalFlagTrue {Name = "DiesesFlagWirdNiemalsTrue"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alchemistP204_018PC", String = "30 Goldstücke? Seid Ihr des Wahnsinns fette Beute?", AnswerId = 18},
			OfferAnswer{Tag = "alchemistP204_021PC", String = "Hm, waren auf Euren Kopf nicht 50 Goldstücke ausgesetzt ... ?", AnswerId = 21},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_019", String = "Das ist allerbester Staub mein Freund, Qualität hat Ihren Preis!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_020", String = "Dann nicht, ganz wie Ihr wollt."},
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
			Say{Tag = "alchemistP204_022", String = "Wartet, wartet! ...Sagen wir 20 Goldstücke, weil Ihr es seid!"},
			Answer{Tag = "alchemistP204_023PC", String = "Ein weiser Entschluss ... ich nehme den Staub.", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_024", String = "Schöne Träume!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 20, Flag = Take}, TransferItem {GiveItem = 7220, Flag = Give}, SetGlobalFlagTrue {Name = "g_P204_Gauner2HatVerkauft"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_026", String = "Made? Ich schneide dir die Zunge heraus, dann ists nichts mehr mit melden!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alchemistP204_027PC", String = "Versucht es nur!", AnswerId = 27},
			OfferAnswer{Tag = "alchemistP204_029PC", String = "Schon gut! Ich verschwinde ...", AnswerId = 29},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_028", String = "Stirb!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_Gauner2Kampf"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_030", String = "Ja, mach das du weg kommst! Du ... Made!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alchemistP204_032", String = "Schade, dann seht zu, dass Ihr sie Euch besorgt, ich lege etwas Staub für Euch zurück"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end