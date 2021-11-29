-->INFO: Flink
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n6799_Flink.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "flink105_001", String = "Vielen Dank! Auf Euch Runenkrieger ist wirklich Verlass!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "flink105_005", String = "Ah, Ihr seid es wieder!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_002", String = "Wenn wir schon gerade dabei sind ... Ihr hättet nicht zufällig Zeit, mir bei einem kleinen Unterfangen zu helfen?"},
			Answer{Tag = "flink105_003PC", String = "Wo soll es denn hingehen?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_004", String = "In die Glutfänge! Ich bin Tiondria dicht auf der Spur! Das Buch von Darius gab mir endlich den richtigen Hinweis!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"}),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_006PC", String = "Also auf in die Glutfänge!", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"}),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_015PC", String = "Ich bin aus den Glutfängen zurück!", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			QuestState{QuestId = 714, State = StateActive},
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_023PC", String = "Ich habe den Schatz!", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"}),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_031PC", String = "Dort gab es keinen Schatz!", AnswerId = 25},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			IsGlobalFlagFalse{Name = "Frage1P105"},
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_039PC", String = "Wo sind die Glutfänge?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			IsGlobalFlagFalse{Name = "Info2P105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink105_041PC", String = "Was ist Tiondria?", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 709, State = StateSolved}),IsNpcFlagFalse{Name = "QuestOnlyOnceP105"})),
			Negated(UND(QuestState{QuestId = 709 , State = StateSolved},IsNpcFlagFalse{Name = "GlutfaengeSolvedP105"})),
			Negated(QuestState{QuestId = 714, State = StateActive}),
			Negated(UND(QuestState{QuestId = 714, State = StateActive},IsNpcFlagFalse{Name = "SchatzBehaltenP105"})),
			Negated(IsGlobalFlagFalse{Name = "Frage1P105"}),
			Negated(IsGlobalFlagFalse{Name = "Info2P105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_007", String = "Ich ... bin leider noch sehr schwach von dem Aufenthalt in der Zelle! Könntet Ihr vielleicht ohne mich gehen?"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_008", String = "Ich wäre Euch ja ohnehin nur im Weg!"},
			Answer{Tag = "flink105_009PC", String = "Was sucht Ihr denn in den Glutfängen?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_010", String = "Da ist der Offenbarungsort von Farnhardts Schatz aus Tiondria! All das Gold, das er aus Tiondria mitgebracht hat!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_011", String = "Er hat es in Fastholme versteckt. Aber in den Glutfängen befindet sich der Schlüssel!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_012", String = "In den Glutfängen hat Farnhardt ein Abbild von Fastholme in den Stein gehauen! Und er hat einen magischen Obelisken dort aufgestellt."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_013", String = "Wenn Ihr drei spezielle Schlüssel in den Obelisken einsetzt, weist Euch ein Licht über dem Abbild auf die Position des Schatzes in Fastholme hin! Merkt Euch diesen Ort!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_014", String = "Hier sind die drei Teile von Farnhardts Schlüssel für den Obelisken. Passt gut darauf auf! Und findet das Abbild!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 709},
			      SetNpcFlagTrue{Name = "QuestOnlyOnceP105"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_016", String = "Habt Ihr Euch gemerkt, wo der Schatz liegt?"},
			Answer{Tag = "flink105_017PC", String = "Ich hoffe es.", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_018", String = "Gut, dann geht so schnell wie möglich nach Fastholme und bergt ihn! Das Versteck ist jetzt offen!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_019", String = "Ihr erkennt es an den knöchernen Wächtern die es bewachen. Sie sind Farnhardts treue Garde und bewachen den Schatz bis über den Tod hinaus!"},
			Answer{Tag = "flink105_020PC", String = "Wie viele knöcherne Wächter?", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_021", String = "Dem Buch zufolge bestand die Garde aus ... fünfzehn Skeletten."},
			Answer{Tag = "flink105_022PC", String = "Das sollte kein allzu schwerer Kampf werden. Ich breche auf, sobald ich bereit bin.", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 739},
			   QuestSolve {QuestId = 710},
			   QuestBegin {QuestId = 712},
			   SetNpcFlagTrue{Name = "GlutfaengeSolvedP105"},
			Say{Tag = "", String = ""},
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
			Say{Tag = "flink105_024", String = "Wunderbar!"},
			Answer{Tag = "flink105_025PC", String = "Sagtet Ihr nicht dort wachen fünfZEHN Skelette?", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_026", String = "Ich? Nein, Ihr müsst mich falsch verstanden haben, die Garde bestand aus fünfzig Kriegern! Aber ich bin froh, dass Ihr den Sieg errungen habt!"},
			Answer{Tag = "flink105_027PC", String = "Ich auch! Teilen wir den Schatz.", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_028", String = "Ich hätte hier einen Meisterring der Diebe, das wäre doch eine gute Entlohnung für Euch?"},
			Answer{Tag = "flink105_029PC", String = "Wollt Ihr mich beleidigen?", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_030", String = "Schon gut, schon gut! Teilen wir. Ihr bringt mich noch ins Grab ..."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 714},
			     QuestSolve {QuestId = 698},
			     SetItemFlagFalse{Name = "PlayerHasItemFarnhardtsTreasure"},
			     SetRewardFlagTrue { Name = "SQTiondriaSchatzGeteilt"},
			     RemoveDialog{NpcId = 6799},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_032", String = "Was? Verflucht, ich hätte mitgehen sollen! Keinen Schatz?"},
			Answer{Tag = "flink105_033PC", String = "Nein. Nur Schnee und Tod.", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_034", String = "Dreimal verflucht! Es stand doch in dem Buch! Und Ihr lügt mich auch nicht an?"},
			OfferAnswer{Tag = "flink105_035PC", String = "Nur ein Scherz, hier ist der Schatz.", AnswerId = 27},
			OfferAnswer{Tag = "flink105_036PC", String = "Nein! Ihr wollt einen Runenkrieger einen Lügner nennen?", AnswerId = 30},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "SchatzBehaltenP105"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_037", String = "Ihr könnt lügen wie jeder andere!  Aber ihr könnt auch Armeen aus dem Nichts beschwören, von daher schweige ich lieber."},
			Answer{Tag = "flink105_038PC", String = "Tut das, mein Freund, tut das.", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 714},
			      QuestSolve {QuestId = 698},
			      SetItemFlagFalse{Name = "PlayerHasItemFarnhardtsTreasure"},
			      SetRewardFlagTrue { Name = "SQTiondriaSchatzBehalten" },
			      RemoveDialog{NpcId = 6799},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_040", String = "Das ist ein Gebirge im brennenden Land, nicht weit von Shal'Dun. Es ist sehr gefährlich dort."},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Frage1P105"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_042", String = "Ein sagenhafter Ort, eine fremde Welt! Die Dächer sind mit Gold gedeckt und die Bewohner trinken aus Diamantkelchen silbernen Wein!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_043", String = "Viele suchen das Tor nach Tiondria, aber ich habe Farnhardts Schlüssel! Damit hole ich mir seinen Schatz!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_044", String = "Farnhardt war der Einzige, der jemals bis nach Tiondria kam! Sein Schatz muss gewaltig sein! Und er enthält Hinweise auf die Lage des Tors nach Tiondria!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink105_045", String = "Reichtümer mein Freund, Reichtümer!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Info2P105"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}


	EndDefinition()
end