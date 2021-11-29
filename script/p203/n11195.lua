-->INFO: Tantaro
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate {}

SpawnOnlyWhen
{X = _X , Y = _Y , NoSpawnEffect = TRUE,
	Conditions = 
	{
		QuestState {QuestId = 1028, State = StateActive},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p203_Tantaro_Has_Spawned"},
		ChangeRace {Race = 152},
	},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p203\n11195_Tantaro.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "n_p203_Tantaro_Known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "n_p203_Tantaro_Known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tantaroP203_001", String = "Weg!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tantaroP203_009PC", String = "Schon gut, Tantaro. Ich gehe.", AnswerId = 10},
			OfferAnswer{Tag = "tantaroP203_011PC", String = "Irrsinniger! Ihr könnt nicht das ganze Dorf opfern! Zur Seite!", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 1029},
			Say{Tag = "tantaroP203_002", String = "Bleibt weg! Das ist mein Wasser! Weg!"},
			Answer{Tag = "tantaroP203_003PC", String = "Ihr seid Tantaro, nicht wahr? Was ist mit Euren Händen passiert? Ihr seht krank aus!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tantaroP203_004", String = "Nicht näher! Das ist mein Wasser! Ich töte Euch! Ich tue es!"},
			Answer{Tag = "tantaroP203_005PC", String = "Ihr sollt die Quelle reinigen, nicht ihr letzes Wasser für Euch beanspruchen!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tantaroP203_006", String = "Sie kann nicht gereinigt werden, das Dorf ist verloren! Alle sind verloren!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tantaroP203_007", String = "Die Hazim werden sie sowieso alle töten! So lebe wenigstens ich!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tantaroP203_008", String = "Bleibt weg! Oder ich schlage Euch den Schädel ein!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "n_p203_Tantaro_Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tantaroP203_009PC", String = "Schon gut, Tantaro. Ich gehe.", AnswerId = 10},
			OfferAnswer{Tag = "tantaroP203_011PC", String = "Irrsinniger! Ihr könnt nicht das ganze Dorf opfern! Zur Seite!", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tantaroP203_010", String = "Ja! Geht weg!"},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tantaroP203_012", String = "Ich habe Euch gewarnt! Ihr bekommt mein Wasser nicht!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tantaroP203_013", String = "Ich mache Euch tot, dann habt Ihr keinen Durst mehr!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			ChangeRace{NpcId = 11195, Race = 150},
			RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end