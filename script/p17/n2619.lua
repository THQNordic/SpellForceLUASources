-->INFO: vintus
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END


--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
			IsNpcFlagTrue{Name = "HasMainquest"},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			IsNpcFlagFalse{Name = "HasMainquest"},
			},
OffActions = {
		SetDialogType{Type = SideQuest}
		},
}
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}
	


--Ketten weg
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue {Name = "VintusGodwallChainRemove"},
			},
Actions = {
		StopEffect{TargetType = Figure , X = 0 , Y = 0 , NpcId = 2619}
		}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p17\n2619_vintus.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagVintusKnown"},
		},
		Actions = {
			Say{Tag = "vintus001", String = "Wer... wer seid Ihr? Ein... ein Krieger der Rune? Was... bringt Euch zu uns?"},
			Answer{Tag = "vintus001PC", String = "Ein Auftrag des Ordens! Lasst mich Eure Fesseln lösen!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagVintusKnown"}),
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "vintus004", String = "Es ist mir eine Ehre!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			StopEffect{TargetType = Figure , X = 0 , Y = 0 , NpcId = 2619},
				SetRewardFlagTrue{ Name = "AufDemWall5Endkampf"},
			Say{Tag = "vintus002", String = "Ah, endlich frei! Ich bin Vintus, der Schreiber dieser bescheidenen Siedlung? Wie kann ich Euch danken?"},
			Answer{Tag = "vintus002PC", String = "Ein wenig Eures Wissens soll mir genügen!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagVintusKnown"},
			Say{Tag = "vintus003", String = "Nur zu gerne! Fragt! Was wollt Ihr wissen?"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus005", String = "Ihr Auftraggeber, ein Zauberer, sucht die Fragmente eines alten, magischen Kunstwerks!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus006", String = "Thurgin, der Gründer unserer Siedlung, hinterließ mir eines davon! Ich hielt es geheim und verbarg es, sogar vor meinem eigenen Blut! Aber Mechlan spürt, dass es hier ist! Er ist besessen davon!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus007", String = "Er wird wiederkehren! Und dann wird er uns alle foltern! Es muss endlich ein Ende haben!"},
			Answer{Tag = "vintus007PC", String = "Ihr wollt ihm den Splitter geben?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus008", String = "Nein! Ich werde ihn Euch geben!"},
			Answer{Tag = "vintus008PC", String = "Mir? Ich bin nur ein Wanderer in Eurem Land! Ich begehre nichts von Euren Schätzen!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus009", String = "Ihr müsst ihn nicht behalten! Bringt ihn nur fort von hier! Bringt ihn fort, zurück nach Mulandir! Dorthin, wo er hergekommen ist!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 251} , QuestBegin{QuestId = 264} , QuestSolve{QuestId = 250} , QuestSolve{QuestId = 257},
			Say{Tag = "vintus010", String = "Soll Mechlan ihn dort selbst aus der Asche wühlen, wenn er ihn so begehrt!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus011", String = "Geht zu der verfallenen Mine bei der alten Zwergensiedlung! Sucht bei dem umgestürzten Baum nach einem großen Fels! Darunter ist der Splitter verborgen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 252} , SetNpcFlagTrue{Name = "ShardAAsked"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus012", String = "Er ist eines von vier Teilen eines Kunstwerks aus magischem Glas, welches vor über tausend Jahren von den mächtigen Formern geschaffen wurde!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus013", String = "Man sagt, wer das Kunstwerk erblickte, wurde von überirdischer Verzückung befallen, so schön war es! Der Zirkel brachte es in seinen Besitz und verwahrte es in den Archiven in Mulandir!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus014", String = "In den Wirren des Konvokationskrieges zerbrach das Kunstwerk. Die vier Bruchstücke gingen verloren!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus015", String = "Mechlan war ein Diener des Zirkels in Mulandir. Vielleicht hat er einmal die Wunder des Artefakts geschaut und ist nun von seinem Zauber besessen? Wer weiß..."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ShardAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus016", String = "Den Phönix? Allerdings! Die reine Kraft des Allfeuers, gebannt in einem dunklen Edelstein! Der Zirkel fertigte ihn auf dem Gipfel seiner Macht!"},
			Answer{Tag = "vintus016PC", String = "Wisst Ihr, wo ich ihn finden kann?", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus017", String = "Den Phönixstein finden? Ich verstehe... deshalb hat Euch der Orden geschickt! Nun, wenn Ihr den Phönix wollt, gibt es nur einen Ort, an dem Ihr suchen dürft: Mulandir!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vintus018", String = "Einstmals die Stadt des Zirkels - heute hingegen nur noch eine Aschewüste voller Dämonen! Sucht dort nach dem Phönix! Aber seht Euch vor!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "PhoenixAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 264 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus004PC", String = "Was wollten diese Söldner von Euch?", AnswerId = 3},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus010PC", String = "Wo finde ich diesen Splitter?", AnswerId = 10},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus011PC", String = "Woher stammt der Splitter?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vintus015PC", String = "Kennt Ihr den Phönixstein?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 264 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAAsked"})),
			Negated(UND(QuestState{QuestId = 264 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
			Negated(UND(QuestState{QuestId = 265 , State = StateActive} , IsNpcFlagFalse{Name = "PhoenixAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end