-->INFO: Truhe13_330
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n11470_Truhe13_330.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l?sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "codechest13_330p210_001", String = "(Auf den Deckel der Truhe ist eine rote 330 und eine schwarze 13 gemalt.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			UND(IsGlobalCounter{Name = "g_P210_Faktorcounter", Value = 23, Operator = IsEqual}, IsGlobalCounter{Name = "g_P210_Binaercounter", Value = 13, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "codechest13_330p210_002", String = "(Die Kiste ist entriegelt und kann jetzt ge?ffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(IsGlobalCounter{Name = "g_P210_Faktorcounter", Value = 23, Operator = IsEqual}, IsGlobalCounter{Name = "g_P210_Binaercounter", Value = 13, Operator = IsEqual})),
		},
		Actions = {
			Say{Tag = "codechest13_330p210_003", String = "(Die Truhe wird durch einen Riegel geschlossen gehalten.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end