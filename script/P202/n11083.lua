-->INFO: Hirin
--Gott Hirin

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = {},
	Actions = 
	{
		ChangeRace {NpcId = self,  Race = 152},
	},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n11083_Hirin.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l�sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "Known"},
		},
		Actions = {
			Say{Tag = "hirinP202_001", String = "Lasst mich mit meiner Trauer alleine, Mensch!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "hirinP202_002", String = "Geht, Sterblicher! Lasst mich allein!"},
			Answer{Tag = "hirinP202_003PC", String = "Was tut Ihr hier?", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
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
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_004", String = "Ich ruhe mich aus. Ich bin meinen Weg gegangen vom Anbeginn der Zeit! Nie habe ich gerastet! Stets ritt ich mit der D�mmerung �ber die Welt, brachte Gutes und Schlechtes!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_005", String = "Nie wurde ich m�de! Bis heute! Nun raste ich hier, mag die Zeit f�r einen Moment ohne mich Ihr Werk tun!"},
			Answer{Tag = "hirinP202_006PC", String = "Ihr ... Ihr seid der Falke! Der einsame Reiter! Hirin, der Bote der G�tter!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "hirinP202_007", String = "Und zu dieser Stunde verfluche ich, was ich bin!"},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_009", String = "Dieser Ort ist voller Verzweiflung und Leid! Ich hatte gehofft, dass mir meine eigene Verzweiflung im Angesicht dieses Ortes gering erscheinen w�rde!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_010", String = "Aber es n�tzt nichts,  das Antlitz meines Bruders verfolgt mich auch hier!"},
			Answer{Tag = "hirinP202_011PC", String = "Euer Bruder?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_012", String = "Ereon, den Ihr den Gerechten nennt und ich einen Narren! Er hat die Regeln der G�tter verletzt! Er hat den Sterblichen, entgegen dem Willen unseres Vaters, Geheimnisse verk�ndet, die nur ein Gott wissen darf!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_013", String = "Daf�r wurde er vom Kreis der W�chterg�tter ausgestossen! Und es war meine Aufgabe ihn zu verfolgen und in die Verbannung zu jagen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_014", String = "Doch ein Sterblicher hat ihn in eine Falle gelockt, in den Knochentempel Zarachs! Wir W�chter haben dort keine Macht, denn dieser Tempel ist dem Renegaten Zarach geweiht!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_015", String = "Ereon wusste es! Und doch ist dieser vetr�umte Narr in den Tempel gegangen! Nun ist er Gefangener dieses Sterblichen! Mein Bruder! Ein Gott als Sklave eines Menschen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_016", String = "Ich h�tte ihn befreit! Wie ein Nachtmahr w�re ich �ber seinen Peiniger gekommen, oh ja, niemand h�lt meinen Bruder gefangen! Doch Ereon ist ausgestossen und die Regeln verbieten mir einzugreifen! Die Regeln! Die verdammten Regeln!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_017", String = "W�re nur unser Vater hier! Er w�sste was zu tun ist! Ich bin nur ein ratloses Kind, das den Regeln zu folgen hat!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "HirinBasicsTold"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[7]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_019", String = "Dieser Narr! Er hat dem Menschen Rohen eines seiner B�cher gegeben! Eines der B�cher aus den Hallen der G�tter!"},
			Answer{Tag = "hirinP202_020PC", String = "Das Buch der Konvokation!", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_021", String = "Richtig! Verkleidet als der Schriftgelehrte Darius hat er den Sterblichen geholfen, wo er konnte! Und gehofft wir, seine Geschwister w�rden diesen Regelverstoss nicht bemerken!"},
			Answer{Tag = "hirinP202_022PC", String = "Aber dadurch, das Rohen das Buch hatte wurde er bekehrt! Er hat viel Gutes getan! Diese Welt l�ge in Tr�mmern ohne das Buch!", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_023", String = "Dann w�re das der Lauf der Dinge gewesen! Ihr Sterblichen habt die Vernichtung selbst auf Euch herabgebracht! Aber mein vertr�umter Bruder glaubte Euch helfen zu m�ssen!"},
			Answer{Tag = "hirinP202_024PC", String = "Warum nennt Ihr Ereon einen Tr�umer? Steht er nicht f�r Wissen und Gerechtigkeit? Wie kann ein Gott des Rechts ein Tr�umer sein?", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_025", String = "Seht Euch diese Welt doch an, Mensch! Ich sehe jeden Tag den sinnlosen Tod Tausender! Tode durch Willk�r! Durch Zufall! Durch Wahnsinn!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_026", String = "Keine Heldentat bewahrt Euch davor, als Betler im Stra�engraben zu verenden, wenn Ihr erlahmt oder erblindet! Es gibt keine Gerechtigkeit! Nur Grausamkeit!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_027", String = "Also, ich frage Euch, was sollte ein Gott der Gerechtigkeit anderes sein,als ein hoffnungsloser Tr�umer?"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[18]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_029", String = "Ich spreche zwar zu Euch, Mensch, aber ich habe die Regeln nicht vergessen!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_030", String = "So gern ich Euch auch zum Gef�ngnis meines Bruders f�hren w�rde, Euch vielleicht sogar anflehen w�rde, ihn zu befreien, die Regeln verbieten es!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_031", String = "Ihr m�sst diesen Weg alleine gehen, ich kann Euch nicht helfen! Aber ich werde jeden Eurer Schritte mit Hoffnung verfolgen!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[27]Abgeschaltet"},
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
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_008PC", String = "Was tut Ihr an diesem Ort, Falke?", AnswerId = 7, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_018PC", String = "Was hat Ereon getan, dass ihr ihn ausgestossen habt?", AnswerId = 18, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_028PC", String = "Wer h�lt Ereon gefangen?", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hirinP202_032PC", String = "Ereon ist frei!", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[18]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "HirinBasicsTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue{Name = "g_213EreonFree"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_033", String = "Ist es war? Ich konnte Eure Schrittte im Dschungel nicht mehr verfolgen ... dann ist er gerettet?"},
			Answer{Tag = "hirinP202_034PC", String = "Er ist schwach, aber er wird seinen Platz bald wieder einnehmen.", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_035", String = "Ihr habt unglaubliches vollbracht, Mensch! Nehmt den Dank Eurer G�tter! Ihr handelt, wo wir nur unt�tig zusehen k�nnen."},
			Answer{Tag = "hirinP202_036PC", String = "Bleibt nicht unt�tig! Nehmt Ereon wieder in Eure Mitte auf! Und setzt die Dryade frei, ohne deren Hilfe all dies nicht geschehen w�re!", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_037", String = "Ich werde meinen Geschwistern davon berichten! Vielleicht sollten die Regeln neu geschreiben werden!"},
			Answer{Tag = "hirinP202_038PC", String = "Und vielleicht stehen auch einem Gott ein paar Tr�ume nicht schlecht zu Gesicht!", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hirinP202_039", String = "Ha! Ihr gefallt mir, Mensch! Schade, das ich Euch jetzt verlassen muss ... aber ich glaube wir werden uns bald wiedersehen."},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "TBD_InsertHirinDespawnStuffHere"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[33]Abgeschaltet"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end