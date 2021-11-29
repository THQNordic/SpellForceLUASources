-->INFO: CelenFell
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn{WaitTime = 5}
OnIdleGoHome{X = 126, Y = 115, Direction = South}

--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
			IsNpcFlagTrue{Name = "HasMainquest" , UpdateInterval = 20},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			IsNpcFlagFalse{Name = "HasMainquest" , UpdateInterval = 20},
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
		SetDialogType{Type = SideQuest}
		}
}
-- Weg anch eloni aktiv
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 14, State = StateActive}
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}
-- Weg anch eloni fertig
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 14, State = StateSolved}
			},
Actions = {
		SetNpcFlagFalse{Name = "HasMainquest"},
		}
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n1392_CelenFell.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagCelenKnown" },
		},
		Actions = {
			Say{Tag = "celenFell001", String = "Beim Seelenfluss! Die Rune zieht wieder? Was sind das nur für Zeiten...?!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCelenKnown" }),
		},
		Actions = {
			Say{Tag = "celenFell002", String = "Ihr seid es! Was wollt Ihr?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCelenKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 14 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"},
			IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"},
			IsPlayerFlagTrue{Name = "Q16AttemptFailed"},
			PlayerHasItem{ItemId = 2004},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell002PC", String = "Ich muss Eloni erreichen, Leutnant Fell!", AnswerId = 4},
			OfferAnswer{Tag = "celenFell007PC", String = "Snarf wird Euch nicht mehr belästigen! Hier ist sein Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "celenFell011PC", String = "Die Männer sind tot!", AnswerId = 18},
			OfferAnswer{Tag = "celenFell013PC", String = "Ist dieser Steckbrief von Euch?", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"},
			IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"},
			IsPlayerFlagTrue{Name = "Q16AttemptFailed"},
			Negated(PlayerHasItem{ItemId = 2004}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell002PC", String = "Ich muss Eloni erreichen, Leutnant Fell!", AnswerId = 4},
			OfferAnswer{Tag = "celenFell007PC", String = "Snarf wird Euch nicht mehr belästigen! Hier ist sein Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "celenFell011PC", String = "Die Männer sind tot!", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"},
			IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"},
			Negated(IsPlayerFlagTrue{Name = "Q16AttemptFailed"}),
			PlayerHasItem{ItemId = 2004},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell002PC", String = "Ich muss Eloni erreichen, Leutnant Fell!", AnswerId = 4},
			OfferAnswer{Tag = "celenFell007PC", String = "Snarf wird Euch nicht mehr belästigen! Hier ist sein Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "celenFell013PC", String = "Ist dieser Steckbrief von Euch?", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"},
			IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"},
			Negated(IsPlayerFlagTrue{Name = "Q16AttemptFailed"}),
			Negated(PlayerHasItem{ItemId = 2004}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell002PC", String = "Ich muss Eloni erreichen, Leutnant Fell!", AnswerId = 4},
			OfferAnswer{Tag = "celenFell007PC", String = "Snarf wird Euch nicht mehr belästigen! Hier ist sein Dolch!", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"},
			Negated(IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"}),
			IsPlayerFlagTrue{Name = "Q16AttemptFailed"},
			PlayerHasItem{ItemId = 2004},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell002PC", String = "Ich muss Eloni erreichen, Leutnant Fell!", AnswerId = 4},
			OfferAnswer{Tag = "celenFell011PC", String = "Die Männer sind tot!", AnswerId = 18},
			OfferAnswer{Tag = "celenFell013PC", String = "Ist dieser Steckbrief von Euch?", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"},
			Negated(IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"}),
			IsPlayerFlagTrue{Name = "Q16AttemptFailed"},
			Negated(PlayerHasItem{ItemId = 2004}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell002PC", String = "Ich muss Eloni erreichen, Leutnant Fell!", AnswerId = 4},
			OfferAnswer{Tag = "celenFell011PC", String = "Die Männer sind tot!", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"},
			Negated(IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"}),
			Negated(IsPlayerFlagTrue{Name = "Q16AttemptFailed"}),
			PlayerHasItem{ItemId = 2004},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell002PC", String = "Ich muss Eloni erreichen, Leutnant Fell!", AnswerId = 4},
			OfferAnswer{Tag = "celenFell013PC", String = "Ist dieser Steckbrief von Euch?", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"},
			Negated(IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"}),
			Negated(IsPlayerFlagTrue{Name = "Q16AttemptFailed"}),
			Negated(PlayerHasItem{ItemId = 2004}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell002PC", String = "Ich muss Eloni erreichen, Leutnant Fell!", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"}),
			IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"},
			IsPlayerFlagTrue{Name = "Q16AttemptFailed"},
			PlayerHasItem{ItemId = 2004},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell007PC", String = "Snarf wird Euch nicht mehr belästigen! Hier ist sein Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "celenFell011PC", String = "Die Männer sind tot!", AnswerId = 18},
			OfferAnswer{Tag = "celenFell013PC", String = "Ist dieser Steckbrief von Euch?", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"}),
			IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"},
			IsPlayerFlagTrue{Name = "Q16AttemptFailed"},
			Negated(PlayerHasItem{ItemId = 2004}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell007PC", String = "Snarf wird Euch nicht mehr belästigen! Hier ist sein Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "celenFell011PC", String = "Die Männer sind tot!", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"}),
			IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"},
			Negated(IsPlayerFlagTrue{Name = "Q16AttemptFailed"}),
			PlayerHasItem{ItemId = 2004},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell007PC", String = "Snarf wird Euch nicht mehr belästigen! Hier ist sein Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "celenFell013PC", String = "Ist dieser Steckbrief von Euch?", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"}),
			IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"},
			Negated(IsPlayerFlagTrue{Name = "Q16AttemptFailed"}),
			Negated(PlayerHasItem{ItemId = 2004}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell007PC", String = "Snarf wird Euch nicht mehr belästigen! Hier ist sein Dolch!", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"}),
			Negated(IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"}),
			IsPlayerFlagTrue{Name = "Q16AttemptFailed"},
			PlayerHasItem{ItemId = 2004},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell011PC", String = "Die Männer sind tot!", AnswerId = 18},
			OfferAnswer{Tag = "celenFell013PC", String = "Ist dieser Steckbrief von Euch?", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"}),
			Negated(IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"}),
			IsPlayerFlagTrue{Name = "Q16AttemptFailed"},
			Negated(PlayerHasItem{ItemId = 2004}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell011PC", String = "Die Männer sind tot!", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"}),
			Negated(IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"}),
			Negated(IsPlayerFlagTrue{Name = "Q16AttemptFailed"}),
			PlayerHasItem{ItemId = 2004},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "celenFell013PC", String = "Ist dieser Steckbrief von Euch?", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 14 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "DialogeCelenFirstQuestion"}),
			Negated(IsPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"}),
			Negated(IsPlayerFlagTrue{Name = "Q16AttemptFailed"}),
			Negated(PlayerHasItem{ItemId = 2004}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell003", String = "Ich würde Euch nicht hindern! Doch der Pfad dorthin wird von Goblinhorden kontrolliert! Wir mussten die Torfeste nach Eloni aufgeben und haben sie verschlossen!"},
			Answer{Tag = "celenFell003PC", String = "Gibt es einen Weg, sie wieder zu öffnen?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell004", String = "Dazu müsste ich einige meiner Leute mit Euch zum Portal schicken! Nur sie können das Tor entriegeln!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell005", String = "Aber solange Snarf und seine Bande die Gegend hier unsicher machen, kann ich keinen einzigen Mann entbehren!"},
			Answer{Tag = "celenFell005PC", String = "Kann ich Euch bei diesem Problem helfen?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell006", String = "Nur zu! Bringt diesen Bastard zur Strecke! Snarf ist ein großer, hässlicher Goblin! Sein Lager liegt ein Stück westlich von hier! Geht an den drei Wachen vorbei und haltet Euch dann rechts!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell007", String = "Aber vielleicht solltet Ihr Euch zuerst Verstärkung an dem Monument hier hinter mir herbeirufen, Krieger! Snarf ist gefährlich! Wenn Ihr ihn besiegt habt, bringt mir seinen rostigen Dolch als Beweis!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 15},
			SetPlayerFlagTrue{Name = "Q14SpokenToCelenReward"},
			SetNpcFlagTrue{Name = "DialogeCelenFirstQuestion"},
			SetNpcFlagTrue{Name = "DialogeCelenSecondQuestion"},
			QuestBegin{QuestId = 65} , QuestBegin{QuestId = 63},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "WegNachEloni1Snarf"},
			Say{Tag = "celenFell008", String = "Ihr versteht Euer Handwerk, Runenkrieger! Damit habt Ihr uns viel Sorgen erspart! Nehmt dies als Entlohnung!"},
			Answer{Tag = "celenFell008PC", String = "Werdet Ihr nun die Torfeste öffnen lassen?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell009", String = "Ich gebe zu... Ihr habt bewiesen, dass Ihr etwas taugt! Ich gebe Euch einige Männer mit! Wartet hier, ich werde sie antreten lassen!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell010", String = "Und noch etwas: die Männer werden auf direktem Wege zur Torfeste marschieren! Gebt ihnen Geleitschutz und achtet darauf, dass sie lebend dort oben ankommen! Sie werden dann das Tor für Euch öffnen!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2336 , Flag = Take},
			SetPlayerFlagFalse{Name = "Q65HasDaggerAndQuest"},
			QuestSolve{QuestId = 64} , QuestSolve{QuestId = 63} , QuestSolve{QuestId = 65},
			
			QuestBegin{QuestId = 16},
			SetGlobalFlagTrue{Name = "PortalTroopsSpawning"}, 
			SetGlobalFlagFalse{Name = "PortalTroopsWalking"},
			ResetGlobalCounter{Name = "NumTroopsSpawned"},
			ResetGlobalCounter{Name = "NumTroopsDead"} ,
			SetPlayerFlagFalse{Name = "Q16AttemptFailed"},
			SetPlayerFlagTrue{Name = "Q16StartedBefore"},
			Say{Tag = "celenFell011", String = "Solltet Ihr scheitern, kehrt umgehend zu mir zurück! Viel Glück - Ihr werdet es brauchen!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell012", String = "Bei den Schlünden von Barga Gor! Das waren gute Leute, verdammt!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell013", String = "Doch so leicht gibt sich Leonidar nicht geschlagen! Ich schicke Euch eine weitere Gruppe mit! Seht zu, dass ihr diesmal bis zur Torfeste durchkommt!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 15},
			
			QuestBegin{QuestId = 16},
			SetGlobalFlagTrue{Name = "PortalTroopsSpawning"}, 
			SetGlobalFlagFalse{Name = "PortalTroopsWalking"},
			ResetGlobalCounter{Name = "NumTroopsSpawned"},
			ResetGlobalCounter{Name = "NumTroopsDead"} ,
			SetPlayerFlagFalse{Name = "Q16AttemptFailed"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell014", String = "Allerdings, das ist er! Habt Ihr diesen Halunken etwa erledigt?"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "celenFell015", String = "Ihr erstaunt mich immer mehr, Runenkrieger! Hier, Eure Belohnung! Ein Strauchdieb weniger, um den wir uns Sorgen machen müssen!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "Steckbrief"} , TransferItem{TakeItem = 2004 , Amount = 1 , Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end