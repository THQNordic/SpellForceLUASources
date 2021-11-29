-->INFO: Shazam
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = West}
--!EDS ONIDLEGOHOME END

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11000"},				
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11000_Shazam.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
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
			Say{Tag = "shazamP204_001", String = "Ah, Freund! Doch ein wenig Pflege gefällig?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "shazamP204_002", String = "Herzlich willkommen in Empyria, Fremder! Mögen Eure Wege stets mit Glück und Gold gepflastert sein!"},
			Answer{Tag = "", String = "", AnswerId = 4},
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
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_003", String = "Darf ich Euch zu einer kleinen Sitzung in meiner Barbierstube laden? Schneiden, kämmen, ölen für nur fünf Silber, ein Sonderpreis für Nordländer!"},
			Answer{Tag = "shazamP204_004PC", String = "Nun, ich ...", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_005", String = "Günstiger bekommt Ihr es hier, und ich wage sogar zu sagen, auf der ganzen Welt nicht! So etwas gibt es nur in Shazams Barbierstube! Was sagt Ihr?"},
			Answer{Tag = "shazamP204_006PC", String = "Wisst Ihr ...", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_007", String = "Natürlich, Ihr fragt Euch jetzt, wie macht er das? Ist das ein Trick? Gar Betrug? Doch ich, und viele zufriedene Kunden, sagen: Nein! Es ist der beste und billigste Haarschnitt in ganz Empyria!"},
			Answer{Tag = "shazamP204_008PC", String = "Also ...", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_009", String = "Ihr werdet es nicht bereuen, das schwöre ich bei den Grab meines Großvaters! Also, was soll es sein? Schneiden? Ein wenig Duftöl? Oder gar das Lockeneisen?"},
			Answer{Tag = "shazamP204_010PC", String = "Ein paar Fragen für den Anfang.", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shazamP204_011", String = "Oh! Schade. Nun, Ihr hättet ja ein wenig Pflege bitter nötig, wenn ich das mal anmerken darf. Aber gut, dann fragt ..."},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_013", String = "Ach dieser Kerl!"},
			Answer{Tag = "shazamP204_014PC", String = "Ihr kennt ihn?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_015", String = "Jeder Mensch, der aussieht, als hätte er sich seit der Konvokation nicht mehr gekämmt, bleibt mir zwangsläufig im Gedächtnis! Auch wenn das für mich nicht immer erfreulich ist!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_016", String = "Dieser Flink lungert meistens in der Gegend von Boros Weinstand herum, das ist nicht weit südlich von hier. Immer der Nase nach!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[9]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_018", String = "Oh, seit dem die Hazim im Umland so zänkisch geworden sind ist es hier geradezu gespenstisch ruhig ein Empyria!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_019", String = "Vor einem Jahr noch hättet Ihr hier kaum stehen können vor Händlern, Musikanten und Schaustellern! Aber das Leben in Empyria ist härter geworden."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_020", String = "Die Steuern des Kaisers sind hart und die Diebin Alyah und ihre Bande lässt uns kaum zur Ruhe kommen! Ich ahbe shcon sieben Schlösser an meiner Tür!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_021", String = "Jetzt berichtet man sich sogar davon, das kleine Mädchen spurlos verschwinden! Ach die schönen Jahre sind vorbei, ich sags Euch!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_022", String = "Ihr könnt wegen Auskünften auch ruhig Hauptmann Ishtar fragen, er ist ein recht freundlicher Zeitgenosse, zumindest für jemanden von der Stadtwache."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ShazamGirlInfoGiven"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[15]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_024", String = "Ja! Junge Mädchen, alleine acht schon diesen Mond! Die meisten von ihnen verschwanden in der Nähe des Palastes!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_025", String = "Irgend ein Monster haust in unserer Stadt! Oder zumindest ein sehr böser Mensch! Ich habe meiner kleinen Fatma verboten aus dem Haus zu gehen!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_026", String = "Jetzt weint sie den ganzen Tag! Sie spielt doch so gerne im Basar ... Aber ich würde es nicht überleben, wenn meiner Kleinen etwas zustösst!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[23]Abgeschaltet"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_028", String = "Ist das wahr? Wer? Wer ist das Monster?"},
			Answer{Tag = "shazamP204_029PC", String = "Eine Kreatur, halb Spinne, halb Mann, der wohl mit Vorliebe Mädchenfleisch verzehrt! Ich habe ihn erschlagen, aber das wahre Monster war der Kaiser selbst!", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_030", String = "Der Kaiser?"},
			Answer{Tag = "shazamP204_031PC", String = "Er hat der Kreatur die Mädchen zuführen lassen um sie bei Laune zu halten! Sie wurden wohl von des Kaisers eigenen Leuten entführt!", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_032", String = "Wie schrecklich! Das ... das kann ich nicht glauben! Unmöglich, Ihr müsst Euch irren!"},
			Answer{Tag = "shazamP204_033PC", String = "Das könnt Ihr halten wie Ihr wollt! Das Monster ist tot, so oder so, es ist vorbei!", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_034", String = "Dann kann meine Fatma also endlich wieder spielen gehen! Hach wird sie sich freuen! Danke, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			TransferXP {XP = 3000, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[27]Abgeschaltet"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_036", String = "Tja, wer hätte das gedacht, von der Diebin zu Kaiserin ... Kaum zu glauben, da bin ich von einer waschechten Prinzessin bestohlen worden!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_037", String = "Hm, gut, dass Ihr mich erinnert! Ich sollte eine Liste machen, von all den Sachen, die sie gestohlen hat! Die wird sie ja wohl jetzt nicht mehr brauchen!"},
			Answer{Tag = "shazamP204_038PC", String = "Seid vorsichtig, Alyah ist nicht eben zart besaitet!", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shazamP204_039", String = "Ihr meint sie macht mich eine Kopf kürzer? Herrje, herrje ... Nun ja, so wichtig sind diese Sachen ja wieder nicht ..."},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[32]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_012PC", String = "Ich suche jemand namens Flink McWinter.", AnswerId = 9},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_017PC", String = "Was gibt es besonderes in der Stadt?", AnswerId = 15, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_023PC", String = "Es werden Mädchen vermisst?", AnswerId = 23, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_027PC", String = "Ich weiß, wer die Mädchen gestohlen hat!", AnswerId = 27, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shazamP204_035PC", String = "Nun Shazam, wie ist das Leben mit einer neuen Kaisern?", AnswerId = 32, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( QuestState{QuestId = 813 , State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( Negated(QuestState{QuestId = 810 , State = StateUnknown}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[15]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagTrue{Name = "ShazamGirlInfoGiven"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND(QuestState{QuestId = 868, State = StateSolved} , IsGlobalFlagTrue{Name = "gf_204IshtarGirlsTold"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[27]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[32]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end