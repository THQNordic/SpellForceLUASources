-->INFO: Grabmal
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n9107_Grabmal.txt


	

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
			Say{Tag = "graveP202_001", String = "(Das Grabmal ist geöffnet. Runen verzieren alle Gegenstände hier und in der Luft liegt ein leises Raunen und Flüstern.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "graveP202_002", String = "(In einer Nische steht eine Urne, deren seltsame Verzierungen sich ständig bewegen, als wären sie lebendige Wesen.)"},
			OfferAnswer{Tag = "graveP202_003PC", String = "(Die Urne herausmehmen.)", AnswerId = 2},
			OfferAnswer{Tag = "graveP202_006PC", String = "(Die Urne stehen lassen.)", AnswerId = 6},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "graveP202_004", String = "(Das Flüstern schwillt kurz bedrohlich an, als sich Eure Hände der Urne nähern. Dann verstummt es schlagartig.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "graveP202_005", String = "(Die Urne ist nun in Eurem Besitz.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 0, GiveItem = 4633, Amount = 1, Flag = Give},
			RemoveDialog {NpcId = 9107},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
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