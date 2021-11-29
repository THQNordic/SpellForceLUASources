-->INFO: Craigh
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


------------ CUTSCENE -------------------------------------------------------

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = 359, Y = 186, Direction = 7, Conditions =
	{
		IsGlobalFlagTrue {Name = "UriasCraigIdleOn"},
	}
}
--!EDS ONIDLEGOHOME END


---------------- CUTSCENE --------------------------------------
SpawnOnlyWhen
{
	--X = 342, Y = 194,	Conditions =
	--X = 366, Y = 169,	Conditions =	
	X = 367, Y = 166,	Conditions =	
	{
		IsGlobalFlagTrue {Name = "UriasCraigSpawns", UpdateInterval = 10},
	}
}
----------------------------------------------------------------


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p25\n2910_Craigh.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagCraighKnown"},
		},
		Actions = {
			Say{Tag = "craighGodmark001", String = "Ihr m�sst weiter, ins Nachtfl�stertal! Ihr habt sp�ter noch genug Zeit, zu trauern!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"}),
			QuestState {QuestId = 390 , State = StateActive},
		},
		Actions = {
			Say{Tag = "craighGodmark002", String = "Was gibt es noch zu sagen?"},
			OfferAnswer{Tag = "craighGodmark002PC", String = "Was erwartet mich im Nachtfl�stertal?", AnswerId = 2},
			OfferAnswer{Tag = "craighGodmark005PC", String = "Ihr wart einst ein Waffenbruder Amras?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"}),
			Negated(QuestState {QuestId = 390 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "craighGodmark002", String = "Was gibt es noch zu sagen?"},
			OfferAnswer{Tag = "craighGodmark002PC", String = "Was erwartet mich im Nachtfl�stertal?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			Negated(UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"})),
			QuestState {QuestId = 390 , State = StateActive},
		},
		Actions = {
			Say{Tag = "craighGodmark002", String = "Was gibt es noch zu sagen?"},
			OfferAnswer{Tag = "craighGodmark005PC", String = "Ihr wart einst ein Waffenbruder Amras?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			Negated(UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"})),
			Negated(QuestState {QuestId = 390 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "craighGodmark002", String = "Was gibt es noch zu sagen?"},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"}),
			QuestState {QuestId = 390 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighGodmark002PC", String = "Was erwartet mich im Nachtfl�stertal?", AnswerId = 2},
			OfferAnswer{Tag = "craighGodmark005PC", String = "Ihr wart einst ein Waffenbruder Amras?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"}),
			Negated(QuestState {QuestId = 390 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighGodmark002PC", String = "Was erwartet mich im Nachtfl�stertal?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"})),
			QuestState {QuestId = 390 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighGodmark005PC", String = "Ihr wart einst ein Waffenbruder Amras?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"})),
			Negated(QuestState {QuestId = 390 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark003", String = "Meine Br�der werden sich dort im Kampf mit den Eisernen befinden! Ihr m�sst versuchen, die Stadt Shal zu erreichen! Sie liegt s�dwestlich des Portals!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark004", String = "Meidet die Speipflanzen! Es bedarf Jahre, um sich gegen ihr Gift abzuh�rten! F�r Euch ist es t�dlich! Ihr m�sst sie umgehen. Sie wachsen vor allem im Norden des Nachtfl�stertals!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark005", String = "Nehmt Euch au�erdem vor den Kithar in Acht! Ein Volk von Katzenmenschen, das vor Jahren aus Urgath in unser Land eingedrungen ist! Sie sind furchteinfl��ende, t�dliche Krieger, die keine Gnade kennen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "NightwisperAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"}),
			QuestState {QuestId = 390 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighGodmark002PC", String = "Was erwartet mich im Nachtfl�stertal?", AnswerId = 2},
			OfferAnswer{Tag = "craighGodmark005PC", String = "Ihr wart einst ein Waffenbruder Amras?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"}),
			Negated(QuestState {QuestId = 390 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighGodmark002PC", String = "Was erwartet mich im Nachtfl�stertal?", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"})),
			QuestState {QuestId = 390 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighGodmark005PC", String = "Ihr wart einst ein Waffenbruder Amras?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"})),
			Negated(QuestState {QuestId = 390 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark006", String = "Ihr wisst viel f�r einen einfachen Krieger..."},
			Answer{Tag = "craighGodmark006PC", String = "Tyrgar hat mir berichtet, Ihr h�ttet Amra bis zuletzt begleitet.", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark007", String = "Das habe ich...! Nur in seinem letzten Kampf konnte ich ihm nicht beistehen! Wir suchten Lea �berall und fanden schlie�lich eine Spur, die in die D�sterlande f�hrte!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark008", String = "Wochenlang irrten wir in der W�stenei umher! Amra war wie rasend! Weder Durst noch die Heere der Untoten konnten ihn aufhalten! Doch wir fanden nur Staub und Tod!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark009", String = "Bis wir eines Abends einen unheiligen Ort erreichten...! Der Wind sang klagend zwischen den Felsen. Und eine alte Festung trohnte �ber dem Land! Dort schlie�lich fand er uns...!"},
			Answer{Tag = "craighGodmark009PC", String = "Leas Gemahl?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark010", String = "Ja! Ein Magier mit dunkler Kapuze, und von unglaublicher Macht! Er schwebte aus dem Himmel herab... fegte uns beiseite wie Strohhalme im Wind! Geifernd verlangte er von Amra das Pfand der G�tter, jenen unseligen Ring!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark011", String = "Ich sah noch, wie Amra sich aufrichtete! Wie er der Magie trotzend auf den Zauberer zuschritt... dann l�schte ein Blitz mein Bewusstsein..."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark012", String = "Als ich erwachte, fand ich Amra tot neben mir! Das Pfand der G�tter war verschwunden. Ich begrub seinen Leichnam an jenem Ort! Mitsamt seinen Waffen und seiner R�stung, wie es einem Krieger geb�hrt!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark013", String = "Alles nur wegen eines nutzlosen Rings!"},
			Answer{Tag = "craighGodmark013PC", String = "Nutzlos? Das Pfand der G�tter muss doch unvorstellbar gro�e Macht besessen haben?", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark014", String = "Nein! Es war nur ein einfacher Ring aus Messing! Manchmal ist der Glaube der Leute st�rker als jede Magie! Versteht Ihr? Das Volk wollte einfach glauben, dass Lea gesegnet war! Sie selbst schufen diese Legende - mit ihrer eigenen Vorstellungskraft!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighGodmark015", String = "Dabei war das Pfand der G�tter nur ein wertloses St�ck Metall! Und ein Spiegel f�r die Habgier und die Dummheit der V�lker! Denn die G�tter verschenken kein Pfand an die Sterblichen!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"}),
			QuestState {QuestId = 390 , State = StateActive},
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighGodmark002PC", String = "Was erwartet mich im Nachtfl�stertal?", AnswerId = 2},
			OfferAnswer{Tag = "craighGodmark005PC", String = "Ihr wart einst ein Waffenbruder Amras?", AnswerId = 7},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"}),
			Negated(QuestState {QuestId = 390 , State = StateActive}),
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighGodmark002PC", String = "Was erwartet mich im Nachtfl�stertal?", AnswerId = 2},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"})),
			QuestState {QuestId = 390 , State = StateActive},
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighGodmark005PC", String = "Ihr wart einst ein Waffenbruder Amras?", AnswerId = 7},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 533 , State = StateActive} , IsNpcFlagFalse{Name = "NightwisperAsked"})),
			Negated(QuestState {QuestId = 390 , State = StateActive}),
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end