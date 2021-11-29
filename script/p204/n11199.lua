-->INFO: Borgo
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = South}
--!EDS ONIDLEGOHOME END


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11199"},				
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_BorgoDialogOn", UpdateInterval = 10},	
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11199"},				
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_BorgoKampf"},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	   IsGlobalTimeElapsed{Name = "c_P204_BorgoVerflucht", Seconds = 2, UpdateInterval = 10}, 
	},

	Actions =
	{	
		SetEffect {Effect = "OccludeBlack", Length = 11000, TargetType = World, X = 331, Y = 219},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	   IsGlobalTimeElapsed{Name = "c_P204_BorgoVerflucht", Seconds = 4, UpdateInterval = 10}, 
	},

	Actions =
	{	
		Outcry { NpcId = 11199, Tag = "oca2borgoP204_001", String = "Was bei allen heulenden Sandteufeln ist jetzt los? Verdammte Zauberei!" },			
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	   IsGlobalTimeElapsed{Name = "c_P204_BorgoVerflucht", Seconds = 9, UpdateInterval = 10}, 
	},

	Actions =
	{	
		SetGlobalFlagTrue{Name = "g_P204_BorgoUmspawn"},
	}
}


Umspawn
{
	UnitId = 2779, X = _X, Y = _Y, NoSpawnEffect = TRUE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_BorgoUmspawn", UpdateInterval = 2},
	},


	Actions =
	{
	 	SetGlobalFlagFalse{Name = "g_P204_BorgoUmspawn"},	
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11199"},
		SetGlobalFlagTrue{Name = "g_P204_BorgoDerVerfluchte"},	
	    			
				
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_BorgoDerVerfluchte", UpdateInterval = 2},
	},

	Actions =
	{	
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11199"},
		QuestSolve {QuestId = 1074}, QuestSolve {QuestId = 1073}, QuestSolve {QuestId = 1072},			
	}
}


--OnIdleGoHome
--{
--X = _X, Y = _Y, Direction = South, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "g_P204_BorgoDerVerfluchte", UpdateInterval = 10},
--	},
--	Actions = {},
--	HomeActions = 
--	{
--	--HoldPosition {NpcId = self},
--	},
--}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11199_Borgo.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "g_204_BorgoKnown"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_204_BorgoKnown"}),
		},
		Actions = {
			Say{Tag = "borgoP204_002", String = "He du, was starrst du denn so an, hm?"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"}),
		},
		Actions = {
			Say{Tag = "borgoP204_001", String = "Was?"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "borgoP204_033PC", String = "Nun, wie fühlt Ihr Euch in Eurer neuen Form?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_034", String = "Witzig! Sehr witzig! Hinterhältiges Aas! Mach, das es wieder aufhört! Los!"},
			Answer{Tag = "borgoP204_035PC", String = "Ich fürchte Ihr müsst Euch daran gewöhnen, der Koboldfluch hält solange, wie Ihr finstere Gedanken habt!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_036", String = "Ja! Toll! Wie soll Brogo jetzt seine Arbeit machen, hm! Niemand wird Borgo mehr ernst nehmen, so klein! Verflixt nochmal!"},
			Answer{Tag = "borgoP204_037PC", String = "Ich schätze Brogo wird sich eine neue Arbeit suchen müssen ...", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_038", String = "Neue Arbeit? Du meinst richtige Arbeit? Ooh, mir wird schlecht! Verflixt und dreimal verflixt! Elender Bastard, elender ..."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
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
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
		}}

	OnAnswer{8;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
		}}

	OnAnswer{8;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_003", String = "Wenn du Ärger suchst, bist du bei Borgo genau richtig! Borgo macht aus Leuten wie dir Kleinholz!!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_005PC", String = "Ich komme von Wiesel und Zanzabar ...", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_008PC", String = "Kann ich Ihr Schutzgeld bezahlen?", AnswerId = 14},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370}),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_020PC", String = "Ich habe das Schutzgeld für Euch eingetrieben!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
			OfferAnswer{Tag = "borgoP204_027PC", String = "Ihr lasst die Beiden in Ruhe, oder Ihr bekommt es mit mir zu tun!", AnswerId = 33},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							Negated(PlayerHasItem{ItemId = 7369}),
							Negated(PlayerHasItem{ItemId = 7370})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
			Negated(ODER(PlayerHasItem{ItemId = 7369} , PlayerHasItem{ItemId = 7370})),
			Negated(UND(IsGlobalFlagTrue{Name = "OpenAnswers"},
					Negated(PlayerHasItem{ItemId = 7369}))),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_BorgoKnown"},
			Say{Tag = "borgoP204_004", String = "Aber Borgo muss mich jetzt erst um seine Kunden kümmern, also sieh zu, dass du Land gewinnst!"},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_006", String = "So? Du willst doch hier nicht etwa Borgos Zeit mit irgenwelchem Gnadegewinsel vergeuden, was?"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_007", String = "Die Zwei sind reif! Entweder sie zahlen, oder sie enden als Kriecherfutter! So einfach ist das!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "OpenAnswers"},
			SetGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[11]Abgeschaltet"},
			Say{Tag = "", String = ""},
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
			IsGlobalFlagTrue{Name = "AlreadyTriedMoney"},
		},
		Actions = {
			Say{Tag = "borgoP204_009", String = "Kommt darauf an! Hast du jetzt die 500 Gold zusammen?"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "AlreadyTriedMoney"}),
		},
		Actions = {
			Say{Tag = "borgoP204_010", String = "Du? Klar, für einen Monat macht das ..."},
			Answer{Tag = "borgoP204_011PC", String = "Kann ich sie nicht für immer freikaufen?", AnswerId = 19},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			PlayerHasMoney{Gold = 500},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_015PC", String = "Ja, hier nehmt.", AnswerId = 21},
			OfferAnswer{Tag = "borgoP204_018PC", String = "Nein, soviel habe ich nicht.", AnswerId = 24},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 500}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "borgoP204_018PC", String = "Nein, soviel habe ich nicht.", AnswerId = 24},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_012", String = "Für immer? Also Schutz von Borgo für alle Zeit?"},
			Answer{Tag = "borgoP204_013PC", String = "Von oder vor, wie es Euch beliebt, nur lasst sie in Ruhe.", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			PlayerHasMoney{Gold = 500},
		},
		Actions = {
			Say{Tag = "borgoP204_014", String = "Das wird teuer ...hm ...teuer ... so ...teuer wie 500 Goldstücke! Habt Ihr soviel?"},
			OfferAnswer{Tag = "borgoP204_015PC", String = "Ja, hier nehmt.", AnswerId = 21},
			OfferAnswer{Tag = "borgoP204_018PC", String = "Nein, soviel habe ich nicht.", AnswerId = 24},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 500}),
		},
		Actions = {
			Say{Tag = "borgoP204_014", String = "Das wird teuer ...hm ...teuer ... so ...teuer wie 500 Goldstücke! Habt Ihr soviel?"},
			OfferAnswer{Tag = "borgoP204_018PC", String = "Nein, soviel habe ich nicht.", AnswerId = 24},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "borgoP204_016PC", String = "Und nun lasst die beiden in Ruhe!", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_017", String = "500 Gold! ...ehm, ja, natürlich, Borgo wird die beiden in Ruhe lassen! Borgos Ehrenwort drauf!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 500, Flag = Take},
					SetGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"},
						SetGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},					
						QuestSolve {QuestId = 1072},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_019", String = "Dann halt mich nicht auf!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "AlreadyTriedMoney"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_021", String = "Was? Du?"},
			Answer{Tag = "borgoP204_022PC", String = "Ja, ich habe an den beiden ein Exempel statuiert!", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_023", String = "Ein Exewas? Naja, wie auch immer, du hast das Geld?"},
			Answer{Tag = "borgoP204_024PC", String = "Hier, ein Beutel voller Gold für Euch!", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_025", String = "Gute Arbeit! Hm, du wirst Borgo doch nicht das Geschäft verderben, oder?"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_026", String = "Naja, wie auch immer, hier, nehmt Euren Anteil, niemand soll sagen, Borgo wäre nicht fair!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
			PlayerHasItem{ItemId = 7370},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7370}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 50, Flag = Give}, TransferItem {TakeItem = 7370, Amount = 1, Flag = Take},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8683"}, 
				SetGlobalTimeStamp{Name = "c_P204_BorgoVerflucht"},
				SetGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"},
				QuestSolve {QuestId = 1074},
				 SetGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 1072}, QuestSolve {QuestId = 1071},
						TransferMoney{Gold = 50, Flag = Give},
						 SetGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
						 SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8683"},
						  TransferItem {TakeItem = 7369, Amount = 1, Flag = Take},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_028", String = "Was? Du willst Borgo Vorschriften machen! Soll Borgo deinen Schädel zu Mus machen, ja?"},
			OfferAnswer{Tag = "borgoP204_029PC", String = "Redet nicht, kämpft!", AnswerId = 34},
			OfferAnswer{Tag = "borgoP204_031PC", String = "Nein, schon gut.", AnswerId = 36},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_030", String = "Dummkopf! Borgo wird dich zermalmen!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_BorgoKampf"}, QuestSolve {QuestId = 1072},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "borgoP204_032", String = "Ha, ha! Borgo wusste, dass du vernünftig sein würdest!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end