-->INFO: Raum3MenhirA
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions =
	{
			IsNpcFlagTrue{Name = "npc_P210_ChoiceHandTaken"},
			IsNpcFlagTrue{Name = "npc_P210_ChoiceSwordTaken"}
	},
	Actions =
	{
		RemoveDialog {NpcId = self },
	}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9803_Raum3MenhirA.txt


	

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
			Say{Tag = "room3_menhirA_p210_001", String = "(In diesen Menhir wurden zwei Symbole eingraviert: Das Symbol einer Hand und das Symbol eines Schwerts .)"},
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
			IsNpcFlagFalse { Name = "npc_P210_ChoiceHandTaken" },
			IsNpcFlagFalse { Name = "npc_P210_ChoiceSwordTaken" },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room3_menhirA_p210_002PC", String = "(Das Symbol der Hand berühren)", AnswerId = 3},
			OfferAnswer{Tag = "room3_menhirA_p210_005PC", String = "(Das Symbol des Schwerts berühren)", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse { Name = "npc_P210_ChoiceHandTaken" },
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceSwordTaken" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room3_menhirA_p210_002PC", String = "(Das Symbol der Hand berühren)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceHandTaken" }),
			IsNpcFlagFalse { Name = "npc_P210_ChoiceSwordTaken" },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room3_menhirA_p210_005PC", String = "(Das Symbol des Schwerts berühren)", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceHandTaken" }),
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceSwordTaken" }),
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
			IsGlobalFlagTrue{Name = "g_P210_Room3GateAOpen"},
		},
		Actions = {
			Say{Tag = "room3_menhirA_p210_003", String = "Nichts geschieht"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P210_Room3GateAOpen"}),
		},
		Actions = {
			Say{Tag = "room3_menhirA_p210_004", String = "Ein Rumpeln ertönt."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "npc_P210_ChoiceHandTaken"},
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
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_Room3GateAOpen"},
			SetNpcFlagTrue{Name = "npc_P210_ChoiceHandTaken"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "room3_menhirA_p210_004", String = "Ein Rumpeln ertönt."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_Room3GateDOpen"},
			SetNpcFlagTrue{Name = "npc_P210_ChoiceSwordTaken"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end