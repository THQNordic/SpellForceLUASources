-->INFO: BasarwacheSued
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)




OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 8830},
		SetGlobalFlagTrue {Name = "g_P204_BasarwacheSuedHomempoint"},	
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8830"},				
	}
}

OnIdleGoHome
{
X = _X, Y = _Y, Direction = South, Range = 0 , WalkRange = 2 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_BasarwacheSuedHomepoint"},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}

-- Wache wird agro, wenn Tor geöffnet wird und sie nicht abgelenkt wurde
OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterBasartorSued", Seconds = 2, UpdateInterval = 10}, 
	   FigureInRange{X = 273, Y = 227, NpcId = self , Range = 5},
	   IsGlobalFlagTrue {Name = "g_P204_BasartorSuedOffen"},
	   IsGlobalFlagTrue {Name = "g_P204_BasartorSuedBewacht"},
	   IsGlobalFlagFalse{Name = "g_P204_EmpyriaAlarmiert"},	   
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8830"},
		SetGlobalFlagTrue{Name = "g_P204_SuedtorAttacke"},
		Outcry { NpcId = 8830, Tag = "oca2soldierP204_001", String = "Was? Du wagst es? Na warte!" },
		ChangeRace{Race = 150, NpcId = self},
	}
}


--- Tor ist bewacht abschalten ---
OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalFlagTrue {Name = "g_P204_BasarwacheSuedNachHause"},  
	},

	Actions =
	{
		SetGlobalFlagFalse {Name = "g_P204_BasartorSuedBewacht"},	
	}
}


-- Wache geht nach hause wenn Spieler ihr den Brief gegeben hat
OnIdleGoHome
{
	X = 280, Y = 160, WalkMode = Run, Direction = North,

	Conditions =
	{
	   IsGlobalFlagTrue {Name = "g_P204_BasarwacheSuedNachHause"},
	},

	HomeActions =
	{
		SetGlobalFlagFalse {Name = "g_P204_BasarwacheSuedHomepoint"},	
		SetGlobalFlagTrue{Name = "g_P204_BasarwacheSuedZuhause"},
	}
}

-- Wache despwand wenn sie zuhause angekommen ist
Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_BasarwacheSuedZuhause", UpdateInterval = 10},
	}
}

--- Wache wird agro nach cutscene Alyah Dryade ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert"},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8830"},
	}
}


--- Wache wird lieb wenn Alyah Kaiserin ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_AlyahKaiserin"},
	},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}

------OutcryDummy Event für Scriptparser
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue{Name = "NeverTrue"}
			},
Actions = {
		Outcry { NpcId = 8830, Tag = "oca2gatekeeper_endoP204_001", String = "Das Schloss ist kaputt! Das Tor lässt sich nicht mehr schließen!"},	
		}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n8830_BasarwacheSued.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState {QuestId = 970, State = StateActive},
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_001", String = "Sie bringt mich um, sie bringt mich um  ... Habt Ihr die Fibel?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState {QuestId = 970, State = StateActive}),
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_002", String = "Kein ...(gähnt) ...Druchgang ..."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeeper_endoP204_003PC", String = "Ich habe eine Nachricht von Eurer Frau. Es geht da wohl um eine Fassade ...", AnswerId = 6},
			OfferAnswer{Tag = "gatekeeper_endoP204_011PC", String = "Ist das die Fibel?", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeeper_endoP204_003PC", String = "Ich habe eine Nachricht von Eurer Frau. Es geht da wohl um eine Fassade ...", AnswerId = 6},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeeper_endoP204_011PC", String = "Ist das die Fibel?", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeeper_endoP204_003PC", String = "Ich habe eine Nachricht von Eurer Frau. Es geht da wohl um eine Fassade ...", AnswerId = 6},
			OfferAnswer{Tag = "gatekeeper_endoP204_011PC", String = "Ist das die Fibel?", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeeper_endoP204_003PC", String = "Ich habe eine Nachricht von Eurer Frau. Es geht da wohl um eine Fassade ...", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeeper_endoP204_011PC", String = "Ist das die Fibel?", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_004", String = "Oje, oje ... Sie wird mich umbringen! Aber ich kann nicht nach Hause, unmöglich!"},
			Answer{Tag = "gatekeeper_endoP204_005PC", String = "Wegen Eurer Wache?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_006", String = "Ja! Nein, eher, weil ihre Hochzeitsfibel verloren habe! Ich sollte sie zum Goldschmied bringen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_007", String = "Ich habe sie meinen Kameraden gezeigt und da ist sie mir englitten! Sie rollte hier den Abhand hinunter zum See! Noch bevor ich etwas machen konnte, hatte sich einer der Kriehcer das Glitzerding geschnappt und ist damit in seine Höhle geflüchtet!"},
			Answer{Tag = "gatekeeper_endoP204_008PC", String = "Diese Fibel ist euch also hier rechts den Abhang hinuntergefallen?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_009", String = "Ja! Ich sie ja schon selbst geholt, aber die Kriecher da drin fressen einen mit Haut und Haaren! Aber ohne die Fibel bringt mich meine Frau um! Ich bin verloren, ich kann nie mehr heimkehren ..."},
			Answer{Tag = "gatekeeper_endoP204_010PC", String = "Das werden wir noch sehen.", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7219, Flag = Take}, QuestSolve {QuestId = 876}, QuestBegin {QuestId = 970},
			SetGlobalFlagTrue {Name = "g_P204_KroeteSpawnen"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[6]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeeper_endoP204_003PC", String = "Ich habe eine Nachricht von Eurer Frau. Es geht da wohl um eine Fassade ...", AnswerId = 6},
			OfferAnswer{Tag = "gatekeeper_endoP204_011PC", String = "Ist das die Fibel?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeeper_endoP204_003PC", String = "Ich habe eine Nachricht von Eurer Frau. Es geht da wohl um eine Fassade ...", AnswerId = 6},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeeper_endoP204_011PC", String = "Ist das die Fibel?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem{ItemId = 7303}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[14]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_012", String = "Ja! Das ist sie! Ich bin gerettet!"},
			Answer{Tag = "gatekeeper_endoP204_013PC", String = "Dann auf nach Hause!", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_014", String = "Hm, aber das Tor ... ach was, es ist ja verschlossen! So ein feiner Mensch wie Ihr bricht doch keine Tore auf ..."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_015", String = "Danke nochmals! Ihr seid wirklich ein Lebensretter!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_BasarwacheSuedNachHause"},
			QuestSolve {QuestId = 947}, SetGlobalFlagFalse {Name = "g_P204_BasartorSuedBewacht"}, SetRewardFlagTrue {Name = "Tor2DurchTrickGeoeffnet"},
			QuestSolve {QuestId = 970}, TransferItem {TakeItem = 7303, Flag = Take},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagBasarwacheSuedKnown"}),
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_017", String = "Kein Durchgang. Weitergehen, weitergehen ...(gähnt)"},
			Answer{Tag = "gatekeeper_endoP204_018PC", String = "Müde?", AnswerId = 21},
		}}

	OnAnswer{19;
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagBasarwacheSuedKnown"},
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_016", String = "Ich sagte doch (gähnt) ... kein Druchgang."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_endoP204_019", String = "Ach lasst mich zufrieden!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBasarwacheSuedKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end