-->INFO: Schatzkiste19
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n7940_Schatzkiste19.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "schatzkiste19110_001", String = "(Anstelle eines Schl�ssellochs ist in diese Kiste ein Schlitz eingelassen. Daneben wurden f�nf Totensch�del in das Holz geschnitzt.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem {ItemId = 4079},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schatzkiste19110_002PC", String = "(Sch�delm�nze in den Schlitz werfen)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4079}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedFourthCoin"}),
		},
		Actions = {
			Say{Tag = "schatzkiste19110_004", String = "(Die M�nze f�llt in den Schlitz. In der Truhe verschiebt sich ein Riegel.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedFourthCoin"},
		},
		Actions = {
			Say{Tag = "schatzkiste19110_003", String = "(Die M�nze f�llt in den Schlitz. Der letzte Riegel verschiebt sich. Die Truhe kann jetzt ge�ffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4079, Flag = Take},
			RemoveDialog {NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedThirdCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedThirdCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedFourthCoin"},
			TransferItem{TakeItem = 4079, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedSecondCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedSecondCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedThirdCoin"},
			TransferItem{TakeItem = 4079, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedFirstCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{13;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedFirstCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedSecondCoin"},
			TransferItem{TakeItem = 4079, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedFirstCoin"},
			TransferItem{TakeItem = 4079, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}


	EndDefinition()
end