-->INFO: AlarmanlageBank
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11171_AlarmanlageBank.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			PlayerHasItem{ItemId = 7323},
		},
		Actions = {
			Say{Tag = "alarm2P204_001", String = "(In diesem Stein befindet sich eine Öffnung.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7323}),
		},
		Actions = {
			Say{Tag = "alarm2P204_001", String = "(In diesem Stein befindet sich eine Öffnung.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 7323},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alarm2P204_002PC", String = "(Ein Siegel einsetzen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7323}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alarm2P204_003", String = "(Ein Klicken ertönt hinter der Wand. Ihr habt scheinbar einen Teil der Mechanik des Alarms ausgeschaltet.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			ChangeObject{X = 391, Y = 269, Object = 3050}, TransferItem {TakeItem = 7323, Amount = 1, Flag = Take}, SetGlobalFlagTrue {Name = "g_P204_Stein2Deaktiviert"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
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


	EndDefinition()
end