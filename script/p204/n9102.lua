-->INFO: Arenawache

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 9102},
		SetGlobalFlagTrue {Name = "g_P204_ArenawacheHomepoint"},		
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = South, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_ArenawacheHomepoint", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert"},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9023"},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n9102_Arenawache.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_ArenaWacheKnown"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_ArenaWacheKnown"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState {QuestId = 881, State = StateActive}),
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_016", String = "Ich sagte doch, keine Vorstellung!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState {QuestId = 881, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_UrkundeSchonGegeben"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_UrkundeSchonGegeben"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_RundeEinsGeschafft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_RundeEinsGeschafft"},
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_001", String = "Die Ahnen mögen Euch verfluchen! Das waren meine besten Kämpfer!"},
			Answer{Tag = "townguard_bostosP204_002PC", String = "Nicht gut genug. Jetzt gebt mir den Schuldschein!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_003", String = "Bei den tanzenden Sandteufeln! Da, nehmt ihn!"},
			Answer{Tag = "townguard_bostosP204_004PC", String = "Nun ist EUre Bruder wohl endlich frei von Euch! Lebt wohl.", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7217, Flag = Give}, SetGlobalFlagTrue {Name = "g_P204_UrkundeSchonGegeben"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_ArenaAuswahlTreffen"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_ArenaAuswahlTreffen"}),
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_005", String = "Kein Kampf heute, verdammt schade!"},
			Answer{Tag = "townguard_bostosP204_006PC", String = "Vielleicht doch ... Ich bin hier um als Champion Eures Bruders anzutreten!", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_007", String = "Hat er wieder jemanden beschwatzt! Glaubt mir es will keiner für ihn kämpfen! Er kann nämlich nicht bezahlen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_009", String = "Hört Ihr was ich sage? Er hat kein Gold! Kein Stück! Ihr werdet nicht mal ein Kupfer bekommen!"},
			Answer{Tag = "townguard_bostosP204_010PC", String = "Das lasst nur meine Sorge sein! Ich soll seinen Schuldschein mitbringen, nachdem ich Eure Kämpfer geschlagen habe.", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_011", String = "Also gut! Gut, gut! Wir werden ja sehen! In die Arena mit Euch!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_ArenaAuswahlTreffen"},
			Say{Tag = "townguard_bostosP204_012", String = "Wie sieht es aus? Willst du kämpfen?"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "townguard_bostosP204_013PC", String = "Ja! Ich trete an!", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_014", String = "Gut! Stellt Euch in die Mitte des Sterns auf dem Arenaplatz! Dann werde ich den Kampf beginnen lassen!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_015", String = "Wenn ihr wirklich siegt, dann könnt Ihr Euch bei mir den Schuldschein abholen! Aber ich denke Ihr werdet gleich in Eurem Blut liegen!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_ArenaKampfStart"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_017", String = "Keine Vorstellung heute!"},
			Answer{Tag = "townguard_bostosP204_018PC", String = "Was ist das für ein Ort?", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_019", String = "Wonach sieht es denn aus? Dies ist die Arena! Hier gibt es grandiose Kämpfe der besten Gladiatoren von Xu!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_020", String = "Wir haben hier Bestien aus aller Herren Länder! Nur nach das Colloseum der Götter kommt dier Arena gleich!"},
			Answer{Tag = "townguard_bostosP204_021PC", String = "Seid Ihr der Betreiber, dass Ihr es so anpreist?", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "townguard_bostosP204_022", String = "Nein, das ist Serbio, ich schiebe nur Wache hier ... aber ich habe so nebenher selbst einen kleinen Gladiatorenstall! Meine Kämpfer sind die besten!"},
			Answer{Tag = "townguard_bostosP204_023PC", String = "Da bin ich mir sicher. Lebt wohl.", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_ArenaWacheKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end