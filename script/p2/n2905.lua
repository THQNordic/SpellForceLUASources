-->INFO: Shadira
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 189, Y = 112,
	Conditions = {
		IsGlobalFlagTrue{Name = "Q66SpawnFreetraders", UpdateInterval = 20},
	},
}



--Dialogsteuerung
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
-- Source: C:\project\main\mission\dialoge\p2\n2905_Shadira.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagShadiraKnown"},
		},
		Actions = {
			Say{Tag = "shadira001", String = "Grüße! Wie es scheint, verdanken wir Euch unsere Rettung! In unser aller Namen möchte ich Euch von tiefstem Herzen danken! Viel länger hätte ich es in diesem stinkenden Loch auch nicht mehr ausgehalten!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShadiraKnown"}),
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "shadira004", String = "Guten Tag!"},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShadiraKnown"}),
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "shadira004", String = "Guten Tag!"},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShadiraKnown"}),
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "shadira004", String = "Guten Tag!"},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShadiraKnown"}),
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "shadira004", String = "Guten Tag!"},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShadiraKnown"}),
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "shadira004", String = "Guten Tag!"},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShadiraKnown"}),
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "shadira004", String = "Guten Tag!"},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShadiraKnown"}),
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "shadira004", String = "Guten Tag!"},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShadiraKnown"}),
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "shadira004", String = "Guten Tag!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira002", String = "Man nennt mich Shadira! Ich und meine Gefährten hier sind Freihändler! Wir reisen durch aller Herren Länder, kaufen und verkaufen, wo sich die Gelegenheit bietet!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShadiraKnown"},
			Say{Tag = "shadira003", String = "Wir waren mit einer Lieferung nach Liannon unterwegs... Doch ehe wir uns versahen, waren wir ausgeraubt und eingekerkert! Die Manieren in dieser Gegend lassen doch sehr zu wünschen übrig..."},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShadiraKnown"},
			Say{Tag = "shadira003", String = "Wir waren mit einer Lieferung nach Liannon unterwegs... Doch ehe wir uns versahen, waren wir ausgeraubt und eingekerkert! Die Manieren in dieser Gegend lassen doch sehr zu wünschen übrig..."},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShadiraKnown"},
			Say{Tag = "shadira003", String = "Wir waren mit einer Lieferung nach Liannon unterwegs... Doch ehe wir uns versahen, waren wir ausgeraubt und eingekerkert! Die Manieren in dieser Gegend lassen doch sehr zu wünschen übrig..."},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShadiraKnown"},
			Say{Tag = "shadira003", String = "Wir waren mit einer Lieferung nach Liannon unterwegs... Doch ehe wir uns versahen, waren wir ausgeraubt und eingekerkert! Die Manieren in dieser Gegend lassen doch sehr zu wünschen übrig..."},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShadiraKnown"},
			Say{Tag = "shadira003", String = "Wir waren mit einer Lieferung nach Liannon unterwegs... Doch ehe wir uns versahen, waren wir ausgeraubt und eingekerkert! Die Manieren in dieser Gegend lassen doch sehr zu wünschen übrig..."},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShadiraKnown"},
			Say{Tag = "shadira003", String = "Wir waren mit einer Lieferung nach Liannon unterwegs... Doch ehe wir uns versahen, waren wir ausgeraubt und eingekerkert! Die Manieren in dieser Gegend lassen doch sehr zu wünschen übrig..."},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShadiraKnown"},
			Say{Tag = "shadira003", String = "Wir waren mit einer Lieferung nach Liannon unterwegs... Doch ehe wir uns versahen, waren wir ausgeraubt und eingekerkert! Die Manieren in dieser Gegend lassen doch sehr zu wünschen übrig..."},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShadiraKnown"},
			Say{Tag = "shadira003", String = "Wir waren mit einer Lieferung nach Liannon unterwegs... Doch ehe wir uns versahen, waren wir ausgeraubt und eingekerkert! Die Manieren in dieser Gegend lassen doch sehr zu wünschen übrig..."},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira005", String = "Zwei Wagen voller Feuerstahl von den Halliten! Dazu noch feine Roben und Schmuck aus der Hohenmark! Hätte uns einen stattlichen Batzen Gold gebracht! Es ist ein Jammer..."},
			Answer{Tag = "shadira005PC", String = "Die Oger und Bestien scheinen sichtlich Gefallen an Euren Waren gefunden zu haben! Wie es scheint, ist Eure Ladung mittlerweile über das halbe Land verstreut!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira006", String = "Ja, sie schleppen die Güter als Trophäen mit sich herum! Ich möchte gar nicht wissen, was sie mit unseren Kostbarkeiten alles anstellen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionShipmentAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira007", String = "Ich bin eine Närrin! Ich war diejenige, die Jenquai überredete, eine Fahrt durch dieses entlegene Land zu unternehmen!"},
			Answer{Tag = "shadira007PC", String = "Aber Ihr werdet doch sicherlich gewusst haben, dass man in diesen Landen nicht mit Geld sondern der Waffe handelt?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira008", String = "Natürlich! Doch meine Hoffnung darauf, ein wenig Ariafrost zu finden, hat mich verblendet!"},
			Answer{Tag = "shadira008PC", String = "Ariafrost?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira009", String = "Reinstes Aria, die Tränen des Wissens! Fließendes Sternenlicht, das heilige Wasser der Erde! Erstarrt zu vollendeten Kristallen..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira010", String = "Ariafrost kommt nur an wenigen Stellen der Welt vor! Dort wo ihr Gesicht noch ursprünglich ist! Es ist wunderschön! Man sagt, selbst die Drachen erfreuten sich an seinem Glanz!"},
			Answer{Tag = "shadira010PC", String = "Nun, in diesem Land ist das Antlitz der Welt in der Tat sehr alt! Es mag sein, dass sich hier tatsächlich noch Ariafrost finden lässt!", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 1} ,  QuestBegin{QuestId = 71},
			Say{Tag = "shadira011", String = "Ja, das hatte ich gehofft! Doch nun ist alles dahin!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira012", String = "Ihr Götter! Es ist so... wunderschön! Wo habt Ihr es gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira013", String = "Nun... wie dem auch sei! Ihr besitzt es jetzt! Aber sagt ehrlich, was wollt Ihr damit anfangen?"},
			OfferAnswer{Tag = "shadira013PC", String = "Ihr könnt es haben, ich habe dafür keine Verwendung!", AnswerId = 15},
			OfferAnswer{Tag = "shadira015PC", String = "...", AnswerId = 18},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira014", String = "Ihr... gebt es mir? Einfach so?"},
			Answer{Tag = "shadira014PC", String = "Spart euch das Feilschen, Shadira! Ihr habt genug Verlust erlitten! Hier habt Ihr den Ariafrost!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 72} , QuestSolve{QuestId = 1} , TransferItem{TakeItem = 2155 , Amount = 1 , Flag = Take},
			SetRewardFlagTrue{ Name = "StaubDerSterne1"},
			Say{Tag = "shadira015", String = "Nein, Ihr beleidigt die Ehre einer Freihändlerin! Hier! Nehmt dies als bescheidene Geste im Austausch! Ihr seid ein wundervoller Mensch!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira016", String = "...Ich meine, es hat ja keinen eigentlichen Wert! Und Ihr wisst es nicht zu nutzen..."},
			OfferAnswer{Tag = "shadira016PC", String = "Ihr wollt es unbedingt haben, oder? Na gut, es sei das Eure!", AnswerId = 19},
			OfferAnswer{Tag = "shadira017PC", String = "...", AnswerId = 21},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 72} , QuestSolve{QuestId = 1} , TransferItem{TakeItem = 2155 , Amount = 1 , Flag = Take},
			SetRewardFlagTrue{ Name = "StaubDerSterne2"},
			Say{Tag = "shadira017", String = "Ah, ich sehe, wir verstehen uns! Selbstredend werde ich Euch dafür bezahlen! Es ist mir eine Ehre, mit Euch Geschäfte zu machen!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira018", String = "...Überlegt mal! Es wird nur Platz in Euren Taschen wegnehmen! Und Ihr werdet zweifellos niemanden finden, der etwas dafür geben wird... wie gesagt, es ist ja nur von ideellem Wert..."},
			OfferAnswer{Tag = "shadira018PC", String = "Lasst gut sein, verschont mich! Hier! Nehmt es schon!", AnswerId = 22},
			OfferAnswer{Tag = "shadira019PC", String = "Nun, es gibt sicherlich einige Magier in Graufurt, die...", AnswerId = 24},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 72} , QuestSolve{QuestId = 1} , TransferItem{TakeItem = 2155 , Amount = 1 , Flag = Take},
			SetRewardFlagTrue{ Name = "StaubDerSterne3"},
			Say{Tag = "shadira019", String = "Ah, ich dachte, schon Ihr würdet nie Vernunft annehmen! Hier, nehmt dies als Bezahlung! Mehr kann ich Euch leider nicht anbieten!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira020", String = "Ganz sicher nicht! Keiner wird... ach, was soll´s! Ihr wollt mich wohl unbedingt schröpfen, oder?"},
			Answer{Tag = "shadira020PC", String = "Ihr müsst wissen, ich habe das nicht gerade hinter einem Busch gefunden! Es befand sich im Besitz einer Kreatur, die...", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shadira021", String = "Schon gut, schon gut! Wer feilscht schon mit einem Runenkrieger? Ich habe hier etwas, das Euch sicher zufrieden stellen wird! Das sind einige meiner besten Ringe! Wenigstens die konnte ich vor den Ogern verbergen!"},
			OfferAnswer{Tag = "shadira021PC", String = "(Ring der Diebe)", AnswerId = 26},
			OfferAnswer{Tag = "shadira021PCa", String = "(Sternring)", AnswerId = 28},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 72} , QuestSolve{QuestId = 1} , TransferItem{TakeItem = 2155 , Amount = 1 , Flag = Take},
			SetPlayerFlagTrue{Name = "Q72GiveRingRouge"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{27;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{27;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{27;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 72} , QuestSolve{QuestId = 1} , TransferItem{TakeItem = 2155 , Amount = 1 , Flag = Take},
			SetPlayerFlagTrue{Name = "Q72GiveRingEveryone"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionShipmentAsked"},
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira004PC", String = "Was für eine Art Lieferung hattet Ihr bei Euch?", AnswerId = 3},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			QuestState{QuestId = 71 , State = StateUnknown},
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira006PC", String = "Warum der Umweg durch dieses Land?", AnswerId = 7},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			QuestState{QuestId = 72 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shadira011PC", String = "Ist dies hier der Ariafrost, von dem Ihr spracht?", AnswerId = 13},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionShipmentAsked"}),
			Negated(QuestState{QuestId = 71 , State = StateUnknown}),
			Negated(QuestState{QuestId = 72 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end