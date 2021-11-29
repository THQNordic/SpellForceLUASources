-->INFO: Huldis
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n6818_Huldis.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagHuldisKnown"},
		},
		Actions = {
			Say{Tag = "huldis105_001", String = "Nun, was schleicht Ihr noch hier herum?"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagHuldisKnown"}),
		},
		Actions = {
			Say{Tag = "huldis105_002", String = "Was gibt es?"},
			Answer{Tag = "huldis105_003PC", String = "Ihr seht aus wie eine Händlerin.", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "huldis105_004", String = "Das mag sein. Doch ich handle nicht mit Fremden! Schon gar nicht mit Euresgleichen!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagHuldisKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
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
			IsItemFlagTrue{Name = "PlayerHasItemElfBrooch"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "huldis105_005PC", String = "Kennt ihr eine solche Brosche?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemElfBrooch"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "huldis105_006", String = "Die Brosche einer meiner Schwestern. Woher habt Ihr sie?"},
			Answer{Tag = "huldis105_007PC", String = "Eure Schwester schenkte sie mir, als ich sie vom Wundbrand heilte.", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "huldis105_008", String = "Das ist das Zeichen der Ean Hal, der Jahresweihe! Sie dient in meinem Volk als Zeichen der Mündigkeit."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "huldis105_009", String = "Wenn sie Euch ihr Vertrauen schenkt, will ich das auch tun. Verzeiht meine harschen Worte, schaut Euch mein Sortiment an."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetItemFlagFalse{Name = "PlayerHasItemElfBrooch"},
			RemoveDialogFromNpc{NpcId = self},
			ChangeUnit{Unit = 1745},
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