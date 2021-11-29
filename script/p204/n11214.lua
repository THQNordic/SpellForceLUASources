-->INFO: Serbio
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11214"},		
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11214_Serbio.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l�sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "known"},
		},
		Actions = {
			Say{Tag = "serbioP204_001", String = "Ah, Hereinspaziert, guter Freund!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "known"}),
		},
		Actions = {
			Say{Tag = "serbioP204_002", String = "Hereinspaziert! Hereinspaziert! Willkommen im gro�en Zirkus von Empyria!"},
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
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_003", String = "Hier erleben Sie alle Wunder der Welt! Heldenhafte Gladiatoren und finstere Bestien aus allen Winkeln Eos!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_004", String = "Erleben Sie Kitharkrieger aus Urgath! Oder den wundervollen Irfit, der sich f�r Euch verwandelt!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_005", String = "All das f�r nur ein paar Silber ... leider ist zur Zeit keine Vorstellung, aber behalten Sie uns im Auge, bald wird der Zirkus wieder er�ffnen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_007", String = "Ach, das ist nur ein momentanes Ungl�ck mein Freund, eine kurze Verz�gerung, weiter nichts, ha ha!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_008", String = "Nun, zugegeben, der Kaiser hat nicht allzuviel Interesse an unseren Lustbarkeiten und hat leider die Unterst�tzung des Palastes f�r den Zirkus untersagt!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_009", String = "Wir sind also etwas in Geldnot, wenn Ihr versteht ... und die letze Gladiatorenvorstellung ist etwas ... nun ja, au�er Rand und Band geraten, wenn ihr versteht."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_010", String = "Aber wie gesagt, nur ein kleines Missgeschick ... in wenigen Wochen werden wir bestimmt wieder Vorstellungen geben ... hoffe ich!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_011", String = "Ach, w�re nur die g�tige Kaiserin Kaira noch am Leben, sie hat uns stets unterst�tzt!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[8]Abgeschaltet"},
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
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_013", String = "Dieser infame Kerl! Vergreift sich an meiner Tochter!"},
			Answer{Tag = "serbioP204_014PC", String = "Habt Ihr es denn gesehen?", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_015", String = "Nein, aber die beiden Wachleute Tak und Lhaled haben es mit in allen Einzelheiten erz�hlt! Dieser Unhold!"},
			Answer{Tag = "serbioP204_016PC", String = "Habt Ihr denn Eure Tocher dazu befragt?", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_017", String = "Ich will doch Ihr zartes Wesen nicht noch mehr belasten! Sie sollte nicht daran errinnert werden!"},
			Answer{Tag = "serbioP204_018PC", String = "Glaubt IHr wirklich, dass Uzakhan so etwas tun w�rde?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_019", String = "Nun ... eigentlich nein. Aber mein Entschluss steht fest! Ich habe ihn entlassen und dabei bleibt es auch! Ich kann doch nicht wankelm�tig sein!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[16]Abgeschaltet"},
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
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_021", String = "Das ist ja unerh�rt! Wie kommt Ihr dazu, in meinem eigenen Zirkus Bedingungen zu stellen?"},
			Answer{Tag = "serbioP204_022PC", String = "Dieses Wesen ist ein Geschenk der Natur, eine Kreatur der alten Welt! Sie sollte freie sein uns nicht eingesperrt, um von Schaulustigen angegafft zu werden!", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_023", String = "Nichts da! Diese Kreatur war ein Geschenk des Kaisers! Ausserdem ist sie eine der wenigen Besonderheiten, die wir noch haben!"},
			Answer{Tag = "serbioP204_024PC", String = "Dieses Wesen muss frei sein! Sucht Euch eine andere Kruiosit�t mit der Ihr angeben k�nnt!", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_025", String = "Wenn Ihr mir eine solche bringt, will ich es mir �berlgenen! Hm, da w�re sogar etwas ..."},
			Answer{Tag = "serbioP204_026PC", String = "Lasst h�ren!", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_027", String = "Es gibt Geschichten, �ber eine wundersame mechanische Kreatur, die ganz ohne Leben und Magie funktioniert! Das w�re durchaus ein Ersatz f�r diesen Irfit, der ohnehin nur jammert."},
			Answer{Tag = "serbioP204_028PC", String = "Wo finde ich diese Kreatur?", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_029", String = "Ich denke der Westteil der Stadt der Seelen w�re ein guter Ort um anzufangen. Ich glaube, dieses Wesen ist eine Sch�pfung der Fremden, die dort gewohnt haben!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 1044},
							 QuestSolve{QuestId = 1043},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[23]Abgeschaltet"},
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
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_006PC", String = "Warum ist der Zirkus geschlossen?", AnswerId = 8, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_012PC", String = "Warum habt Ihr Uzakhan entlassen?", AnswerId = 16, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_020PC", String = "Lasst den Irfit frei!", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_030PC", String = "Ich habe diese mechanische Kreatur f�r Euch!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "serbioP204_036PC", String = "Nun, wie geht es Eurem Zirkus unter der neuen Herrschaft?", AnswerId = 35, Color = ColorDarkOrange},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9
						{
						IsGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
						Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"})
						}
						, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( QuestState{QuestId = 1043, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND( UND9{ QuestState{QuestId = 1044, State = StateActive}, PlayerHasItem {ItemId = 7339} }, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_031", String = "Tats�chlich! Was f�r ein kurioses Gesch�pf! Was er wohl ... frisst?"},
			Answer{Tag = "serbioP204_032PC", String = "Ich glaube, er ist nur eine Puppe ohne Leben. Er scheint weder Futter noch Schlaf zu brauchen.", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_033", String = "Perfekt! Dann muss ja nicht einmal sein K�fig gereinigt werden ..."},
			Answer{Tag = "serbioP204_034PC", String = "Jetzt lasst den Irfit frei!", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_035", String = "Ja, nat�rlich! Der ist schon ganz aufgeregt, ich dene er sp�rt,  dass etwas vor sich geht! Er wird bestimmt hoch zum Dryadenhain laufen, so wie ich ihn kenne!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 1044},
				   QuestBegin{QuestId = 1045},
				   TransferItem{TakeItem = 7339, Flag = Take},
				   SetGlobalFlagTrue{Name = "g_P204_IrfitSpawnIrfit"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[31]Abgeschaltet"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_037", String = "Pr�chtig! Kaiserin Alyah hat uns wieder den kaiserlichen Zirkussatz gezahlt! Die Ahnen m�gen sie segnen!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_038", String = "Jetzt werden wir den Zirkus wieder in neuer Pracht errichten! Ach was rede ich ... noch sch�ner, noch pr�chtiger! Ihr werdet staunen."},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "serbioP204_039", String = "Und wisst Ihr was, ganz unter uns ... wenn die Reparaturen abgeschlossen sind, dann hole ich Uzakhan zur�ck! Er war doch der Leibling der Massen, wisst Ihr?"},
			Answer{Tag = "serbioP204_040PC", String = "Schade, das ichd as nciht mehr miterleben kann, ich muss weiter.", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[35]Abgeschaltet"},
			Say{Tag = "serbioP204_041", String = "Ja, schade! Nun denn, viel Gl�ck auf Eurer Reise!"},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end