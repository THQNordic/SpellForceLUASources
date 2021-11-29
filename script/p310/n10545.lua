-->INFO: CoopQuestgeberLight2
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Defaultmaessig ist der Dialog aus
OnOneTimeEvent
{
	Actions =
	{
		RemoveDialog {},
	}
}

-- Wenn der Spieler die Items von Auftrag 2,3 oder 5 hat Dialog anschalten
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			PlayerHasItem {ItemId = 7225},
			PlayerHasItem {ItemId = 7226},
			PlayerHasItem {ItemId = 7228}
		}
	},
	Actions =
	{
		EnableDialog {},
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p310\n10545_CoopQuestgeberLight2.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})),
		},
		Actions = {
			Say{Tag = "bard_deskP310_001", String = "(Das muss der Schreibtisch von Schattenlied sein. Überall liegen halb vollgerschriebene Notenblätter und Textbücher.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249}))),
		},
		Actions = {
			Say{Tag = "bard_deskP310_004", String = "(Ein Schreibtisch. Hier finden sich Notenblätter, Feder und Tinte. Scheinbar hat hier ein Barde komponiert.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bard_deskP310_002", String = "(Spinnenförmige Schmuckstücke aus Silber beschweren die Papiere und verhindern, das der milde Wind sie davonträgt.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bard_deskP310_003", String = "(Alles sieht sehr durcheinander aus, als hätte jemand etwas gesucht. Ihr könnt aber noch genug frisches Pergament und Tinte ausmachen, um einige Lieder zu schreiben.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bard_deskP310_006", String = "(Ihr lasst die Melodie der Täuschung noch einmal durch Euren Kopf gehen, dann setzt Ihr die Feder an. Geschwind und wie von selbst schreibt Eure Hand das Lied der Täschung nieder.)"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bard_deskP310_007", String = "(Ihr habt das Lied der Täuschung fertig gestellt.)"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7249, Flag = Give}, TransferItem {TakeItem = 7237, Flag = Take}, TransferItem {TakeItem = 7225, Flag = Take}, TransferXP {XP= 17500, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[8]Abgeschaltet"},
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
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bard_deskP310_009", String = "(Wieder scheint sich die Feder wie von selbst über das Pergament zu bewegen. Das Lied nimmt Gestalt an.)"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bard_deskP310_010", String = "(Ihr habt das Lied Nachtfall fertiggestellt.)"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7250, Flag = Give}, TransferItem {TakeItem = 7238, Flag = Take}, TransferItem {TakeItem = 7226, Flag = Take}, TransferXP {XP= 22000, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[13]Abgeschaltet"},
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
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bard_deskP310_012", String = "(Die Melodie manifestiert sich zu Noten und Buchstaben. Der Text des Leides scheint förmlich aus Eurer Feder zu fließen.)"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bard_deskP310_013", String = "(Ihr habt das Lied des Verräters fertig gestellt.)"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7252, Flag = Give}, TransferItem {TakeItem = 7240, Flag = Take}, TransferItem {TakeItem = 7228, Flag = Take}, TransferXP {XP= 28000, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[18]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_005PC", String = "(Das Lied der Täuschung niederschreiben)", AnswerId = 8},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_008PC", String = "(Das Lied Nachtfall niederschreiben.)", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bard_deskP310_011PC", String = "(Das Lied des Verräters niederschreiben.)", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( UND(PlayerHasItem {ItemId = 7225}, Negated (PlayerHasItem {ItemId = 7249})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end