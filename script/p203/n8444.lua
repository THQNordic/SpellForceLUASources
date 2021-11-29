-->INFO: Dorfaeltester
-->INFO: Dorfältester
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Zu Beginn hat der Dorfchef den Dialog erst mal aus
OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8444" },
	}
}

-- Dialog an, wenn der Spieler die Blockade durch hat
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203BlockadeVernichtet"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8444" },
	}
}

-- Dialog aus, wenn der Spieler das erste mal mit dem Dorfchef geredet hat
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_n_P203ResourcenGegeben"},
			IsGlobalFlagTrue {Name = "g_n_P203_TierFreiLassen"}
		},
		QuestState {QuestId = 1028, State = StateSolved},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8444" },
	}
}

-- Ist der Gefangene an der Blockade wird der Dialog wieder angeschaltet
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8444" },
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p203\n8444_Dorfaeltester.txt


	

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
			Say{Tag = "tarioP203_001", String = "Des Kaisers Hand möge Euch segnen, Feldherr ... Bei den Gräbern meiner Ahnen! Ihr seid ja ein Nordländer!"},
			Answer{Tag = "tarioP203_002PC", String = "Ja, auf der Suche nach Emypria.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "tarioP203_009", String = "Wieder zurück?"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_003", String = "Da müsst Ihr nicht lange suchen ... aber kommt, setzt Euch zu uns, nehmt Wein und Brot! Unser Heim ist das Eure!"},
			Answer{Tag = "tarioP203_004PC", String = "Hm, das würden mir nicht viele Menschen angebieten ... Aber ich muss weiter, nach Empyira!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_005", String = "Dann haltet Euch weiter nach Süden! Immer dorthin, wo es nach Sünde und Abschaum riecht! Folgt einfach den Horden der Plünderer, die Stadt wird fast ständig belagert!"},
			Answer{Tag = "tarioP203_006PC", String = "Noch mehr Gegner im Süden? Dann muss ich weiter!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_007", String = "Wenn Ihr schon nicht bleibt, nehmt als Dank diese beiden Gegenstände. Ein Stab und ein Schild. Sie sind leider beide zerbrochen, aber ein guter Handwerker kann sie Euch wieder richten!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_008", String = "Ich kann Euch auch noch entweder einige unserer Vorräte oder einen nützlichen Hinweis anbieten. Was wollt ihr haben?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "known"}, SetGlobalFlagTrue {Name = "g_n_P203WestTorOeffnen"}, SetRewardFlagTrue {Name = "DialogMitAeltestem"},
			
							TransferItem{GiveItem = 7306, Flag = Give},
							TransferItem{GiveItem = 7307, Flag = Give},
							QuestBegin{QuestId = 1002},
							QuestBegin{QuestId = 1003},
							QuestBegin{QuestId = 1004}
							 ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
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
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_010PC", String = "Ich nehme lieber die Vorräte.", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_014PC", String = "Vorräte brauche ich nicht, gebt mir Euren Hinweis!", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_021PC", String = "Uram sagte, Ihr könnt mir Rohstoffe geben?", AnswerId = 28},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_026PC", String = "Was ist das für eine Bande, die Euch belagert?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_033PC", String = "Was hat es mit diesen zerbrochenen Waffen auf sich?", AnswerId = 45, Color = ColorDarkOrange},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_039PC", String = "Ihr seht krank aus ... was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarioP203_045PC", String = "Eure Quelle ist gereinigt!", AnswerId = 62},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_HazimInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_ItemsInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "n_P203_WasserquelleInfoGegeben"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1031, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_011", String = "Wir können nicht viel geben, Nordmensch, dies ist ein armes Land."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_012", String = "Man sagt die Hand des Kaisers macht Asche zu Gold ... aber ich sage Euch, sie macht vor allem Bauern zu Bettlern! Die Steuern sind hart!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_013", String = "Ich werde Euch den Zugang zu einem unserer Vorratslager öffnen. Ich hoffe, es hilft Euch!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "n_P203_SpielerHatHandelBekommen"},
			SetGlobalFlagTrue {Name = "g_n_P203ResourcenGegeben"},
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
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_015", String = "Ihr solltet Euch die Goras zunutze machen. Das sind Kreaturen, die diesen Landstrich bevölkern ... sie hassen die Hazim!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_016", String = "Die Goras sind friedlich, aber die Hazim haben sie ihres Fleisches wegen fast ausgerottet! Seitdem greifen sie alles an, was nach Hazim riecht!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_017", String = "Es gibt nur noch ein altes Leittier der Goras, dass im Land herumstreift, aber es ist schwach und hält sich im Westen verborgen. Ihr könntet ihm etwas bringen, was es wieder aufmuntert!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_018", String = "Hier, nehmt diese Honigwabe, Goras lieben Honig! Wenn ihr es dem Leittier gebt, wird es wieder zu Kräften kommen, und ich wette, es wird wieder zu seinen alten Jagdgründen zurückkehren!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_019", String = "Dort wird es den Hazim gehörig Ärger machen und Eure Truppen haben weniger Gegner zu bekämpfen!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_020", String = "Ihr findet das Leittier weit im Westen, jenseits des Sees. Gebt ihm den Honig und das Tier wird dem kampf gegen die Hazim aufnehmen! Mein Wort darauf!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "n_P203_SpielerHatHandelBekommen"},
			SetGlobalFlagTrue {Name = "g_n_P203_TierFreiLassen"},
					TransferItem{GiveItem = 7438 , Amount = 1 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_022", String = "So, sagte er das? Nun, das ist sehr eifrig von dem Herrn Zwerg, aber ich fürchte er kennt unsere Notlage nicht ..."},
			Answer{Tag = "tarioP203_023PC", String = "Er sagte, Ihr solltet mir die 'kaiserlichen' Vorräte geben.", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_024", String = "Bei der Asche meines Großvaters! Wer hat dem Zwerg davon erzählt? Wenn ich diese Tratschmäuler erwische!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_025", String = "Aber gut ...gut! ich werde Euch auch dieses Lager öffnen. Mögen Eure Ahnen gnädig auf uns schauen ..."},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_n_P203ZweitesMalResourcenGegeben"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[28]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_027", String = "Sie sind die Hazim, räuberische Stämme aus der roten Wüste! ZUsammen mit den einsitgen Piraten der Onyxbucht!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_028", String = "Die Konvokation hat deren Schiffe zerschlagen und nun setzen sie ihre Raubzüge kurzerhand zu Fuss fort!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_029", String = "Diese beiden Banden werden immer dreister, nun belagern sie sogar Empyria!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_030", String = "Wenn sie nicht bald abziehen und die Handelsstraße wieder geöffnet wird, dann werden wir hier elend zugrunde gehen! Oder sie schlitzen uns vorher die Kehlen auf!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_031", String = "Und kein Kaiserlicher weit und breit um uns zu helfen! Aber unsere Steuern,d ei nehmen sie gerne! Geht nur nach Empyria! Geht dorthin und schaut, wie sie unser Geld verprassen!"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_032", String = "Und wenn ihr uns dabei von der Plage dieser Hazim befreit, will ich auf ewig zu meinen Ahnen für Euch beten!"},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[35]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_034", String = "Sie gehörten einem Anführer der Hazim, die unser Dorf angegriffen haben! Als unser Schmied ihn erschlug, flohen sie!"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_035", String = "Der Anführer hatte diese beiden Waffen bei sich, sie schienen magische Kräfte zu haben! Leider zerbrachen sie, als er fiel und sind nun nutzlos."},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_036", String = "Wenn Ihr Euch bis Empyria durchschlagen könnt, dann zeigt sie dort der Handwerkerin Niamh!"},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_037", String = "Sie kennt sich mit allen Arten von Waffen aus und kann sie Euch vielleicht wiederherstellen!"},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_038", String = "Eine bessere Entlohnung kann ich Euch leider nicht bieten. Die Steuern lassen uns gerade genug zum leben ..."},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[45]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_040", String = "Unser Wasser ist ist von bösen Geistern verseucht! Wer es trinkt, dem zerfrisst es die Eingeweide, wer sich damit wäscht, dem verbrennt es die Haut!"},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_041", String = "Unser Brunnen ist ein Ort des Todes! Ich habe einen unserer Krieger, Tantaro, geschickt um den Grund zu finden, warum unser Wasser zu Gift wird."},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_042", String = "Er wollte in den Norden gehen, dort liegt die Quelle, die unseren Brunnen speist. Aber er ist nicht zurückgekehrt! Und unser  trinkbaren Wasservorräte schwinden Tag für Tag."},
			Answer{Tag = "tarioP203_043PC", String = "Warum sagt Ihr nicht gleich, das es so schlimm um Euch steht?", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_044", String = "Ich wollte Euch nicht noch mehr belästigen! Aber wenn Ihr die Zeit findet, dann geht in den Norden und sucht Tantaro! Vielleicht könnt Ihr uns gemeinsam von dem Gift im Wasser befreien!"},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 1028}, QuestBegin{QuestId = 1029},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[54]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_046", String = "Wir haben bereits wieder frisches Wasser! Ich danke Euch! Wo ist Tantaro?"},
			Answer{Tag = "tarioP203_047PC", String = "Er ist ... dem Gift zum Opfer gefallen.", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_048", String = "Seine Ahnen mögen den armen Kerl zu sich nehmen. Ihr habt uns gerettet! Lasst uns Euch danken!"},
			Answer{Tag = "tarioP203_049PC", String = "Das Gift kam von dieser Kreatur ... wisst Ihr was das ist?", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_050", String = "Eine Beißkrake! Früher, als dies wirklich noch eine Bucht war, gab es sie hier recht häufig! Jetzt leben sie in den tiefen Zisternen unter der Erde ... die Hazim benutzen sie, um ihre Waffen zu vergiften!"},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarioP203_051", String = "Also wieder eine Teufelei der Hazim! Elendes Pack!"},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 1031}, QuestSolve{QuestId = 1028},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[62]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}


	EndDefinition()
end