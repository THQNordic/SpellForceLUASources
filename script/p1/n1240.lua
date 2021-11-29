-->INFO: Darius
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{X = _X, Y = _Y, Direction = 3}

Respawn{WaitTime = 10}

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
--Toggle f�r Buch
OnToggleEvent
{
OnConditions = {
			PlayerHasItem{ItemId = 3461},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			Negated(PlayerHasItem{ItemId = 3461}),
			},
OffActions = {
		SetDialogType{Type = SideQuest}
		},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n1240_Darius.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagDariusKnown"},
		},
		Actions = {
			Say{Tag = "darius001", String = "Was f�hrt Euch zu mir, Runenknecht?"},
			Answer{Tag = "darius001PC", String = "Der Orden des Erwachens schickt mich! Seid Ihr der, den man Darius nennt?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDariusKnown"}),
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "darius007", String = "Seid gegr��t, junger Krieger"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius002", String = "Der bin ich! Doch Ihr vergeudet Eure Zeit - ich bin an den R�nkespielen von Euch und Euresgleichen nicht interessiert!"},
			Answer{Tag = "darius002PC", String = "Ich bin auf der Suche nach Rohen - er befindet sich in gro�er Gefahr! ", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius003", String = "Gefahr? Welche Gefahr sollte einem Magier des Zirkels wohl drohen?"},
			Answer{Tag = "darius003PC", String = "Nun, es scheint leider so, als w�re er nicht der einzige Zirkelmagier, der den Konvokationskrieg �berlebt hat! Rohen l�uft geradewegs in eine Falle! ", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius004", String = "Sprecht Ihr die Wahrheit, Runenknecht? Ein zweiter Magier? Wenn dem so ist, d�rft Ihr keine Zeit verlieren!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius005", String = "Rohen ist schon lange weiter gereist - zum Wildland-Pass!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius006", String = "Sprecht mit Celen Fell, Kommandantin der Wachen! Ihr werdet Ihre Erlaubnis brauchen, wenn Ihr die Torfeste nach Eloni durchqueren wollt! Dies ist momentan der einzige Weg, der zum Pass f�hrt!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
			QuestSolve{QuestId = 447} , QuestSolve{QuestId = 12},
			SetRewardFlagTrue{ Name = "DariusDerKarthograph"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetPlayerFlagTrue{Name = "FlagDariusKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius008", String = "Lasst mal sehen... Hm, talindische Gildenrunen... recht alt, w�rde ich sagen. Noch aus der Zeit vor dem Zirkel. Woher stammt es?"},
			Answer{Tag = "darius008PC", String = "Von einem Schemen, der aus den Sch�chten der alten Ostmine aufgestiegen ist! Ortah glaubt, es handle sich um die Geister von Udwins Expedition!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius009", String = "So, glaubt er das? F�r einen alten Soldaten ist Ortah gut im Bilde! In der Tat, Udwin geh�rte der Talindischen Gilde an..."},
			Answer{Tag = "darius009PC", String = "K�nnt Ihr etwas davon entziffern?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 46} , QuestSolve{QuestId = 43},
			SetRewardFlagTrue{ Name = "AusDerTiefe1Buch"},
			Say{Tag = "darius010", String = "Dazu brauche ich mehr Zeit! Aber es scheint sich um ein Tagebuch oder etwas �hnliches zu handeln!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius011", String = "Hm, ein finsteres Schriftst�ck... Sehr finster... Allm�chtiges Licht, das ist... das Buch des Kindschl�chters!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius012", String = "Hier, nehmt dies zum Tausch! Das Buch werde ich behalten! Dieses Wissen ist nicht... f�r Euch bestimmt!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 378} , 
				QuestSolve {QuestId = 324} ,
				SetRewardFlagTrue{ Name = "EchosBuch"},
				TransferItem{TakeItem = 3042, GiveItem = 653, Amount = 1, Flag = Exchange} ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius013", String = "Brannigans Handlanger schleichen schon geraume Zeit hier herum! Doch seit dem letzten Mond r�cken sie uns pl�tzlich offen zu Leibe!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius014", String = "Den Westen unseres Landes halten sie bereits fest in ihrem Griff! Nie konnten sie so weit vordringen wie jetzt, aber sie waren auch noch nie so gut organisiert und ger�stet wie heute!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius015", String = "Man muss kein Gelehrter sein, um zu sehen, dass sich hier irgend ein finsterer Plan entfaltet!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius016", String = "Aber noch wei� keiner, worauf dieser Plan abzielt und wer au�er Brannigan noch dahinter steckt!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "LiannonAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius017", String = "Nun, ich kenne ihn sicherlich besser, als die meisten dieser nichtsnutzigen Ordensleute, f�r die Ihr Euch verdingt! Er hat mich oft auf seinen Reisen besucht und mir �ber ferne L�nder berichtet!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius018", String = "Und doch blieb er allzeit r�tselhaft f�r mich... Die Schuld der Konvokation lastet immer noch schwer auf ihm, soviel kann ich sagen! Doch wer wollte �ber ihn richten?"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius019", String = "Ohne ihn w�ren wir l�ngst verloren in dieser geborstenen Welt."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "RohenAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 46 , State =  StateActive},
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius007PC", String = "K�nnt Ihr etwas mit diesem Buch hier anfangen?", AnswerId = 7},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			QuestState {QuestId = 378, State = StateActive},
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius010PC", String = "Goran sagte mir, Ihr k�nnt das hier entziffern?", AnswerId = 11},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius012PC", String = "Was ist in Liannon geschehen?", AnswerId = 15},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"}),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius016PC", String = "Ihr kennt Rohen wohl recht gut?", AnswerId = 21},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			QuestState{QuestId = 14 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius019PC", String = "Bitte, erz�hlt mir etwas �ber...", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 46 , State =  StateActive}),
			Negated(QuestState {QuestId = 378, State = StateActive}),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "LiannonAsked"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateUnknown}, IsNpcFlagFalse{Name = "RohenAsked"})),
			Negated(QuestState{QuestId = 14 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "BookQuestionAsked"} , Negated(QuestState{QuestId = 110 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius019PCa", String = "...die Konvokation.", AnswerId = 27},
			OfferAnswer{Tag = "darius028PC", String = "...den Zirkel.", AnswerId = 36},
			OfferAnswer{Tag = "darius035PC", String = "...die Runen.", AnswerId = 43},
			OfferAnswer{Tag = "darius040PC", String = "...die Nordreiche.", AnswerId = 48},
			OfferAnswer{Tag = "darius044PC", String = "...dieses Buch.", AnswerId = 52},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "BookQuestionAsked"} , Negated(QuestState{QuestId = 110 , State = StateUnknown}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius019PCa", String = "...die Konvokation.", AnswerId = 27},
			OfferAnswer{Tag = "darius028PC", String = "...den Zirkel.", AnswerId = 36},
			OfferAnswer{Tag = "darius035PC", String = "...die Runen.", AnswerId = 43},
			OfferAnswer{Tag = "darius040PC", String = "...die Nordreiche.", AnswerId = 48},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius020", String = "Das Wissen �ber die Konvokation stammt von einem Runentext aus den Ruinen der Former in Xu."},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius021", String = "Der Text beschreibt die Zusammenkunft zweier Himmelsk�rper: Aonirs Stern und etwas, das die Former den dunklen Bruder nannten. Aonirs Stern wird dabei f�r einen Augenblick verdeckt!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius022", String = "Wenn dies geschieht, ist Aonirs Auge blind und seine Macht erlischt f�r einen Lidschlag. In diesem Moment ist auch der Bann geschw�cht, der die wilden Urelemente unserer Welt im Zaume h�lt!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius023", String = "Der Text besagt nun, dass, falls es jemandem gelingen sollte, w�hrend der Zusammenkunft die Urelemente zu erwecken, er sie unter seinen Bann schlagen und eine Macht erlangen k�nnte, die selbst die G�tter erschauern l�sst!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius024", String = "Die Zirkelmagier entdeckten diesen alten Text in Xu und studierten ihn. Und wenig sp�ter begann in ihren K�pfen der n�rrische Plan zu reifen, die Konvokation heraufzubeschw�ren!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius025", String = "Mit der Zeit zerstritten sich die Magier allerdings. Sie glaubten, nur ein Einziger k�nnte die Macht �ber die Urelemente erlangen. So kam es zum Konvokationkrieg! Viele Generationen arbeiteten sie darauf hin. Aber die alten Texte waren ungenau."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius026", String = "Und als die Stunde der Konvokation kam, da riefen sie die Urm�chte mit all ihrem magischen K�nnen an - wetteifernd um den Preis der Macht. Aber keiner konnte einzeln genug Kraft aufbringen und die Urelemente gerieten au�er Kontrolle!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius027", String = "Sie fuhren aus ihrem Schlaf auf und ihr Toben zerschmetterte das Antlitz der Welt! Nur dort wo die Gottsteine Aonirs - die blauen Obelisken - standen, blieb noch etwas von der Macht des Sternengottes erhalten und sch�tzte uns vor der Vernichtung!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "BookQuestionAsked"} , Negated(QuestState{QuestId = 110 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "darius028", String = "So entstanden die Inseln. Aber wir w�ren dennoch dem Untergang geweiht gewesen, h�tte Rohen Tahir nicht die Portale geschaffen und die L�nder unserer Welt wieder miteinander verbunden!"},
			OfferAnswer{Tag = "darius019PCa", String = "...die Konvokation.", AnswerId = 27},
			OfferAnswer{Tag = "darius028PC", String = "...den Zirkel.", AnswerId = 36},
			OfferAnswer{Tag = "darius035PC", String = "...die Runen.", AnswerId = 43},
			OfferAnswer{Tag = "darius040PC", String = "...die Nordreiche.", AnswerId = 48},
			OfferAnswer{Tag = "darius044PC", String = "...dieses Buch.", AnswerId = 52},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "BookQuestionAsked"} , Negated(QuestState{QuestId = 110 , State = StateUnknown}))),
		},
		Actions = {
			Say{Tag = "darius028", String = "So entstanden die Inseln. Aber wir w�ren dennoch dem Untergang geweiht gewesen, h�tte Rohen Tahir nicht die Portale geschaffen und die L�nder unserer Welt wieder miteinander verbunden!"},
			OfferAnswer{Tag = "darius019PCa", String = "...die Konvokation.", AnswerId = 27},
			OfferAnswer{Tag = "darius028PC", String = "...den Zirkel.", AnswerId = 36},
			OfferAnswer{Tag = "darius035PC", String = "...die Runen.", AnswerId = 43},
			OfferAnswer{Tag = "darius040PC", String = "...die Nordreiche.", AnswerId = 48},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius029", String = "Zu allen Zeiten haben Magier mit ihrem Durst nach Wissen und Macht die Reiche in Unruhe versetzt. Der Zirkel wurde von allen V�lkern in �bereinkunft gegr�ndet, um die R�nkespiele der Zauberkundigen zu beenden!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius030", String = "Dem Zirkel traten die dreizehn m�chtigsten Magier der V�lker bei, Anh�nger des Lichts ebenso wie der Finsternis. Der Zirkel w�hlte die Stadt Mulandir als Sitz, unabh�ngig von jeder Regierung!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius031", String = "Zuerst versahen die Magier des Zirkels ihre Aufgaben noch mit Ernst und schufen Frieden und Gerechtigkeit, wo zuvor Hass und Intrigen geherrscht hatten. Doch es kam, wie es kommen musste..."},
			Answer{Tag = "darius031PC", String = "Die Magier erkannten, welche Macht ihr Zirkel vereinte?", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius032", String = "Weise gesprochen! Der Zirkel wurde alsbald zu einem Zentrum der Macht! Eine Gefahr, die keines der V�lker wahrzunehmen vermochte! Denn die Magier wirkten heimlich und auf vielerlei Umwegen!"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius033", String = "Sie entschl�sselten das Geheimnis des Allfeuers, das ihr Leben verl�ngerte und ihnen Macht jenseits jeder bekannten Zauberei verlieh! Hunderte von Jahren lenkten sie die Geschicke der Reiche aus dem Verborgenen!"},
			Answer{Tag = "darius033PC", String = "Wie kann ein Zirkelmagier besiegt werden, wenn er doch die Kraft des Allfeuers zu nutzen wei�?", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius034", String = "Nur durch einen anderen Zirkelmagier! Oder einen Gott! Das, was sie letzen Endes t�tete, war ihre eigene Gier! Als die Konvokation fehlschlug, wurden die meisten von ihnen vernichtet!"},
			Answer{Tag = "darius034PC", String = "Die meisten?", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "BookQuestionAsked"} , Negated(QuestState{QuestId = 110 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "darius035", String = "Nun, Rohen Tahir hat �berlebt! Wer garantiert uns, dass nicht noch andere des Zirkels am Leben sind?"},
			OfferAnswer{Tag = "darius019PCa", String = "...die Konvokation.", AnswerId = 27},
			OfferAnswer{Tag = "darius028PC", String = "...den Zirkel.", AnswerId = 36},
			OfferAnswer{Tag = "darius035PC", String = "...die Runen.", AnswerId = 43},
			OfferAnswer{Tag = "darius040PC", String = "...die Nordreiche.", AnswerId = 48},
			OfferAnswer{Tag = "darius044PC", String = "...dieses Buch.", AnswerId = 52},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "BookQuestionAsked"} , Negated(QuestState{QuestId = 110 , State = StateUnknown}))),
		},
		Actions = {
			Say{Tag = "darius035", String = "Nun, Rohen Tahir hat �berlebt! Wer garantiert uns, dass nicht noch andere des Zirkels am Leben sind?"},
			OfferAnswer{Tag = "darius019PCa", String = "...die Konvokation.", AnswerId = 27},
			OfferAnswer{Tag = "darius028PC", String = "...den Zirkel.", AnswerId = 36},
			OfferAnswer{Tag = "darius035PC", String = "...die Runen.", AnswerId = 43},
			OfferAnswer{Tag = "darius040PC", String = "...die Nordreiche.", AnswerId = 48},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius036", String = "Ich verstehe! Euer langer... Schlaf hat viele Eurer Erinnerungen getr�bt! Die Runenkrieger wurden einst vom Zirkel als Garde geschaffen!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius037", String = "Magische Kreaturen sind machtvoll, aber meist unerfahren! Erfahrene Soldaten dagegen sind sterblich und von schwankender Loyalit�t!"},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius038", String = "Also schuf der Zirkel Euch! Er schmiedete Eure Seelen, Eure Lebenskraft an die Runen und sicherte sich somit Eure Treue. Und jede Erfahrung, die Ihr in endlosen Kriegen sammelt, bleibt in Euch erhalten! Eine perfekte Waffe!"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius039", String = "Und als der Krieg kam, sah man Euch in endlosen Reihen - Armeen aus dem Nirgendwo - das Land verheeren. Oh, wir haben Euch gehasst! Ihr wart das Sinnbild f�r die Macht der dreizehn gro�en Puppenspieler!"},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "BookQuestionAsked"} , Negated(QuestState{QuestId = 110 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "darius040", String = "Nun, ich kann Rohen verstehen, dass er einen von Euch zur�ckgerufen hat! Wenn etwas die geschw�chten Nordreiche retten kann, dann die Macht der Rune!"},
			OfferAnswer{Tag = "darius019PCa", String = "...die Konvokation.", AnswerId = 27},
			OfferAnswer{Tag = "darius028PC", String = "...den Zirkel.", AnswerId = 36},
			OfferAnswer{Tag = "darius035PC", String = "...die Runen.", AnswerId = 43},
			OfferAnswer{Tag = "darius040PC", String = "...die Nordreiche.", AnswerId = 48},
			OfferAnswer{Tag = "darius044PC", String = "...dieses Buch.", AnswerId = 52},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "BookQuestionAsked"} , Negated(QuestState{QuestId = 110 , State = StateUnknown}))),
		},
		Actions = {
			Say{Tag = "darius040", String = "Nun, ich kann Rohen verstehen, dass er einen von Euch zur�ckgerufen hat! Wenn etwas die geschw�chten Nordreiche retten kann, dann die Macht der Rune!"},
			OfferAnswer{Tag = "darius019PCa", String = "...die Konvokation.", AnswerId = 27},
			OfferAnswer{Tag = "darius028PC", String = "...den Zirkel.", AnswerId = 36},
			OfferAnswer{Tag = "darius035PC", String = "...die Runen.", AnswerId = 43},
			OfferAnswer{Tag = "darius040PC", String = "...die Nordreiche.", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius041", String = "Als Nordreiche bezeichnet man die L�nder im n�rdlichen Teil Fiaras. Dazu geh�rt in erster Linie das Reich Nortander, der einstige Sitz des Imperiums."},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius042", String = "Nortander ist heute mehr eine Art loser Zusammenschluss der vier �berlebenden F�rstenh�user. Das Reich der Hohenmark, das s�dlich der D�sterlande liegt, hat seine Grenzen geschlossen. Wir wissen nicht, was dort vorgeht!"},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius043", String = "Aber nicht nur Menschen leben in den Nordreichen! Die Zwerge haben ihre beiden gro�en St�dte, Windholme und Fastholme, von den Elfen existiert nur noch die Siedlung der Eloni!"},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "BookQuestionAsked"} , Negated(QuestState{QuestId = 110 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "darius044", String = "Weiter im Osten, hinter dem Wildland Pass, liegt das Orkreich Gruk, das von den Orks der Sharok beherrscht wird! S�dlich davon leben die Dunkelelfen in ihren Obsidiant�rmen! Ihr Reich nennen sie Lar!"},
			OfferAnswer{Tag = "darius019PCa", String = "...die Konvokation.", AnswerId = 27},
			OfferAnswer{Tag = "darius028PC", String = "...den Zirkel.", AnswerId = 36},
			OfferAnswer{Tag = "darius035PC", String = "...die Runen.", AnswerId = 43},
			OfferAnswer{Tag = "darius040PC", String = "...die Nordreiche.", AnswerId = 48},
			OfferAnswer{Tag = "darius044PC", String = "...dieses Buch.", AnswerId = 52},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "BookQuestionAsked"} , Negated(QuestState{QuestId = 110 , State = StateUnknown}))),
		},
		Actions = {
			Say{Tag = "darius044", String = "Weiter im Osten, hinter dem Wildland Pass, liegt das Orkreich Gruk, das von den Orks der Sharok beherrscht wird! S�dlich davon leben die Dunkelelfen in ihren Obsidiant�rmen! Ihr Reich nennen sie Lar!"},
			OfferAnswer{Tag = "darius019PCa", String = "...die Konvokation.", AnswerId = 27},
			OfferAnswer{Tag = "darius028PC", String = "...den Zirkel.", AnswerId = 36},
			OfferAnswer{Tag = "darius035PC", String = "...die Runen.", AnswerId = 43},
			OfferAnswer{Tag = "darius040PC", String = "...die Nordreiche.", AnswerId = 48},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius045", String = "Bei den G�ttern! Habt Ihr dieses Buch von Rohen? Was ist mit ihm passiert?"},
			Answer{Tag = "darius045PC", String = "Rohen fiel in den Frostmarschen! Es war meine Schuld...", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius046", String = "Ihr wart nur Bote! Doch jetzt seid Ihr weit mehr als das! Dar�ber m��t Ihr Euch im Klaren sein!"},
			Answer{Tag = "darius046PC", String = "Ist es wahr, dass in diesem Buch die Geheimnisse der Konvokation stehen?", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius047", String = "Nicht nur das! Dieses Buch erl�utert, warum die Konvokation fehlschlagen musste! Es erkl�rt, was sie eigentlich ist - eine T�uschung!"},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius048", String = "Kein Geheimnis der Former, sondern ein falscher Hinweis! Eine Rache der Renegaten, der dunklen G�tter! Von den Fial Darg in Xu zur�ckgelassen, als finsterer K�der!"},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius049", String = "Die Fial Darg wussten, dass die Urgewalten nicht geb�ndigt werden k�nnen! Dazu ist nur Aonir selbst imstande! So verleiteten sie die V�lker dazu, die M�chte zur rechten Zeit anzurufen und sich selbst zu vernichten!"},
			Answer{Tag = "darius049PC", String = "Aber die dunklen V�lker w�ren doch genauso vernichtet worden!", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius050", String = "Bedenke, diese Runentafeln wurden zu einer Zeit gefertigt, als die Dunklen von Xu vertrieben und die Renegaten von der Welt verbannt wurden! Damals standen die Dunklen ohnehin am Rand der Vernichtung!"},
			Answer{Tag = "darius050PC", String = "Woher habt Ihr soviel Kenntnis �ber Dinge, die selbst der Zirkel nicht wusste? Rohen hat dieses Buch von Euch, nicht wahr?", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "BookQuestionAsked"} , SetDialogType{Type = SideQuest},
			Say{Tag = "darius051", String = "Ich wei� vielleicht viel, aber Ihr m�sst nicht alles wissen! Gehabt Euch wohl!"},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end