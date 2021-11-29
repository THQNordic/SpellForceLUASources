-->INFO: Affenjunge
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

---- Der Affe spawnt nur wenn der Spieler fertig ist mit aufräumen
--SpawnOnlyWhen
--{
--	X = _X, Y = _Y,
--	NoSpawnEffect = TRUE,
--	Conditions =
--	{
--		-- Wenn der Spieler um die Ecke kommt spawnt der Bub
--		ODER9
--		{
--			IsGlobalFlagTrue {Name = "g_P213_ZweiCampMantis"},
--			IsGlobalFlagTrue {Name = "g_P213_DreiCampMantis"},
--			IsGlobalFlagTrue {Name = "g_P213_VierCampMantis"}
--		}
--	},
--	Actions = 
--	{
--		Follow {Target = Avatar},
--	}
--}

-- Dialog erst mal aus
OnPlatformOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10985"},
	}
}

-- Dialog an wenn Affe frei
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_AffenjungeFrei"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_10985"},
	}
}


-- Ist alles gesagt Auftrag  gegeben/gesolved kann der Dialog weg
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_AffenjungeDeal"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10985"}
	}
}

-- An die Mauer für die Cutscene
Umspawn
{
	X = 158, Y = 172,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UmspawnBone", UpdateInterval = 2}, 
		IsGlobalFlagFalse {Name = "n_P213_AffenjungeAnMauer", UpdateInterval = 2}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10985"}
	}
}

-- Auf dieser Seite der Mauer wird kein Affe mehr gebraucht, also wegspawnen
Despawn
{
	Conditions =
	{
		FigureInRange {X = 152, Y = 165, Range = 0},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "n_P213_AffenjungeAnMauer"}
	}

}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p213\n10985_Affenjunge.txt


	

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
			Say{Tag = "apeP213_001", String = "Ich bringen Hilfe! Du mir zuhören!"},
			Answer{Tag = "apeP213_002PC", String = "Ein sprechender Affe?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "apeP213_004", String = "Du wieder da!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "apeP213_003", String = "Alter Mann hat gelehrt Menschenrufe! Du zuhören! Du nicht kommst in Tempel! Mauern zu! Tore zu!"},
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
			UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_005PC", String = "Kannst du mir helfen?", AnswerId = 5},
			OfferAnswer{Tag = "apeP213_013PC", String = "Hier ist die Nahrung für deinen Stamm!", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_005PC", String = "Kannst du mir helfen?", AnswerId = 5},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_013PC", String = "Hier ist die Nahrung für deinen Stamm!", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_005PC", String = "Kannst du mir helfen?", AnswerId = 5},
			OfferAnswer{Tag = "apeP213_013PC", String = "Hier ist die Nahrung für deinen Stamm!", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_005PC", String = "Kannst du mir helfen?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_013PC", String = "Hier ist die Nahrung für deinen Stamm!", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "apeP213_006", String = "Ja! Ja! Ich kennen Weg in Tempel! Weg in Knochenhaus!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "apeP213_007", String = "Aber geheimer Weg! Schwerer Weg! Weg, nur Affenjunge kann gehen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "apeP213_008", String = "Ich klettern hinein und öffnen Tor! Du dann machen Maskenmann kaputt! Machen fort alle Knochenmänner! Fort alle Eisenmänner!"},
			Answer{Tag = "apeP213_009PC", String = "Deshalb bin ich hier, kleiner Freund! Öffne das Tor für mich!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P213_AffenjungeDeal"}, QuestSolve {QuestId = 1007}, QuestBegin {QuestId = 1009},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[5]Abgeschaltet"},
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "apeP213_010", String = "Nein! Nein! Du erst müssen uns zeigen du gut! Nicht schlecht wie Maskenmann!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "apeP213_011", String = "Du Affen überzeugen! Bringen unserem Stamm viele hundert Nahrung! Handvoll Hundert! Dann Stamm wieder stark!"},
			Answer{Tag = "apeP213_012PC", String = "Also 500 aus meinen Nahrungslagern und dann öffnest du das Tor? Gut, ich werde sehen, was ich tun kann.", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_005PC", String = "Kannst du mir helfen?", AnswerId = 5},
			OfferAnswer{Tag = "apeP213_013PC", String = "Hier ist die Nahrung für deinen Stamm!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_005PC", String = "Kannst du mir helfen?", AnswerId = 5},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_013PC", String = "Hier ist die Nahrung für deinen Stamm!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "apeP213_014", String = "Du gut! Nicht böse wie Maskenmann! Ich öffnen Tor! Du bereit sein!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestSolve {QuestId = 1008}, QuestBegin {QuestId = 1009}, SetRewardFlagTrue {Name = "NahrungFuerAffenjunge"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[13]Abgeschaltet"},
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
			UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_005PC", String = "Kannst du mir helfen?", AnswerId = 5},
			OfferAnswer{Tag = "apeP213_013PC", String = "Hier ist die Nahrung für deinen Stamm!", AnswerId = 13},
		}}

	OnAnswer{16;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_005PC", String = "Kannst du mir helfen?", AnswerId = 5},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "apeP213_013PC", String = "Hier ist die Nahrung für deinen Stamm!", AnswerId = 13},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_P213_AffenjungeDeal"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen"}, QuestState {State = StateActive, QuestId = 1008},ODER( PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideLight}, PlayerHasGood {Good = GoodFood, Amount = 500, Side = SideDark})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end