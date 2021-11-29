-->INFO: Gartenwache
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_AlyahKaiserin"},
	}
}


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 8849},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		   IsGlobalFlagTrue {Name = "g_P204_GartenwacheAttacke", UpdateInterval = 10},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8849"},
		Outcry { NpcId = 8849 , Tag = "oca2sergeantP204_002", String = "Ein Eindringling im Palast! Alarm! Ergreift ihn!" },
		ChangeRace{Race = 150, NpcId = self},
	}
}

OnIdleGoHome
{
	X = _X, Y = _Y, WalkMode = Walk, Direction = East,
	Conditions =
	{
	    FigureDead {NpcId = 0},
	},

	HomeActions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n8849_Gartenwache.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_PalastwacheWarnung"},
		},
		Actions = {
			Say{Tag = "gatekeeper_tantharP204_001", String = "Ihr wollt es wohl nicht anders, was? Wachen tötet den Eindringling!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_PalastwacheWarnung"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_GartenwacheAttacke"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagGartenwacheKnown"},
		},
		Actions = {
			Say{Tag = "gatekeeper_tantharP204_002", String = "Wer seid denn Ihr? Euch habe ich hier ja noch nie gesehen!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGartenwacheKnown"}),
		},
		Actions = {
			Say{Tag = "gatekeeper_tantharP204_005", String = "Rede ich Orkisch? Ihr sollt verschwinden! Das ist meine letzte Warnung!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_tantharP204_003", String = "Hm, hier wollen sonst nur Gärtner oder Diebe rein und wie ein Gärtner seht Ihr mir nicht gerade aus! Da wird die Wahl doch ziemlich eng!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_tantharP204_004", String = "Ich gebe Euch jetzt Gelegenheit, unverletzt von hier zu verschwinden! Aber nur, weil ich meinen guten Tag habe! Los, verschwindet!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagGartenwacheKnown"},
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
			SetGlobalFlagTrue {Name = "g_P204_PalastwacheWarnung"},
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


	EndDefinition()
end