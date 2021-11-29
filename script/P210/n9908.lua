-->INFO: SzepterKiste
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9908_SzepterKiste.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l�sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "sceptrechestp210_001", String = "(Im Deckel der Kiste ist ein Schlitz. Daneben wurde f�nfmal das Symbol des Feuers in das Holz geritzt.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
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
			PlayerHasItem {ItemId = 7222},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sceptrechestp210_002PC", String = "(Feuerm�nze in den Schlitz werfen)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7222}),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedFourthCoin"}),
		},
		Actions = {
			Say{Tag = "sceptrechestp210_004", String = "(Die M�nze f�llt in den Schlitz.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedFourthCoin"},
		},
		Actions = {
			Say{Tag = "sceptrechestp210_003", String = "(Ein Mechanismus im Inneren der Kiste klickt. Die Kiste kann jetzt ge�ffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 7222, Flag = Take},
			SetRewardFlagTrue {Name = "SceptreOfWindsFound"},
			RemoveDialog {NpcId = self},
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
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedThirdCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedThirdCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedFourthCoin"},
			TransferItem{TakeItem = 7222, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedSecondCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedSecondCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedThirdCoin"},
			TransferItem{TakeItem = 7222, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedFirstCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{13;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedFirstCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedSecondCoin"},
			TransferItem{TakeItem = 7222, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedFirstCoin"},
			TransferItem{TakeItem = 7222, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}


	EndDefinition()
end