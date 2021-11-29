-->INFO: Brunnen
--Brunnen

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n9347_Brunnen.txt


	

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
			Say{Tag = "fountainP202_001", String = "(Ihr erkennt die Runen des Lebens auf dem Rand dieses Brunnens. In seinem Innern glitzert kristallklares Wasser. )"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem {ItemId = 7341, Amount = 1 , Equipment = EquipmentAll , UpdateInterval = 20},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountainP202_002PC", String = "(Die Schale der Dryade mit heiligem Wasser füllen.)", AnswerId = 2},
			OfferAnswer{Tag = "fountainP202_005PC", String = "(Heiliges Wasser aus dem Brunnen trinken.)", AnswerId = 6},
			OfferAnswer{Tag = "fountainP202_007PC", String = "(Den Brunnen unberührt lassen.)", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7341, Amount = 1 , Equipment = EquipmentAll , UpdateInterval = 20}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountainP202_005PC", String = "(Heiliges Wasser aus dem Brunnen trinken.)", AnswerId = 6},
			OfferAnswer{Tag = "fountainP202_007PC", String = "(Den Brunnen unberührt lassen.)", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountainP202_003", String = "(Sobald das Wasser den Brunnen verlässt, beginnt es in der unheilgen Aura der Stadt zu verdunsten!)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountainP202_004", String = "(Ihr habt nun ein Gefäß mit heiligem Wasser, aber es verflüchtigt sich sehr schnell, Ihr müsst Euch beeilen!)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "P202_WassertransportLäuft"},
										 			TransferItem {TakeItem = 0, GiveItem = 7067, Amount = 1, Flag = Give},
										 			TransferItem {TakeItem = 7341, GiveItem = 0, Amount = 1, Flag = Take},
										 			SetGlobalFlagTrue {Name = "g_P202SpielerHatNeuesWasser"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountainP202_006", String = "(Das Wasser rinnt wie flüssiges Licht durch Eure Kehle. Ein wohliges Gefühl druchströmt Euch.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "P202_testflag1"},
											SetGlobalFlagTrue {Name = "P202_WasserGetrunken"} ,
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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