-->INFO: CoopQuestgeberDark1
-->INFO: MPQuestgeber
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Wenn der Spieler Auftrag zwei gelöst hat Dialog aus 
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7255}
	},
	Actions =
	{
		RemoveDialog {},
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p310\n10086_CoopQuestgeberDark1.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})},
		},
		Actions = {
			Say{Tag = "tothlarP310_001", String = "Könnte es sein ... ich bin mir nicht sicher ..."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}),
		},
		Actions = {
			Say{Tag = "tothlarP310_002", String = "Nors Macht sei mit Euch."},
			Answer{Tag = "", String = "", AnswerId = 5},
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
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_004", String = "Ihr seid ... ein Runenkrieger! Ich wusste es!"},
			Answer{Tag = "tothlarP310_005PC", String = "Was wollt Ihr, sprecht!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_006", String = "Ihr habt Kampfgeist, dass gefällt mir! Ich habe eine Aufgabe für Euch!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_007", String = "Mein Vater, Nazshar, wurde vor vielen Jahren von den Lichtbetern gefangen. Sie schlugen seine Seele in Fesseln und begruben ihn!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_008", String = "Seit dem liegt er, lebendig begraben, unter dem Fels! Ich versuche seit Jahren, ihn aus diesem Gefängnis zu befreien! Aber keiner meiner dunklen Brüder hilft mir!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_009", String = "Ihr könntet das mit Euren Runenkräften erreichen!"},
			Answer{Tag = "tothlarP310_010PC", String = "Lebendig begraben? Lichtbeter sollen das getan haben?", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_011", String = "Meines Vaters Macht reicht bis weit hinter den Tod ... aber in den Bann geschlagen und unter der Erde verscharrt ... dort hilft ihm diese Macht nichts! Das war das Ziel der Lichtkriecher!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_012", String = "Aber er leidet wie jedes andere Wesen auch! Rettet meinen Vater, Runenkrieger!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_013", String = "Hier, nehmt diesen Schlüssel. Er öffnet das Grab! Ihr findet es in Tirganach!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7242, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[7]Abgeschaltet"},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_015", String = "Sein Körper ist leblos, aber er vergeht nicht! Noch ist er nicht befreit!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_016", String = "Seine Seele ist in magischen Bändern gefangen! Wir müssen diese Bänder brechen!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_017", String = "Der Zauber der Bänder wurde damals von den ehernen Falken gewebt! Es gibt nur noch wenige von ihnen!"},
			Answer{Tag = "tothlarP310_018PC", String = "Und ich soll einen von ihnen finden?", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_019", String = "Nein, ich werde es Euch sagen. Viel wichtiger aber ist, dass Ihr die Schriftrolle mit dem Bannbrecher findet!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_020", String = "Die Magier der ehernen Falken haben sie mit einem Zauber unsichtbar gemacht! Aber ich habe ein Kristallglas geschliffen, das Euch durch diesen Zauber blicken lässt!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_021", String = "Nehmt diese Augengläser aus Kristall! Begebt Euch nach Erindar, dort werdet Ihr einen der ehernen Falken finden. Sucht dort nach der Schriftrolle des Bannbrechers!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7243, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[18]Abgeschaltet"},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{26;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{26;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{26;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{26;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{26;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_023", String = "Nors Segen über Euch, Runenkrieger! Nehmt das Siegels des Nazshar, Ihr sollt nun einer unserer Verbündeten sein!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7254, Flag = Give}, TransferItem {TakeItem = 7242, Flag = Take}, TransferItem {TakeItem = 7230, Flag = Take}, TransferXP {XP= 16000, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[27]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_025", String = "Nor ist an Eurer Seite, Freund! Nun lasst mich den Zauber anwenden und die Bänder um meines Vaters Seele brechen!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_026", String = "Es ist vollbracht! Er ist frei! Nehmt den Glyphen des Bannbrechers, er ist eine hohe Auszeichnung! Ihr habt einen großen Sieg über die Lichtbeter errungen!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tothlarP310_027", String = "Nun kann mein Vater endlich heimkehren! Sprecht mit ihm, er wird Euch ebenfalls danken wollen, Runenkrieger!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7255, Flag = Give}, TransferItem {TakeItem = 7243, Flag = Take}, TransferItem {TakeItem = 7231, Flag = Take}, TransferXP {XP= 19000, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[31]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_003PC", String = "Was starrt Ihr mich so an, Norcaine?", AnswerId = 7},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_014PC", String = "Was geschieht nun mit Eurem Vater?", AnswerId = 18},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_022PC", String = "Euer Vater ist geborgen.", AnswerId = 27},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tothlarP310_024PC", String = "Die Schriftrolle des Bannbrechers!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7242}), Negated(PlayerHasItem {ItemId = 7254})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7243}), Negated(PlayerHasItem {ItemId = 7255}),PlayerHasItem {ItemId =7254}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7230}, Negated (PlayerHasItem {ItemId = 7254})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7231}, Negated (PlayerHasItem {ItemId = 7255})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end