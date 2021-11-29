-->INFO: mosaik
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p16\n3616_mosaik.txt


	

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{ Name = "MosaicOne" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{ Name = "MosaicOne" },
			PlayerHasItem{ItemId = 3233},
		},
		Actions = {
			Say{Tag = "mosaik001", String = "(Die Bodenplatten ziert ein zerbrochenes Steinbild. Der größte Teil des Mosaiks fehlt.)"},
			OfferAnswer{Tag = "mosaik001PC", String = "(Jons Teilstück einsetzen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{ Name = "MosaicOne" },
			Negated(PlayerHasItem{ItemId = 3233}),
		},
		Actions = {
			Say{Tag = "mosaik001", String = "(Die Bodenplatten ziert ein zerbrochenes Steinbild. Der größte Teil des Mosaiks fehlt.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik002", String = "(Aus dem Untergrund ertönt entfernt ein Summen.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 3234},
		},
		Actions = {
			SetPlayerFlagTrue {Name = "MosaicOne"},
					ChangeObject{X = 262, Y = 414 , Object = 2455 },
					TransferItem{TakeItem = 3233 , Flag = Take},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik002PC", String = "(Zweites Teilstück einsetzen)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3234}),
		},
		Actions = {
			SetPlayerFlagTrue {Name = "MosaicOne"},
					ChangeObject{X = 262, Y = 414 , Object = 2455 },
					TransferItem{TakeItem = 3233 , Flag = Take},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik003", String = "(Das Summen aus dem Untergrund wird lauter.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem{ItemId = 3235},
		},
		Actions = {
			SetPlayerFlagTrue {Name = "MosaicTwo"},
					 ChangeObject{X = 262 , Y = 414 , Object = 2456 },
					 TransferItem{TakeItem = 3234 , Flag = Take},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik003PC", String = "(Drittes Teilstück einsetzen)", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3235}),
		},
		Actions = {
			SetPlayerFlagTrue {Name = "MosaicTwo"},
					 ChangeObject{X = 262 , Y = 414 , Object = 2456 },
					 TransferItem{TakeItem = 3234 , Flag = Take},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik004", String = "(Die Luft beginnt zu vibrieren.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 3236},
		},
		Actions = {
			SetPlayerFlagTrue {Name = "MosaicThree"},
					ChangeObject{X = 262 , Y = 414 , Object = 2457 },
					TransferItem{TakeItem = 3235 , Flag = Take},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mosaik004PC", String = "(Letztes Teilstück einsetzen)", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3236}),
		},
		Actions = {
			SetPlayerFlagTrue {Name = "MosaicThree"},
					ChangeObject{X = 262 , Y = 414 , Object = 2457 },
					TransferItem{TakeItem = 3235 , Flag = Take},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mosaik005", String = "(Das Mosaik ist wieder vollständig! Der Boden zittert, die Luft wird faulig...)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue {Name = "MosaicComplete"},
				   RemoveDialogFromNpc{NpcId = 3616},
				   ChangeObject{X = 262 , Y = 414 , Object = 2458 },
				   TransferItem{TakeItem = 3236 , Flag = Take},
				   SetRewardFlagTrue{ Name = "MosaikDesTodes"},
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse { Name = "MosaicTwo" },
			PlayerHasItem{ItemId = 3234},
		},
		Actions = {
			Say{Tag = "mosaik006", String = "(In das Mosaik wurde bereits ein Teilstück wieder eingefügt.)"},
			OfferAnswer{Tag = "mosaik002PC", String = "(Zweites Teilstück einsetzen)", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse { Name = "MosaicTwo" },
			Negated(PlayerHasItem{ItemId = 3234}),
		},
		Actions = {
			Say{Tag = "mosaik006", String = "(In das Mosaik wurde bereits ein Teilstück wieder eingefügt.)"},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse { Name = "MosaicTwo" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse { Name = "MosaicThree" },
			PlayerHasItem{ItemId = 3235},
		},
		Actions = {
			Say{Tag = "mosaik007", String = "In das Mosaik wurden bereits zwei Teilstücke wieder eingefügt."},
			OfferAnswer{Tag = "mosaik003PC", String = "(Drittes Teilstück einsetzen)", AnswerId = 5},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse { Name = "MosaicThree" },
			Negated(PlayerHasItem{ItemId = 3235}),
		},
		Actions = {
			Say{Tag = "mosaik007", String = "In das Mosaik wurden bereits zwei Teilstücke wieder eingefügt."},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse { Name = "MosaicThree" }),
			PlayerHasItem{ItemId = 3236},
		},
		Actions = {
			Say{Tag = "mosaik008", String = "In das Mosaik wurden bereits drei Teilstücke wieder eingefügt"},
			OfferAnswer{Tag = "mosaik004PC", String = "(Letztes Teilstück einsetzen)", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse { Name = "MosaicThree" }),
			Negated(PlayerHasItem{ItemId = 3236}),
		},
		Actions = {
			Say{Tag = "mosaik008", String = "In das Mosaik wurden bereits drei Teilstücke wieder eingefügt"},
		}}


	EndDefinition()
end