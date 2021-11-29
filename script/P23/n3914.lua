-->INFO: chest2
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p23\n3914_chest2.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "chest2rift001", String = "(Die Truhe ist verschlossen und lässt sich auch mit großer Kraftanstrengung nicht aufbrechen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 3351},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "chest2rift001PC", String = "(Den leuchtend roten Schlüssel verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3351}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "chest2rift002", String = "(Mit einem Klicken entriegelt der Schlüssel das Schloss. Die Kiste kann nun geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "ThirdChestOpened"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "ThirdChestOpened"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FirstChestOpened"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{4;
		Conditions = {
			IsPlayerFlagTrue{Name = "FirstChestOpened"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "chest2rift003", String = "(Der Schlüssel bricht ab. Das abgebrochene Stück kann nicht mehr aus dem Schloss herausgezogen werden.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3351 , Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "chest2rift004", String = "(Ihr zieht den Schlüssel wieder aus dem Schloss.)"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "SecondChestOpened"},
			RemoveDialogFromNpc{NpcId = 3914},
			EndDialog(),
		}}


	EndDefinition()
end