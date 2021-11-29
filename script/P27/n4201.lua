-->INFO: HighArchon
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = South}


-- 539 wieder restarten wenn spieler auf BF scheitert
OnEvent
{
	Conditions = {
		QuestState{QuestId = 539, State = StateSolved},
	},
	Actions = {
       	QuestBegin{QuestId = 539},
	},
}


OnToggleEvent
{
	OnConditions = {
		IsNpcFlagTrue{Name = "BitteZaubernDanke", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 20},
	},
	OnActions = {
		CastSpell{Spell = 1667 , Target = Avatar, TargetType = Figure , X = 0, Y = 0},
		SetNpcFlagFalse{Name = "BitteZaubernDanke"},
	},
	OffConditions = {
		IsNpcFlagFalse{Name = "BitteZaubernDanke"},
	},
	OffActions = {
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p27\n4201_HighArchon.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagArchonKnown"},
		},
		Actions = {
			Say{Tag = "archon001", String = "Ein Lichtgläubiger?! Ich werde von einem elenden Lichtgläubigen gerettet?! Ich werde meine Soldaten zu Tode foltern lassen!"},
			Answer{Tag = "archon001PC", String = "Seid kein Narr, Archon! Ihr seid frei - nur das zählt!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagArchonKnown"}),
			QuestState{QuestId = 538 , State = StateActive},
			QuestState{QuestId = 539 , State = StateActive},
		},
		Actions = {
			Say{Tag = "archon004", String = "Sprecht schnell, Mensch!"},
			OfferAnswer{Tag = "archon004PC", String = "Helft mir gegen die Eisernen!", AnswerId = 3},
			OfferAnswer{Tag = "archon009PC", String = "Gebt mir den Schutz vor der Magie der Eisernen!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagArchonKnown"}),
			QuestState{QuestId = 538 , State = StateActive},
			Negated(QuestState{QuestId = 539 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "archon004", String = "Sprecht schnell, Mensch!"},
			OfferAnswer{Tag = "archon004PC", String = "Helft mir gegen die Eisernen!", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagArchonKnown"}),
			Negated(QuestState{QuestId = 538 , State = StateActive}),
			QuestState{QuestId = 539 , State = StateActive},
		},
		Actions = {
			Say{Tag = "archon004", String = "Sprecht schnell, Mensch!"},
			OfferAnswer{Tag = "archon009PC", String = "Gebt mir den Schutz vor der Magie der Eisernen!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagArchonKnown"}),
			Negated(QuestState{QuestId = 538 , State = StateActive}),
			Negated(QuestState{QuestId = 539 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "archon004", String = "Sprecht schnell, Mensch!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "archon002", String = "Zu einer anderen Zeit hätte ich Euch die Zunge verfaulen lassen für diese Worte...! Doch die Ehre gebietet mir, Euch zu verschonen!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 538 , State = StateActive},
			QuestState{QuestId = 539 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagArchonKnown"},
			Say{Tag = "archon003", String = "Nennt mir die Form, in der Ihr meine Dankbarkeit erfahren wollt...! Damit diese unsägliche Schuld rasch beglichen sein möge!"},
			OfferAnswer{Tag = "archon004PC", String = "Helft mir gegen die Eisernen!", AnswerId = 3},
			OfferAnswer{Tag = "archon009PC", String = "Gebt mir den Schutz vor der Magie der Eisernen!", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 538 , State = StateActive},
			Negated(QuestState{QuestId = 539 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagArchonKnown"},
			Say{Tag = "archon003", String = "Nennt mir die Form, in der Ihr meine Dankbarkeit erfahren wollt...! Damit diese unsägliche Schuld rasch beglichen sein möge!"},
			OfferAnswer{Tag = "archon004PC", String = "Helft mir gegen die Eisernen!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 538 , State = StateActive}),
			QuestState{QuestId = 539 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagArchonKnown"},
			Say{Tag = "archon003", String = "Nennt mir die Form, in der Ihr meine Dankbarkeit erfahren wollt...! Damit diese unsägliche Schuld rasch beglichen sein möge!"},
			OfferAnswer{Tag = "archon009PC", String = "Gebt mir den Schutz vor der Magie der Eisernen!", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 538 , State = StateActive}),
			Negated(QuestState{QuestId = 539 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagArchonKnown"},
			Say{Tag = "archon003", String = "Nennt mir die Form, in der Ihr meine Dankbarkeit erfahren wollt...! Damit diese unsägliche Schuld rasch beglichen sein möge!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "archon005", String = "Ohne meine Armeen kann ich Euch nur eine Hilfe anbieten..."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "archon006", String = "Die Eisernen folgen den dunklen Pfaden der Magie, so wie wir Norcaine auch! Ich kenne ihre Kräfte! Und ich kann Euch dagegen schützen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "archon007", String = "Der Schutz wirkt nur für kurze Zeit! Doch er bewahrt Euch vor allen schwarzmagischen Kräften... ebenso wie vor ihren Bauwerken!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "archon008", String = "Damit bleibt Euch genug Zeit, um zwischen ihnen hindurch zum Portal nach Urgath zu gelangen! Von dort an seid Ihr auf Euch allein gestellt!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "archon009", String = "Kehrt zu mir zurück, falls Ihr den Schutz erneut benötigt! Damit soll meine Schuld beglichen sein, Lichtbeter!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 539} , QuestSolve{QuestId = 538},
				SetRewardFlagTrue{ Name = "NachUrgath3Archon"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 538 , State = StateActive},
			QuestState{QuestId = 539 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archon004PC", String = "Helft mir gegen die Eisernen!", AnswerId = 3},
			OfferAnswer{Tag = "archon009PC", String = "Gebt mir den Schutz vor der Magie der Eisernen!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 538 , State = StateActive},
			Negated(QuestState{QuestId = 539 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archon004PC", String = "Helft mir gegen die Eisernen!", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 538 , State = StateActive}),
			QuestState{QuestId = 539 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archon009PC", String = "Gebt mir den Schutz vor der Magie der Eisernen!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 538 , State = StateActive}),
			Negated(QuestState{QuestId = 539 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			SetGlobalTimeStamp{Name = "Q538BuffTimer"} , SetNpcFlagTrue{Name = "BitteZaubernDanke"},
			Say{Tag = "archon012", String = "Ihr seid geschützt! Für kurze Zeit wird kein schwarzer Zauberspruch Euch treffen können! Nun geht! Beeilt Euch!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end