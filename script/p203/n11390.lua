-->INFO: HeiligeStaetteOnyx
--heilige Stätte

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p203\n11390_HeiligeStaetteOnyx.txt


	

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
			Say{Tag = "sacred_grove_onyxP203_001", String = "(Hier wuchs einmal ein prächtiger Baum, von dem allerdings nur noch verfaulte Reste übrig sind.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sacred_grove_onyxP203_002", String = "(Der Ort wirkt verdorben und ein übler Geruch steht in der Luft.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sacred_grove_onyxP203_003", String = "(Zwischen den Resten des Baumes findet sich noch eine Mulde mit fruchtbarer Erde.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7083, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 20}),
		},
		Actions = {
			Say{Tag = "sacred_grove_onyxP203_009", String = "(In der Mulde ragen abgestorbene Wurzeln aus dem Grund.)"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			PlayerHasItem{ItemId = 7083, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 20},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sacred_grove_onyxP203_004PC", String = "(Den Baumsamen der Dryade in die Mulde einpflanzen.)", AnswerId = 5},
			OfferAnswer{Tag = "sacred_grove_onyxP203_008PC", String = "(Die Mulde unberührt lassen.)", AnswerId = 10},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sacred_grove_onyxP203_005", String = "(Aus dem Samen der Lebenseibe schießen grüne Sprösslinge hervor. Sofort beginnt ein neuer Baum an diesem Ort zu wachsen!)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sacred_grove_onyxP203_006", String = "(Der junge Baum verdängt die Reste des Alten und erstahlt in frischem Grün. Eine Aura der Lebenskraft scheint den Ort zu durchdingen, der faulige Hauch verflüchtigt sich.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sacred_grove_onyxP203_007", String = "(Ihr habt diesen Ort gereinigt!)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P203OnyxBaumWirdKlein"},
													TransferItem {TakeItem = 7083, GiveItem = 0, Amount = 1, Flag = Take},
													SetGlobalTimeStamp {Name = "gt_P203OnyxBaumwuchsTimer"},
			RemoveDialog {NpcId = 11390},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end