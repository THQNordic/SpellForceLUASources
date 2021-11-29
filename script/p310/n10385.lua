-->INFO: CoopQuestgeberLight2
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p310\n10385_CoopQuestgeberLight2.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Gibt es mehr zu tun?", AnswerId = 1},
			OfferAnswer{Tag = "", String = "PP: Ich will arbeit", AnswerId = 3},
			OfferAnswer{Tag = "", String = "PP: Ich habe das Blut für dich", AnswerId = 5},
			OfferAnswer{Tag = "", String = "PP: Ich habe die Feder für dich", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Gibt es mehr zu tun?", AnswerId = 1},
			OfferAnswer{Tag = "", String = "PP: Ich will arbeit", AnswerId = 3},
			OfferAnswer{Tag = "", String = "PP: Ich habe das Blut für dich", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Gibt es mehr zu tun?", AnswerId = 1},
			OfferAnswer{Tag = "", String = "PP: Ich will arbeit", AnswerId = 3},
			OfferAnswer{Tag = "", String = "PP: Ich habe die Feder für dich", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Gibt es mehr zu tun?", AnswerId = 1},
			OfferAnswer{Tag = "", String = "PP: Ich will arbeit", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Gibt es mehr zu tun?", AnswerId = 1},
			OfferAnswer{Tag = "", String = "PP: Ich habe das Blut für dich", AnswerId = 5},
			OfferAnswer{Tag = "", String = "PP: Ich habe die Feder für dich", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Gibt es mehr zu tun?", AnswerId = 1},
			OfferAnswer{Tag = "", String = "PP: Ich habe das Blut für dich", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Gibt es mehr zu tun?", AnswerId = 1},
			OfferAnswer{Tag = "", String = "PP: Ich habe die Feder für dich", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Gibt es mehr zu tun?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Ich will arbeit", AnswerId = 3},
			OfferAnswer{Tag = "", String = "PP: Ich habe das Blut für dich", AnswerId = 5},
			OfferAnswer{Tag = "", String = "PP: Ich habe die Feder für dich", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Ich will arbeit", AnswerId = 3},
			OfferAnswer{Tag = "", String = "PP: Ich habe das Blut für dich", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Ich will arbeit", AnswerId = 3},
			OfferAnswer{Tag = "", String = "PP: Ich habe die Feder für dich", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Ich will arbeit", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Ich habe das Blut für dich", AnswerId = 5},
			OfferAnswer{Tag = "", String = "PP: Ich habe die Feder für dich", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Ich habe das Blut für dich", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
			OfferAnswer{Tag = "", String = "PP: Ich habe die Feder für dich", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[1]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[3]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7226}, Negated (PlayerHasItem {ItemId = 7250})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[5]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7228}, Negated (PlayerHasItem {ItemId = 7252})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = "PP: Ah ein Abenteurer"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "PP: Immer, hol mir das Lichtkind Blut"},
			Answer{Tag = "", String = "PP: Supi", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7239, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[1]Abgeschaltet"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "PP: Dann hol mir  die Erinnerungsfedern"},
			Answer{Tag = "", String = "PP: Werde ich machen", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7240, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[3]Abgeschaltet"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "PP: Immmer hereinspaziert"},
			Answer{Tag = "", String = "PP: Gerne", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7250, Flag = Give}, TransferItem {TakeItem = 7238, Flag = Take}, TransferItem {TakeItem = 7226, Flag = Take},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[5]Abgeschaltet"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "PP: Ok gibs raus"},
			Answer{Tag = "", String = "PP: Klaro dafür bin ich hier", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7252, Flag = Give}, TransferItem {TakeItem = 7240, Flag = Take}, TransferItem {TakeItem = 7228, Flag = Take},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[7]Abgeschaltet"},
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end