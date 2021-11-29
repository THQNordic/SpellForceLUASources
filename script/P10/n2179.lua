-->INFO: Urak
-->INFO: Urim
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END

--!EDS RESPAWN BEGIN
Respawn{WaitTime=3}
--!EDS RESPAWN END

--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p10\n2179_Urak.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"}),
		},
		Actions = {
			Say{Tag = "urak023", String = "Lasst mich zufrieden, Mensch! Euresgleichen ist hier nicht willkommen!"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUrakKnown"}),
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "urak003", String = "Glück auf!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagUrakKnown"},
		},
		Actions = {
			Say{Tag = "urak001", String = "Ah, der Runenkrieger! Was führt Euch in meine Minen?"},
			Answer{Tag = "urak001PC", String = "Seid Ihr der Vorarbeiter?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUrakKnown"},
			Say{Tag = "urak002", String = "Der Minenmeister, wenn´s beliebt! Nun sagt an, was treibt Euch her, Mensch?"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak004", String = "Hmm, so etwas findet man nicht oft! Ich gebe Euch zehn Silbermünzen das Stück! Hier nehmt!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			TransferMoney{Copper = 3000 , Flag = Give} , TransferItem{TakeItem = 2536 , Amount = 1 , Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak005", String = "Habt Ihr eine Vorstellung, wovon Ihr sprecht, Mensch!"},
			Answer{Tag = "urak005PC", String = "Was meint Ihr?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak006", String = "Nun, Ihr benötigt allein genügend Adamantinum für die Rohmasse! Darüber hinaus braucht Ihr einen Stein des ewigen Feuers sowie das Blut eines Dämons für die Farbe!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak007", String = "Vollendet ist das Werk aber erst, wenn das glühende Metall in den Tränen eines seelenlosen Wesens gelöscht wurde!"},
			Answer{Tag = "urak007PC", String = "Skarvig erwähnte nicht, dass ein solcher Aufwand nötig ist, um den Griff für ein Schwert zu fertigen!", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak008", String = "Ein Schwert?"},
			Answer{Tag = "urak008PC", String = "Eine Erdenklinge, geschmiedet von den Dienern der Tiefe!", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak009", String = "Ah, ich verstehe! Hm, ein Vorschlag, Mensch - ich tausche Euch die Klinge gegen ein gleichwertiges Stück aus meiner Sammlung!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak010", String = "Ich kann Euch aber auch verraten, wo Ihr die Zutaten für das rote Adamantinum findet! Die Entscheidung liegt bei Euch!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q171SetDesicion"},
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
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak011", String = "Adamantinum findet man nur an äußerst seltenen Stellen! Dort, wo das Gestein der Erde alt ist!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak012", String = "Steine des ewigen Feuers müsst Ihr an Orten suchen, an denen das Blut der Erde glutrot und siedend an die Oberfläche tritt und die Luft voller Asche hängt!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak013", String = "Das Blut des Dämons muss lebend entnommen werden, um seine Kraft zu erhalten! Fragt mich nicht, wie Ihr das vollbringen könnt!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak014", String = "Die Tränen eines seelenlosen Wesens sind der schwierigste Teil, da nur wenige Kreaturen ohne Seele je Trauer empfinden!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 170} , QuestBegin{QuestId = 171} , 
							QuestBegin{QuestId = 172} , QuestBegin{QuestId = 173} , 
							QuestBegin{QuestId = 174} , QuestBegin{QuestId = 175} , 
							SetPlayerFlagFalse{Name = "Q171SetDesicion"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak015", String = "Hier, wählt aus einer dieser Runen! Sie mag Euch bessere Dienste leisten!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
			IsNpcFlagFalse{Name = "UrimHasGivenSilas"},
			IsNpcFlagFalse{Name = "UrimHasGivenRaithskar"},
		},
		Actions = {
			Say{Tag = "urak016", String = "Dies ist die Rune von Silas, einem Magier der Elemente! Und dies ist die Rune von Raithskar, ein Meister der schwarzen Kunst!"},
			OfferAnswer{Tag = "urak016PC", String = "Gebt mir die Rune des Silas (Elementalist, Stufe 6)!", AnswerId = 25},
			OfferAnswer{Tag = "urak017PC", String = "Ich nehme die Rune des Raithskar (Hexer, Stufe 7)!", AnswerId = 29},
		}}

	OnAnswer{24;
		Conditions = {
			IsNpcFlagFalse{Name = "UrimHasGivenSilas"},
			Negated(IsNpcFlagFalse{Name = "UrimHasGivenRaithskar"}),
		},
		Actions = {
			Say{Tag = "urak016", String = "Dies ist die Rune von Silas, einem Magier der Elemente! Und dies ist die Rune von Raithskar, ein Meister der schwarzen Kunst!"},
			OfferAnswer{Tag = "urak016PC", String = "Gebt mir die Rune des Silas (Elementalist, Stufe 6)!", AnswerId = 25},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "UrimHasGivenSilas"}),
			IsNpcFlagFalse{Name = "UrimHasGivenRaithskar"},
		},
		Actions = {
			Say{Tag = "urak016", String = "Dies ist die Rune von Silas, einem Magier der Elemente! Und dies ist die Rune von Raithskar, ein Meister der schwarzen Kunst!"},
			OfferAnswer{Tag = "urak017PC", String = "Ich nehme die Rune des Raithskar (Hexer, Stufe 7)!", AnswerId = 29},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "UrimHasGivenSilas"}),
			Negated(IsNpcFlagFalse{Name = "UrimHasGivenRaithskar"}),
		},
		Actions = {
			Say{Tag = "urak016", String = "Dies ist die Rune von Silas, einem Magier der Elemente! Und dies ist die Rune von Raithskar, ein Meister der schwarzen Kunst!"},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak017", String = "Sie gehört Euch!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3576 , Amount = 1 , Flag = Give} , SetNpcFlagTrue{Name = "UrimHasGivenSilas"},
					SetPlayerFlagFalse{Name = "Q171SetDesicion"},
			TransferItem{TakeItem = 3556 , Amount = 1 , Flag = Take} , SetPlayerFlagFalse{Name = "Q171SetDesicion"} , QuestChangeState{QuestId = 167 , State = StateUnsolvable} , QuestChangeState{QuestId = 169 , State = StateUnsolvable} , QuestChangeState{QuestId = 170 , State = StateUnsolvable} , QuestChangeState{QuestId = 168 , State = StateUnsolvable} , QuestChangeState{QuestId = 166 , State = StateUnsolvable},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
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
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak018", String = "Nehmt!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3577 , Amount = 1 , Flag = Give} , 
							SetNpcFlagTrue{Name = "UrimHasGivenRaithskar"},
							SetPlayerFlagFalse{Name = "Q171SetDesicion"},
			TransferItem{TakeItem = 3556 , Amount = 1 , Flag = Take} , SetPlayerFlagFalse{Name = "Q171SetDesicion"} , QuestChangeState{QuestId = 167 , State = StateUnsolvable} , QuestChangeState{QuestId = 169 , State = StateUnsolvable} , QuestChangeState{QuestId = 170 , State = StateUnsolvable} , QuestChangeState{QuestId = 168 , State = StateUnsolvable} , QuestChangeState{QuestId = 166 , State = StateUnsolvable},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
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
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak019", String = "Die Herstellung ist schwierig! Ich werde einige Zeit dafür benötigen!"},
			Answer{Tag = "urak019PC", String = "Wie viel Zeit?", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urak020", String = "Genug, dass es sich für Euch lohnt, Euch anderswo herumzudrücken! Geht und zerstört irgendetwas - oder was Euresgleichen sonst so tut!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 176} , QuestBegin{QuestId = 181},
					TransferItem{TakeItem = 2544 , Amount = 4 , Flag = Take},
					TransferItem{TakeItem = 2200 , Amount = 2 , Flag = Take},
					TransferItem{TakeItem = 2540 , Amount = 1 , Flag = Take},
					TransferItem{TakeItem = 2541 , Amount = 1 , Flag = Take},
					TransferItem{TakeItem = 3556 , Amount = 1 , Flag = Take},
					SetGlobalTimeStamp{Name = "Q166WaitingForAdamant"},
					SetRewardFlagTrue{ Name = "Erdenklinge3"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(IsGlobalTimeElapsed{Name = "Q166WaitingForAdamant" , Seconds = 300}),
		},
		Actions = {
			Say{Tag = "urak022", String = "Noch nicht! Kehrt später wieder!"},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{38;
		Conditions = {
			IsGlobalTimeElapsed{Name = "Q166WaitingForAdamant" , Seconds = 300},
		},
		Actions = {
			Say{Tag = "urak021", String = "Das ist es in der Tat! Ein prachtvolles Stück, wie es nur ein Zwerg vollbringen kann! Hier, nehmt es!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 181} , QuestSolve{QuestId = 171} , 
				QuestSolve{QuestId = 166} ,
				TransferItem{GiveItem = 2535 , Amount = 1 , Flag = Give} ,
				SetRewardFlagTrue{ Name = "Erdenklinge4"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2536},
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak003PC", String = "Seid Ihr an diesem Metall interessiert?", AnswerId = 3},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak004PC", String = "Ich benötige rotes Adamantinum!", AnswerId = 7},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak010PC", String = "Sagt mir, wie ich an die Zutaten für das Adamantinum komme!", AnswerId = 16},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			IsPlayerFlagTrue{Name = "Q171SetDesicion"},
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak014PC", String = "Tauscht mir die Erdenklinge ein!", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			QuestState{QuestId = 176 , State = StateActive},
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak018PC", String = "Ich habe die Bestandteile des roten Adamantinums zusammen!", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			QuestState{QuestId = 181 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urak020PC", String = "Ist das Adamantinum fertig?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536}),
			Negated(UND(QuestState{QuestId = 170 , State = StateActive} , IsPlayerFlagFalse{Name = "Q171SetDesicion"})),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(IsPlayerFlagTrue{Name = "Q171SetDesicion"}),
			Negated(QuestState{QuestId = 176 , State = StateActive}),
			Negated(QuestState{QuestId = 181 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end