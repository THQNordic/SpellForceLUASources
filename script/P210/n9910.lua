-->INFO: Raum1TalkingHead0
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnToggleEvent 
{
	UpdateInterval = 30,
	OnConditions =
	{
		IsGlobalFlagTrue{ Name = "g_210_TongueInHead0"},
	},
	OnActions	=
	{
		SetEffect { Effect = "Tongue",  Length = 0, TargetType = Object, NpcId = self},
	},
	OffConditions =
	{
		IsGlobalFlagFalse{ Name = "g_210_TongueInHead0"},
	},
	OffActions	=
	{
		StopEffect { X = _X, Y = _Y, TargetType = World },
	}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9910_Raum1TalkingHead0.txt


	

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
			Say{Tag = "room1_head0_p210_001", String = "(Der steinerne Kopf ist innen hohl.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "room1_head0_p210_002", String = "(Aus einem Schacht, der in die Tiefe führt, dringt ein in regelmäßigen Abständen unterbrochener Luftstrom aus dem Mund. )"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "room1_head0_p210_003", String = "(Die im Mundraum des Steinkopfs wirblende Luft erzeugt ein seltsames Rauschen.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			IsGlobalFlagTrue{ Name = "g_210_TongueInHead0" },
		},
		Actions = {
			Say{Tag = "room1_head0_p210_004", String = "(Im Innern des Mundraums liegt eine Zunge, die vom Luftstrom bewegt wird.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "g_210_TongueInHead0" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
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
			PlayerHasItem{ItemId = 7216},
			IsGlobalFlagTrue{ Name = "g_210_TongueInHead0" },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room1_head0_p210_005PC", String = "(Dem Rauschen des Luftstrom lauschen)", AnswerId = 10},
			OfferAnswer{Tag = "room1_head0_p210_009PC", String = "(Steinzunge einsetzen)", AnswerId = 19},
			OfferAnswer{Tag = "room1_head0_p210_011PC", String = "(Steinzunge herausnehmen)", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			PlayerHasItem{ItemId = 7216},
			Negated(IsGlobalFlagTrue{ Name = "g_210_TongueInHead0" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room1_head0_p210_005PC", String = "(Dem Rauschen des Luftstrom lauschen)", AnswerId = 10},
			OfferAnswer{Tag = "room1_head0_p210_009PC", String = "(Steinzunge einsetzen)", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7216}),
			IsGlobalFlagTrue{ Name = "g_210_TongueInHead0" },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room1_head0_p210_005PC", String = "(Dem Rauschen des Luftstrom lauschen)", AnswerId = 10},
			OfferAnswer{Tag = "room1_head0_p210_011PC", String = "(Steinzunge herausnehmen)", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7216}),
			Negated(IsGlobalFlagTrue{ Name = "g_210_TongueInHead0" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room1_head0_p210_005PC", String = "(Dem Rauschen des Luftstrom lauschen)", AnswerId = 10},
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
			IsGlobalFlagTrue{ Name = "g_210_TongueInHead0" },
		},
		Actions = {
			Say{Tag = "room1_head0_p210_006", String = "NARRRR!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "g_210_TongueInHead0" }),
		},
		Actions = {
			Say{Tag = "room1_head0_p210_008", String = "(Es sind keine verständlichen Laute zu hören.)"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "room1_head0_p210_007", String = "DEIN TOD IST GEWISSSS!"},
			Answer{Tag = "", String = "", AnswerId = 13},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{ Name = "g_210_TongueInHead0" },
			TransferItem{GiveItem = 0, TakeItem = 7216, Flag = Take},
			Say{Tag = "room1_head0_p210_010", String = "(Steinzunge eingesetzt)"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 7216, TakeItem = 0, Flag = Give},
			SetGlobalFlagFalse{ Name = "g_210_TongueInHead0" },
			Say{Tag = "room1_head0_p210_012", String = "(Steinzunge herausgenommen)"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}


	EndDefinition()
end