-->INFO: Tyrgar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{X = 107, Y = 164, Direction = 1}

-- ? setzen:
OnOneTimeEvent
{
	Actions = {
		SetDialogType{Type = SideQuest},
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n1396_Tyrgar.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagTyrgarKnown"},
		},
		Actions = {
			Say{Tag = "tyrgar001", String = "Welch eigentümlicher Besuch! Seid gegrüßt! Man nennt mich Tyrgar Brannon!"},
			Answer{Tag = "tyrgar001PC", String = "Ihr seid Fischer?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTyrgarKnown"}),
			QuestState{QuestId = 128 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "tyrgar003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTyrgarKnown"}),
			QuestState{QuestId = 128 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "tyrgar003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTyrgarKnown"}),
			QuestState{QuestId = 128 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "tyrgar003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTyrgarKnown"}),
			QuestState{QuestId = 128 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "tyrgar003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTyrgarKnown"}),
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "tyrgar003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTyrgarKnown"}),
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "tyrgar003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTyrgarKnown"}),
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "tyrgar003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTyrgarKnown"}),
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "tyrgar003", String = "Willkommen zurück!"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTyrgarKnown"},
			Say{Tag = "tyrgar002", String = "Das wäre ich, wenn diese elenden Goblins mir nicht alles wegfangen würden! So bin ich zum Netze flicken degradiert!"},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTyrgarKnown"},
			Say{Tag = "tyrgar002", String = "Das wäre ich, wenn diese elenden Goblins mir nicht alles wegfangen würden! So bin ich zum Netze flicken degradiert!"},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTyrgarKnown"},
			Say{Tag = "tyrgar002", String = "Das wäre ich, wenn diese elenden Goblins mir nicht alles wegfangen würden! So bin ich zum Netze flicken degradiert!"},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTyrgarKnown"},
			Say{Tag = "tyrgar002", String = "Das wäre ich, wenn diese elenden Goblins mir nicht alles wegfangen würden! So bin ich zum Netze flicken degradiert!"},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTyrgarKnown"},
			Say{Tag = "tyrgar002", String = "Das wäre ich, wenn diese elenden Goblins mir nicht alles wegfangen würden! So bin ich zum Netze flicken degradiert!"},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTyrgarKnown"},
			Say{Tag = "tyrgar002", String = "Das wäre ich, wenn diese elenden Goblins mir nicht alles wegfangen würden! So bin ich zum Netze flicken degradiert!"},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTyrgarKnown"},
			Say{Tag = "tyrgar002", String = "Das wäre ich, wenn diese elenden Goblins mir nicht alles wegfangen würden! So bin ich zum Netze flicken degradiert!"},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTyrgarKnown"},
			Say{Tag = "tyrgar002", String = "Das wäre ich, wenn diese elenden Goblins mir nicht alles wegfangen würden! So bin ich zum Netze flicken degradiert!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tyrgar004", String = "Wie ich schon sagte, die Goblins sind schuld! Dreckiges Pack! Sie fischen drüben vom Nordufer alles weg!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tyrgar005", String = "Und ich kann Sunder nicht beliefern! Dabei wartet er schon seit Tagen auf eine Ladung Fisch!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tyrgar006", String = "Könntet Ihr mir bei der Sache nicht behilflich sein? Erschlagt dieses grünhäutige Pack und bringt mir ihre Beute! Ihr seht aus wie jemand, dem so etwas Freude bereiten dürfte!"},
			Answer{Tag = "tyrgar006PC", String = "Das höre ich nicht zum ersten Mal...", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 128} , QuestBegin{QuestId = 129},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tyrgar007", String = "Danke! Kann ich Euch um einen weiteren Gefallen bitten?"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tyrgar008", String = "Könntet Ihr den Sack zu Sunder ins Dorf bringen, mit meinen besten Grüßen? Ich kann hier leider nicht weg! Schätze, es dürfte sich für Euch lohnen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 130} , QuestBegin{QuestId = 131} , SetPlayerFlagFalse{Name = "Q118HasBagandQuest"},
			Say{Tag = "tyrgar009", String = "Und nehmt das als Dank von mir! Hier, es müsste Euch von Nutzen sein!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "KleineFische1"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 128 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar003PC", String = "Kein guter Fang heute?", AnswerId = 2},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive}),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar006PCa", String = "Hier! Ein großer Sack Fische für euch... beinahe fangfrisch!", AnswerId = 7},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			QuestState {QuestId = 389, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tyrgar009PC", String = "Ihr wart einst Amras Waffenbruder?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 128 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2461}, QuestState{QuestId = 130 , State = StateActive})),
			Negated(QuestState {QuestId = 389, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tyrgar010", String = "Hmm... alte Zeiten, alte Wunden! Man sollte das auf sich beruhen lassen! Heute bin ich nur noch Fischer!"},
			Answer{Tag = "tyrgar010PC", String = "Was ist aus Amra geworden? Hat er Lea je gefunden?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tyrgar011", String = "Ich weiß es nicht! Er war damals wie von Sinnen! Wir haben ihn alle gewarnt... haben ihm gesagt, dass der Magier zu mächtig ist! Aber er wollte nicht hören!"},
			Answer{Tag = "tyrgar011PC", String = "Ihr habt Euch zerstritten?", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tyrgar012", String = "Ja! Die meisten von uns blieben hier! Nur Craig, der Dunkelelf, hat ihn begleitet! Sie zogen in die Düsterlande und verschwanden darin!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tyrgar013", String = "Aber soweit ich weiß, ist Craig noch am Leben! Ich hörte, er wäre wieder nach Osten gegangen, ins Land der Dunkelelfen jenseits des Wildland Passes!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 389}, QuestBegin {QuestId = 390},
						SetRewardFlagTrue{ Name = "AmraUndLea2Liannon2"},
			Say{Tag = "tyrgar014", String = "Wenn einer weiß, was aus Amra geworden ist, dann er! Viel Glück bei Eurer Suche! Ich muss mich jetzt wieder um meine Netze kümmern!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end