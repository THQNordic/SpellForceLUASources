-->INFO: Leutnant
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

--SideQuest wird aktiv sobald der Schattenkrieger oder der Phönixkrieger (bei gesolvter MainQuest 777) Blackwater betritt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
			UND9
			{
				QuestState {QuestId = 777, State = StateSolved}, 
				IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"},
				IsGlobalFlagTrue{Name = "g_P204_UriasNebenquestAktiv"},
			},
		},
	},
	Actions = 
	{ 
		Goto {X = 84, Y = 79, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous},
		SetGlobalFlagTrue {Name = "g_sP201SideQuestAktive"},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 84, Y = 79, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP201SideQuestAktive"},
	},
	Actions = 
	{ 
		LookAtDirection {Direction = SouthWest, NpcId = self},
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P201\n9202_Leutnant.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 895 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(Negated(QuestState{QuestId = 895 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_001", String = "Ihr seid zurück? Gut!"},
			Answer{Tag = "dawn_leutenantP201_002PC", String = "Brecht Euer Lager ab, Leutnant, bringt die Männer zurück nach Nortander. Wo wir hingehen, wären ihre guten Seelen nur verloren.", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_004", String = "Wer seid Ihr?"},
			Answer{Tag = "dawn_leutenantP201_005PC", String = "Ich reise mit Urias. Wir sind hier, um Euch heimzusenden, Leutnant. Wir brechen in den Süden von Xu auf, Ihr kehrt am besten in Eure Heimat zurück.", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_003", String = "Den Göttern sei Dank!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_006", String = "Endlich! Ich hoffe, in Nortander ist noch alles beim Alten! An diesem Ort hier hält es ja keiner aus!"},
			Answer{Tag = "dawn_leutenantP201_007PC", String = "Ihr seht reichlich erschöpft aus, was habt Ihr?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_008", String = "Dieser Ort ist ... verflucht! Die Götter wissen, dass ich nicht leicht zu schrecken bin, aber dieses Geheul geht einem durch Mark und Bein!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_009", String = "Es sind Klagerufe ... ich weiß nicht, woher sie kommen. Aber eine unserer Streifen hat behauptet, etwas nordwestlicher Richtung gesehen zu haben, was wie ein Geist aussah."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_010", String = "Nehmt's mir nicht übel, wenn ich hier Geistergeschichten erzähle, aber ich will verdammt sein, wenn das Geheul nicht von diesem Geisterwesen stammt!"},
			Answer{Tag = "dawn_leutenantP201_011PC", String = "Über was klagt denn der Geist?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_012", String = "Über seinen Bruder, glaube ich. Vergebt mir, aber ich bin nur Soldat. Solche Rätsel sind etwas für Euresgleichen."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP201QuestStartGurim"},
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

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_001", String = "Ihr seid zurück? Gut!"},
			Answer{Tag = "dawn_leutenantP201_013PC", String = "Was gibt es Leutnant?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_004", String = "Wer seid Ihr?"},
			Answer{Tag = "dawn_leutenantP201_016PC", String = "Ein Runenkrieger auf Feldzug ... und wer seid Ihr?", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_014", String = "Irgendetwas geht hier um ... keiner der Untoten, wie wir sie kennen, etwas anderes! Es heult und schreit in einem fort, meine Männer und ich sind  am Ende!"},
			Answer{Tag = "dawn_leutenantP201_015PC", String = "Wisst Ihr, woher dieses Geheul kommt?", AnswerId = 6},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_017", String = "Wir sind Ritter vom Orden des Erwachens aus Nortander. Wir zogen mit unserem Kommandanten Urias hierher, auf der Suche dem Historiker Darius."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_018", String = "Urias ist mittlerweile nach Xu weitergezogen, wir sollen hier auf ihn warten und aushalten. Aber, bei meiner Treu, ich weiß nicht, wie lange wir das noch können!"},
			Answer{Tag = "dawn_leutenantP201_019PC", String = "Werdet Ihr angegriffen?", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawn_leutenantP201_020", String = "Es gab Angriffe, ja! Aber jetzt ist es ruhiger geworden, nur irgendetwas heult und schreit da draußen, als gäbe es kein Morgen! Mittlerweile wünsche ich mir fast, dass es uns endlich angreifen würde, nur damit es vorbei ist!"},
			Answer{Tag = "dawn_leutenantP201_021PC", String = "Was glaubt Ihr, was es ist? Was hat das Geheul zu bedeuten?", AnswerId = 6},
		}}


	EndDefinition()
end