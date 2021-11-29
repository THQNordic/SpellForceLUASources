-->INFO: KistePhenomena
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9894_KistePhenomena.txt


	

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
			Say{Tag = "chest_phenomena_p210_001", String = "(Ein Schl�ssel steckt in der Kiste. In ihren Deckel ist ein seltsames Wort eingeritzt.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "chest_phenomena_p210_002", String = "(PHENOMENA)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "chest_phenomena_p210_003PC", String = "(Den Schl�ssel umdrehen)", AnswerId = 3},
			OfferAnswer{Tag = "chest_phenomena_p210_006PC", String = "(Kiste nicht anfassen)", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "chest_phenomena_p210_004", String = "(Klick.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "chest_phenomena_p210_005", String = "(Die Kiste kann jetzt ge�ffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			RemoveObject {X = 326, Y = 446, Object = 3087},
			SetEffect{Effect = "Lightning", X = 326, Y = 446, Length = 5000,  TargetType = World},
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
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end