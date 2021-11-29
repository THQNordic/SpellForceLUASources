-->INFO: Blinder
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
	SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10102"},
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = East, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = {	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10102_Blinder.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
		},
		Actions = {
			Say{Tag = "blindmonkP204_001", String = "Ah, Ihr erhellt diese Stätte mit Eurer Gegenwart!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 119},
		}}

	OnAnswer{1;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_003", String = "Oh, es gibt nur einen Gott hier in Empyria und das ist der Kaiser! Diese Stadt folgt noch dem alten Glauben des IMperiums der Drachentöter müsst ihr wissen."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_004", String = "Aber Empyira ist eine Stadt der Ungläubigen und kaum jemand schert sich um geistliche Dinge. Am wenigsten der Kaiser selbst!"},
			Answer{Tag = "blindmonkP204_005PC", String = "Warum jagt man diese Priester hier nicht fort?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_006", String = "Der Kaiser erlaubt uns zu bleiben, solange wir uns an dem Tempelbereich halten und ihn respektieren. Wir sind hier Heiler und Berater, wir kümmern uns um die Armen und Kranken."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_007", String = "Wir sind viel zu nützlich, als dass der Kaiser uns verteiben würde!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[2]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_009", String = "Es natürlich Tempel Aonirs und Tiaras! Ereon, Shanna und Hirin haben ebenfalls Schreine."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_010", String = "Sogar Zerbo hat einen Priester hier. Eine Gruppe Elfen predigt für Elen und einige Zwerge singen für Niethalf!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_011", String = "Ihr seht, alle der Wächtergötter sind vertereten!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_012", String = "Es gibt auch Gerüchte über einen geheimen Schrein der Renegaten irgendwo. Aber neimand betet heir offen Nor oder Zarach an!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[9]Abgeschaltet"},
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
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_014", String = "Mein liebstes Tagewerk! Über wen soll ich Euch berichten?"},
			OfferAnswer{Tag = "blindmonkP204_015PC", String = "Erzählt über die Wächter.", AnswerId = 17, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_066PC", String = "Erzählt über die Renegaten.", AnswerId = 86, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_088PC", String = "Lasst gut sein, reden wir ein anderes Mal.", AnswerId = 115},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_016", String = "Sie sind die Bewahrer unserer Welt. Sie sind das Geschlecht Aonirs, der unsere Welt geschaffen hat."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_017", String = "Er liess sie hier zurück, auf das sie die Welt vor dunklen Geschöpfen aus der großen Sternenweite beschützen sollten."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_018", String = "Aber er verbot ihnen, das Werk seiner Schöpfung zu verändern! Die Völker sollten selbst ihr Leben bestimmen, ob zum Guten oder zum Schlechten."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_019", String = "Über welchen der Wächter soll ich erzählen?"},
			OfferAnswer{Tag = "blindmonkP204_020PC", String = "Aonir.", AnswerId = 21, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_028PC", String = "Tiara.", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_032PC", String = "Hirin.", AnswerId = 37, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_037PC", String = "Shanna.", AnswerId = 44, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_043PC", String = "Elen.", AnswerId = 52, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_048PC", String = "Niethalf.", AnswerId = 59},
			OfferAnswer{Tag = "blindmonkP204_053PC", String = "Zerbo.", AnswerId = 66, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_059PC", String = "Ereon.", AnswerId = 74, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 82},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_021", String = "Aonir kam als Wanderer zu unserer Welt, die von dem Mächten der Urelemente in sinnlosem Wettstreit in ein Schlachtfeld verwandelt worden war."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_022", String = "Er warf die Elmente nieder zwang sie unter seinen Bann! Dann schuf er festen Boden aus der brodelnden See und sääte den Keim des Lebens darauf."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_023", String = "Aber er sah, das er nicht bleiben konnte, so riss er einen scharfen Fels aus dem land und stach sich in die Seite. Seni Sternenblut fiel herab und bildete die Gottsteine, die seit dem den Bann über die Elemente aufrecht erhalten."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_024", String = "Er rief seine Kinder über die Sternensee herbei und befahl ihnen über sein Werk zu wachen, während er Rast an fernen Gestaden suchte."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_025", String = "Doch er verbot ihnen seine Schöpfung zu verändern, denn die Völker sollten ihr Leben selbst bestimmen!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_026", String = "Dann verschwand er über die Sternensee und von da an bewachten seine Kinder unsere Welt vor allen Übeln, die aus dem endlosen Abgrund der Sterne nach uns greifen mögen."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_027", String = "Man nennt ihn auch Gottvater, den Bezwinger der Urelmente, den Reisenden über den Abgrund oder den Gott der Sterne. Sein Zeichen ist das Auge oder die Hand, manchmal auch ein Schiff über dem Sternengrund."},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_020PC", String = "Aonir.", AnswerId = 21, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_028PC", String = "Tiara.", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_032PC", String = "Hirin.", AnswerId = 37, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_037PC", String = "Shanna.", AnswerId = 44, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_043PC", String = "Elen.", AnswerId = 52, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_048PC", String = "Niethalf.", AnswerId = 59},
			OfferAnswer{Tag = "blindmonkP204_053PC", String = "Zerbo.", AnswerId = 66, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_059PC", String = "Ereon.", AnswerId = 74, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 82},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_029", String = "Aonir sprach:Tiara, ältestes meiner Kinder, dein Heim soll die Sonnenscheibe sein. Und dein flammender Tanz wird dem Leben das Licht und die Wärme geben, ohne die es vergeht. Mögest du nie ermüden."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_030", String = "Sie ist die Göttin der Sonne und der Stärke, die tanzende Flamme, die Himmelswächterin, auch dei Goldene oder die Strahlende genannt."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_031", String = "Sie gibt uns Hoffnung, innere Kraft, Lebensfreude und Leidenschaft. ihr Zeichen ist die goldgeschmückte Tänzerin, die Sonne oder ein goldener Kreis. Viele Krieger der Menschen beten sie an."},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_020PC", String = "Aonir.", AnswerId = 21, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_028PC", String = "Tiara.", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_032PC", String = "Hirin.", AnswerId = 37, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_037PC", String = "Shanna.", AnswerId = 44, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_043PC", String = "Elen.", AnswerId = 52, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_048PC", String = "Niethalf.", AnswerId = 59},
			OfferAnswer{Tag = "blindmonkP204_053PC", String = "Zerbo.", AnswerId = 66, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_059PC", String = "Ereon.", AnswerId = 74, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 82},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_033", String = "Aonir sprach: Hirin, du wirst der Bote sein, der ihnen Gutes und Schlechtes bringt. Die Seelen der Sterbenden sollst du in die Hallen des Todes geleiten und die der Geborenen in das Leben."},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_034", String = "Schlaf, Tod und Traum, aber auch Glück und Gesundheit werden deine Waren sein. Mögen sie dich fürchten und lieben zugleich."},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_035", String = "Hirin, der Reiter, ist der Bote und auch der Vollstrecker der Wächter. er steht für Wind und Sturm, für den Lauf der Zeit und die Vergänglichkeit, aber auch für die Freiheit!"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_036", String = "Man nennt ihn auch Seelenträger, Traumbote, Schalfbringer oder Nachtmahr. Seine Zeichen sind der einsame Reister, die Sanduhr, ein Rapphengst, der Wolf oder der Falke."},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_020PC", String = "Aonir.", AnswerId = 21, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_028PC", String = "Tiara.", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_032PC", String = "Hirin.", AnswerId = 37, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_037PC", String = "Shanna.", AnswerId = 44, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_043PC", String = "Elen.", AnswerId = 52, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_048PC", String = "Niethalf.", AnswerId = 59},
			OfferAnswer{Tag = "blindmonkP204_053PC", String = "Zerbo.", AnswerId = 66, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_059PC", String = "Ereon.", AnswerId = 74, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 82},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_038", String = "Aonir sprach: Shanna, meine Tochter, du wirst dieser Welt Güte und Sanftmut verleihen. Denn in Heim und Familie wird deine ruhige Hand ihnen den Weg weisen."},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_039", String = "Zeige ihnen die Freuden des Lebens, der Arbeit und des Beisammenseins."},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_040", String = "Shanna, die Weberin, steht für das Handwerk, die Familie, Heilung und Sanftheit. Sie ist die Göttin der Bauern und Arbeiter."},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_041", String = "So wie Tiara für die Leidenschaft steht, steht Shanna für die ruhige und besonnene Seite der Liebe. Man nennt sie auch die Mutter, die Gütige oder die sanfte Hand."},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_042", String = "Ihre Zeichen sind die Frau am Webstuhl, die Eiche, eine graue Katze oder die Taube."},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_020PC", String = "Aonir.", AnswerId = 21, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_028PC", String = "Tiara.", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_032PC", String = "Hirin.", AnswerId = 37, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_037PC", String = "Shanna.", AnswerId = 44, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_043PC", String = "Elen.", AnswerId = 52, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_048PC", String = "Niethalf.", AnswerId = 59},
			OfferAnswer{Tag = "blindmonkP204_053PC", String = "Zerbo.", AnswerId = 66, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_059PC", String = "Ereon.", AnswerId = 74, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 82},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_044", String = "Aonir sprach: Tochter Elen, wandle über das Land und schaue auf die Kraft des Lebens. Wache über den Reichtum der Natur, die Pflanzen und Wesen der Wälder."},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_045", String = "Gib ihnen das Wasser, welches sie zum Leben brauchen, und sei ihnen Freund und Beschützer."},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_046", String = "Elen, die Einsame, ist die Göttin der Elfen. Sie steht für die Natur, die Gewässer, den Nebel aber auch Rätsel und Weisheit."},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_047", String = "Man nennt sie auch Nebelweberin oder Regenfrau. ihre Zeichen sind die Frau am Webstuhl, die Eibe, eine weisse Wölfin oder die Eule."},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_020PC", String = "Aonir.", AnswerId = 21, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_028PC", String = "Tiara.", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_032PC", String = "Hirin.", AnswerId = 37, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_037PC", String = "Shanna.", AnswerId = 44, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_043PC", String = "Elen.", AnswerId = 52, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_048PC", String = "Niethalf.", AnswerId = 59},
			OfferAnswer{Tag = "blindmonkP204_053PC", String = "Zerbo.", AnswerId = 66, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_059PC", String = "Ereon.", AnswerId = 74, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 82},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_049", String = "Aonir sprach: Niethalf, deine Stärke soll sie formen und härten. Du wirst ihnen die Kraft verleihen zu überleben. Denn diese Welt wird nicht ohne Gefahren sein."},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_050", String = "Im Innern der Erde sollst du in deiner Schmiede ihre Seelen formen und ihnen Mut und Wahrhaftigkeit, Willenskraft und Stärke geben."},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_051", String = "Die Zwerge singen zu Neithalf, dem Schmied, in ihren steinernen Hallen. Aber auch viele Krieger der anderen Völker rufen ihn an, denn er steht für Härte, Stärke, Mut und Kriegskunst."},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_052", String = "Man nennt ihn auch den Weltschmied, den Roüfer und Former oder den Meister der ewigen Esse. Seine Zeichen sind der gepanzerte Krieger, Hammer udn Amboss, der Bär. Mondsilber und Stahl, sowie der Adler."},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_020PC", String = "Aonir.", AnswerId = 21, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_028PC", String = "Tiara.", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_032PC", String = "Hirin.", AnswerId = 37, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_037PC", String = "Shanna.", AnswerId = 44, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_043PC", String = "Elen.", AnswerId = 52, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_048PC", String = "Niethalf.", AnswerId = 59},
			OfferAnswer{Tag = "blindmonkP204_053PC", String = "Zerbo.", AnswerId = 66, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_059PC", String = "Ereon.", AnswerId = 74, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 82},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_054", String = "Aonir sprach: Doch werden da auch diejenigen sein, die schwach oder wankelmütig sind und deren Leben nicht dem Weg der Wahrhaftigkeit folgt."},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_055", String = "Auch sie sollen einen Fürsprecher haben und dieser wirst du sein, Zerbo. Deine List und Gewandtheit möge ihnen Hilfe und Beispiel sein."},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_056", String = "Zerbo der Fiedler ist der Gott der Diebe aber auch der Händler. Denn er steht für Gerissenheit Täuschung und Geschick, was in beiden Handwerken wichtig ist!"},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_057", String = "Seine Anhänger nennen ihn auch Lumpenfürst, Gaucckler im Spiegel oder den schlohweissen Narren."},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_058", String = "Seine Zeichen sind der Fiedler, der Fechter, ein schwarzer Kater, der weisshaarige Narr oder die Krähe."},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_020PC", String = "Aonir.", AnswerId = 21, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_028PC", String = "Tiara.", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_032PC", String = "Hirin.", AnswerId = 37, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_037PC", String = "Shanna.", AnswerId = 44, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_043PC", String = "Elen.", AnswerId = 52, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_048PC", String = "Niethalf.", AnswerId = 59},
			OfferAnswer{Tag = "blindmonkP204_053PC", String = "Zerbo.", AnswerId = 66, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_059PC", String = "Ereon.", AnswerId = 74, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 82},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_060", String = "Aonir sprach: Und zuletzt wirst du, Ereon, Bewahrer ihres Wissens sein. Denn Wissenschaft, Forschung und Magie schenken den Völkern eine bessere Zukunft."},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_061", String = "All ihr Wissen und Schaffen sollst du in einem Buche festhalten, auf dass ich am Ende der Zeit die Geschichte meines Werkes erfahren kann."},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_062", String = "Fast alle Magier waren früher Anhänger Ereons, bis der Zirkel die Magie verdarb. Ich habe das Gefühl, Eure Geschichte hat schon einen festen Platz in seinem Buche, Freund."},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_063", String = "Man nennt den Schreiber auch den Gerechten, den Bewahrer des Arkanen oder den Meister des einen Buches."},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_064", String = "Seine Zeichen sind der Schreiber, der Federkeil, das Buch mit dem Schwert, eine Waage, ein Mann in grauer Robe oder der Rabe."},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_020PC", String = "Aonir.", AnswerId = 21, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_028PC", String = "Tiara.", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_032PC", String = "Hirin.", AnswerId = 37, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_037PC", String = "Shanna.", AnswerId = 44, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_043PC", String = "Elen.", AnswerId = 52, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_048PC", String = "Niethalf.", AnswerId = 59},
			OfferAnswer{Tag = "blindmonkP204_053PC", String = "Zerbo.", AnswerId = 66, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_059PC", String = "Ereon.", AnswerId = 74, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_015PC", String = "Erzählt über die Wächter.", AnswerId = 17, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_066PC", String = "Erzählt über die Renegaten.", AnswerId = 86, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_088PC", String = "Lasst gut sein, reden wir ein anderes Mal.", AnswerId = 115},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_067", String = "Einst waren sie Wächter, denn auch sie sind Kinder Aonirs. Doch sie verachteten die Gesetze ihres Vaters!"},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_068", String = "Sie begannen die Welt nach ihrem Gutdünken zu verändern, schufen Völker und Länder wie es ihnen gefiel!"},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_069", String = "Sie trachteten nach Herrschafft und Verehrung! Doch die Wächter griffen schliesslich ein und vertrieben sie von unserer Welt!"},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_070", String = "Über welchen der Renegaten soll ich Euch berichten?"},
			OfferAnswer{Tag = "blindmonkP204_071PC", String = "Nor.", AnswerId = 90, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_078PC", String = "Zarach.", AnswerId = 99, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 111},
		}}

	OnAnswer{90;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_072", String = "Aonir sprach: Nor, mein Sohn, du sollst die Mondscheibe als dein Reich erhalten. Wache über die Nacht und den Schlaf, wenn Tiara weitergezogen ist. Dein Licht wird kalt sein, aber den Geschöpfen der Nacht ein willkommenes Zeichen."},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_073", String = "Nor war es, der den Wächterglauben auf unsere Welt brachte. Doch er war nicht zufrieden mit der Rolle, die ihm sein Vater zugedacht hatte, denn dei Völker fürchteten die Nacht."},
			Answer{Tag = "", String = "", AnswerId = 92},
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_074", String = "Er begehrte auf und versuchte sich die Achtung der Völker mit seiner Macht zu erzwingen. Es kam zum Streit mit seinen Geschwistern. Als Zarach sich abwandte, folgte ihm Nor aus dem Kreis der Wächter."},
			Answer{Tag = "", String = "", AnswerId = 93},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_075", String = "Zarach erschuf für Nor das Volk der Dunkelelfen, das ihm bis heute ergeben ist. Für uns steht er  für den Mond, die Nacht, die Kälte, den Schlaf und das Vergessen."},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_076", String = "Für die Norcaine ist er aber der Silberweber, Meister Silbersichel, der alleinig Sehende!"},
			Answer{Tag = "", String = "", AnswerId = 95},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_077", String = "Seine Zeichen sind der Mond, ein Säbelkämpfer, Mondsilber, Salzwasser, ein silbernes Netz und die allgegenwärtige, silberne Spinne."},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_071PC", String = "Nor.", AnswerId = 90, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_078PC", String = "Zarach.", AnswerId = 99, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 111},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_079", String = "Aonir sprach: Ulm, du sollst Bewahrer der Vielfalt und des Wechsels sein. Denn nichts soll ewig währen und Veränderung wird das Antlitz dieser Welt bestimmen. Deine Kraft möge den Blumen ihre Farben geben und den Kreaturen ihre Vielfalt."},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_080", String = "Doch Ulm war zornig, denn niemand liebt oder verehrte ihn, er blieb der ungerufene Gott, allgegenwärtig aber unbemerkt."},
			Answer{Tag = "", String = "", AnswerId = 101},
		}}

	OnAnswer{101;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_081", String = "Sein Zorn darüber wurde schließlich so gross, das er sich zu verändern begann! Aus dem wundervollen, vielfarbigen Baum, ind em er wohnte, wurde eine verzerrte schwarze Klaue aus eisenharten Ästen."},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{102;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_082", String = "Er beschloss, dass die Welt sich ihm zum wohlgefallen verändern sollte. Das es seine Aufgabe war das Alte hinfort zu fegen und neues, ihm gefälliges zu schaffen."},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{103;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_083", String = "Da niemand ihn anbeten wollte, entführte er Wesen der Völker in den dunklen Dschungel von Xu und quälte und verzerrte sie dort, bis sie seinen Wüsnchen entsprachen."},
			Answer{Tag = "", String = "", AnswerId = 104},
		}}

	OnAnswer{104;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_084", String = "So schuf er die Orks und die Trolle. Schließlich fromte er auch die Dunkelelfen, asl Geschenk für seinen Waffenbruder Nor."},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_085", String = "Seine letze Schöpfung waren dei Fial Darg, ein kleines Volk mächtiger Wesen, die als Statthalter der Renegaten zurückbleiben sollten, als diese von den Wächtern von Eo vertrieben wurden."},
			Answer{Tag = "", String = "", AnswerId = 106},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_086", String = "Die Orks heißen Zarach, denn so nennt sich Ulm jetzt, den Trinker des Weltenblutes, Eisenwurzel, Klaue oder den dunklen Sturm."},
			Answer{Tag = "", String = "", AnswerId = 107},
		}}

	OnAnswer{107;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_087", String = "Seine Zeichen sind eine fünfgliedrige Klaue, eine schwarze Wurzel, ein klauenförmiger, blattloser Baum, aber auch Eisen und Blut!"},
			Answer{Tag = "", String = "", AnswerId = 108},
		}}

	OnAnswer{108;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 109},
		}}

	OnAnswer{109;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 110},
		}}

	OnAnswer{110;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_071PC", String = "Nor.", AnswerId = 90, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_078PC", String = "Zarach.", AnswerId = 99, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_065PC", String = "Lasst gut sein.", AnswerId = 111},
		}}

	OnAnswer{111;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 112},
		}}

	OnAnswer{112;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 113},
		}}

	OnAnswer{113;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 114},
		}}

	OnAnswer{114;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_015PC", String = "Erzählt über die Wächter.", AnswerId = 17, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_066PC", String = "Erzählt über die Renegaten.", AnswerId = 86, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_088PC", String = "Lasst gut sein, reden wir ein anderes Mal.", AnswerId = 115},
		}}

	OnAnswer{115;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 116},
		}}

	OnAnswer{116;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 117},
		}}

	OnAnswer{117;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{118;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{118;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{118;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{118;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_002PC", String = "Wie steht es mit dem Glauben in dieser Stadt?", AnswerId = 2, Color = ColorDarkOrange},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_008PC", String = "Welche Priester findet man hier?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "blindmonkP204_013PC", String = "Erzählt mir mehr über die Götter.", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{118;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BlindMonkBeliefTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue {Name = "g_P204_BlindMonkGodsTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{119;
		Conditions = {
			QuestState {QuestId = 938, State = StateActive},
		},
		Actions = {
			Say{Tag = "blindmonkP204_089", String = "Bringt Lyrio den Wein! Ich bitte Euch!"},
			Answer{Tag = "", String = "", AnswerId = 120},
		}}

	OnAnswer{119;
		Conditions = {
			Negated(QuestState {QuestId = 938, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 121},
		}}

	OnAnswer{120;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{120;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{121;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_SpielerHatTraumweinzutaten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 126},
		}}

	OnAnswer{121;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_SpielerHatTraumweinzutaten"},
		},
		Actions = {
			Say{Tag = "blindmonkP204_090", String = "Habt Ihr die Zutaten für den Traumwein?"},
			Answer{Tag = "blindmonkP204_091PC", String = "Das habe ich. Hier!", AnswerId = 122},
		}}

	OnAnswer{122;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_092", String = "Ihr seid ein guter Mensch! Wartet, ich mische nur schnell den Wein ... Nicht zu viel von dem Staub ... "},
			Answer{Tag = "", String = "", AnswerId = 123},
		}}

	OnAnswer{123;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_093", String = "So! Nehmt den Traumwein und bringt ihn Lyrio! Vielleicht müsst Ihr ihn ein wenig überreden, ihn zu trinken, aber er wird Euch dankbar sein."},
			Answer{Tag = "", String = "", AnswerId = 124},
		}}

	OnAnswer{124;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7271, Flag = Give}, TransferItem {TakeItem = 7272, Amount = 1, Flag = Take}, TransferItem {TakeItem = 7220, Amount = 1, Flag = Take}, SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10102"},
			QuestSolve {QuestId = 879}, QuestBegin {QuestId = 938},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 125},
		}}

	OnAnswer{125;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{125;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{126;
		Conditions = {
			QuestState {QuestId = 879, State = StateActive},
		},
		Actions = {
			Say{Tag = "blindmonkP204_090", String = "Habt Ihr die Zutaten für den Traumwein?"},
			Answer{Tag = "blindmonkP204_094PC", String = "Noch nicht.", AnswerId = 127},
		}}

	OnAnswer{126;
		Conditions = {
			Negated(QuestState {QuestId = 879, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 130},
		}}

	OnAnswer{127;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_095", String = "Ich brauche Wein und Traumstaub! Dann kann ich Lyrio helfen!"},
			Answer{Tag = "blindmonkP204_096PC", String = "Ich werde sie Euch bringen!", AnswerId = 128},
		}}

	OnAnswer{128;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 129},
		}}

	OnAnswer{129;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{129;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{130;
		Conditions = {
			Negated(QuestState {QuestId = 880, State = StateActive}),
		},
		Actions = {
			Say{Tag = "blindmonkP204_105", String = "Seid willkommen zwischen den Tempeln Empyrias, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 137},
		}}

	OnAnswer{130;
		Conditions = {
			QuestState {QuestId = 880, State = StateActive},
		},
		Actions = {
			Say{Tag = "blindmonkP204_097", String = "Seid willkommen. Habt Ihr eine Frage zu den Tempeln der Wächter?"},
			Answer{Tag = "blindmonkP204_98PC", String = "Einer der Priester ... Lyrio, er spricht wie im Wahn! Was ist mit ihm?", AnswerId = 131},
		}}

	OnAnswer{131;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_99", String = "Ja, der arme Lyrio wird von grauenvollen Visionen geplagt! Er braucht Traumwein um seine Sinne zu beruhigen."},
			Answer{Tag = "blindmonkP204_100PC", String = "Traumwein?", AnswerId = 132},
		}}

	OnAnswer{132;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_101", String = "Das ist Rotwein mit etwas Traumstaub darin. Es würde Lyrios Geist klären, aber Traumstaub ist verboten und schwer zu bekommen."},
			Answer{Tag = "", String = "", AnswerId = 133},
		}}

	OnAnswer{133;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_102", String = "Da Ihr mich darauf ansprecht ... ich bitte Euch, helft einem blinden Mann und bringt mir etwas Traumstaub und Wein! Lyrio ist ein Freund und es schmerzt mich, ihn leiden zu sehen!"},
			Answer{Tag = "", String = "", AnswerId = 134},
		}}

	OnAnswer{134;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_103", String = "Den Wein könnt Ihr bei Borus, dem Weinhändler bekommen. Der Traumstaub wird unter der Hand verkauft, meist von Apothekern. Achtet auf Männer in grünen Roben!"},
			Answer{Tag = "", String = "", AnswerId = 135},
		}}

	OnAnswer{135;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blindmonkP204_104", String = "Ihr findet sie vor allem in dem schmutzigen Armenviertel vor der Stadt. Bringt mir etwas Traumstaub und eine Flasche Wein, dann können wir Lyrio helfen!"},
			Answer{Tag = "", String = "", AnswerId = 136},
		}}

	OnAnswer{136;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 879}, QuestSolve {QuestId = 880},
			SetGlobalFlagTrue {Name = "g_P204_GaunerDialogeAn"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{136;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{137;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 138},
		}}

	OnAnswer{138;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{138;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end