-->INFO: Raum2Fackel3
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n8643_Raum2Fackel3.txt


	

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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room2_torch3_p210_001PC", String = "(Die Fackel entz�nden)", AnswerId = 2},
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
			SetEffect { Effect = "Torch",  Length = 1500, TargetType = Object, NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalCounter{Name = "P210_Room2RightComboLit", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalCounter{Name = "P210_Room2RightComboLit", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name =  "P210_Room2RightComboLit"},
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
			IncreaseGlobalCounter{Name = "P210_Room2WrongTorchesLit"},
			ResetGlobalCounter{Name = "P210_Room2RightComboLit"},
			IncreaseGlobalCounter{Name = "g_P210_MediumMistakesMade"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end