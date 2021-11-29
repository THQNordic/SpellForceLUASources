-->INFO: Futterplatz
--leere Tröge

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p211\n10583_Futterplatz.txt


	

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
			Say{Tag = "feeding_placeP211_001", String = "(Hier scheinen Eingeborene einer Kreatur Opfer dargebracht zu haben. Aber jetzt sind die großen Fleischtröge leer. )"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			Negated( PlayerHasItem {ItemId = 7277, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 30}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			 PlayerHasItem {ItemId = 7277, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 30},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "feeding_placeP211_002PC", String = "(Fleisch in die Tröge legen.)", AnswerId = 2},
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
				SetGlobalFlagFalse {Name = "g_P211DasTierGehtUm"},
											Goto {X = 155, Y = 211, NpcId = 9720, Range = 3, WalkMode = Run, GotoMode = GotoForced, XRand = 0, YRand = 0},
											ChangeRace {Race = 152, NpcId = 9720},
				ChangeObject {X = 154, Y = 212, Object = 2887},
											ChangeObject {X = 154, Y = 213, Object = 2887},
											TransferItem {TakeItem = 7277, GiveItem = 0, Amount = 1, Flag = Take},
											SetGlobalTimeStamp {Name = "gt_P211TierFutter"},
											SetRewardFlagTrue {Name = "WerwolfAbgelenkt"},
				RemoveDialog {NpcId = 10583},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
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
			Say{Tag = "feeding_placeP211_003", String = "(Die Kreatur, die hier haust, scheint auf der Jagd nach frischem Fleisch zu sein.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
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
			EndDialog(),
		}}


	EndDefinition()
end