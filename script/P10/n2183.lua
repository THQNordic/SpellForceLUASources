-->INFO: Miria
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = SouthWest}
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
-- Source: C:\project\main\mission\dialoge\p10\n2183_Miria.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagMiriaKnown"},
		},
		Actions = {
			Say{Tag = "miria001", String = "Seid Ihr sicher, dass Ihr DAS bei DIESEM Wetter tragen wollt?"},
			Answer{Tag = "miria001PC", String = "Wovon sprecht Ihr? Meine Bekleidung ist praktischer Natur! Und das Wetter ist wahrhaftig mein geringstes Problem!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMiriaKnown"}),
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "miria003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMiriaKnown"}),
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "miria003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMiriaKnown"}),
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "miria003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMiriaKnown"}),
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "miria003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMiriaKnown"}),
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "miria003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMiriaKnown"}),
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "miria003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMiriaKnown"}),
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "miria003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMiriaKnown"}),
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "miria003", String = "Willkommen zurück!"},
		}}

	OnAnswer{1;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMiriaKnown"},
			Say{Tag = "miria002", String = "Ach verflixt! Keiner will sich mehr Zeit für ein richtiges Verkaufsgespräch nehmen! Ich bin Miria, Sams Frau! Schneidern ist mein Handwerk!"},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMiriaKnown"},
			Say{Tag = "miria002", String = "Ach verflixt! Keiner will sich mehr Zeit für ein richtiges Verkaufsgespräch nehmen! Ich bin Miria, Sams Frau! Schneidern ist mein Handwerk!"},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMiriaKnown"},
			Say{Tag = "miria002", String = "Ach verflixt! Keiner will sich mehr Zeit für ein richtiges Verkaufsgespräch nehmen! Ich bin Miria, Sams Frau! Schneidern ist mein Handwerk!"},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMiriaKnown"},
			Say{Tag = "miria002", String = "Ach verflixt! Keiner will sich mehr Zeit für ein richtiges Verkaufsgespräch nehmen! Ich bin Miria, Sams Frau! Schneidern ist mein Handwerk!"},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMiriaKnown"},
			Say{Tag = "miria002", String = "Ach verflixt! Keiner will sich mehr Zeit für ein richtiges Verkaufsgespräch nehmen! Ich bin Miria, Sams Frau! Schneidern ist mein Handwerk!"},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMiriaKnown"},
			Say{Tag = "miria002", String = "Ach verflixt! Keiner will sich mehr Zeit für ein richtiges Verkaufsgespräch nehmen! Ich bin Miria, Sams Frau! Schneidern ist mein Handwerk!"},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMiriaKnown"},
			Say{Tag = "miria002", String = "Ach verflixt! Keiner will sich mehr Zeit für ein richtiges Verkaufsgespräch nehmen! Ich bin Miria, Sams Frau! Schneidern ist mein Handwerk!"},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMiriaKnown"},
			Say{Tag = "miria002", String = "Ach verflixt! Keiner will sich mehr Zeit für ein richtiges Verkaufsgespräch nehmen! Ich bin Miria, Sams Frau! Schneidern ist mein Handwerk!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "miria004", String = "Für jemanden, der sie verarbeiten kann schon! Das ist ein seltenes Stück!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "miria005", String = "Ich wüsste jemanden in Graufurt, der sich mit dieser Art Seide auskennt! Ihr Name ist Tanara. Sie ist die beste Näherin in den Nordlanden!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q413MiriaTalkedAboutSilk"} , 
				QuestBegin{QuestId = 255}, QuestBegin{QuestId = 413},
				SetGlobalFlagTrue {Name = "TanaraKannSprechen"},
				SetRewardFlagTrue{ Name = "FeineStoffe2Miria"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{5;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{5;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "miria006", String = "Hmm... ein gutes, starkes Fell! Die Kraft des Monstrums wohnt noch in ihm!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2320, Amount = 3}),
		},
		Actions = {
			Say{Tag = "miria008", String = "Wenn Ihr mir noch drei Mähnen der Tiermenschen bringt, kann ich Euch ein Wams daraus fertigen!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{7;
		Conditions = {
			PlayerHasItem{ItemId = 2320, Amount = 3},
		},
		Actions = {
			Say{Tag = "miria007", String = "Gebt mir noch die drei Mähnen, die Ihr an Eurem Gürtel tragt, hinzu - dann will ich Euch ein Wams daraus fertigen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 481} , QuestSolve{QuestId = 480},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{9;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnAnswer{9;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{9;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 481} , QuestSolve{QuestId = 480},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnAnswer{11;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "miria009", String = "Gut, wartet einen Augenblick!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "miria010", String = "Die Urkraft dieser Bestien hallt noch wie ein Echo aus ihren Fellen! Das Wams soll Euch Kraft und Schutz gewähren!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "miria011", String = "Hier, nehmt!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3513 , Amount = 1 , Flag = Give} , 
			TransferItem{TakeItem = 2514 , Amount = 1 , Flag = Take} , 
			TransferItem{TakeItem = 2320 , Amount = 3 , Flag = Take} , 
			QuestSolve{QuestId = 481} , QuestSolve{QuestId = 479},
			SetRewardFlagTrue{ Name = "Reisserfell"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnAnswer{16;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"}),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria003PC", String = "Ist diese dunkle Seide hier wertvoll?", AnswerId = 2},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			QuestState{QuestId = 480 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria005PC", String = "Könnt Ihr etwas aus dem Fell des Reißers wirken?", AnswerId = 6},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "miria008PC", String = "Hier, nehmt das Fell und die drei Mähnen!", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2511} , IsPlayerFlagFalse{Name = "Q413MiriaTalkedAboutSilk"})),
			Negated(QuestState{QuestId = 480 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2320, Amount = 3} , QuestState{QuestId = 481 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end