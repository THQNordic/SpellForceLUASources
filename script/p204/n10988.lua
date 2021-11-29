-->INFO: Nandini
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10988"},				
	}
}


OnPlatformOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10988"},
		SetNpcTimeStamp{Name = "npc_P204_NandiniWaitsForNextNepp"},
		CGdsDbVariableSet:new("nfToggleNum1_Npc10988_P204", NpcVariable, FALSE),
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "npc_P204_NandiniWaitsForNextNepp", Seconds = 600},
		IsGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_NandiniFollowAvatar"},
	}
}

OnFollowToggle
{
	Target = Avatar,
	NpcId = self,
	FollowConditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_NandiniFollowAvatar"},
		IsGlobalFlagFalse{Name = "g_P204_NandiniNervNicht"},
	},
	FollowActions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10988"},	
	},
	StopFollowConditions =
	{
		ODER9
		{
		IsGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
		IsGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"}
		},
	},
	StopFollowActions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10988"},
		SetNpcTimeStamp{Name = "npc_P204_NandiniWaitsForNextNepp"}
	}
}

OnEvent -- falls der Spieler Dialog über ESC abbricht, haut Nandini ab
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_NandiniInDialogue"},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10988"},
		SetNpcTimeStamp{Name = "npc_P204_NandiniWaitsForNextNepp"},
		SetGlobalFlagFalse{Name = "g_P204_NandiniInDialogue"},
		SetGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
	},
}

OnIdleGoHome
{
	WalkMode = Run, X = _X, Y = _Y, Direction = 1,
	Conditions =
	{
		IsGlobalFlagFalse{Name = "g_P204_NandiniTearSold"},
		IsGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
	},
	HomeActions =
	{
	},
}


OnIdleGoHome
{
	WalkMode = Run, X = _X, Y = _Y, Direction = 1,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_NandiniTearSold"},
		IsGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
	},
	HomeActions =
	{
		SetGlobalFlagTrue{Name ="g_P202_NandiniDespawn"},
	},
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue{Name ="g_P202_NandiniDespawn"},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10988_Nandini.txt


	

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
			SetGlobalFlagTrue{Name = "g_P204_NandiniInDialogue"},
			RandomizeGlobalCounter{Name = "g_P204_NepperPreise", MaxValue = 126},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			RandomizeGlobalCounter{Name = "g_P204_NepperAngebot", MaxValue = 6},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "g_P204_NepperPreise", Step = 1},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_001", String = "Heh, Ihr da!"},
			Answer{Tag = "nandiniP204_002PC", String = "Wer, ich?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_003", String = "Psst ... ja. Hört mal ..."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_004", String = "Ich habe Euch ein unglaubliches Angebot zu machen!"},
			Answer{Tag = "", String = "", AnswerId = 101},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_005", String = "Ich sehe, Ihr seid interessiert!"},
			Answer{Tag = "", String = "", AnswerId = 9},
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
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 64, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 64, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{11;
		Conditions = {
			PlayerHasMoney{Gold = 400},
		},
		Actions = {
			Say{Tag = "nandiniP204_006", String = "Ich mache Euch ein Angebot: 400 Goldstücke für diesen Gegenstand!"},
			OfferAnswer{Tag = "nandiniP204_007PC", String = "In Ordnung. Ich bezahle.", AnswerId = 12},
			OfferAnswer{Tag = "nandiniP204_008PC", String = "Euren wertlosen Plunder kann ich nicht gebrauchen!", AnswerId = 15},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 400}),
		},
		Actions = {
			Say{Tag = "nandiniP204_006", String = "Ich mache Euch ein Angebot: 400 Goldstücke für diesen Gegenstand!"},
			OfferAnswer{Tag = "nandiniP204_008PC", String = "Euren wertlosen Plunder kann ich nicht gebrauchen!", AnswerId = 15},
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
			TransferMoney{Gold = 400, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
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
			DecreaseGlobalCounter{Name = "g_P204_NepperPreise", Step = 64},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "nandiniP204_009", String = "Ihr wollt feilschen? Nun gut, laßt mich überlegen."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 32, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 32, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasMoney{Gold = 300},
		},
		Actions = {
			Say{Tag = "nandiniP204_010", String = "Für 300 Goldstücke soll der Gegenstand Euch gehören!"},
			OfferAnswer{Tag = "nandiniP204_007PC", String = "In Ordnung. Ich bezahle.", AnswerId = 23},
			OfferAnswer{Tag = "nandiniP204_011PC", String = "Alles, was Ihr sagt, ist Schwindel und Betrug! Lasst mich in Ruhe!", AnswerId = 26},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 300}),
		},
		Actions = {
			Say{Tag = "nandiniP204_010", String = "Für 300 Goldstücke soll der Gegenstand Euch gehören!"},
			OfferAnswer{Tag = "nandiniP204_011PC", String = "Alles, was Ihr sagt, ist Schwindel und Betrug! Lasst mich in Ruhe!", AnswerId = 26},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 300, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			DecreaseGlobalCounter{Name = "g_P204_NepperPreise", Step = 32},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "nandiniP204_012", String = "Nicht zufrieden mit meinem Angebot? Hm ..."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 16, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{32;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 16, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
			PlayerHasMoney{Gold = 200},
		},
		Actions = {
			Say{Tag = "nandiniP204_013", String = "Gebt mir 200 Goldstücke und Ihr könnt den Gegenstand haben."},
			OfferAnswer{Tag = "nandiniP204_007PC", String = "In Ordnung. Ich bezahle.", AnswerId = 34},
			OfferAnswer{Tag = "nandiniP204_014PC", String = "Bleibt mir mit Eurem Tand vom Leib!", AnswerId = 37},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 200}),
		},
		Actions = {
			Say{Tag = "nandiniP204_013", String = "Gebt mir 200 Goldstücke und Ihr könnt den Gegenstand haben."},
			OfferAnswer{Tag = "nandiniP204_014PC", String = "Bleibt mir mit Eurem Tand vom Leib!", AnswerId = 37},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 200, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			DecreaseGlobalCounter{Name = "g_P204_NepperPreise", Step = 16},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "nandiniP204_015", String = "Was? Das ist Euch zu teuer?"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{39;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 8, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{43;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 8, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
			PlayerHasMoney{Gold = 100},
		},
		Actions = {
			Say{Tag = "nandiniP204_016", String = "Ein spezielles Angebot - nur für Euch: 100 Goldstücke für diesen wertvollen Gegenstand!"},
			OfferAnswer{Tag = "nandiniP204_007PC", String = "In Ordnung. Ich bezahle.", AnswerId = 45},
			OfferAnswer{Tag = "nandiniP204_017PC", String = "Sucht Euch jemand anderes, dem Ihr Euren Plunder aufschwatzen könnt.", AnswerId = 48},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 100}),
		},
		Actions = {
			Say{Tag = "nandiniP204_016", String = "Ein spezielles Angebot - nur für Euch: 100 Goldstücke für diesen wertvollen Gegenstand!"},
			OfferAnswer{Tag = "nandiniP204_017PC", String = "Sucht Euch jemand anderes, dem Ihr Euren Plunder aufschwatzen könnt.", AnswerId = 48},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 100, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			DecreaseGlobalCounter{Name = "g_P204_NepperPreise", Step = 8},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "nandiniP204_018", String = "Verflixt! Ihr seid ein zäher Brocken!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 4, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{54;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 4, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{55;
		Conditions = {
			PlayerHasMoney{Gold = 40},
		},
		Actions = {
			Say{Tag = "nandiniP204_019", String = "Wie wäre es mit 40 Goldstücken? Nur 40 Goldstücke - für diesen Schatz!"},
			OfferAnswer{Tag = "nandiniP204_007PC", String = "In Ordnung. Ich bezahle.", AnswerId = 56},
			OfferAnswer{Tag = "nandiniP204_020PC", String = "Was soll ich damit? Geht weg!", AnswerId = 59},
		}}

	OnAnswer{55;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 40}),
		},
		Actions = {
			Say{Tag = "nandiniP204_019", String = "Wie wäre es mit 40 Goldstücken? Nur 40 Goldstücke - für diesen Schatz!"},
			OfferAnswer{Tag = "nandiniP204_020PC", String = "Was soll ich damit? Geht weg!", AnswerId = 59},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 40, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			DecreaseGlobalCounter{Name = "g_P204_NepperPreise", Step = 4},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{61;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "nandiniP204_021", String = "Wollt Ihr mich zum Narren halten? Wie tief soll ich mit meinem Preis noch gehen?"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 2, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{65;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 2, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
			PlayerHasMoney{Gold = 20},
		},
		Actions = {
			Say{Tag = "nandiniP204_022", String = "Mein letztes Angebot: 20 Goldstücke!"},
			OfferAnswer{Tag = "nandiniP204_007PC", String = "In Ordnung. Ich bezahle.", AnswerId = 67},
			OfferAnswer{Tag = "nandiniP204_023PC", String = "Geht mir mit Eurem Gerümpel aus den Augen!", AnswerId = 70},
		}}

	OnAnswer{66;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 20}),
		},
		Actions = {
			Say{Tag = "nandiniP204_022", String = "Mein letztes Angebot: 20 Goldstücke!"},
			OfferAnswer{Tag = "nandiniP204_023PC", String = "Geht mir mit Eurem Gerümpel aus den Augen!", AnswerId = 70},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 20, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			DecreaseGlobalCounter{Name = "g_P204_NepperPreise", Step = 2},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{72;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "nandiniP204_024", String = "Ihr ruiniert mich! Wo habt Ihr bloß gelernt, derart zu feilschen?"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
			IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{76;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P204_NepperPreise", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{77;
		Conditions = {
			PlayerHasMoney{Gold = 5},
		},
		Actions = {
			Say{Tag = "nandiniP204_025", String = "Mein allerletztes Angebot: 5 Goldstücke!"},
			OfferAnswer{Tag = "nandiniP204_007PC", String = "In Ordnung. Ich bezahle.", AnswerId = 78},
			OfferAnswer{Tag = "nandiniP204_030PC", String = "Für so etwas bezahle ich nicht einmal eine Kupfermünze.", AnswerId = 92},
		}}

	OnAnswer{77;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 5}),
		},
		Actions = {
			Say{Tag = "nandiniP204_025", String = "Mein allerletztes Angebot: 5 Goldstücke!"},
			OfferAnswer{Tag = "nandiniP204_030PC", String = "Für so etwas bezahle ich nicht einmal eine Kupfermünze.", AnswerId = 92},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 5, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
			Negated(ODER9{
							IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 0, Operator = IsEqual},
							IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 1, Operator = IsEqual}
								}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{81;
		Conditions = {
			ODER9{
							IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 0, Operator = IsEqual},
							IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 1, Operator = IsEqual}
								},
		},
		Actions = {
			Say{Tag = "nandiniP204_026", String = "Ihr werdet den Kauf des Hammers sicherlich nicht bereuen! Damit seht Ihr gleich viel heldenhafter aus!"},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 7063 , Flag = Give},
				SetNpcTimeStamp{Name = "npc_P204_NandiniWaitsForNextNepp"},
				SetGlobalFlagFalse{Name = "g_P204_NandiniInDialogue"},
				SetGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{84;
		Conditions = {
			ODER9{
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 2, Operator = IsEqual},
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 3, Operator = IsEqual}
					},
		},
		Actions = {
			Say{Tag = "nandiniP204_027", String = "Ich wusste, dass die Kappe genau das Richtige für Euch sein würde!"},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(ODER9{
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 2, Operator = IsEqual},
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 3, Operator = IsEqual}
					}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 7064 , Flag = Give},
			   SetNpcTimeStamp{Name = "npc_P204_NandiniWaitsForNextNepp"},
			   SetGlobalFlagFalse{Name = "g_P204_NandiniInDialogue"},
			   SetGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{87;
		Conditions = {
			ODER9{
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 4, Operator = IsEqual},
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 5, Operator = IsEqual}
					},
		},
		Actions = {
			Say{Tag = "nandiniP204_028", String = "Hier, der Ring ist nun Euer. Habt viel Freude damit!"},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{87;
		Conditions = {
			Negated(ODER9{
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 4, Operator = IsEqual},
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 5, Operator = IsEqual}
					}),
		},
		Actions = {
			Say{Tag = "nandiniP204_029", String = "Nun, dann habt viel Freude an dem schönen Edelstein!"},
			Answer{Tag = "", String = "", AnswerId = 90},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 7065 , Flag = Give},
			  SetNpcTimeStamp{Name = "npc_P204_NandiniWaitsForNextNepp"},
			  SetGlobalFlagFalse{Name = "g_P204_NandiniInDialogue"},
			  SetGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{90;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 7066 , Flag = Give},
			 SetNpcTimeStamp{Name = "npc_P204_NandiniWaitsForNextNepp"},
			 SetGlobalFlagTrue{Name = "g_P204_NandiniTearSold"},
			 SetGlobalFlagFalse{Name = "g_P204_NandiniInDialogue"},
			 SetGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 93},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			DecreaseGlobalCounter{Name = "g_P204_NepperPreise", Step = 1},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 95},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Say{Tag = "nandiniP204_031", String = "Dann eben nicht! In den Barga Gor mit Euch! Mit Runenkriegern kann man keine Geschäfte machen!"},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_031", String = "Dann eben nicht! In den Barga Gor mit Euch! Mit Runenkriegern kann man keine Geschäfte machen!"},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			SetNpcTimeStamp{Name = "npc_P204_NandiniWaitsForNextNepp"},
			SetGlobalFlagFalse{Name = "g_P204_NandiniInDialogue"},
			SetGlobalFlagFalse{Name = "g_P204_NandiniFollowAvatar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 101},
		}}

	OnAnswer{101;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{102;
		Conditions = {
			ODER9{
							IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 0, Operator = IsEqual},
							IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 1, Operator = IsEqual}
								},
		},
		Actions = {
			Say{Tag = "nandiniP204_032", String = "Seht, hier habe ich eine mächtige Waffe, den Titanenhammer!"},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{102;
		Conditions = {
			Negated(ODER9{
							IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 0, Operator = IsEqual},
							IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 1, Operator = IsEqual}
								}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 107},
		}}

	OnAnswer{103;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_033", String = "Diesen Hammer könnt Ihr verwenden, wenn Ihr Euch ein wenig mit großen Schlagwaffen auskennt."},
			Answer{Tag = "", String = "", AnswerId = 104},
		}}

	OnAnswer{104;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_034", String = " Dies ist eine Waffe für Helden! Große Schlachten hat dieser Hammer gesehen!"},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_035", String = "Wenn ihr mit ihm trefft, birst Stein und Stahl! Ihr werdet bei Euren Feinden damit einen ungeheuren ... Eindruck hinterlassen! Ha ha!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{107;
		Conditions = {
			ODER9{
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 2, Operator = IsEqual},
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 3, Operator = IsEqual}
					},
		},
		Actions = {
			Say{Tag = "nandiniP204_036", String = "Seht her, eine der legendären Kappen der geistigen Unversehrtheit!"},
			Answer{Tag = "", String = "", AnswerId = 108},
		}}

	OnAnswer{107;
		Conditions = {
			Negated(ODER9{
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 2, Operator = IsEqual},
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 3, Operator = IsEqual}
					}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 111},
		}}

	OnAnswer{108;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_037", String = "Diese Kappe bietet hervorragenden Schutz gegen die bösartigen Schock-Zauber! Sie ist wie ein unüberwindlicher Schutzwall um Euren Geist!"},
			Answer{Tag = "", String = "", AnswerId = 109},
		}}

	OnAnswer{109;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_038", String = "Ihr seid kein richtiger Magier, wenn Ihr keine habt! Selbst die großen Zirkelmagier gingen nie ohne eine aus dem Haus! Glaubt mir!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{111;
		Conditions = {
			Negated(ODER9{
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 4, Operator = IsEqual},
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 5, Operator = IsEqual}
					}),
		},
		Actions = {
			Say{Tag = "nandiniP204_042", String = "Seht her, ich biete Euch diese Zerbitenträne!"},
			Answer{Tag = "", String = "", AnswerId = 115},
		}}

	OnAnswer{111;
		Conditions = {
			ODER9{
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 4, Operator = IsEqual},
					IsGlobalCounter{Name = "g_P204_NepperAngebot", Value = 5, Operator = IsEqual}
					},
		},
		Actions = {
			Say{Tag = "nandiniP204_039", String = "Ich biete Euch den Ring der Narretei! Ein mächtiges, mächtiges Schmuckstück!"},
			Answer{Tag = "", String = "", AnswerId = 112},
		}}

	OnAnswer{112;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_040", String = "Nachdem Ihr diesen Ring angezogen habt, werdet Ihr ein ganz anderer Mensch sein!"},
			Answer{Tag = "", String = "", AnswerId = 113},
		}}

	OnAnswer{113;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_041", String = "Ihr werdet Euch selbst nicht wiedererkennen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{115;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_043", String = "Ein wunderschöner, äußerst seltener, unsagbar wertvoller Stein! Ein Schmuckstück, ein Juwel!"},
			Answer{Tag = "", String = "", AnswerId = 116},
		}}

	OnAnswer{116;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_044", String = "Und darüberhinaus lauern geheime Kräfte im Innern dieser Kostbarkeit!"},
			Answer{Tag = "", String = "", AnswerId = 117},
		}}

	OnAnswer{117;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nandiniP204_045", String = "Zumindest habe ich das gehört ... irgendwann ... von irgendjemandem."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}


	EndDefinition()
end