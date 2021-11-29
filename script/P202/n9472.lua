-->INFO: Bodenranke
--Bodenranke: Dialogobjekt für Toröffner

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n9472_Bodenranke.txt


	

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
			Say{Tag = "plantP202_001", String = "(Eine große Bodenranke wächst hier an dem geschlossenenTor.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "plantP202_002", String = "(Sie hat das schwere Tor einen Spalt weit aufgedrückt.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "plantP202_003", String = "(Die Ranke sieht verdorrt aus.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7067, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{3;
		Conditions = {
			PlayerHasItem{ItemId = 7067, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "plantP202_004PC", String = "(Die verdorrte Ranke mit dem heiligen Wasser giessen)", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P202RankeGegossen"},
										TransferItem {TakeItem = 7067, GiveItem = 0, Amount = 1, Flag = Take},
										TransferItem {TakeItem = 0, GiveItem = 7341, Amount = 1, Flag = Give},
			RemoveDialog {NpcId = 9472},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
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
			EndDialog(),
		}}


	EndDefinition()
end