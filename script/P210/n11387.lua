-->INFO: ZerbitengeistSidequest
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnToggleEvent
{
	OnConditions =
	{
		ODER9
		{
			IsGlobalFlagFalse{Name = "g_P210_EndeCutsceneVermaechtnis"},
			IsGlobalFlagTrue{Name = "g_P210_ToldAboutTuomiFraud"}
		}
	},
	OnActions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11387"}
	},
	OffConditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_EndeCutsceneVermaechtnis"},
		IsGlobalFlagFalse{Name = "g_P210_ToldAboutTuomiFraud"}
	},
	OffActions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11387"}
	}
}


OnIdleGoHome
{
	X = 262, Y = 461,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_ToldAboutTuomiFraud"}
	},
	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_p210_SidequestGhostDespawn"},
		SetGlobalFlagFalse{Name = "g_P210_ToldAboutTuomiFraud"},
		QuestSolve{QuestId = 1069},
		QuestBegin{QuestId = 1070}
	}

}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_p210_SidequestGhostDespawn"},
	},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n11387_ZerbitengeistSidequest.txt


	

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
			Say{Tag = "zerbiteghost_siedqP210_001", String = "Was wünscht Ihr?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerbiteghost_siedqP210_002PC", String = "Tuomi ist eine Betrügerin!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "zerbiteghost_siedqP210_003PC", String = "Nicht sie hat die Artefakte des blutenden Auges gefunden, sondern ich!", AnswerId = 3},
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
			Say{Tag = "zerbiteghost_siedqP210_004", String = "Ein schwerer Vorwurf. Habt Ihr Beweise dafür?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "zerbiteghost_siedqP210_005PC", String = "Nein, keine Beweise. Nur mein Wort!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghost_siedqP210_006", String = "Einer von Euch beiden muss lügen, doch vielleicht sagt auch keiner von Euch die Wahrheit."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghost_siedqP210_007", String = "Folgt mir, nun muss das Spiel der Meister entscheiden, wer von Euch ein Anrecht auf das Vermächtnis der Zerbiten hat."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_ToldAboutTuomiFraud"},
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