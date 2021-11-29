-->INFO: mosaik
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p107\n6827_mosaik.txt


	

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{ Name = "P107_MosaicOne" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{ Name = "P107_MosaicOne" },
			PlayerHasItem{ItemId = 3233},
		},
		Actions = {
			Say{Tag = "mosaik107_001", String = "(Die Bodenplatten ziert ein zerbrochenes Steinbild. Der größte Teil des Mosaiks fehlt.)"},
			OfferAnswer{Tag = "mosaik107_002PC", String = "(Teilstück einsetzen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{ Name = "P107_MosaicOne" },
			Negated(PlayerHasItem{ItemId = 3233}),
		},
		Actions = {
			Say{Tag = "mosaik107_001", String = "(Die Bodenplatten ziert ein zerbrochenes Steinbild. Der größte Teil des Mosaiks fehlt.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik107_003", String = "(Aus dem Untergrund ertönt entfernt ein Summen.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 3234},
		},
		Actions = {
			SetPlayerFlagTrue {Name = "P107_MosaicOne"},
					ChangeObject{X = 184, Y = 177 , Object = 2455 },
					TransferItem{TakeItem = 3233 , Flag = Take},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik107_004PC", String = "(Zweites Teilstück einsetzen)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3234}),
		},
		Actions = {
			SetPlayerFlagTrue {Name = "P107_MosaicOne"},
					ChangeObject{X = 184, Y = 177 , Object = 2455 },
					TransferItem{TakeItem = 3233 , Flag = Take},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik107_005", String = "(Das Summen aus dem Untergrund wird lauter.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem{ItemId = 3235},
		},
		Actions = {
			SetPlayerFlagTrue {Name = "P107_MosaicTwo"},
					 ChangeObject{X = 184 , Y = 177 , Object = 2456 },
					 TransferItem{TakeItem = 3234 , Flag = Take},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik107_006PC", String = "(Drittes Teilstück einsetzen)", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3235}),
		},
		Actions = {
			SetPlayerFlagTrue {Name = "P107_MosaicTwo"},
					 ChangeObject{X = 184 , Y = 177 , Object = 2456 },
					 TransferItem{TakeItem = 3234 , Flag = Take},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik107_007", String = "(Die Luft beginnt zu vibrieren.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 3236},
		},
		Actions = {
			SetPlayerFlagTrue {Name = "P107_MosaicThree"},
					ChangeObject{X = 184 , Y = 177 , Object = 2457 },
					TransferItem{TakeItem = 3235 , Flag = Take},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik107_008PC", String = "(Letztes Teilstück einsetzen)", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3236}),
		},
		Actions = {
			SetPlayerFlagTrue {Name = "P107_MosaicThree"},
					ChangeObject{X = 184 , Y = 177 , Object = 2457 },
					TransferItem{TakeItem = 3235 , Flag = Take},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik107_009", String = "(Das Mosaik ist wieder vollständig! Der Boden zittert, die Luft wird faulig...)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue {Name = "P107_MosaicComplete"},
				   RemoveDialogFromNpc{NpcId = self},
				   ChangeObject{X = 184 , Y = 177 , Object = 2458 },
				   TransferItem{TakeItem = 3236 , Flag = Take},
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse { Name = "P107_MosaicTwo" },
			PlayerHasItem{ItemId = 3234},
		},
		Actions = {
			Say{Tag = "mosaik107_010", String = "(In das Mosaik wurde bereits ein Teilstück wieder eingefügt.)"},
			OfferAnswer{Tag = "mosaik107_004PC", String = "(Zweites Teilstück einsetzen)", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse { Name = "P107_MosaicTwo" },
			Negated(PlayerHasItem{ItemId = 3234}),
		},
		Actions = {
			Say{Tag = "mosaik107_010", String = "(In das Mosaik wurde bereits ein Teilstück wieder eingefügt.)"},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse { Name = "P107_MosaicTwo" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse { Name = "P107_MosaicThree" },
			PlayerHasItem{ItemId = 3235},
		},
		Actions = {
			Say{Tag = "mosaik107_011", String = "In das Mosaik wurden bereits zwei Teilstücke wieder eingefügt."},
			OfferAnswer{Tag = "mosaik107_006PC", String = "(Drittes Teilstück einsetzen)", AnswerId = 5},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse { Name = "P107_MosaicThree" },
			Negated(PlayerHasItem{ItemId = 3235}),
		},
		Actions = {
			Say{Tag = "mosaik107_011", String = "In das Mosaik wurden bereits zwei Teilstücke wieder eingefügt."},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse { Name = "P107_MosaicThree" }),
			PlayerHasItem{ItemId = 3236},
		},
		Actions = {
			Say{Tag = "mosaik107_012", String = "In das Mosaik wurden bereits drei Teilstücke wieder eingefügt"},
			OfferAnswer{Tag = "mosaik107_008PC", String = "(Letztes Teilstück einsetzen)", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse { Name = "P107_MosaicThree" }),
			Negated(PlayerHasItem{ItemId = 3236}),
		},
		Actions = {
			Say{Tag = "mosaik107_012", String = "In das Mosaik wurden bereits drei Teilstücke wieder eingefügt"},
		}}


	EndDefinition()
end