-->INFO: sunder
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = 
	{
		FigureDead{NpcId = 2567},
		IsGlobalFlagTrue {Name = "BauernCamp"}, 
	}
}

OnIdleGoHome{WalkMode = Run, X = 397, Y = 198, Direction = 0}

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

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p17\n2616_sunder.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagSunderKnown"},
		},
		Actions = {
			Say{Tag = "sunderGW001", String = "Wer hätte gedacht, dass uns jemand von diesseits des Walls zur Hilfe kommt!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "sunderGW003", String = "Ah, Ihr seid es!"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSunderKnown"},
			SetRewardFlagTrue{ Name = "AufDemWall3Village3"},
			Say{Tag = "sunderGW002", String = "Als wir den Kampfeslärm von unten hörten, wuchs unsere Hoffnung auf Befreiung! Gebe Shanna, dass es noch nicht zu spät ist!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunderGW004", String = "Meine Tochter Gwen ist schwer krank! Alle Wege in eine andere Stadt sind blockiert! Und ich hatte ohnehin nicht mehr viel von ihrer Medizin..."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunderGW005", String = "Dann haben mir diese elenden Bastarde auch noch den Rest genommen!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunderGW006", String = "Falls Ihr irgendwo bei den Söldnern eine Flasche findet, die nach Branntwein riecht, bringt sie mir! Bitte!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 258} , QuestBegin{QuestId = 259},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunderGW007", String = "Ja! Den Göttern sei Dank! Gwen wird leben! Danke! Ich werde sie sogleich zu ihr bringen! Was wollt Ihr als Belohnung? Ich werde alles in meiner Macht stehende tun! Ihr habt meine Gwen gerettet!"},
			Answer{Tag = "sunderGW007PC", String = "Bringt Eurer Tochter zuerst die Medizin! Die anderen Dörfer haben mir Güter geschenkt! Wenn Ihr wollt, tut das gleiche!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunderGW008", String = "Das werde ich! Ich schicke sofort einige Leute los und lasse Euch bringen, was wir entbehren können!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 260} , QuestSolve{QuestId = 258} , 
				TransferItem{TakeItem = 2635 , Amount = 1 , Flag = Take},
				SetRewardFlagTrue{ Name = "GwensMedizin"},
			TransferResource{Resource = 1 , Side = SideLight, Amount = 100 , Flag = Give} , 
				TransferResource{Resource = 1 , Side = SideDark, Amount = 100 , Flag = Give} , 
				TransferResource{Resource = 2 , Side = SideLight, Amount = 150 , Flag = Give} , 
				TransferResource{Resource = 2 , Side = SideDark, Amount = 150 , Flag = Give} , 
				TransferResource{Resource = 7 , Side = SideLight, Amount = 100 , Flag = Give} , 
				TransferResource{Resource = 7 , Side = SideDark, Amount = 100 , Flag = Give} , 
				SetPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 260 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 260 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "sunderGW010", String = "Es geht Ihr wieder besser! Leider kann die Medizin nur lindern, aber nicht heilen! Solltet Ihr auf Euren Reisen je auf einen Heiler stoßen, dann erinnert Euch an uns!"},
			Answer{Tag = "sunderGW010PC", String = "Das werde ich!", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 258 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "sunderGW009", String = "Sie ist gesund! Es ging wie im Fluge, nachdem sie Euer Mittel bekam! Nochmals Danke, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnsolvable}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnsolvable},
		},
		Actions = {
			Say{Tag = "sunderGW011", String = "Sie ist von uns gegangen! Diese Aufregung... es war am Ende zuviel..."},
			Answer{Tag = "sunderGW011PC", String = "Es tut mir leid! Ich konnte die Medizin nicht finden...", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunderGW012", String = "Es ist nicht Eure Schuld! Hätten diese verdammten Söldner sie nicht gestohlen..."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunderGW013", String = "Ich hoffe nur, diese Bastarde bezahlen eines Tages dafür!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q258GwenWorst"},
		},
		Actions = {
			Say{Tag = "sunderGW014", String = "Sie atmet kaum noch! Ich glaube, es ist nicht mehr viel Zeit!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q258GwenWorst"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q258GwenBad"}),
		},
		Actions = {
			Say{Tag = "sunderGW016", String = "Noch ist ihr Zustand unverändert! Aber ich fürchte, dass wird nicht mehr lange so bleiben..."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{22;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q258GwenBad"},
		},
		Actions = {
			Say{Tag = "sunderGW015", String = "Es geht ihr immer schlechter! Wenn sie nicht bald ihre Medizin bekommt, wird es zu spät sein!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q248VtwoNewRessourcesReady"}),
		},
		Actions = {
			Say{Tag = "sunderGW018", String = "Ich möchte nicht unhöflich erscheinen, Freund... doch unsere Güter werden langsam knapp! Ich werde mit den anderen beraten, was wir noch entbehren können! Kommt bitte später wieder!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{25;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q248VtwoNewRessourcesReady"},
		},
		Actions = {
			Say{Tag = "sunderGW017", String = "Wir werden Euch noch weitere ins Lager bringen lassen! Hoffentlich ist Euer Kampf bald vorbei! Wir sind hier nicht mit Reichtümern gesegnet, müsst Ihr wissen!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			TransferResource{Resource = 1 , Side = SideLight, Amount = 100 , Flag = Give} , 
				TransferResource{Resource = 1 , Side = SideDark, Amount = 100 , Flag = Give} , 
				TransferResource{Resource = 2 , Side = SideLight, Amount = 150 , Flag = Give} , 
				TransferResource{Resource = 2 , Side = SideDark, Amount = 150 , Flag = Give} , 
				TransferResource{Resource = 7 , Side = SideLight, Amount = 100 , Flag = Give} , 
				TransferResource{Resource = 7 , Side = SideDark, Amount = 100 , Flag = Give} , 
				SetPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{27;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{27;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{27;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{27;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{27;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{27;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{27;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 258 , State = StateUnknown},
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW003PC", String = "Zu spät wofür?", AnswerId = 2},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			QuestState{QuestId = 260 , State = StateActive},
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW006PC", String = "Ist dies die Medizin?", AnswerId = 7},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			QuestState{QuestId = 258 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW008PC", String = "Wie geht es Gwen?", AnswerId = 11},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunderGW016PC", String = "Könnt Ihr noch Rohstoffe entbehren?", AnswerId = 25},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 258 , State = StateUnknown}),
			Negated(QuestState{QuestId = 260 , State = StateActive}),
			Negated(QuestState{QuestId = 258 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesVtwoGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end