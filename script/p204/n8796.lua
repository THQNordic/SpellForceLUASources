-->INFO: Lyrio
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


--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = South}
--!EDS ONIDLEGOHOME END



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n8796_Lyrio.txt


	

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
			Say{Tag = "lyrioP204_001", String = "Ereon sei mit Euch!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{1;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_003", String = "Ich ... habe von Euch geträumt!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_004", String = "Ihr trugt Ereons Buch zu einem verdorrten Baum auf einem Berg von Knochen! Ereon braucht Euch, Runenkrieger! Und Ihr habt eine wichtige Rolle zu spielen in dem was kommt!"},
			Answer{Tag = "lyrioP204_005PC", String = "Habt Ihr in dem Traum auch gesehen, wie ich in den Palast gekommen bin?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_006", String = "Nein! Aber dabei kann ich Euch vielleicht mit weltlichen Dingen helfen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_007", String = "Nehmt diese Robe hier, sie weist Euch als einen Mönch Ereons und Rechtsbetreuer aus!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_008", String = "Legt diese Robe an und sagt Shamziro, hier am westlichen Tor in den Basar, das Ihr ein Möch Ereons seid, der Beistand geben möchte."},
			Answer{Tag = "lyrioP204_009PC", String = "Warum ausgerechnet Shamziro?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_010", String = "Zum einen hat Shamziro ein schlechtes Gedächtnis, er würde Euch nicht wiedererkennen, selbst wenn Ihr zehnmal dort wart. Zum anderen habe ich ihm einmal selbst Beistand gegeben und ihn vor dem Kerker bewahrt."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_011", String = "Seit dem ist er ein Freund unseres Ordens. Er wird Euch durchlassen, er ist ein guter Kerl. Denkt nur daran, die Robe auch anzuziehen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 4632, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[2]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_013", String = "Etwas schreckliches muss geschehen sein! Für gewöhnlich verbringe ich meine Tage im Zwiegespräch mit Ereon, lausche seiner Weisheit und berichte ihm von den Taten der Völker."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_014", String = "Aber seit einigen Wochen ist dort, wo früher die Gegenwart meines Gottes war, nur noch Schmerz! Ich sehe Finsternis ... einen Tempel ... und ich bin ... so hilflos."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_015", String = "Ich werde mir mehr Traumwein beschaffen! Diese Visionen sind unerträglich!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_016", String = "Ereon will mir damit irgend etwas mitteilen ... aber ich verstehe es nicht! Es ist zum Verzweifeln!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[12]Abgeschaltet"},
			Say{Tag = "", String = ""},
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
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_018", String = "Wir sind die Priester Ereons, des Gottes der Weisheit und Gerechtigkeit. Wir sind Bewahrer alter Schriften, Richter und Rechtsgelehrte."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_019", String = "Hier, in dieser Stadt der Gottlosen, verkennt man unsere Dienste. Aber wann immer ein Angeklagter zur arm ist, um sich einen Advokaten zu leisten, so ruft man uns hinzu, um ihm Beistand in Rechtsdingen zu geben."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_020", String = "Unser Ordensleben ist bescheiden, wir widmen uns meist der Studien des Rechts und der Geschichte. Aber auch die Geheimnisse der Magie sind uns nicht fremd."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_021", String = "Vor der Herrschaft des Zirkels waren die meisten Magier Anhänger Ereons. Nun ist unser Glaube fast vergessen."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_022", String = "Dabei haben wir so viel zu geben! Und Ereon ist anders als die meisten Götter des Wächterkreises! Er spricht oft zu uns, gibt uns neue Wege zu denken und er hat stets ein Ohr für die Völker!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_023", String = "Aber wer will schon Gerechtigkeit, wenn man sich mit Feuer und Schwert die Welt gefügig machen kann."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[19]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_025", String = "Wenn ich es nur noch genau wüsste! Ich errinnere mich an eine dunkle Ebene, Blitze fuhren hernieder. Überall lagen Gebeine Erschlagener!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_026", String = "Nein! Nein, es war ein Meer! Ein wogendes Meer aus Knochen, über das ich schritt, knirschend und krachend wie eine gewaltige Mühle!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_027", String = "Und es wusch Bäume und Felsen, Mauern und Städte fort, riss sie mit sich und zermalmte sie zu Staub!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_028", String = "Doch ich schritt unberührt von all dem über die Wogen aus Gebein ... bis ich in der Ferne einen Berg erblickte!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_029", String = "Es war ein Berg aus Knochen! Von seiner Spitze strömten die Gebeine herab wie eine Sturzsee und ihr Donnern und Mahlen drohte meinen Geist zu zerschmettern!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_030", String = "Doch ich lief weiter ... weiter auf den Quell des Schreckens zu!  Und an der Spitze erblickte ich zwölf Gargoylen aus deren steinernen Mündern sich der Strom der Gebeine ergoss!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_031", String = "Und in ihrer Mitte saß eine dreizehnte! Eine von reinem Gold! Und in ihren Klauen lag ein Rabe, dessen Augen weinten Tränen von Blut!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_032", String = "Dann sah ich Euch, wie ihr mit einem Buch in der Hand gegen den gewaltigen Strom der Knochen Euch den Berg hinaufkämpftet!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_033", String = "Und Euer Ziel schien ein Baum zu sein ...ein einziger verdorrter Baum, der dem Strom der Knochen als letzer noch Trutz bot!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_034", String = "Doch dort oben, klammernd an den Baum, wartete ein zweiter Krieger, der Euch helfend die Hand entgegen streckte!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_035", String = "Dann wandte die goldenen Gargoyle den Blick zu mir ... und für einen Moment blickte ich in etwas Großes, etwas Göttliches ... aber auch Grausames!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_036", String = "Seit dem verfolgen mich diese Bilder ... was sie bedeuten? Ich weiß es nicht."},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_037", String = "Aber Ihr habt eine große Aufgabe vor Euch. Möge Ereon Euch schützen, wohin immer Euch diese Aufgabe auch führt."},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[28]Abgeschaltet"},
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
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{44;
		Conditions = {
			PlayerHasItem{ItemId = 7271},
		},
		Actions = {
			Say{Tag = "lyrioP204_038", String = "Ketten ... keine Kraft ... die Maske! Die Maske in der Finsternis!"},
			OfferAnswer{Tag = "lyrioP204_039PC", String = "Nehmt diesen Traumwein, er wird Euch Frieden geben.", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7271}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_040", String = "Nicht den Trank ... der Trank des Lebens! Brüder, Schwestern! Helft!"},
			Answer{Tag = "lyrioP204_041PC", String = "Es ist nur etwas Traumwein, Priester. Trinkt.", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_042", String = "(Lyrio trinkt den Traumwein.)"},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_043", String = "Ah! Die Schmerzen lassen nach! Mein Geist klärt sich! Ah, Wohltat! Wer seid Ihr, Freund?"},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7271, Flag = Take}, SetRewardFlagTrue{Name = "LyrioQuestGeloest"},
			QuestSolve {QuestId = 878}, QuestSolve {QuestId = 938}, SetGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
			Say{Tag = "", String = ""},
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
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_002PC", String = "Ich bin ein Runenkrieger der hier ist, um die Dryade aufzusuchen.", AnswerId = 2},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} ),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_012PC", String = "Woher kamen Eure Schmerzen?", AnswerId = 12, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_017PC", String = "Erzählt mir etwas über Euren Orden.", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lyrioP204_024PC", String = "Erzählt mir mehr über Euren Traum!", AnswerId = 28, Color = ColorDarkOrange},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagFalse {Name = "g_P204_BasartorWestAufmachen"},
							IsGlobalFlagTrue {Name = "g_P204_LyrioGeheilt"},
							FigureAlive {NpcId = 8838},
							QuestState{QuestId = 810, State = StateActive}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[2]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[12]Abgeschaltet"} )),
			Negated(UND( ODER(ODER(IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, PlayerHasItem {ItemId = 4632}),IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 4632}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_LyrioKnown"}),
		},
		Actions = {
			Say{Tag = "lyrioP204_047", String = "Mein Blut brennt!   ... Keine Macht ... der Tempel ... "},
			Answer{Tag = "lyrioP204_048PC", String = "Was habt Ihr?", AnswerId = 54},
		}}

	OnAnswer{51;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_LyrioKnown"},
		},
		Actions = {
			Say{Tag = "lyrioP204_044", String = "Zu schwach ... kann nicht ... "},
			Answer{Tag = "lyrioP204_045PC", String = "Ich verstehe Euch nicht, braucht ihr Hilfe?", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_046", String = "Er kehrt zurück! Nicht ... Nein!"},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lyrioP204_049", String = "Dunkelheit ... Kann ... nicht ..."},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 880}, SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_10102"},
			SetGlobalFlagTrue {Name = "g_P204_LyrioKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end