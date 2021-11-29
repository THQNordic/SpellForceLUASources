-->INFO: Raum5Kiste5
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n8581_Raum5Kiste5.txt


	

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
			Say{Tag = "room5_chest5_p210_001", String = "(Diese Truhe ist durch ein rotes Schloss gesichert.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem {ItemId = 4581},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room5_chest5_p210_002PC", String = "(Den seltsamen roten Schlüssel verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4581}),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			IsGlobalFlagTrue{Name = "g_P210_Room5Chest4Open"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P210_Room5Chest4Open"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "room5_chest5_p210_003", String = "(Der Schlüssel passt. Die Truhe kann nun geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4581 , Flag = Take},
			IncreaseGlobalCounter{Name = "P210_Room5ChestsOpened"},
			SetGlobalFlagTrue{Name = "g_P210_Room5Chest5Open"},
			RemoveDialogFromNpc{NpcId = 8581},
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
			Say{Tag = "room5_chest5_p210_004", String = "(Der Schlüssel lässt sich im Schloss nicht drehen.)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "room5_chest5_p210_005", String = "(Vermutlich passt er in eine der anderen Truhen.)"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end