-->INFO: MenhirLabEntry
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9596_MenhirLabEntry.txt


	

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
			Say{Tag = "menhir_laby_entryp210_001", String = "(In den Menhir ist eine Mulde eingelassen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem {ItemId = 4636},
			PlayerHasItem {ItemId = 7221},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "menhir_laby_entryp210_002PC", String = "(Xalabars Stein einsetzen)", AnswerId = 2},
			OfferAnswer{Tag = "menhir_laby_entryp210_005PC", String = "(Den Schlüsselstein zur Untotenhalle einsetzen)", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem {ItemId = 4636},
			Negated(PlayerHasItem {ItemId = 7221}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "menhir_laby_entryp210_002PC", String = "(Xalabars Stein einsetzen)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4636}),
			PlayerHasItem {ItemId = 7221},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "menhir_laby_entryp210_005PC", String = "(Den Schlüsselstein zur Untotenhalle einsetzen)", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4636}),
			Negated(PlayerHasItem {ItemId = 7221}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir_laby_entryp210_003", String = "(Der Stein passt genau in die Mulde.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir_laby_entryp210_004", String = "(Mit einem Grollen öffnet sich das Tor.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P210_LabDoorOpen"},
			TransferItem{TakeItem = 4636 , Flag = Take},
			RemoveDialog {NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir_laby_entryp210_006", String = "(Der Stein passt nicht in die Mulde. Offenbar ist es nicht der richtige.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end