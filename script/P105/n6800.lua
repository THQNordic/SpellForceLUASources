-->INFO: Elune
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name ="P105_LenaReachesCity"},
	},
	Actions = 
	{
		Outcry { NpcId = 6800, String = "Willkommen in Tirganach, Schülerin. Diese Mauern werden dich und deine Freunde schützen." , Tag = "ocElune_P105_001" , Color = ColorWhite},
		QuestSolve{QuestId = 681},
		QuestBegin{QuestId = 696},
		SetGlobalFlagTrue {Name ="P105_LenaKannSprechen"},
		SetGlobalFlagTrue {Name = "P105_ElfenTrupp_StopSpawn"},
	},
}


OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse {Name ="P105_EluneKannSprechen"},
	 },
	OnActions = 
	{
		 RemoveDialog { NpcId = 6800} ,
	},
	OffConditions = 
	{
		IsGlobalFlagTrue {Name ="P105_EluneKannSprechen"},
	},
	OffActions = 
	{
		EnableDialog { NpcId = 6800} ,
	},
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n6800_Elune.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{Name = "CenwenIsFree"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "CenwenIsFree"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "elune105_001", String = "Willkommen in Tirganach, Runenkrieger."},
			Answer{Tag = "elune105_002PC", String = "Ich danke Euch für den Schutz, den Ihr uns gewährt.", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_003", String = "Meine Schwestern sind Euch weniger gut gesinnt. Aber jedes Leben ist von gleichem Wert."},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 688 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 688 , State = StateActive},
		},
		Actions = {
			Say{Tag = "elune105_004", String = "Nun seid Ihr bereit für einen Angriff auf das rote Imperium. Die Schattengrenze erwartet Euch."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 608 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "elune105_006", String = "Was wünscht Ihr?"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 608 , State = StateActive},
		},
		Actions = {
			Say{Tag = "elune105_005", String = "Habt Ihr den Feuerbann erringen können?"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
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
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			QuestState{QuestId = 687 , State = StateActive},
			QuestState{QuestId = 690 , State = StateActive},
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			QuestState{QuestId = 687 , State = StateActive},
			QuestState{QuestId = 690 , State = StateActive},
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			QuestState{QuestId = 687 , State = StateActive},
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			QuestState{QuestId = 687 , State = StateActive},
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			QuestState{QuestId = 690 , State = StateActive},
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			QuestState{QuestId = 690 , State = StateActive},
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			QuestState{QuestId = 687 , State = StateActive},
			QuestState{QuestId = 690 , State = StateActive},
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			QuestState{QuestId = 687 , State = StateActive},
			QuestState{QuestId = 690 , State = StateActive},
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			QuestState{QuestId = 687 , State = StateActive},
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			QuestState{QuestId = 687 , State = StateActive},
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			QuestState{QuestId = 690 , State = StateActive},
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			QuestState{QuestId = 690 , State = StateActive},
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionWhatHappened"},
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_007PC", String = "Was ist nun wirklich geschehen?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			QuestState{QuestId = 687 , State = StateActive},
			QuestState{QuestId = 690 , State = StateActive},
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			QuestState{QuestId = 687 , State = StateActive},
			QuestState{QuestId = 690 , State = StateActive},
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			QuestState{QuestId = 687 , State = StateActive},
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			QuestState{QuestId = 687 , State = StateActive},
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			QuestState{QuestId = 690 , State = StateActive},
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			QuestState{QuestId = 690 , State = StateActive},
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 ),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_014PC", String = "Was ist nun zu tun?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			QuestState{QuestId = 687 , State = StateActive},
			QuestState{QuestId = 690 , State = StateActive},
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			QuestState{QuestId = 687 , State = StateActive},
			QuestState{QuestId = 690 , State = StateActive},
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			QuestState{QuestId = 687 , State = StateActive},
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			QuestState{QuestId = 687 , State = StateActive},
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_023PC", String = "Ich habe den Feuerbann, das geheime Wissen der Zwerge!", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			QuestState{QuestId = 690 , State = StateActive},
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			QuestState{QuestId = 690 , State = StateActive},
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_033PC", String = "Ich habe bei den Geistern einen Schlüssel gefunden!", AnswerId = 36},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elune105_036PC", String = "Warum, glaubt Ihr, hat der Fial Darg Cenwen geraubt?", AnswerId = 40},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionWhatHappened"}),
			Negated(UND
			(IsNpcFlagTrue{Name = "QuestionWhatHappened"} ,
			 IsNpcFlagFalse{Name = "QuestionWhatNow"}
			 )),
			Negated(QuestState{QuestId = 687 , State = StateActive}),
			Negated(QuestState{QuestId = 690 , State = StateActive}),
			Negated(UND
							(IsNpcFlagFalse{Name = "QuestionWhyStolen"},
 							IsNpcFlagTrue{Name = "QuestionWhatHappened"})
 						  ),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "elune105_008PC", String = "War alles nur eine Lüge? Keine geraubte Königin? Kein Drache, der erwacht?", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_009", String = "Der Feuerdiener hat Euch nicht gänzlich belogen. Die Königin unter dem Eis wurde tatsächlich geraubt!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_010", String = "Der Fial Darg stahl sie mit Hilfe seiner Täuschkunst. Dann floh er nach Mirraw Thur, um bei seinen Orkdienern Unterschlupf zu finden."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_011", String = "Wir verfolgten ihn! Der weißen Priesterin gelang es, ihn mit einem Bann zu belegen. Doch die Königin war verschwunden."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_012", String = "Wir befragten den Fial Darg, aber er verspottete uns nur. So schlossen wir ihn in Eis, in der Hoffnung, so seinen Willen zu brechen."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_013", String = "Dieser Grim muss derweil die Königin unbemerkt aus dem Land gebracht haben. Dann hat er Euch getäuscht, um seinen Herrn zu befreien und dem roten Imperium die Pforten zu öffnen."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionWhatHappened"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_015", String = "Die Königin muss befreit werden! Wenn wir alle vergehen, aber sie muss zu Aryn zurückkehren!"},
			Answer{Tag = "elune105_016PC", String = "Oder er wird ausziehen, um sie zu suchen ...", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_017", String = "Und mit ihm käme der ewige Winter über die Welt! Noch ist er schwach, aber wir spüren bereits seinen Zorn!"},
			Answer{Tag = "elune105_018PC", String = "Aber wie finden wir die Königin?", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_019", String = "Oh, sie zu finden, wird einfach sein. Aber kein Lichtgläubiger gelangt lebend zu ihr. Die Feuer des roten Imperiums würden Euch verzehren!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_020", String = "Selbst unsere Winterwacht könnte nicht bis nach Shal´Dun vordringen, dem brennenden Fels, auf dem der Fial Darg regiert."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_021", String = "Wir müssen einen Weg finden, den Flammen zu widerstehen. Ich erinnere mich, dass die Zwerge einst Mittel kannten, um vom Feuer verschont zu werden."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_022", String = "Sprecht mit Aedale, unserer Hohen Priesterin. Sie kennt die Legenden."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionWhatNow"},
							   SetGlobalFlagTrue{Name = "P105_AedaleKannSprechen"},
							   QuestSolve{QuestId = 686},
							   QuestBegin{QuestId = 685},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_024", String = "Dann seid Ihr bereit!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_025", String = "Meine Schwestern und ich müssen hier verweilen. Aedale ist von uns gegangen, eine neue Priesterin muss bestimmt werden."},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_026", String = "Ihr aber solltet nicht rasten! Wir wissen nicht, wie viel Zeit noch bleibt, und der Weg in die Feuerstadt ist beschwerlich!"},
			Answer{Tag = "elune105_027PC", String = "Wie gelange ich nach Shal´Dun?", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_028", String = "Die Imperialen haben die Tore versiegelt. Wir kennen ihre Magie nicht, aber es sind Dunkelelfen. Und sie werden uns helfen, das Siegel des Imperiums zu brechen!"},
			Answer{Tag = "elune105_029PC", String = "Wie soll das geschehen?", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_030", String = "Dies war einst eine Stadt der Norcaine. Vor Jahren vertrieben meine Schwestern die Dunklen von diesem heiligen Ort, aber unter dem Eis schlummern immer noch die Geister der alten Herren!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_031", String = "Sie haben diese Tore erbaut! Wir hoffen, in den Gräbern etwas zu finden, mit dem man das Tor öffnen kann."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_032", String = "Begebt Euch des Nachts zu den Höhlen nahe der Westbrücke. Dort steigen sie manchmal aus den eisigen Tiefen herauf."},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 687},
										QuestSolve{QuestId = 608},
										QuestBegin{QuestId = 688},
										QuestBegin{QuestId = 689},
										SetGlobalFlagTrue { Name = "P105_NorthCityGateOpen" }
										,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_034", String = "Öffnet damit das Tor im Südosten, dahinter liegt der Pfad in die brennenden Lande der Dunklen."},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_035", String = "Mögen die Götter des Lichts Euch begleiten! Eilt Euch!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 690},
						QuestBegin{QuestId = 691},
						SetGlobalFlagTrue { Name = "P105_SouthCityGateOpen" }
						,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_037", String = "Wir wissen, dass es ihm nicht um den Drachen geht. Das ist ihm alles gleich."},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_038", String = "Bedenkt, Cenwen ist etwas ganz Besonderes. Sie ist ein Gottkind, eine Erstgeborene, eine der ersten Elfen, die über das Weltenrund wanderten."},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_039", String = "Das Blut der Erstgeborenen trägt noch die Magie der Götter ... und Rituale, die mit diesem Blut vollführt werden, haben göttliche Macht!"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_040", String = "Deswegen musste der Fial Darg Cenwen rauben. Denn es gibt nicht mehr viele Erstgeborene, vielleicht ist sie sogar die letzte."},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_041", String = "Am Weidwintertag wird die Sonnenscheibe Aonirs Stern verdecken. Dann muss er sie opfern, um zu erreichen, was er plant."},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_042", String = "Die dunklen Götter wieder auf Eo zurückzurufen! Was aus uns, Aryn oder sogar seinen eigenen Dienern wird, schert diese Kreatur nicht!"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionWhyStolen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{48;
		Conditions = {
			IsNpcFlagFalse{Name = "KnownReturned"},
		},
		Actions = {
			Say{Tag = "elune105_043", String = "Ihr habt es geschafft! Cenwen ist frei! Oh, das Volk der Elfen dankt Euch von ganzem Herzen! Wo ist Lena?"},
			Answer{Tag = "elune105_044PC", String = "An einem besseren Ort.", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KnownReturned"}),
		},
		Actions = {
			Say{Tag = "elune105_050", String = "Ihr solltet Euch beeilen!"},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_045", String = "Tot? Ihr Götter! Warum sie? Warum ... ?"},
			Answer{Tag = "elune105_046", String = "Nicht ich?", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "elune105_047", String = "Glaubt mir, ich wäre ebenso für sie gestorben. Aber ich bin an dieses Leben gefesselt, ich kann nur mit ansehen, wie meine Freunde sterben!", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "elune105_048PC", String = "Immer und immer wieder!", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elune105_049", String = "Dann werden wir beide Lena in unseren Herzen behalten ... auf der langen Reise, die noch vor uns liegt."},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "KnownReturned"},
			RemoveDialog {NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end