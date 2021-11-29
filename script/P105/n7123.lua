-->INFO: Lena
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions =
	{
		QuestState{QuestId = 585 , State = StateSolved},
	},
}

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse {Name ="P105_LenaKannSprechen"},
	 },
	OnActions = 
	{
		 RemoveDialog { NpcId = 7123} ,
	},
	OffConditions = 
	{
		IsGlobalFlagTrue {Name ="P105_LenaKannSprechen"},
	},
	OffActions = 
	{
		EnableDialog { NpcId = 7123} ,
	},
}


-- Lena läuft mit Fugis los
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 0, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "FugisGo"},
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- Lena läuft zum Elfentor
OnIdleGoHome
{
	X = Fugis1X, Y = Fugis1Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 1, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint1"},
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

--- Lena meckert am geschlossenen Tor
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 2, Operator = IsEqual},
		IsGlobalFlagFalse { Name = "P105_SouthTorAuf" },
	 },
	Actions = 
	{
		 QuestBegin{QuestId = 682},
		 Outcry { NpcId = 7123, String = "Das Grenztor ist verschlossen! Die Wächter sind tot! Das ist das Werk der Wolflinge!" , Tag = "ocLena_P105_001" , Color = ColorWhite},
		 SetGlobalTimeStamp{Name = "P105LenasOutcriesGate"},
	}
}

-- Zweiter Outcry Lenas
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "P105LenasOutcriesGate", Seconds = 14},
		IsNpcCounter{Name = "FugisWalkPath", Value = 2, Operator = IsEqual},
		IsGlobalFlagFalse { Name = "P105_SouthTorAuf" },
	},
	Actions = 
	{
		 Outcry { NpcId = 7123, String = "Wir müssen ihr Lager nach dem Schlüssel durchsuchen! Rasch!" , Tag = "ocLena_P105_002" , Color = ColorWhite},
	}
}

-- Lena läuft auf Pfadstelle hinter Elfentor (Kosmetik, da sie sonst quer über Schnee laufen)
OnIdleGoHome
{
	X = Fugis1aX, Y = Fugis1aY, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 2, Operator = IsEqual},
		IsGlobalFlagTrue { Name = "P105_SouthTorAuf" },
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- nun geht Lena zur Eistempelfalle
OnIdleGoHome
{
	X = Fugis2X, Y = Fugis2Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 3, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint2"},
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- Lena startet Eistempelfalle
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 4, Operator = IsEqual},
	},
	Actions = 
	{
		 SetGlobalFlagTrue { Name = "P105_EistempelfalleStart" },
	}
}

-- Lenas Outcry sobald Eiselementare angreifen
OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRangeNpc{ TargetNpcId = 7124 , NpcId = self, Range = 7 }
	},
	Actions = 
	{
		QuestBegin{QuestId = 683},
	    Outcry { NpcId = 7123, String = "Vorsicht! Ein Angriff! Bleibt zusammen, Leute!" , Tag = "ocLena_P105_004" , Color = ColorWhite},
	}
}

-- Bei Angriff der Eiselementare warten sie oben im Norden
OnIdleGoHome
{
	X = Fugis2aX, Y = Fugis2aY, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 4, Operator = IsEqual},
	},
}

-- Lena wartet, bis der Spieler den Eistempel plattmacht
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 4, Operator = IsEqual},
		IsGlobalFlagTrue { Name = "P105_IcetempleDestroyed" },
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint3"},
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- nun geht Lena vor die Stadt
OnIdleGoHome
{
	X = Fugis3X, Y = Fugis3Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 5, Operator = IsEqual},
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
		Outcry { NpcId = 7123, String = "Die Stadt, endlich! Wir sind in Sicherheit!" , Tag = "ocLena_P105_005" , Color = ColorWhite},
		SetGlobalFlagTrue { Name = "P105_WestCityGateOpen" },
	},
}

-- nun geht Lena in die Stadt
OnIdleGoHome
{
	X = 200, Y = 253, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 6, Operator = IsEqual},
		IsGlobalFlagTrue { Name = "P105_WestTorAuf" },
	},
	HomeActions = 
	{
		SetGlobalFlagTrue {Name ="P105_LenaReachesCity"},
		SetRewardFlagTrue{ Name = "FugisBroughtToTirganach"},
	},
}

Despawn
{
	Conditions =
	{
		QuestState {QuestId = 691, State = StateSolved},
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n7123_Lena.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "lena105_001", String = "Hier sind wir erst einmal sicher. Sie werden es nicht wagen, Tirganach anzugreifen."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalCounter{Name = "P105_CountTheSurvivors", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "lena105_002", String = "Du hast in den letzten Tagen vielen Menschen das Leben gerettet. Wir müssen dir dankbar sein!"},
			Answer{Tag = "lena105_003PC", String = "Auch wenn wir Unheil über das Land gebracht haben?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalCounter{Name = "P105_CountTheSurvivors", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "lena105_007", String = "Was für ein Gemetzel. So viele Tote ..."},
			Answer{Tag = "lena105_008PC", String = "Es tut mir Leid.", AnswerId = 5},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_004", String = "Grim, dieser falsche Hund! Jetzt wird mir alles klar! Seine Versprechungen, sein Plan, sein Spott über Aedar ..."},
			Answer{Tag = "lena105_005PC", String = "Was ist nun mit der geraubten Königin und dem Drachen? Auch eine Lüge?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 696},
						QuestSolve{QuestId = 574},
						QuestBegin{QuestId = 608},
						QuestBegin{QuestId = 686},
						SetGlobalFlagTrue{Name = "P105_EluneKannSprechen"},
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGrim"},
			IsNpcFlagFalse{Name = "QuestionElune"},
		},
		Actions = {
			Say{Tag = "lena105_006", String = "Ich weiß es nicht. Am besten sprichst du mit Elune und versuchst herauszufinden, was vor sich geht. Ich werde mich um die Flüchtlinge kümmern."},
			OfferAnswer{Tag = "lena105_014PC", String = "Wie konnte dich Grim so täuschen?", AnswerId = 13},
			OfferAnswer{Tag = "lena105_021PC", String = "Du hast deine Magie bei Elune gelernt?", AnswerId = 21},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGrim"},
			Negated(IsNpcFlagFalse{Name = "QuestionElune"}),
		},
		Actions = {
			Say{Tag = "lena105_006", String = "Ich weiß es nicht. Am besten sprichst du mit Elune und versuchst herauszufinden, was vor sich geht. Ich werde mich um die Flüchtlinge kümmern."},
			OfferAnswer{Tag = "lena105_014PC", String = "Wie konnte dich Grim so täuschen?", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGrim"}),
			IsNpcFlagFalse{Name = "QuestionElune"},
		},
		Actions = {
			Say{Tag = "lena105_006", String = "Ich weiß es nicht. Am besten sprichst du mit Elune und versuchst herauszufinden, was vor sich geht. Ich werde mich um die Flüchtlinge kümmern."},
			OfferAnswer{Tag = "lena105_021PC", String = "Du hast deine Magie bei Elune gelernt?", AnswerId = 21},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGrim"}),
			Negated(IsNpcFlagFalse{Name = "QuestionElune"}),
		},
		Actions = {
			Say{Tag = "lena105_006", String = "Ich weiß es nicht. Am besten sprichst du mit Elune und versuchst herauszufinden, was vor sich geht. Ich werde mich um die Flüchtlinge kümmern."},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_009", String = "Gräm dich nicht, die Schuld daran trägt einzig und alleine Grim! Dieser Bastard!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_010", String = "Aber ich habe das Gefühl, er hat uns nicht nur Lügen erzählt. Sprich mit Elune über die Lage, ich kümmere mich um die Überlebenden."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 696},
						QuestSolve{QuestId = 574},
						QuestBegin{QuestId = 608},
						QuestBegin{QuestId = 686},
						SetGlobalFlagTrue{Name = "P105_EluneKannSprechen"},
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGrim"},
			IsNpcFlagFalse{Name = "QuestionElune"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lena105_014PC", String = "Wie konnte dich Grim so täuschen?", AnswerId = 13},
			OfferAnswer{Tag = "lena105_021PC", String = "Du hast deine Magie bei Elune gelernt?", AnswerId = 21},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGrim"},
			Negated(IsNpcFlagFalse{Name = "QuestionElune"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lena105_014PC", String = "Wie konnte dich Grim so täuschen?", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGrim"}),
			IsNpcFlagFalse{Name = "QuestionElune"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lena105_021PC", String = "Du hast deine Magie bei Elune gelernt?", AnswerId = 21},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGrim"}),
			Negated(IsNpcFlagFalse{Name = "QuestionElune"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 688 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lena105_011", String = "Es wird Zeit, dass Grim seine Strafe bekommt! Shal´Dun wartet auf uns!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 688 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
			UND(
								QuestState{QuestId = 608 , State = StateActive},
								QuestState{QuestId = 686 , State = StateSolved}
								)
								,
		},
		Actions = {
			Say{Tag = "lena105_012", String = "Hole den Feuerbann von den Zwergen. Ich bleibe hier, die Leute brauchen mich."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(
								QuestState{QuestId = 608 , State = StateActive},
								QuestState{QuestId = 686 , State = StateSolved}
								)
								),
			IsNpcFlagFalse{Name = "QuestionGrim"},
			IsNpcFlagFalse{Name = "QuestionElune"},
		},
		Actions = {
			Say{Tag = "lena105_013", String = "Freund?"},
			OfferAnswer{Tag = "lena105_014PC", String = "Wie konnte dich Grim so täuschen?", AnswerId = 13},
			OfferAnswer{Tag = "lena105_021PC", String = "Du hast deine Magie bei Elune gelernt?", AnswerId = 21},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(
								QuestState{QuestId = 608 , State = StateActive},
								QuestState{QuestId = 686 , State = StateSolved}
								)
								),
			IsNpcFlagFalse{Name = "QuestionGrim"},
			Negated(IsNpcFlagFalse{Name = "QuestionElune"}),
		},
		Actions = {
			Say{Tag = "lena105_013", String = "Freund?"},
			OfferAnswer{Tag = "lena105_014PC", String = "Wie konnte dich Grim so täuschen?", AnswerId = 13},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(
								QuestState{QuestId = 608 , State = StateActive},
								QuestState{QuestId = 686 , State = StateSolved}
								)
								),
			Negated(IsNpcFlagFalse{Name = "QuestionGrim"}),
			IsNpcFlagFalse{Name = "QuestionElune"},
		},
		Actions = {
			Say{Tag = "lena105_013", String = "Freund?"},
			OfferAnswer{Tag = "lena105_021PC", String = "Du hast deine Magie bei Elune gelernt?", AnswerId = 21},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(
								QuestState{QuestId = 608 , State = StateActive},
								QuestState{QuestId = 686 , State = StateSolved}
								)
								),
			Negated(IsNpcFlagFalse{Name = "QuestionGrim"}),
			Negated(IsNpcFlagFalse{Name = "QuestionElune"}),
		},
		Actions = {
			Say{Tag = "lena105_013", String = "Freund?"},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_015", String = "Ich kenne ihn von früher, aus der Zeit vor dem Krieg. Wir waren fast noch Kinder, als ich mich entschloss, die Lehren des Winters bei Elune zu studieren."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_016", String = "Grim war schon immer ein Hitzkopf. Er war wütend über unsere Trennung und nahm das erstbeste Schiff in die Ferne."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_017", String = "Danach habe ich nichts mehr von ihm gehört. Bis er dann plötzlich in Mirraw Thur auftauchte, an dem Tag, als die Eiselfen kamen."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_018", String = "Wie konnte ich nur so leichtgläubig sein! Aber er war so entschlossen! Genau das, was wir nach dem Verlust von Dunhan und Reowys brauchten."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_019", String = "Aber seine Kampfeslust ... seine Angst vor Kälte ... Ich hätte es ahnen müssen. Ich schätze, Liebe macht wirklich blind ... aber jetzt sind meine Augen offen!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_020", String = "Und diese Augen werden den Verräter sterben sehen, das verspreche ich!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionGrim"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGrim"},
			IsNpcFlagFalse{Name = "QuestionElune"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lena105_014PC", String = "Wie konnte dich Grim so täuschen?", AnswerId = 13},
			OfferAnswer{Tag = "lena105_021PC", String = "Du hast deine Magie bei Elune gelernt?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGrim"},
			Negated(IsNpcFlagFalse{Name = "QuestionElune"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lena105_014PC", String = "Wie konnte dich Grim so täuschen?", AnswerId = 13},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGrim"}),
			IsNpcFlagFalse{Name = "QuestionElune"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lena105_021PC", String = "Du hast deine Magie bei Elune gelernt?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGrim"}),
			Negated(IsNpcFlagFalse{Name = "QuestionElune"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_022", String = "Ja, als ich hierher kam, war ich fast noch ein Kind. Elune wies mich in die Formen der Eismagie ein, ließ mir aber meinen Glauben."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_023", String = "Doch irgendwann, nach der Schlacht um Fiara, kamen Runenkrieger durch Tirganach. Sie berichteten von der Schlacht und dem Schicksal der Sklaven in Mirraw Thur. Den Rest kannst du dir denken."},
			Answer{Tag = "lena105_024PC", String = "Aber warum hast du dich gegen deine Lehrer aufbringen lassen?", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lena105_025", String = "Diese Elfen hier oben sind ... anders, als die in den Wäldern. Kälter, härter. Viele sagen, sie seien keine Diener des Lichtes mehr. Und glaube nicht, dass ich sie während meiner Lehrzeit nicht gehasst habe!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionElune"},
			Say{Tag = "lena105_026", String = "Aber nie hätte ich gegen sie ziehen dürfen!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGrim"},
			IsNpcFlagFalse{Name = "QuestionElune"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lena105_014PC", String = "Wie konnte dich Grim so täuschen?", AnswerId = 13},
			OfferAnswer{Tag = "lena105_021PC", String = "Du hast deine Magie bei Elune gelernt?", AnswerId = 21},
		}}

	OnAnswer{25;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGrim"},
			Negated(IsNpcFlagFalse{Name = "QuestionElune"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lena105_014PC", String = "Wie konnte dich Grim so täuschen?", AnswerId = 13},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGrim"}),
			IsNpcFlagFalse{Name = "QuestionElune"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lena105_021PC", String = "Du hast deine Magie bei Elune gelernt?", AnswerId = 21},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGrim"}),
			Negated(IsNpcFlagFalse{Name = "QuestionElune"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end