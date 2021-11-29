-->INFO: Halicos
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END


--Dialogsteuerung

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
-- Source: C:\project\main\mission\dialoge\p21\n2793_Halicos.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagHalicosKnown"},
		},
		Actions = {
			Say{Tag = "halicos001", String = "Tretet näher, Runenkrieger! Ich habe schon viel von Euch gehört!"},
			Answer{Tag = "halicos001PC", String = "Ihr seid der Kommandant der roten Legion?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHalicosKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos004", String = "Fasst Euch kurz, mein Freund!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagHalicosKnown"},
			Say{Tag = "halicos002", String = "Der bin ich! Ihr habt unsere Siedler auf dem Gottwall gerettet!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos003", String = "Nun, ich bin Soldat, kein Barde! Reden liegt mir nicht! Dennoch - Danke für alles, was Ihr für uns getan habt!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferXP {XP = 4000 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos005", String = "Nun, Ihr könnt ihre Außenposten zerstören! Aber solange Briar selbst lebt, werden immer wieder neue Söldner kommen!"},
			Answer{Tag = "halicos005PC", String = "Es muss einen Weg geben!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos006", String = "Den gibt es auch - Ihr müsst ihr Hauptlager vernichten! Doch das wird kein Spaziergang! Briars Elite verteidigt es gegen jeden Ansturm!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos007", String = "Wenn man sie dort herauslocken könnte - dann wäre es vielleicht machbar! Aber Briar hält seine Leute im Zaum! Mit plumpen Tricks kommt Ihr da nicht weiter!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 273} , QuestBegin{QuestId = 274} , QuestSolve{QuestId = 272},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos008", String = "Ihr seid ein Segen der Götter, Freund! Endlich wird wieder Frieden einkehren! Die Versorgung unserer Siedlungen ist gesichert!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos009", String = "Ich habe versucht, etwas zu finden, das euch als Belohnung für Eure Mühen nützlich sein könnte! Hier!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
				SetNpcFlagTrue{Name = "RewardGiven"},
					TransferItem{GiveItem = 1031 , Flag = Give} ,
					TransferItem{GiveItem = 1023 , Flag = Give} ,
					TransferItem{GiveItem = 1291 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos010", String = "Das ist richtig! Ich war dort... mehr als acht Jahre ist das jetzt her! Ein grauenvolles Gemetzel... nur wenige Tage, bevor die Konvokation ausbrach..."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos011", String = "All die Wochen zuvor sind wir von Sieg zu Sieg geeilt! Ulathers Horden überrannten alles! Sie stampften Hokans graue Heere in den Staub!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos012", String = "Doch dann, als wir Kaith Halur schon in Brand gesetzt hatten, kamen sie..."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos013", String = "Schwarze Wesen! Albträume aus Stahl, übersät mit Klingen und Stacheln! Sie schritten durch unsere Reihen wie Schnitter durch reifes Korn!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos014", String = "Sie kannten weder Erbarmen noch Erschöpfung... ihre Schreie, ich werde das niemals in meinem Leben vergessen..."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos015", String = "Wir nannten sie die Eisernen! Und wäre die Konvokation nicht gekommen, sie hätten uns alle niedergemäht! Alle!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagFalse{Name = "INFOBladesAskHalicos"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos016", String = "Aye! Ich habe meinen Männern eine Belohnung für jedes Wolfszeichen versprochen, das sie mir bringen!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos017", String = "Briars Truppen haben verdammt viel Zulauf! Unsere einzige Hoffnung ist es, ihre Anführer auszuschalten! Deshalb die Belohnung..."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 266} , QuestBegin{QuestId = 267} , SetPlayerFlagFalse{Name = "Q266FirstTimeSign"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "halicos018", String = "Aye! Wenn ich meinen Männern Geld gebe, warum nicht auch Euch! Zeigt her..."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos019", String = "Ihr wollt mich wohl auf den Arm nehmen? Ihr habt keine Wolfszeichen!"},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2630 , Amount = 1 , Flag = Take} , TransferXP{XP = 200, Flag = Give} , TransferMoney{Silver = 20 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos020", String = "In Ordnung! Hier ist Eure Belohnung!"},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2630 , Amount = 1 , Flag = Take} , TransferXP{XP = 200, Flag = Give} , TransferMoney{Silver = 20 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos021", String = "In Ordnung! Hier ist Eure Belohnung!"},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2630 , Amount = 1 , Flag = Take} , TransferXP{XP = 200, Flag = Give} , TransferMoney{Silver = 20 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos022", String = "In Ordnung! Hier ist Eure Belohnung!"},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2630 , Amount = 1 , Flag = Take} , TransferXP{XP = 200, Flag = Give} , TransferMoney{Silver = 20 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos023", String = "In Ordnung! Hier ist Eure Belohnung!"},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2630 , Amount = 1 , Flag = Take} , TransferXP{XP = 200, Flag = Give} , TransferMoney{Silver = 20 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2630})),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos025", String = "Wartet, eins nach dem anderen! Ich nehme erst einmal diese fünf! Hier, Euer Geld!"},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos004PC", String = "Wie kann man die Briarwölfe ausschalten?", AnswerId = 5},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos007PC", String = "Die Wölfe sind vertrieben!", AnswerId = 10},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"},
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos009PC", String = "Cord erzählte mir, Ihr habt in der Schlacht von Kaith Halur gekämpft?", AnswerId = 14},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			IsPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos015PC", String = "Ihr habt Interesse an Wolfszeichen?", AnswerId = 22},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			IsPlayerFlagTrue{Name = "Q266HasSign"},
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
			OfferAnswer{Tag = "halicos017PC", String = "Gilt das Kopfgeld für Wolfszeichen auch für mich?", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2630}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 273 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
			Negated(IsPlayerFlagTrue{Name = "INFOBladesAskHalicos"}),
			Negated(IsPlayerFlagTrue{Name = "Q266FirstTimeSign"}),
			Negated(IsPlayerFlagTrue{Name = "Q266HasSign"}),
		},
		Actions = {
			Say{Tag = "halicos024", String = "In Ordnung! Hier ist Eure Belohnung!"},
		}}


	EndDefinition()
end