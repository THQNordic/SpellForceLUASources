-->INFO: Raum3MenhirG
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions =
	{
			IsNpcFlagTrue{Name = "npc_P210_ChoiceDaggerTaken"},
			IsNpcFlagTrue{Name = "npc_P210_ChoiceDiamondTaken"}
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
-- Source: C:\project\main\mission\dialoge\p210\n9809_Raum3MenhirG.txt


	

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
			Say{Tag = "room3_menhirG_p210_001", String = "(In diesen Menhir wurden zwei Symbole eingraviert: Das Symbol eines Dolchs und das Symbol einer Diamanten.)"},
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
			IsNpcFlagFalse { Name = "npc_P210_ChoiceDaggerTaken" },
			IsNpcFlagFalse { Name = "npc_P210_ChoiceDiamondTaken" },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room3_menhirG_p210_002PC", String = "(Das Symbol des Dolchs berühren)", AnswerId = 3},
			OfferAnswer{Tag = "room3_menhirG_p210_004PC", String = "(Das Symbol der Diamanten berühren)", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse { Name = "npc_P210_ChoiceDaggerTaken" },
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceDiamondTaken" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room3_menhirG_p210_002PC", String = "(Das Symbol des Dolchs berühren)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceDaggerTaken" }),
			IsNpcFlagFalse { Name = "npc_P210_ChoiceDiamondTaken" },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room3_menhirG_p210_004PC", String = "(Das Symbol der Diamanten berühren)", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceDaggerTaken" }),
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceDiamondTaken" }),
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
		},
		Actions = {
			Say{Tag = "room3_menhirG_p210_003", String = "Ein Rumpeln ertönt."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_Room3GateKOpen"},
			SetGlobalFlagTrue{Name = "g_P210_Room3GateFOpen"},
			SetNpcFlagTrue{Name = "npc_P210_ChoiceDaggerTaken"},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "room3_menhirG_p210_003", String = "Ein Rumpeln ertönt."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_Room3GateJOpen"},
			SetGlobalFlagTrue{Name = "g_P210_Room3GateGOpen"},
			SetNpcFlagTrue{Name = "npc_P210_ChoiceDiamondTaken"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end