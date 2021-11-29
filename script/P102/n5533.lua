-->INFO: Hulu
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p102\n5533_Hulu.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "Q560_HuluKnown"},
		},
		Actions = {
			Say{Tag = "hulu102_001", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q560_HuluKnown"}),
		},
		Actions = {
			Say{Tag = "hulu102_003", String = "Oh! Du Janina gebracht hast! Große Runenkrieger kehren wieder, um uns zu helfen!"},
			Answer{Tag = "hulu102_004PC", String = "Sie erhofft sich Heilung von ihrem Fluch. Könnt Ihr das bewirken, Skerg?", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hulu102_002", String = ""},
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
		},
		Actions = {
			Say{Tag = "hulu102_005", String = "Hmm. Bewirken ich das nicht kann. Zu mächtig ist der Geist, der umschließt ihre Seele!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hulu102_006", String = "Hulus Macht reicht nicht aus, um den Bann zu vertreiben. Sie sich stellen muss den Mächten, die sie quälen."},
			Answer{Tag = "hulu102_007PC", String = "Wie soll das geschehen?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hulu102_008", String = "Nur derjenige, der ihr diesen Fluch auferlegt hat, kann ihn auch von ihr nehmen."},
			Answer{Tag = "hulu102_009PC", String = "Dunhan.", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hulu102_010", String = "Hinter seinen Kriegern und Mauern sitzt er, Wahnsinn wohnt in seinem Geist. Aber Setrius, sein Bruder, er helfen euch wird."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hulu102_011", String = "Folgt dem Weg nach Nordosten, dort Setrius sein Lager hat. Aber viele Kithar und Kriecher auf dem Weg."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hulu102_012", String = "Aber Euch helfen, das werden wir! Unsere Hütten und Land könnt Ihr nutzen! Denn mehr Soldaten werdet ihr brauchen für den Marsch."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 562},
						 QuestBegin{QuestId = 563},
						 SetPlayerFlagTrue{Name = "Q560_HuluKnown"},
						 RevealUnExplored { X = 306 , Y = 393 , Range = 25 },
						 RemoveDialog{NpcId = 5533},
						 SetGlobalFlagTrue{Name = "DialogHuluEnded"},
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