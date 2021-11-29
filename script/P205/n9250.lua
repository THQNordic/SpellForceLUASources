-->INFO: Dryade

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = East}
--!EDS ONIDLEGOHOME END



	

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P205\n9250_Dryade.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 869, State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 869, State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 866, State = StateSolved},
		},
		Actions = {
			Say{Tag = "dryadP205_001", String = "Elens Segen."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 866, State = StateSolved}),
		},
		Actions = {
			Say{Tag = "dryadP205_002", String = "Das Gift verschwindet! Der Hain erwacht zu neuem Leben!"},
			Answer{Tag = "dryadP205_003PC", String = "Der Spinnenmann sollte Euch mit seinem Gift brechen, damit Ihr dem Kaiser gefügig werdet!", AnswerId = 5},
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
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_004", String = "Ach, ich wünschte, ich könnte den Kaiser von dieser unsinnigen Vernarrtheit heilen!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_005", String = "Doch nun zu Euch, mein Freund. Was kann ich tun, um Euch zu helfen?"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 866},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(UND(UND(IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"},IsNpcFlagFalse{Name = "QuestionMaskedOne"}),IsNpcFlagFalse{Name = "QuestionPhoenix"}),IsNpcFlagFalse{Name = "QuestionPotion"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{12;
		Conditions = {
			UND(UND(UND(IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"},IsNpcFlagFalse{Name = "QuestionMaskedOne"}),IsNpcFlagFalse{Name = "QuestionPhoenix"}),IsNpcFlagFalse{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_006PC", String = "Ich bin auf der Suche nach einem Mann namens Darius.", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 20},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 34},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 43},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_007", String = "Er war hier ... und er hat von Euch erzählt."},
			Answer{Tag = "dryadP205_008PC", String = "Geht es ihm gut? Wo ist er?", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_009", String = "Darauf habe ich keine Antwort ... aber ich habe einen Brief für Euch."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "DariusFateTold"}, SetNpcFlagTrue{Name ="DariusFateOn"}, SetGlobalFlagTrue {Name = "g_P205_CutsceneDariusBrief"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_011", String = "Meine Vögel haben ihn auf seiner Reise nach Süden verfolgt. Er überquerte die Dunkelwehrberge, und verschwand im schwarzen Dschungel."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_012", String = "Das ist ein Ort zu dem meine Vögel nicht fliegen können! Es ist der Dschungel Zarachs, weder die Götter, noch ich, können dorthin schauen. Wir haben dort keine Macht."},
			Answer{Tag = "dryadP205_013PC", String = "Und dort will der alte Narr einen Zirkelmagier jagen? Er ist doch nur ein Schreiber, was ist in ihn gefahren?", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_014", String = "Er ist mehr, als ihr denkt, aber ein Narr ist er trotz allem, da habt Ihr recht! Ihr müsst ihm helfe, ich früchte er ist gefangen worden! Und das ist erst der Anfang ..."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_015", String = "Der Maskierte hat begonnen die anderen Zirkelmagier mit dem Essenztrank zu erwecken! Mit diesem Trank gibt er ihnen ihr wahres Leben und ihre Macht zurück, unterwirft sie aber gleichzeitig seinem Willen."},
			Answer{Tag = "dryadP205_016PC", String = "Er bringt den Zirkel aus dem Grab zurück? Unsere alten Meister? Ihr Götter, ich muss ihn aufhalten!", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_017", String = "Ja. ihr seid der Wächter des Phönixsteins, Ihr könnt die Invasion Xus durch Hokans Untote aufhalten, Ihr besitzt die Macht den Zirkel zu vernichten!"},
			Answer{Tag = "dryadP205_018PC", String = "Und bei den Göttern, das werde ich! Ich werde Darius retten und den Zirkel endgültig von dieser Welt fegen!", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_019", String = "Die untoten Armeen haben bereits die Dunklewehrberge überquert und die Pässe in den Dschungel verschlossen! So einfach könnt Ihr Euer Ziel nicht erreichen."},
			Answer{Tag = "dryadP205_020PC", String = "Es muss doch einen Weg in den Dschungel geben! Niemand kann ein ganzes Land abriegeln!", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_021", String = "Der Maskierte ist ein Zirkelmagier, vergesst das nicht! Aber es gibt jemanden der vielleicht einen Weg kennt ... die Uru eine weise Frau der Kathai, ein Volk, dass am Fusse der Dunkelwehrberge lebt."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_022", String = "Sie Geheimnisse über den Dschungel und die Dunkelwehrberge, die ich nie ergründen könnte. Sie kennt die alten Pfade des Zerbitenordens und vielleicht auch einen Weg in den Dschungel."},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_023", String = "Aber der Maskierte weiß, dass Urus Wissen ihm gefählich werden kann! Deswegen wird Kathai bereits von seinen Armeen belagert, er will die Uru tot sehen!"},
			Answer{Tag = "dryadP205_024PC", String = "Wenn ihr Wissen der Schlüssel zum Reich des Maskierten ist dann muss ich Ihr Leben schützen!", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_025", String = "Ja, zieht so schnell Ihr könnt nach Kathai und zersprengt die Belagerung der Untoten dort! Rettet die Uru!"},
			Answer{Tag = "dryadP205_026PC", String = "Wie gelange ich nach Kathai? In Empyria scheinen alle Tore nach Süden verschlossen zu sein!", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_027", String = "Eure Vertraute, die Diebin Alyah, kennt Mittel und Wege um durch die Tore zu kommen ... und sie kann Euch auch wertvolles über den Weg nach Kathai berichten."},
			Answer{Tag = "dryadP205_028PC", String = "Gut, ich breche sofort auf! Danke für Eure Hilfe, Baumgeist. mögt Ihr von nun an Frieden haben.", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 872},
 							 QuestSolve {QuestId = 870},
 							 SetRewardFlagTrue { Name = "MitDryadeGesprochen"},
 							 SetGlobalFlagTrue{Name = "g_StoryQuestRescueUru"},
			SetGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}, SetGlobalFlagTrue{Name = "g_P205_HaranUmspawn"},
			SetGlobalFlagTrue{Name = "g_P205_UriasSpawntBeiAlyah"},
			SetGlobalFlagTrue {Name = "g_nP201_JournalGotoUru"},
						SetNpcFlagTrue{Name = "QuestionPrison"},
						SetNpcFlagFalse{Name ="DariusFateOn"},
			SetNpcFlagTrue{Name = "QuestionMaskedOne"},
			SetNpcFlagTrue{Name = "QuestionPhoenix"},
			SetNpcFlagTrue{Name = "QuestionPotion"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_030", String = "Errinnert Ihr Euch nicht? Es ist der Nekromant, dessen Geist Ihr damals die Maske des Belial gebracht habt!"},
			Answer{Tag = "dryadP205_031PC", String = "In Wisper, ich errinnere mich! Sie Maske war sein Preis, damit er mir verriet, wo ich den Phönix finde!", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_032", String = "Und sie hat ihn wieder erweckt! Sie hat seinen zerschlagenen Köprer neu geformt und ihm seine alte Macht zurück gegeben."},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_033", String = "Er hat lange im Verborgenen gelebt, gewartet, bis seine Kräfte sich erholt hatten. Nun ist er bereit."},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_034", String = "Er hat schon eine Weile, als er noch schwach war, als Berater des Kaisers hier in Empyria sein Unwesen getrieben. Nur meinen Hain konnte er nie betreten. Deshalb hat er seine Attentäter nach mir geschickt!"},
			Answer{Tag = "dryadP205_035PC", String = "Warum kann er Euren Hain nicht betreten?", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_036", String = "Die Maske hat ihn erweckt, aber er ist dennoch kein Mensch. Die Maske des Belial ist nun ein Teil von ihm und damit Belial selbst. Er kann keine heiligen Orte betreten, es sei denn, sie sind den dunklen Göttern geweiht."},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_037", String = "In meinem Hain bin ich vor ihm sicher. Aber seine untoten Heere haben bereits begonnen, Xu von Süden her zu erobern! Wenn sie diesen Hain erreichen, wird Xu seinen letzten Garten des Lebens verlieren!"},
			Answer{Tag = "dryadP205_038PC", String = "Keine Sorge, Waldgeist. Ich werde ihn und den Zirkel aufhalten, bevor das geschieht!", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionMaskedOne"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_040", String = "In seinem Inneren ist der Phönix eingeschlossen, ein Vogel aus reinem Allfeuer, alt wie die Welt und von großer Macht."},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_041", String = "Der Phönix lebte in den Strömen der Magie seit die Zeit geboren wurde. Er ist weder Gut noch Böse, weder Hell noch Dunkel. Er gehört einfach zu dieser Welt, so wie die Wolken und der Himmel."},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_042", String = "Aber der Zirkel lockte ihn aus dem Innern der Erde und bannte ihn in diesen Stein! Dann missbrauchten sie seine Macht, um ihre großen Zauber zu wirken!"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_043", String = "Ihr habt ihn aus den Ruinen von Mulandir geborgen und damit der Welt die einzige Waffe gegeben, die einem Zirkelmagier gefährlich werden kann."},
			Answer{Tag = "dryadP205_044PC", String = "Aber der Stein gibt mir keine Macht!", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_045", String = "Ja nur wenige können den Stein beherrschen."},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_046", String = "Aber die Kreatur in seinem Innern trägt einen unbändigen Hass auf die Zirkelmagier! Setzt sie frei und ihre Allfeuerkraft wird die Macht der Zirkelmagier brechen!"},
			Answer{Tag = "dryadP205_047PC", String = "Sie freisetzen? Wie, der Stein ist unzerstörbar?", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_048", String = "Ich weiß es nicht, aber ich werde meine Vögel aussenden, nach einem Mittel für Euch zu suchen. Ihr müsst derweil weiter nach Süden! Ihr dürft keine Zeit verlieren!"},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionPhoenix"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_050", String = "Es ist eine Flüssigkeit, welche die ursprüngliche Kraft des Lebens in sich trägt. Wird sie einem Toten eingeflösst, erhält er sein altes Leben wieder zurück."},
			Answer{Tag = "dryadP205_051PC", String = "Wie kann der Maskierte so etwas herstellen?", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_052", String = "Er muss also das Blut eines Gottes gewonnen haben! Nur das hat die Kraft des ursprünglichen Lebens! nur damit kann er die Zirkelmagier mit all ihrer Kraft wieder herstellen!"},
			Answer{Tag = "dryadP205_053PC", String = "Er hat das Blut eines Gottes gestohlen? So mächtig ist selbst ein Zirkelmagier nicht!", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_054", String = "Ich fürchte er hat einen der Götter in seiner Gewalt! Dieser Mann hat die Macht Belials, er ist unberechenbar!"},
			Answer{Tag = "dryadP205_055PC", String = "Aber wenn er den Zirkel erweckt, werden sie dann nicht ihren alten Streit fortführen?", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_056", String = "Nein. Der Trank verleiht wohl neues Leben, aber der Erweckte schuldet dieses Leben demjenigen, der ihm den Trank verabreicht hat. Das bedeutet, er muss ihm gehorsam sein."},
			Answer{Tag = "dryadP205_057PC", String = "Das bedeuted, wenn der Maskierte sein Werk vollendet hat, hat er die Magier des Zirkels als getreue Diener zu seiner Verfügung?", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_058", String = "Ja, der Zirkel wäre nicht nur wieder mächtig, er wäre auch geeint unter dem einzigen boshaften Geist von Hokan Ashir!"},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionPotion"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{61;
		Conditions = {
			QuestState{QuestId = 866, State = StateActive},
		},
		Actions = {
			Say{Tag = "dryadP205_059", String = "Findet den Giftmischer, der das Wasser des Hains verdirbt!! Beeilt Euch!"},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{61;
		Conditions = {
			Negated(QuestState{QuestId = 866, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{64;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_nP201_StoreLock"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{64;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_nP201_StoreLock"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(UND(UND(UND(IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"},IsNpcFlagFalse{Name = "QuestionMaskedOne"}),IsNpcFlagFalse{Name = "QuestionPhoenix"}),IsNpcFlagFalse{Name = "QuestionPotion"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(Negated(UND(UND(UND(IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"},IsNpcFlagFalse{Name = "QuestionMaskedOne"}),IsNpcFlagFalse{Name = "QuestionPhoenix"}),IsNpcFlagFalse{Name = "QuestionPotion"}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 117},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusFateTold"},
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_060PC", String = "Könnt Ihr mich von dem Schwert erlösen?", AnswerId = 69},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			IsNpcFlagTrue{Name ="DariusFateOn"},
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_010PC", String = "Was ist mit Darius geschehen?", AnswerId = 76},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			IsNpcFlagTrue{Name = "QuestionMaskedOne"},
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_029PC", String = "Wer ist dieser Hokan Ashir hinter der Maske?", AnswerId = 91},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			IsNpcFlagTrue{Name = "QuestionPhoenix"},
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_039PC", String = "Was wisst Ihr über den Phönixstein?", AnswerId = 101},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			IsNpcFlagTrue{Name = "QuestionPotion"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_049PC", String = "Was ist dieser Essenztrank?", AnswerId = 109},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusFateTold"}),
			Negated(IsNpcFlagTrue{Name ="DariusFateOn"}),
			Negated(IsNpcFlagTrue{Name = "QuestionMaskedOne"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPhoenix"}),
			Negated(IsNpcFlagTrue{Name = "QuestionPotion"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_061", String = "Nein! Keine Magie dieser Welt kann die Klinge jetzt noch von Eurer Seele trennen. Sie wird Euch unweigerlich in einen Schatten verwandeln! Neimand kann das aufhalten! ich aknn Euch nur die Schmerzen nehmen."},
			Answer{Tag = "dryadP205_062PC", String = "Verflucht sollen sie alle sein! Ist das der Preis dafür, das ich die Welt vor Aryn gerettet habe? Ist das Gerechtigkeit?", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_063", String = "Es ist Schicksal! Nutzt die Zeit, die Ihr noch habt! Nutzt sie zum Guten! Haltet Euren Meister auf! Übt Vergeltugn and dem,d er Eure Rache verdient hat!"},
			Answer{Tag = "dryadP205_064PC", String = "Das hat auch diese Stimme gesagt ...", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_065", String = "Eine Stimme?"},
			Answer{Tag = "dryadP205_066PC", String = "Ja, sie schien in mir zu sprechen ... sie klang wie jemand, den ich mal kannte ... ich glaube sein name war ... Darius.", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_067", String = "Ihr kennt Darius?"},
			Answer{Tag = "dryadP205_068PC", String = "Ich bin ihm einmal in Tirganach begegnet. Ein seltsamer alter Kerl ...", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_069", String = "Wenn Ihr Darius tatsächlich kennt ... nun, dieser Brief ist zwar nicht für Euch bestimmt, aber ich weiß nicht, ob die Person noch lebt, für die er geschrieben wurde ... "},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_070", String = "Hier, lest den Brief! Auch wenn er nicht für Euch ist, es ist wichtig, das Ihr erfahrt, was vor sich geht!"},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "DariusFateTold"}, SetNpcFlagTrue{Name ="DariusFateOn"}, SetGlobalFlagTrue {Name = "g_P205_CutsceneDariusBrief"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_011", String = "Meine Vögel haben ihn auf seiner Reise nach Süden verfolgt. Er überquerte die Dunkelwehrberge, und verschwand im schwarzen Dschungel."},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_012", String = "Das ist ein Ort zu dem meine Vögel nicht fliegen können! Es ist der Dschungel Zarachs, weder die Götter, noch ich, können dorthin schauen. Wir haben dort keine Macht."},
			Answer{Tag = "dryadP205_013PC", String = "Und dort will der alte Narr einen Zirkelmagier jagen? Er ist doch nur ein Schreiber, was ist in ihn gefahren?", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_071", String = "Er ist mehr, als ihr denkt, aber ein Narr ist er trotz allem, da habt Ihr recht! Ihr müsst ihm helfen, ich früchte er ist gefangen worden! Und das ist erst der Anfang ..."},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_015", String = "Der Maskierte hat begonnen die anderen Zirkelmagier mit dem Essenztrank zu erwecken! Mit diesem Trank gibt er ihnen ihr wahres Leben und ihre Macht zurück, unterwirft sie aber gleichzeitig seinem Willen."},
			Answer{Tag = "dryadP205_016PC", String = "Er bringt den Zirkel aus dem Grab zurück? Unsere alten Meister? Ihr Götter, ich muss ihn aufhalten!", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_072", String = "Soviel Macht hat Eure Klinge nicht! Ihr benötigt etwas, was die Allfeuerkraft des Zirkels überwindet! Den Phönistein! Er befindet sich in der Hand eines anderen Runenrkriegers."},
			Answer{Tag = "dryadP205_073PC", String = "Wo finde ich diesen Krieger und seinen Stein?", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_074", String = "Ich weiß es nicht, aber meine Vögel werden ihn für Euch suchen. Ich gebe Euch Nachricht, sobald ich ihn gefunden habe."},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_075", String = "Ihr müsst jetzt die untoten Armeen des Maskierten zurückschlagen und Darius aus dem Dschungel retten! aber die Untoten haben die Dunkelwehrberge bereits abgeriegelt, alle Pässe in den Dschungel sind verschlossen!"},
			Answer{Tag = "dryadP205_076PC", String = "Es muss doch einen Weg in diesen Dschungel geben! Niemand kann ein ganzes Land abriegeln!", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_021", String = "Der Maskierte ist ein Zirkelmagier, vergesst das nicht! Aber es gibt jemanden der vielleicht einen Weg kennt ... die Uru eine weise Frau der Kathai, ein Volk, dass am Fusse der Dunkelwehrberge lebt."},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_022", String = "Sie Geheimnisse über den Dschungel und die Dunkelwehrberge, die ich nie ergründen könnte. Sie kennt die alten Pfade des Zerbitenordens und vielleicht auch einen Weg in den Dschungel."},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_023", String = "Aber der Maskierte weiß, dass Urus Wissen ihm gefählich werden kann! Deswegen wird Kathai bereits von seinen Armeen belagert, er will die Uru tot sehen!"},
			Answer{Tag = "dryadP205_024PC", String = "Wenn ihr Wissen der Schlüssel zum Reich des Maskierten ist dann muss ich Ihr Leben schützen!", AnswerId = 86},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_025", String = "Ja, zieht so schnell Ihr könnt nach Kathai und zersprengt die Belagerung der Untoten dort! Rettet die Uru!"},
			Answer{Tag = "dryadP205_026PC", String = "Wie gelange ich nach Kathai? In Empyria scheinen alle Tore nach Süden verschlossen zu sein!", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_027", String = "Eure Vertraute, die Diebin Alyah, kennt Mittel und Wege um durch die Tore zu kommen ... und sie kann Euch auch wertvolles über den Weg nach Kathai berichten."},
			Answer{Tag = "dryadP205_077PC", String = "Gut, ich breche sofort auf! Danke für Eure Hilfe, Baumgeist. Mögt Ihr von nun an Frieden haben.", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_nP201_JorunalGotoUru"},
			QuestBegin {QuestId = 872},
 							 QuestSolve {QuestId = 870},
 							 SetRewardFlagTrue { Name = "MitDryadeGesprochen"},
 							 SetGlobalFlagTrue{Name = "g_StoryQuestRescueUru"},
			SetGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}, SetGlobalFlagTrue{Name = "g_P205_HaranUmspawn"},
			SetGlobalFlagTrue{Name = "g_P205_UriasSpawntBeiAlyah"},
			SetGlobalFlagTrue {Name = "g_nP201_JournalGotoUru"},
						SetNpcFlagTrue{Name = "QuestionPrison"},
						SetNpcFlagFalse{Name ="DariusFateOn"},
			SetNpcFlagTrue{Name = "QuestionMaskedOne"},
			SetNpcFlagTrue{Name = "QuestionPhoenix"},
			SetNpcFlagTrue{Name = "QuestionPotion"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 90},
		}}

	OnAnswer{90;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_078", String = "Ein Mitglied des Zirkels und ein Nekromant des alten Zerbitenordens, ein mächtiger Totenbeschwörer!"},
			Answer{Tag = "dryadP205_079PC", String = "Ich dachte er hätte in der Konvokation bei Wisper sein Ende gefunden?", AnswerId = 92},
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_080", String = "Der Wächter des Phönix hat Hokans ruhelosem Geist während der Schlacht um Fiara die Maske des Belial gebracht. Sie hat ihm seine Macht und sein Leben wiedergegben."},
			Answer{Tag = "dryadP205_081PC", String = "Was für eine Narretei! Dann ist er an allem schuld!", AnswerId = 93},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_082", String = "Schweigt! Er hat uns dadurch alle gerettet! Denn nur so konnte er den Phönixstein erlangen und Rohens Kreislauf vollenden!"},
			Answer{Tag = "dryadP205_083PC", String = "Aber dennoch ist Hokan nun frei! Und wenn der Zirkel erst einmal seine Macht zurück hat, wird uns das alles nichts geholfen haben!", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "dryadP205_084PC", String = "Aber warum schickt er mich um euch zu töten? Ist Eure Macht größer als seine?", AnswerId = 95},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_085", String = "Ja und neine. Er kann diesen Hain nicht betreten. Die Maske hat ihn erweckt, aber er ist kein Mensch, sie verbindet ihn mit dem dunklen Halbgott Belial. Heilige Orte sind dadurch für ihn verboten, es sei denn sei sind Zarach, Belials Herrn, geweiht!"},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_86", String = "Zwar habe ich keine große Macht, aber mein Hain ist die letze Stätte des Lebens, die ihm trotzt. Deshalb schickt er Attentäter."},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_87", String = "Und sollten seine untoten Armeen je diesen Ort erreichen, dann wird der letze Dryadenhain Xus Vergangenheit sein.."},
			Answer{Tag = "", String = "", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionMaskedOne"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{101;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_040", String = "In seinem Inneren ist der Phönix eingeschlossen, ein Vogel aus reinem Allfeuer, alt wie die Welt und von großer Macht."},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{102;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_041", String = "Der Phönix lebte in den Strömen der Magie seit die Zeit geboren wurde. Er ist weder Gut noch Böse, weder Hell noch Dunkel. Er gehört einfach zu dieser Welt, so wie die Wolken und der Himmel."},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{103;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_042", String = "Aber der Zirkel lockte ihn aus dem Innern der Erde und bannte ihn in diesen Stein! Dann missbrauchten sie seine Macht, um ihre großen Zauber zu wirken!"},
			Answer{Tag = "", String = "", AnswerId = 104},
		}}

	OnAnswer{104;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_88", String = "Der Runenkrieger barg ihn damals aus den Ruinen von Mulandir. Seit dem die Schlacht um Fiara vorüber ist, bewahrt er ihn auf."},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_89", String = "Er ist es, nach dem ich meine Vögel ausschicken werde."},
			Answer{Tag = "", String = "", AnswerId = 106},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionPhoenix"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 107},
		}}

	OnAnswer{107;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 108},
		}}

	OnAnswer{108;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{109;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_050", String = "Es ist eine Flüssigkeit, welche die ursprüngliche Kraft des Lebens in sich trägt. Wird sie einem Toten eingeflösst, erhält er sein altes Leben wieder zurück."},
			Answer{Tag = "dryadP205_051PC", String = "Wie kann der Maskierte so etwas herstellen?", AnswerId = 110},
		}}

	OnAnswer{110;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_90", String = "Er muss also das Blut eines Gottes gewonnen haben! Nur das hat die Kraft des ursprünglichen Lebens! Nur damit kann er die Zirkelmagier mit all ihrer Kraft wieder herstellen!"},
			Answer{Tag = "dryadP205_053PC", String = "Er hat das Blut eines Gottes gestohlen? So mächtig ist selbst ein Zirkelmagier nicht!", AnswerId = 111},
		}}

	OnAnswer{111;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_91", String = "Ich fürchte er hat einen der Götter in seiner Gewalt! Aber ich bin mir nicht sicher, dieser Mann hat die Macht Belials, er ist unberechenbar!"},
			Answer{Tag = "dryadP205_92PC", String = "Was für eine Macht! Aber der Zirkelmagier lebte nicht nur, er schien dem Maskierten auch ... hörig zu sein!", AnswerId = 112},
		}}

	OnAnswer{112;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_93", String = "Der Trank verleiht neues Leben, aber der Erweckte schuldet diesesn Leben demjenigen, der ihm den Trank verabreicht hat. Das bedeutet er muss ihm gehorsam sein."},
			Answer{Tag = "dryadP205_94PC", String = "Das bedeuted, wenn der Maskierte sein Werk volendet hat, hat er alle Magier des Zirkels als getreue Diener zu seiner Verfügung?", AnswerId = 113},
		}}

	OnAnswer{113;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_95", String = "Ja, der Zirkel wäre nicht nur wieder mächtig, er wäre auch vereint unter dem einzigen boshaften Geist Hokan Ashirs!"},
			Answer{Tag = "", String = "", AnswerId = 114},
		}}

	OnAnswer{114;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionPotion"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 115},
		}}

	OnAnswer{115;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 116},
		}}

	OnAnswer{116;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{117;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{118;
		Conditions = {
			IsNpcFlagTrue{Name = "QuestionPrison"},
			IsNpcFlagTrue{Name = "P201DryadQuestionLand"},
			UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved})),
			UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_96PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 119},
			OfferAnswer{Tag = "dryadP205_112PC", String = "Das Land verdirbt?", AnswerId = 135},
			OfferAnswer{Tag = "dryadP205_125PC", String = "Wegen den heiligen Orten ...", AnswerId = 149},
			OfferAnswer{Tag = "dryadP205_150PC", String = "Wegen des Irfits ...", AnswerId = 191},
		}}

	OnAnswer{118;
		Conditions = {
			IsNpcFlagTrue{Name = "QuestionPrison"},
			IsNpcFlagTrue{Name = "P201DryadQuestionLand"},
			UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved})),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_96PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 119},
			OfferAnswer{Tag = "dryadP205_112PC", String = "Das Land verdirbt?", AnswerId = 135},
			OfferAnswer{Tag = "dryadP205_125PC", String = "Wegen den heiligen Orten ...", AnswerId = 149},
		}}

	OnAnswer{118;
		Conditions = {
			IsNpcFlagTrue{Name = "QuestionPrison"},
			IsNpcFlagTrue{Name = "P201DryadQuestionLand"},
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved}))),
			UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_96PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 119},
			OfferAnswer{Tag = "dryadP205_112PC", String = "Das Land verdirbt?", AnswerId = 135},
			OfferAnswer{Tag = "dryadP205_150PC", String = "Wegen des Irfits ...", AnswerId = 191},
		}}

	OnAnswer{118;
		Conditions = {
			IsNpcFlagTrue{Name = "QuestionPrison"},
			IsNpcFlagTrue{Name = "P201DryadQuestionLand"},
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved}))),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_96PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 119},
			OfferAnswer{Tag = "dryadP205_112PC", String = "Das Land verdirbt?", AnswerId = 135},
		}}

	OnAnswer{118;
		Conditions = {
			IsNpcFlagTrue{Name = "QuestionPrison"},
			Negated(IsNpcFlagTrue{Name = "P201DryadQuestionLand"}),
			UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved})),
			UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_96PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 119},
			OfferAnswer{Tag = "dryadP205_125PC", String = "Wegen den heiligen Orten ...", AnswerId = 149},
			OfferAnswer{Tag = "dryadP205_150PC", String = "Wegen des Irfits ...", AnswerId = 191},
		}}

	OnAnswer{118;
		Conditions = {
			IsNpcFlagTrue{Name = "QuestionPrison"},
			Negated(IsNpcFlagTrue{Name = "P201DryadQuestionLand"}),
			UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved})),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_96PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 119},
			OfferAnswer{Tag = "dryadP205_125PC", String = "Wegen den heiligen Orten ...", AnswerId = 149},
		}}

	OnAnswer{118;
		Conditions = {
			IsNpcFlagTrue{Name = "QuestionPrison"},
			Negated(IsNpcFlagTrue{Name = "P201DryadQuestionLand"}),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved}))),
			UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_96PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 119},
			OfferAnswer{Tag = "dryadP205_150PC", String = "Wegen des Irfits ...", AnswerId = 191},
		}}

	OnAnswer{118;
		Conditions = {
			IsNpcFlagTrue{Name = "QuestionPrison"},
			Negated(IsNpcFlagTrue{Name = "P201DryadQuestionLand"}),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved}))),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_96PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 119},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "QuestionPrison"}),
			IsNpcFlagTrue{Name = "P201DryadQuestionLand"},
			UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved})),
			UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_112PC", String = "Das Land verdirbt?", AnswerId = 135},
			OfferAnswer{Tag = "dryadP205_125PC", String = "Wegen den heiligen Orten ...", AnswerId = 149},
			OfferAnswer{Tag = "dryadP205_150PC", String = "Wegen des Irfits ...", AnswerId = 191},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "QuestionPrison"}),
			IsNpcFlagTrue{Name = "P201DryadQuestionLand"},
			UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved})),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_112PC", String = "Das Land verdirbt?", AnswerId = 135},
			OfferAnswer{Tag = "dryadP205_125PC", String = "Wegen den heiligen Orten ...", AnswerId = 149},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "QuestionPrison"}),
			IsNpcFlagTrue{Name = "P201DryadQuestionLand"},
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved}))),
			UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_112PC", String = "Das Land verdirbt?", AnswerId = 135},
			OfferAnswer{Tag = "dryadP205_150PC", String = "Wegen des Irfits ...", AnswerId = 191},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "QuestionPrison"}),
			IsNpcFlagTrue{Name = "P201DryadQuestionLand"},
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved}))),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_112PC", String = "Das Land verdirbt?", AnswerId = 135},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "QuestionPrison"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadQuestionLand"}),
			UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved})),
			UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_125PC", String = "Wegen den heiligen Orten ...", AnswerId = 149},
			OfferAnswer{Tag = "dryadP205_150PC", String = "Wegen des Irfits ...", AnswerId = 191},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "QuestionPrison"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadQuestionLand"}),
			UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved})),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_125PC", String = "Wegen den heiligen Orten ...", AnswerId = 149},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "QuestionPrison"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadQuestionLand"}),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved}))),
			UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_150PC", String = "Wegen des Irfits ...", AnswerId = 191},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "QuestionPrison"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadQuestionLand"}),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadShrinesInfo1"} , Negated(QuestState{QuestId = 843 , State = StateSolved}))),
			Negated(UND(IsNpcFlagTrue{Name = "P201DryadIrfitInfo1"}, Negated(QuestState{QuestId = 1042 , State = StateSolved}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{119;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_97", String = "Weil ich einst die Gesetze der Götter gebrochen habe. Dieses Exil ist meine Strafe, auf ewig."},
			Answer{Tag = "dryadP205_98PC", String = "Was habt Ihr getan?", AnswerId = 120},
		}}

	OnAnswer{120;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_99", String = "Ich habe eine Grenze überschritten, die der Gottvater Aonir selbst bestimmt hatte. Ich habe nciht daran gedacht, dass auch schöne Dinge gefährlich Schaden anrichten können."},
			Answer{Tag = "", String = "", AnswerId = 121},
		}}

	OnAnswer{121;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_100", String = "Ihr müsst verstehen, wir Dryaden gehen mit den Jahreszeiten. Und es war der Frühling der Welt! Alles blühte, Xu war damals ein Paradies! es war eine wundervolle Zeit!"},
			Answer{Tag = "", String = "", AnswerId = 122},
		}}

	OnAnswer{122;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_101", String = "Die Völker waren noch nicht geboren und die Götter wandelten noch auf der Welt! Und zu dieser Zeit fand ein Gott auch seinen Weg in meinen Hain."},
			Answer{Tag = "", String = "", AnswerId = 123},
		}}

	OnAnswer{123;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_102", String = "Gemeinsam erlebten wir einen wundervollen Frühling. Doch es kam der Tag, als die anderen Götter von uns erfuhren!"},
			Answer{Tag = "", String = "", AnswerId = 124},
		}}

	OnAnswer{124;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_103", String = "Die Götter waren zornig darüber, dass ich gewagt hatte, einen der ihren zu verführen! Sie nahmen mir meine Macht und banden mich an diesen Ort."},
			Answer{Tag = "", String = "", AnswerId = 125},
		}}

	OnAnswer{125;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_104", String = "Heute bin ich die letze der Dryaden der Lebenseibe. Ohne uns ist Xu zu einer Wüste verfallen. Nur dieser Hain hier, ist die letzte Stätte der Fruchtbarkeit."},
			Answer{Tag = "", String = "", AnswerId = 126},
		}}

	OnAnswer{126;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_105", String = "Wäre ich nur frei vom Fluch der Götter, ich würde Xu wieder grünen lassen! Ich würde dieses Land wieder zu dem Paradies machen, zu dem es bestimmt war!"},
			Answer{Tag = "dryadP205_106PC", String = "Was ist mit den anderen Dryaden geschehen?", AnswerId = 127},
		}}

	OnAnswer{127;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_107", String = "Oh, es gibt noch Dryaden auf der Welt. Nur nicht mehr hier in Xu."},
			Answer{Tag = "", String = "", AnswerId = 128},
		}}

	OnAnswer{128;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_108", String = "Als ich für meinen Frevel verflucht wurde, da begehrten meine Schwestern gegen die Götter auf! Sie wussten, das ich nur gehandelt hatte, wie ich geschaffen war."},
			Answer{Tag = "", String = "", AnswerId = 129},
		}}

	OnAnswer{129;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_109", String = "Aber die Götter blieben unerbittlich und so legten viele meiner Schwestern ihre Macht nieder und verließen Xu."},
			Answer{Tag = "", String = "", AnswerId = 130},
		}}

	OnAnswer{130;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_110", String = "Ohne sie starben die Lebenseiben und das Land verfiel zur Wüste! Nur ich bin geblieben, durch den Fluch an diesen Ort gekettet."},
			Answer{Tag = "", String = "", AnswerId = 131},
		}}

	OnAnswer{131;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_111", String = "Könnte ich es nur rückgängig machen! Es tut so weh zu sehen, wie ein ganzes Land wegen mir verdirbt!"},
			Answer{Tag = "", String = "", AnswerId = 132},
		}}

	OnAnswer{132;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "P201DryadQuestionLand"}, SetNpcFlagFalse{Name = "QuestionPrison"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 133},
		}}

	OnAnswer{133;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 134},
		}}

	OnAnswer{134;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{135;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_113", String = "Ja! Ihr kennt den Norden Xus nur als Wüste, aber einst war er ein Garten der Schönheit! Er war ein heiliger Ort, voller Lebenskraft und wundervoller Geschöpfe!"},
			Answer{Tag = "", String = "", AnswerId = 136},
		}}

	OnAnswer{136;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_114", String = "Nur wenig ist heute davon geblieben. Die letzten heiligen Stätten verdorren und nur noch eine einzige Kreatur aus jener Zeit ist am Leben. Und die Menschen stellen sie im Zirkus aus, als wäre sie eine Kuriosität!"},
			Answer{Tag = "dryadP205_115PC", String = "Könnt Ihr nichts dagegen tun?", AnswerId = 137},
		}}

	OnAnswer{137;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_116", String = "Das könnte ich, doch ich darf diesen Ort nicht verlassen! Und meine Nymphen sind nicht stark genug für so gefährliche Reisen!"},
			OfferAnswer{Tag = "dryadP205_117PC", String = "Kann ich etwas tun?", AnswerId = 138},
			OfferAnswer{Tag = "dryadP205_124PC", String = "Ich verstehe.", AnswerId = 145},
		}}

	OnAnswer{138;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_118", String = "Ich will Euch nicht noch mehr aufbürden, Ihr tragt schwer genug an Eurem Schicksal, Freund."},
			Answer{Tag = "dryadP205_119PC", String = "Lasst mich das entscheiden. Wie kann ich helfen?", AnswerId = 139},
		}}

	OnAnswer{139;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_120", String = "Es gibt heilige Orte hier in Xu, die noch erfüllt sind mit der ursprünglichen Lebenskraft dieses Landes. Aber nun sind sie von Dämonen und Untoten verunreinigt worden!"},
			Answer{Tag = "", String = "", AnswerId = 140},
		}}

	OnAnswer{140;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_121", String = "Die Bäume, die dort wuchsen sind verdorben und dunkle Kreaturen kriechen aus ihren verfaulten Resten! Ihr müsst diese Wunden im Antlitz der Natur verschließen!"},
			Answer{Tag = "dryadP205_122PC", String = "Ihr sagtet etwas von einer Kreatur?", AnswerId = 141},
		}}

	OnAnswer{141;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_123", String = "Ja, der letzte Irfit. Der Kaiser hat ihn aus meinem Garten geraubt und schließlich, nachdem er siener überdrüssig war, an den Zirkus verschenkt. Ihr müsst ihn befreien!"},
			Answer{Tag = "", String = "", AnswerId = 142},
		}}

	OnAnswer{142;
		Conditions = {
		},
		Actions = {
			
							SetNpcFlagFalse{Name = "P201DryadQuestionLand"}, 
							SetNpcFlagTrue{Name = "P201DryadShrinesInfo1"},
							SetNpcFlagTrue{Name = "P201DryadShrinesInfo2"},
							SetNpcFlagTrue{Name = "P201DryadIrfitInfo1"},
							SetNpcFlagTrue{Name = "P201DryadIrfitInfo2"},
							SetNpcFlagTrue{Name = "P201DryadIrfitInfo3"},
							QuestBegin{QuestId = 1042},
							QuestBegin{QuestId = 1045}
							,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 143},
		}}

	OnAnswer{143;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 144},
		}}

	OnAnswer{144;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{145;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 146},
		}}

	OnAnswer{146;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 147},
		}}

	OnAnswer{147;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 148},
		}}

	OnAnswer{148;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{149;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 150},
		}}

	OnAnswer{150;
		Conditions = {
			IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"},
			IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"},
			IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10},
			UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_126PC", String = "Wo finde ich sie?", AnswerId = 151, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_128PC", String = "Was kann ich tun, um sie zu reinigen?", AnswerId = 155},
			OfferAnswer{Tag = "dryadP205_132PC", String = "Ich habe sie alle gereinigt!", AnswerId = 160},
			OfferAnswer{Tag = "dryadP205_138PC", String = "Die letzte Stätte ist gereinigt!", AnswerId = 168},
		}}

	OnAnswer{150;
		Conditions = {
			IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"},
			IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"},
			IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10},
			Negated(UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_126PC", String = "Wo finde ich sie?", AnswerId = 151, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_128PC", String = "Was kann ich tun, um sie zu reinigen?", AnswerId = 155},
			OfferAnswer{Tag = "dryadP205_132PC", String = "Ich habe sie alle gereinigt!", AnswerId = 160},
		}}

	OnAnswer{150;
		Conditions = {
			IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"},
			IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"},
			Negated(IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10}),
			UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_126PC", String = "Wo finde ich sie?", AnswerId = 151, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_128PC", String = "Was kann ich tun, um sie zu reinigen?", AnswerId = 155},
			OfferAnswer{Tag = "dryadP205_138PC", String = "Die letzte Stätte ist gereinigt!", AnswerId = 168},
		}}

	OnAnswer{150;
		Conditions = {
			IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"},
			IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"},
			Negated(IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10}),
			Negated(UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_126PC", String = "Wo finde ich sie?", AnswerId = 151, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_128PC", String = "Was kann ich tun, um sie zu reinigen?", AnswerId = 155},
		}}

	OnAnswer{150;
		Conditions = {
			IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"},
			Negated(IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"}),
			IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10},
			UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_126PC", String = "Wo finde ich sie?", AnswerId = 151, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_132PC", String = "Ich habe sie alle gereinigt!", AnswerId = 160},
			OfferAnswer{Tag = "dryadP205_138PC", String = "Die letzte Stätte ist gereinigt!", AnswerId = 168},
		}}

	OnAnswer{150;
		Conditions = {
			IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"},
			Negated(IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"}),
			IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10},
			Negated(UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_126PC", String = "Wo finde ich sie?", AnswerId = 151, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_132PC", String = "Ich habe sie alle gereinigt!", AnswerId = 160},
		}}

	OnAnswer{150;
		Conditions = {
			IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"},
			Negated(IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"}),
			Negated(IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10}),
			UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_126PC", String = "Wo finde ich sie?", AnswerId = 151, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_138PC", String = "Die letzte Stätte ist gereinigt!", AnswerId = 168},
		}}

	OnAnswer{150;
		Conditions = {
			IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"},
			Negated(IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"}),
			Negated(IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10}),
			Negated(UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_126PC", String = "Wo finde ich sie?", AnswerId = 151, Color = ColorDarkOrange},
		}}

	OnAnswer{150;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"}),
			IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"},
			IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10},
			UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_128PC", String = "Was kann ich tun, um sie zu reinigen?", AnswerId = 155},
			OfferAnswer{Tag = "dryadP205_132PC", String = "Ich habe sie alle gereinigt!", AnswerId = 160},
			OfferAnswer{Tag = "dryadP205_138PC", String = "Die letzte Stätte ist gereinigt!", AnswerId = 168},
		}}

	OnAnswer{150;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"}),
			IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"},
			IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10},
			Negated(UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_128PC", String = "Was kann ich tun, um sie zu reinigen?", AnswerId = 155},
			OfferAnswer{Tag = "dryadP205_132PC", String = "Ich habe sie alle gereinigt!", AnswerId = 160},
		}}

	OnAnswer{150;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"}),
			IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"},
			Negated(IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10}),
			UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_128PC", String = "Was kann ich tun, um sie zu reinigen?", AnswerId = 155},
			OfferAnswer{Tag = "dryadP205_138PC", String = "Die letzte Stätte ist gereinigt!", AnswerId = 168},
		}}

	OnAnswer{150;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"}),
			IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"},
			Negated(IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10}),
			Negated(UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_128PC", String = "Was kann ich tun, um sie zu reinigen?", AnswerId = 155},
		}}

	OnAnswer{150;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"}),
			IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10},
			UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_132PC", String = "Ich habe sie alle gereinigt!", AnswerId = 160},
			OfferAnswer{Tag = "dryadP205_138PC", String = "Die letzte Stätte ist gereinigt!", AnswerId = 168},
		}}

	OnAnswer{150;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"}),
			IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10},
			Negated(UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 }),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_132PC", String = "Ich habe sie alle gereinigt!", AnswerId = 160},
		}}

	OnAnswer{150;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"}),
			Negated(IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10}),
			UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 },
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_138PC", String = "Die letzte Stätte ist gereinigt!", AnswerId = 168},
		}}

	OnAnswer{150;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "P201DryadLastShrineKnown"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadShrinesInfo2"}),
			Negated(IsGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed", UpdateInterval = 10}),
			Negated(UND9
							{
							 IsGlobalFlagTrue{Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
							 IsNpcFlagFalse{Name = "P201DryadRewardShrinesGiven"}
							 }),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{151;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_127", String = "Ihr findet solche Orte in der Onyxbucht, der roten Wüste, in Kathai und nahe der Wachfeste in den Dunkelwehrbergen."},
			Answer{Tag = "", String = "", AnswerId = 152},
		}}

	OnAnswer{152;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 153},
		}}

	OnAnswer{153;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 154},
		}}

	OnAnswer{154;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{155;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_129", String = "Ich gebe Euch diese Samen der Lebenseibe. Versucht an den heiligen Orten noch einen letzen Rest fruchtbarer Erde zu finden und pflanzt dort je einen Samen."},
			Answer{Tag = "", String = "", AnswerId = 156},
		}}

	OnAnswer{156;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_130", String = "Wenn Ihr Erfolg habt, wird dort einen neue Lebenseibe wachsen und mit ihrer Kraft den Ort reinigen. Nehmt Euch aber vor den Kraturen in acht, die dort unaufhörlich hervorkriechen!"},
			Answer{Tag = "", String = "", AnswerId = 157},
		}}

	OnAnswer{157;
		Conditions = {
		},
		Actions = {
			
							TransferItem {TakeItem = 0, GiveItem = 7083, Amount = 4, Flag = Give},
							QuestBegin {QuestId = 843}, --hl. Stätten gesamt
							QuestBegin {QuestId = 1051}, 
							QuestBegin {QuestId = 1052}, 
							QuestBegin {QuestId = 1053}, 
							QuestBegin {QuestId = 1054}
							,
			SetNpcFlagFalse{Name = "P201DryadShrinesInfo2"},
			Say{Tag = "dryadP205_131", String = "Hier, die Samen. Gebt gut auf sie acht, sie sind wie meine Kinder."},
			Answer{Tag = "", String = "", AnswerId = 158},
		}}

	OnAnswer{158;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 159},
		}}

	OnAnswer{159;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{160;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_133", String = "Danke, Freund! Ich spüre bereits, wie sich das Land erholt! Aber wartet ... noch sind nicht alle Wunden geschlossen ..."},
			Answer{Tag = "", String = "", AnswerId = 161},
		}}

	OnAnswer{161;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_134", String = "Es muss noch eine weitere Stätte geben! Aber ... ich kann sie nicht sehen, wie kann das geschehen?"},
			Answer{Tag = "", String = "", AnswerId = 162},
		}}

	OnAnswer{162;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_135", String = "Es muss in der Stadt der Seelen sein! Darius erzählte davon! Er sagte, dass die Fremden einst eine Lebenseibe in der Stadt gezüchtet haben!"},
			Answer{Tag = "", String = "", AnswerId = 163},
		}}

	OnAnswer{163;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_136", String = "Er gab mir diesen Schlüssel und diese Schale. ich vermag es nicht so recht zu deuten, aber ich glaube Darius wusste, das uns dort ein Rätsel erwartet."},
			Answer{Tag = "", String = "", AnswerId = 164},
		}}

	OnAnswer{164;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_137", String = "Nehmt sie und sucht nach den Resten der Lebenseibe in der Stadt der Seelen! ihr müsst auch diesen Ort reinigen, oder das Land wird nicht heilen!"},
			Answer{Tag = "", String = "", AnswerId = 165},
		}}

	OnAnswer{165;
		Conditions = {
		},
		Actions = {
			
							TransferItem {TakeItem = 0, GiveItem = 7083, Amount = 1, Flag = Give},--seed
							TransferItem {TakeItem = 0, GiveItem = 7341, Amount = 1, Flag = Give},--bowl
							TransferItem {TakeItem = 0, GiveItem = 7082, Amount = 1, Flag = Give},--key
							QuestBegin {QuestId = 844}, --hl. Stätten CoS
							QuestSolve {QuestId = 1055},
							--SetNpcFlagTrue{Name = "TBD_STartGototCosQuestAndGiceKeyBowlAndLastSeed"},
							
							SetNpcFlagTrue{Name = "P201DryadLastShrineKnown"},
			SetGlobalFlagFalse{Name = "g_P205FirstShrinesCleansed"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 166},
		}}

	OnAnswer{166;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 167},
		}}

	OnAnswer{167;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{168;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_139", String = "Jetzt ist es vollbracht! Ihr habt die Wunden des Landes geschlossen! Ich danke Euch!"},
			Answer{Tag = "", String = "", AnswerId = 169},
		}}

	OnAnswer{169;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_140", String = "Ich würde Euch gerne so bei Eurer Aufgabe helfen, wie Ihr mir, aber ich fürchte ich kann Euch nur mit diesen Ring oder einem Zauber entlohnen."},
			OfferAnswer{Tag = "dryadP205_141PC", String = "Ich nehme den Ring.", AnswerId = 170},
			OfferAnswer{Tag = "dryadP205_143PC", String = "Gebt mir bitte einen Zauber", AnswerId = 174},
		}}

	OnAnswer{170;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_142", String = "Hier. Möge er Euch dienlich sein, Runenkrieger."},
			Answer{Tag = "", String = "", AnswerId = 171},
		}}

	OnAnswer{171;
		Conditions = {
		},
		Actions = {
			
						SetGlobalFlagTrue{Name = "g_P205DryadeGibtRing"},
						SetNpcFlagFalse{Name = "P201DryadShrinesInfo"}
						,
			SetNpcFlagTrue{Name = "P201DryadRewardShrinesGiven"},
						SetNpcFlagFalse{Name = "P201DryadShrinesInfo"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 172},
		}}

	OnAnswer{172;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 173},
		}}

	OnAnswer{173;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{174;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_144", String = "Welche Art von Magie bevorzugt Ihr?"},
			OfferAnswer{Tag = "dryadP205_145PC", String = "Weiße Magie.", AnswerId = 175},
			OfferAnswer{Tag = "dryadP205_147PC", String = "Elementarmagie.", AnswerId = 179},
			OfferAnswer{Tag = "dryadP205_148PC", String = "Schwarze Magie.", AnswerId = 183},
			OfferAnswer{Tag = "dryadP205_149PC", String = "Mentalmagie.", AnswerId = 187},
		}}

	OnAnswer{175;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_146", String = "Dann sollt Ihr einen Zauber dieser Art erhalten."},
			Answer{Tag = "", String = "", AnswerId = 176},
		}}

	OnAnswer{176;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P205DryadeGibtWeisseMagieSpell"},
			SetNpcFlagTrue{Name = "P201DryadRewardShrinesGiven"},
						SetNpcFlagFalse{Name = "P201DryadShrinesInfo"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 177},
		}}

	OnAnswer{177;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 178},
		}}

	OnAnswer{178;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{179;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_146", String = "Dann sollt Ihr einen Zauber dieser Art erhalten."},
			Answer{Tag = "", String = "", AnswerId = 180},
		}}

	OnAnswer{180;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P205DryadeGibtElementarMagieSpell"},
			SetNpcFlagTrue{Name = "P201DryadRewardShrinesGiven"},
						SetNpcFlagFalse{Name = "P201DryadShrinesInfo"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 181},
		}}

	OnAnswer{181;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 182},
		}}

	OnAnswer{182;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{183;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_146", String = "Dann sollt Ihr einen Zauber dieser Art erhalten."},
			Answer{Tag = "", String = "", AnswerId = 184},
		}}

	OnAnswer{184;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P205DryadeGibtSchwarzeMagieSpell"},
			SetNpcFlagTrue{Name = "P201DryadRewardShrinesGiven"},
						SetNpcFlagFalse{Name = "P201DryadShrinesInfo"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 185},
		}}

	OnAnswer{185;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 186},
		}}

	OnAnswer{186;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{187;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_146", String = "Dann sollt Ihr einen Zauber dieser Art erhalten."},
			Answer{Tag = "", String = "", AnswerId = 188},
		}}

	OnAnswer{188;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P205DryadeGibtMentalMagieSpell"},
			SetNpcFlagTrue{Name = "P201DryadRewardShrinesGiven"},
						SetNpcFlagFalse{Name = "P201DryadShrinesInfo"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 189},
		}}

	OnAnswer{189;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 190},
		}}

	OnAnswer{190;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{191;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 192},
		}}

	OnAnswer{192;
		Conditions = {
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"},
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"},
			UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ,
			IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_151PC", String = "Was ist das für eine Kreatur?", AnswerId = 193, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_156PC", String = "Wo finde ich ihn?", AnswerId = 200},
			OfferAnswer{Tag = "dryadP205_160PC", String = "Ich habe ihn befreit!", AnswerId = 206},
			OfferAnswer{Tag = "dryadP205_171PC", String = "Er hat sich verwandelt!", AnswerId = 217},
		}}

	OnAnswer{192;
		Conditions = {
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"},
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"},
			UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ,
			Negated(IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_151PC", String = "Was ist das für eine Kreatur?", AnswerId = 193, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_156PC", String = "Wo finde ich ihn?", AnswerId = 200},
			OfferAnswer{Tag = "dryadP205_160PC", String = "Ich habe ihn befreit!", AnswerId = 206},
		}}

	OnAnswer{192;
		Conditions = {
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"},
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"},
			Negated(UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ),
			IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_151PC", String = "Was ist das für eine Kreatur?", AnswerId = 193, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_156PC", String = "Wo finde ich ihn?", AnswerId = 200},
			OfferAnswer{Tag = "dryadP205_171PC", String = "Er hat sich verwandelt!", AnswerId = 217},
		}}

	OnAnswer{192;
		Conditions = {
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"},
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"},
			Negated(UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ),
			Negated(IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_151PC", String = "Was ist das für eine Kreatur?", AnswerId = 193, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_156PC", String = "Wo finde ich ihn?", AnswerId = 200},
		}}

	OnAnswer{192;
		Conditions = {
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"},
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"}),
			UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ,
			IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_151PC", String = "Was ist das für eine Kreatur?", AnswerId = 193, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_160PC", String = "Ich habe ihn befreit!", AnswerId = 206},
			OfferAnswer{Tag = "dryadP205_171PC", String = "Er hat sich verwandelt!", AnswerId = 217},
		}}

	OnAnswer{192;
		Conditions = {
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"},
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"}),
			UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ,
			Negated(IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_151PC", String = "Was ist das für eine Kreatur?", AnswerId = 193, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_160PC", String = "Ich habe ihn befreit!", AnswerId = 206},
		}}

	OnAnswer{192;
		Conditions = {
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"},
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"}),
			Negated(UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ),
			IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_151PC", String = "Was ist das für eine Kreatur?", AnswerId = 193, Color = ColorDarkOrange},
			OfferAnswer{Tag = "dryadP205_171PC", String = "Er hat sich verwandelt!", AnswerId = 217},
		}}

	OnAnswer{192;
		Conditions = {
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"},
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"}),
			Negated(UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ),
			Negated(IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_151PC", String = "Was ist das für eine Kreatur?", AnswerId = 193, Color = ColorDarkOrange},
		}}

	OnAnswer{192;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"}),
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"},
			UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ,
			IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_156PC", String = "Wo finde ich ihn?", AnswerId = 200},
			OfferAnswer{Tag = "dryadP205_160PC", String = "Ich habe ihn befreit!", AnswerId = 206},
			OfferAnswer{Tag = "dryadP205_171PC", String = "Er hat sich verwandelt!", AnswerId = 217},
		}}

	OnAnswer{192;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"}),
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"},
			UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ,
			Negated(IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_156PC", String = "Wo finde ich ihn?", AnswerId = 200},
			OfferAnswer{Tag = "dryadP205_160PC", String = "Ich habe ihn befreit!", AnswerId = 206},
		}}

	OnAnswer{192;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"}),
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"},
			Negated(UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ),
			IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_156PC", String = "Wo finde ich ihn?", AnswerId = 200},
			OfferAnswer{Tag = "dryadP205_171PC", String = "Er hat sich verwandelt!", AnswerId = 217},
		}}

	OnAnswer{192;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"}),
			IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"},
			Negated(UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ),
			Negated(IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_156PC", String = "Wo finde ich ihn?", AnswerId = 200},
		}}

	OnAnswer{192;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"}),
			UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ,
			IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_160PC", String = "Ich habe ihn befreit!", AnswerId = 206},
			OfferAnswer{Tag = "dryadP205_171PC", String = "Er hat sich verwandelt!", AnswerId = 217},
		}}

	OnAnswer{192;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"}),
			UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ,
			Negated(IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_160PC", String = "Ich habe ihn befreit!", AnswerId = 206},
		}}

	OnAnswer{192;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"}),
			Negated(UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ),
			IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dryadP205_171PC", String = "Er hat sich verwandelt!", AnswerId = 217},
		}}

	OnAnswer{192;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo2"}),
			Negated(IsNpcFlagTrue{Name = "P201DryadIrfitInfo3"}),
			Negated(UND9
					 {
					 QuestState{QuestId = 1044, State = StateSolved},
					 IsNpcFlagFalse{Name = "npc_P204_IrfitFeedInfoGiven"}
					 }
					 ),
			Negated(IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{193;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_152", String = "Er ist ein Wunschwesen. Er kann jede Form annehmen, die er wünscht, aber für gewöhnlich sucht er sich eine Form, die seinem Wesen entspricht."},
			Answer{Tag = "", String = "", AnswerId = 194},
		}}

	OnAnswer{194;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_153", String = "Ein Irfit kann also von einer bedrohlichen Bestie bis hin zu einem freundlichen Pelztier alles sein!"},
			Answer{Tag = "", String = "", AnswerId = 195},
		}}

	OnAnswer{195;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_154", String = "In den alten Tagen gab es viele von ihnen, aber nur wenige sind noch am Leben. Einer von ihnen bewohnte meinen Hain!"},
			Answer{Tag = "", String = "", AnswerId = 196},
		}}

	OnAnswer{196;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_155", String = "Der Kaiser erfreute sich so an ihm, dass er ihn in dem Palast entführen ließ! Aber er verlor bald das Interesse an der Kreatur und verschenkte sie wie einen Gegenstand, dieser Narr!"},
			Answer{Tag = "", String = "", AnswerId = 197},
		}}

	OnAnswer{197;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "P201DryadIrfitInfo2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 198},
		}}

	OnAnswer{198;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 199},
		}}

	OnAnswer{199;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{200;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_157", String = "Der Kaiser hat ihn an den Zirkus verschenkt! Dort begaffen ihn nun Schaulustige und lassen ihn zu ihrer Belustigung allerlei Formen annehmen!"},
			Answer{Tag = "", String = "", AnswerId = 201},
		}}

	OnAnswer{201;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_158", String = "Ihr solltet ihn nicht mit Gewalt befreien, vielleicht könnt Ihr mit Serbio, dem Herrnd des Zirkus einen Handel eingehen."},
			Answer{Tag = "", String = "", AnswerId = 202},
		}}

	OnAnswer{202;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_159", String = "Ihr solltet mit ihm sprechen, er arbeitet in der Nähe der Arena in Empyria."},
			Answer{Tag = "", String = "", AnswerId = 203},
		}}

	OnAnswer{203;
		Conditions = {
		},
		Actions = {
			
						QuestBegin{QuestId = 1043} -- erhält Subquest "Gehe zu Serbio"
						,
			SetNpcFlagFalse{Name = "P201DryadIrfitInfo3"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 204},
		}}

	OnAnswer{204;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 205},
		}}

	OnAnswer{205;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{206;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_161", String = "Er ist Euch sehr dankbar! ich glaube, er hat Euch lieb gewonnen."},
			Answer{Tag = "dryadP205_162PC", String = "Ihr könnt mit ihm sprechen?", AnswerId = 207},
		}}

	OnAnswer{207;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_163", String = "Ja, er und ich sprechen noch die Sprache der alten Welt, die gesprochen wurde, bevor die Völker geboren wurden.Der Irfit ist sehr schwach. Er benötigt Nahrung!"},
			Answer{Tag = "dryadP205_164PC", String = "Was frisst denn so ein Irfit?", AnswerId = 208},
		}}

	OnAnswer{208;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_165", String = "Ah schön, ich sehe Ihr sorgt Euch um ihn! Ein Irfit ernährt sich von vielerlei, je nachdem was Ihr ihm gebt, so wird sich sein Wesen verändern."},
			Answer{Tag = "", String = "", AnswerId = 209},
		}}

	OnAnswer{209;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_166", String = "Bringt Ihr ihm zermahlene Ariakristalle, wird er ein freundliches Wesen annehmen, füttert Ihr ihm aber die blutigen Herzen Eurer Feinde wird er eine gefährliche Kreatur!"},
			Answer{Tag = "", String = "", AnswerId = 210},
		}}

	OnAnswer{210;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_167", String = "Schaut Euch also nach Ariakristallen um oder achtet darauf, ob Ihr die Herzen Eurer Feinde erringen könnt! Je nach dem was Ihr dem irfit füttert, wird er sich entwickeln."},
			Answer{Tag = "", String = "", AnswerId = 211},
		}}

	OnAnswer{211;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_168", String = "Der Irfit benötigt dreimal Nahrung von einer Art, damit er wachsen kann. Sobald Ihr ihm also drei Kristalle oder drei Herzen gebracht habt, wird er sich verwandeln!"},
			Answer{Tag = "", String = "", AnswerId = 212},
		}}

	OnAnswer{212;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_169", String = "Achtet also darauf, von welchem der Dinge Ihr ihm als erstes drei füttert! Damit bestimmt Ihr sein Wesen!"},
			Answer{Tag = "", String = "", AnswerId = 213},
		}}

	OnAnswer{213;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_170", String = "Ihr müsst die Nahrung allerdings zerkleinern, bevor er sie schlucken kann. Kauft dazu in Empyria einige Mörser, sie sollten dafür geeignet sein."},
			Answer{Tag = "", String = "", AnswerId = 214},
		}}

	OnAnswer{214;
		Conditions = {
		},
		Actions = {
			
						SetNpcFlagTrue{Name = "npc_P204_IrfitFeedInfoGiven"},
						QuestSolve{QuestId = 1045},
						QuestBegin{QuestId = 1046},
						SetGlobalFlagTrue{Name ="g_P204_IrfitKannSprechen"}
						,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 215},
		}}

	OnAnswer{215;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 216},
		}}

	OnAnswer{216;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{217;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_172", String = "Ihr habt ihm nicht nur sein Leben zurückgegeben, sondern auch sein Wesen mitbestimmt. Der Irfit ist Euch sehr dankbar!"},
			Answer{Tag = "", String = "", AnswerId = 218},
		}}

	OnAnswer{218;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_173", String = "Er möchte Euch begleiten und seine Lebensschuld abgleichen. Er sieht es als seine Pflicht ... und er möchte in Eurer Nähe sein."},
			OfferAnswer{Tag = "dryadP205_174PC", String = "Gut, ich freue mich, einen Begleiter zu haben!", AnswerId = 219},
			OfferAnswer{Tag = "dryadP205_176PC", String = "Nein, er würde nur den Tod finden. Er soll hier bleiben!", AnswerId = 223},
		}}

	OnAnswer{219;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_175", String = "Dann passt gut auf ihn auf. Viel Glück!"},
			Answer{Tag = "", String = "", AnswerId = 220},
		}}

	OnAnswer{220;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "P201DryadIrfitInfo1"},
							SetRewardFlagTrue{Name = "SmallIrfitReward"},
							SetGlobalFlagTrue{Name = "g_P204_IrfitIsPlayerUnit"},
							QuestSolve{QuestId = 1080},
							QuestSolve{QuestId = 1042},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 221},
		}}

	OnAnswer{221;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 222},
		}}

	OnAnswer{222;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{223;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dryadP205_177", String = "Vielleicht habt Ihr recht. Nehmt seinen Dank, Ihr habt heute zumindest einen treuen Freund gewonnen."},
			Answer{Tag = "", String = "", AnswerId = 224},
		}}

	OnAnswer{224;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "P201DryadIrfitInfo1"},
							SetRewardFlagTrue{Name = "LargeIrfitReward"},
							QuestSolve{QuestId = 1080},
							QuestSolve{QuestId = 1042},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 225},
		}}

	OnAnswer{225;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 226},
		}}

	OnAnswer{226;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}


	EndDefinition()
end