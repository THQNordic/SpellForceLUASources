-->INFO: mosaik
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p208\n11386_mosaik.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{ Name = "MosaicOne" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{ Name = "MosaicOne" },
			PlayerHasItem{ItemId = 3233},
		},
		Actions = {
			Say{Tag = "mosaik_blazingstonesP208_001", String = "(Die Bodenplatten ziert ein zerbrochenes Steinbild. Der größte Teil des Mosaiks fehlt.)"},
			OfferAnswer{Tag = "mosaik_blazingstonesP208_002PC", String = "(Erstes Teilstück einsetzen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{ Name = "MosaicOne" },
			Negated(PlayerHasItem{ItemId = 3233}),
		},
		Actions = {
			Say{Tag = "mosaik_blazingstonesP208_001", String = "(Die Bodenplatten ziert ein zerbrochenes Steinbild. Der größte Teil des Mosaiks fehlt.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik_blazingstonesP208_003", String = "(Aus dem Untergrund ertönt entfernt ein Summen.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 3234},
		},
		Actions = {
			SetGlobalFlagTrue {Name = "MosaicOne"},
					ChangeObject{X = 359, Y = 379 , Object = 2455 },
					TransferItem{TakeItem = 3233 , Flag = Take},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik_blazingstonesP208_004PC", String = "(Zweites Teilstück einsetzen)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3234}),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "MosaicOne"},
					ChangeObject{X = 359, Y = 379 , Object = 2455 },
					TransferItem{TakeItem = 3233 , Flag = Take},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik_blazingstonesP208_005", String = "(Das Summen aus dem Untergrund wird lauter.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem{ItemId = 3235},
		},
		Actions = {
			SetGlobalFlagTrue {Name = "MosaicTwo"},
					 ChangeObject{X = 359, Y = 379 , Object = 2456 },
					 TransferItem{TakeItem = 3234 , Flag = Take},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik_blazingstonesP208_006PC", String = "(Drittes Teilstück einsetzen)", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3235}),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "MosaicTwo"},
					 ChangeObject{X = 359, Y = 379 , Object = 2456 },
					 TransferItem{TakeItem = 3234 , Flag = Take},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik_blazingstonesP208_007", String = "(Die Luft beginnt zu vibrieren.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 3236},
		},
		Actions = {
			SetGlobalFlagTrue {Name = "MosaicThree"},
					ChangeObject{X = 359, Y = 379 , Object = 2457 },
					TransferItem{TakeItem = 3235 , Flag = Take},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik_blazingstonesP208_008PC", String = "(Letztes Teilstück einsetzen)", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3236}),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "MosaicThree"},
					ChangeObject{X = 359, Y = 379 , Object = 2457 },
					TransferItem{TakeItem = 3235 , Flag = Take},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik_blazingstonesP208_009", String = "(Das Mosaik ist wieder vollständig! Der Boden zittert, die Luft wird faulig...)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "MosaicComplete"},
				   RemoveDialogFromNpc{NpcId = 11386},
				   ChangeObject{X = 359, Y = 379 , Object = 2458 },
				   TransferItem{TakeItem = 3236 , Flag = Take},
				   SetRewardFlagTrue{ Name = "P208MosaikDesTodes"},
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalFlagFalse { Name = "MosaicTwo" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalFlagFalse { Name = "MosaicTwo" },
		},
		Actions = {
			Say{Tag = "mosaik_blazingstonesP208_010", String = "(In das Mosaik wurde bereits ein Teilstück wieder eingefügt.)"},
			Answer{Tag = "", String = "", AnswerId = 10},
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
			PlayerHasItem{ItemId = 3234},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik_blazingstonesP208_004PC", String = "(Zweites Teilstück einsetzen)", AnswerId = 3},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3234}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
			IsGlobalFlagFalse { Name = "MosaicThree" },
		},
		Actions = {
			Say{Tag = "mosaik_blazingstonesP208_011", String = "In das Mosaik wurden bereits zwei Teilstücke wieder eingefügt."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsGlobalFlagFalse { Name = "MosaicThree" }),
		},
		Actions = {
			Say{Tag = "mosaik_blazingstonesP208_012", String = "In das Mosaik wurden bereits drei Teilstücke wieder eingefügt"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			PlayerHasItem{ItemId = 3235},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik_blazingstonesP208_006PC", String = "(Drittes Teilstück einsetzen)", AnswerId = 5},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3235}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			PlayerHasItem{ItemId = 3236},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik_blazingstonesP208_008PC", String = "(Letztes Teilstück einsetzen)", AnswerId = 7},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3236}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end