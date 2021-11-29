-->INFO: Raum3MenhirC
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions =
	{
			IsNpcFlagTrue{Name = "npc_P210_ChoiceRavenTaken"},
			IsNpcFlagTrue{Name = "npc_P210_ChoiceToadTaken"}
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
-- Source: C:\project\main\mission\dialoge\p210\n9805_Raum3MenhirC.txt


	

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
			Say{Tag = "room3_menhirC_p210_001", String = "(In diesen Menhir wurden zwei Symbole eingraviert: Das Symbol eines Raben und das Symbol einer Kröte.)"},
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
			IsNpcFlagFalse { Name = "npc_P210_ChoiceRavenTaken" },
			IsNpcFlagFalse { Name = "npc_P210_ChoiceToadTaken" },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room3_menhirC_p210_002PC", String = "(Das Symbol des Raben berühren)", AnswerId = 3},
			OfferAnswer{Tag = "room3_menhirC_p210_004PC", String = "(Das Symbol der Krone berühren)", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse { Name = "npc_P210_ChoiceRavenTaken" },
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceToadTaken" }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room3_menhirC_p210_002PC", String = "(Das Symbol des Raben berühren)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceRavenTaken" }),
			IsNpcFlagFalse { Name = "npc_P210_ChoiceToadTaken" },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room3_menhirC_p210_004PC", String = "(Das Symbol der Krone berühren)", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceRavenTaken" }),
			Negated(IsNpcFlagFalse { Name = "npc_P210_ChoiceToadTaken" }),
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
			Say{Tag = "room3_menhirC_p210_003", String = "Ein Rumpeln ertönt."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_Room3GateIOpen"},
			SetNpcFlagTrue{Name = "npc_P210_ChoiceRavenTaken"},
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
			Say{Tag = "room3_menhirC_p210_003", String = "Ein Rumpeln ertönt."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_Room3GateHOpen"},
			SetNpcFlagTrue{Name = "npc_P210_ChoiceToadTaken"},
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