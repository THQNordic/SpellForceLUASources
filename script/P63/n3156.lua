-->INFO: Castagir
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--Dialogsteuerung
OnOneTimeEvent
{
Conditions = {},
Actions = {
		RemoveDialog{}
		}
}
--
OnOneTimeEvent
{
Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateUnknown})
			},
Actions = {
		EnableDialog{Important = FALSE},
		SetDialogType{Type = SideQuest}
		}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n3156_Castagir.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagCastagirKnown"},
		},
		Actions = {
			Say{Tag = "castagir001", String = "Seid gegrüßt!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagCastagirKnown"}),
		},
		Actions = {
			Say{Tag = "castagir003", String = "Sie sind hier... sie sind... hier! Aonir sende dein Licht... vertreibe die Schatten..."},
			Answer{Tag = "castagir003PC", String = "Ihr solltet einen Heiler aufsuchen, Freund! Ihr seid krank!", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir004", String = "Nein! Nicht krank... wissend... und dennoch blind! Ich sehe nicht die Schatten unter dem Licht! Sehe nicht das Grauen, das zu mir hinauf kriecht..."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCastagirKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir005", String = "Verzeiht, ich bin Castagir! Ein Adept der dunklen Künste. Glaubt mir, ich kenne die Geschöpfe des Lichts und ich weiß um die Kreaturen der Finsternis!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir006", String = "Doch in den Schatten lauert eine Macht, die grausamer ist, als alle Wesen, die diese Welt jemals hervorbringen wird!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir007", String = "Dort wartet etwas... Fremdes, Unheimliches! Nicht sichtbar für das Auge... es sei denn, wenn sie töten! Dann erblickt man ihre dunklen Schemen! Und es ist das letzte, was man sieht...! Nur wenige wissen von ihnen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir009", String = "Mein Meister starb durch ihre Hand! Ich muss ihr Geheimnis ergründen, ich habe keine andere Wahl! Vielleicht sind sie ja schon hier... zwischen uns... lauernd..."},
			Answer{Tag = "castagir009PC", String = "Gibt es keinen Zauber, der Euch schützen kann?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir010", String = "Nein! Kein Fluch kann sie schrecken! Der Ring... der Ring ist der einzige Weg! Mein Meister erzählte mir von ihm, bevor er starb! Doch er nahm sein Wissen mit ins Grab..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 417}, QuestBegin{QuestId = 423},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir011", String = "Unfassbar! Der Schattenring! Er sieht tatsächlich so aus, wie mein Meister ihn beschrieben hat..."},
			Answer{Tag = "castagir011PC", String = "Aber es ist nur ein gewöhnlicher Ring aus Silber! Von ihm geht keine Kraft aus!", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir012", String = "Ihr habt Recht! Ihm scheint keine Macht innezuwohnen! Und doch sieht er aus wie der Schattenring! Ich muss Rigour befragen!"},
			Answer{Tag = "castagir012PC", String = "Rigour?", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir013", String = "Einer der wenigen, die es außer mir wagten, die Schatten zu studieren! Er war auf der Jagd nach einem abtrünnigen Nekromanten! Dann verschwand er, irgendwo in den Düsterlanden..."},
			Answer{Tag = "castagir013PC", String = "Die Düsterlande? Dorthin wird mich mein Weg wohl ohnehin führen! Ich nehme den Ring mit! Wenn ich Rigour finde, werde ich ihn dazu befragen!", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir014", String = "Tut das! Ich hoffe, Ihr findet ihn! Ich spüre, wie meine Zeit verrinnt!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 423}, QuestBegin{QuestId = 418},
				SetRewardFlagTrue{ Name = "Schattenwelt1Castagir"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir015", String = "Ihr habt... ihr Geheimnis entschlüsselt?"},
			Answer{Tag = "castagir015PC", String = "Dieser Kristallsplitter ist ihr Ursprung - und die Quelle ihrer Macht! Aber ich fürchte, er ist nicht der einzige seiner Art! Seht doch... er sieht aus wie ein Bruchstück... von etwas Größerem!", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir016", String = "Zeigt her... tatsächlich...! Ich werde den Splitter untersuchen! Er ist unsere einzige Spur! Der einzige Weg, uns auf das nächste Erscheinen der Schatten vorzubereiten!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir017", String = "Nehmt dies als Zeichen des Dankes! Kehrt später noch einmal zu mir zurück, wenn Ihr könnt! Vielleicht haben meine Forschungen bis dahin Früchte getragen!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 530}, 
					QuestSolve{QuestId = 417},
					TransferItem{TakeItem = 3200 , Flag = Take},
					SetNpcFlagTrue{Name = "ResearchStarted"} , 
					SetGlobalTimeStamp{Name = "CastagirResearchTime"},
					SetRewardFlagTrue{ Name = "Schattenwelt3Manifest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
			IsGlobalTimeElapsed{Name = "CastagirResearchTime" , Seconds = 300},
		},
		Actions = {
			Say{Tag = "castagir018", String = "Ich habe einen Weg gefunden, die Macht der Schatten zu kontrollieren! Reines Silber scheint sie zu schrecken! Seht her!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(IsGlobalTimeElapsed{Name = "CastagirResearchTime" , Seconds = 300}),
		},
		Actions = {
			Say{Tag = "castagir021", String = "Noch habe ich nichts herausfinden können! Kommt später wieder!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir019", String = "Die Kräfte des Schattenkristalls werden von diesem Silbergürtel hier beherrscht! So lässt sich ihre Macht kontrollieren!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagir020", String = "Nehmt den Gürtel und tragt ihn! So werden die Schatten Euch zu Diensten sein und Euch wie eine Rüstung schützen! Er gebührt Euch!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "SchattenweltShadowpulse"} , 
					TransferItem{GiveItem = 3511 , Amount = 1 , Flag = Give},
					RemoveDialog{NpcId = 3156},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 417 , State = StateUnknown},
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir004PC", String = "Erzählt der Reihe nach!", AnswerId = 5},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive}),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir010PC", String = "Ist es vielleicht dieser Ring, den Ihr meint?", AnswerId = 12},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			QuestState{QuestId = 530 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir014PC", String = "Die Schatten sind vertrieben... vorerst!", AnswerId = 18},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			IsNpcFlagTrue{Name = "ResearchStarted"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagir017PC", String = "Wie stehen Eure Forschungen?", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 417 , State = StateUnknown}),
			Negated(UND(PlayerHasItem{ItemId = 2390}, QuestState{QuestId = 423 , State = StateActive})),
			Negated(QuestState{QuestId = 530 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "ResearchStarted"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end