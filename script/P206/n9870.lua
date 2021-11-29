-->INFO: KarawanenAnnehmer
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Nur wenn der Karawanenführer stirbt und noch mindestens eni Tier der Karawane lebt spawnt der

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		FigureDead {NpcId = 8790},
		ODER9
		{
			FigureAlive {NpcId = 9021},
			ODER9
			{
				FigureAlive {NpcId = 9012},
				FigureAlive {NpcId = 9013},
				FigureAlive {NpcId = 9014},
				FigureAlive {NpcId = 9015},
				FigureAlive {NpcId = 9016},
				FigureAlive {NpcId = 9017},
				FigureAlive {NpcId = 9018},
				FigureAlive {NpcId = 9019},
				FigureAlive {NpcId = 9020}
			}
		}
	},
	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_P206_AngekommeneKarawane"},
	},
	Actions =
	{
		QuestSolve {QuestId = 825}, 
		QuestBegin {QuestId = 891}
	}
		
}

-- Wenn der Auftrag nicht mehr zu lösen ist soll der Typ wieder verschwinden, kann passieren,das er 
-- spawnt wenn der Karawanenführer vor den Trollen stirbt
Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_p206_DespawnKarawanenannehmer"}
	}
}

-- Den Dialog abschalten, wenn alles (Karawane annehmen) gesagt ist
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_AngekommeneKarawane"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8790"},
	}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p206\n9870_KarawanenAnnehmer.txt


	

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
			Say{Tag = "ena_001", String = "Wer seid Ihr? Wo ist Bario? Was ist geschehen?"},
			Answer{Tag = "ena_002PC", String = "Es tut mir leid, Bario ist tot.", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ena_003", String = "Bario tot? Wie kann das Schicksal so grausam sein? Er war der einzige, der sich noch um uns gekümmert hat!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_n_P206GanzeKarawaneAngekommen"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "ena_004PC", String = "Ich habe seine Waren sicher hierher gebracht. Ich denke er wollte, das Ihr sie bekommt!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_n_P206GanzeKarawaneAngekommen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ena_005", String = "Seid bedankt, Fremder! Es gibt nicht viel, was ich Euch im Austausch dafür geben kann."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ena_006", String = "Möge das Schicksal Eure Wege mit Gold bedecken."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "AlleTrolleKommenAn"}, SetGlobalFlagTrue { Name = "g_P206_AngekommeneKarawane"}, QuestSolve {QuestId = 825}, QuestBegin {QuestId = 891},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_n_P206HalbeKarawaneAngekommen"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "ena_007PC", String = "Leider sind auch einige der Träger der Wüste zum Opfer gefallen. Aber nehmt von Barios Waren, was noch übrig ist. Ich denke, er hätte das so gewollt.", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_n_P206HalbeKarawaneAngekommen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ena_008", String = "Die Ahnen mögen Euch segen. Ihr habt ein gutes Werk getan!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "VieleTrolleKommenAn"}, SetGlobalFlagTrue { Name = "g_P206_AngekommeneKarawane"}, QuestSolve {QuestId = 825}, QuestBegin {QuestId = 891},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_n_P206ViertelKarawaneAngekommen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_n_P206ViertelKarawaneAngekommen"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "ena_009PC", String = "Wir wurden mehrfach angegriffen! Viele der Träger sind gefallen, dieses Land ist warhhaft feindselig!", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ena_010", String = "Ja, aber es ist unsere Heimat. Wir sind Euch dankbar, das Ihr wenigstens einige der Vorräte zu uns gebracht habt! Nicht jeder hätte das getan."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "WenigeTrolleKommenAn"}, SetGlobalFlagTrue { Name = "g_P206_AngekommeneKarawane"}, QuestSolve {QuestId = 825}, QuestBegin {QuestId = 891},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
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
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_n_P206KeineKarawaneAngekommen"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "ena_011PC", String = "Leider ist auch die gesamte Lieferung für Euch verloren! Keiner der Träger hat den Marsch überlebt!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_n_P206KeineKarawaneAngekommen"}),
		},
		Actions = {
			Say{Tag = "ena_014", String = "Dennoch, danke!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ena_012", String = "Die Ahnen haben sich von uns abgewandt! Diese Vorräte wären unsere Rettung gewesen! Nun, es kommt wie es muss! Ich werde dem Rat die Kunde bringen."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "206KeineKarawaneDurchgebracht"}, SetGlobalFlagTrue { Name = "g_P206_AngekommeneKarawane"}, QuestSolve {QuestId = 825}, QuestBegin {QuestId = 891},
			Say{Tag = "ena_013", String = "Nun gilt nur noch das nackte Überleben. Was soll ich nur den Kindern sagen ...?"},
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
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ena_015", String = "Werdet Ihr bei uns bleiben?"},
			Answer{Tag = "ena_016PC", String = "Nein, ich muss weiter nach Süden, nach Kathai!", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ena_017", String = "Dann liegt nun der Rabenpass vor Euch, mit seinen alten Festungen! Wir haben von Untoten gehört, die dort einmarschiert sind!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ena_018", String = "Seid dort vorsichtig! Lebt wohl, Freund."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end