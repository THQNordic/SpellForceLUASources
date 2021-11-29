-->INFO: Flink
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 8683},
--		SetGlobalFlagTrue{Name = "g_P204_FlinkHomepoint"},		
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = South, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_FlinkHomepoint", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


--- Flink rennt zum ersten Fluchtpunkt ---
OnIdleGoHome
{
	X = 215, Y = 165, WalkMode = Run, Direction = South,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_FlinkFluchtStart", UpdateInterval = 10},
	},

	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_Fluchtpunkt1Erreicht"},
		SetGlobalFlagFalse{Name = "g_P204_FlinkFluchtStart"},
		SetEffect{Effect = "ObeliskBeam", Length = 0, TargetType = Figure, NpcId = Self},
	}
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Fluchtpunkt1Erreicht", UpdateInterval = 60},
		PlayerUnitInRange {X = 213, Y = 163, Range = 2 , FigureType = FigureAll , UpdateInterval = 20},
	}
}


--- Erster Hinterhalt ---
Respawn
{
	WaitTime = 2, UnitId = self , X = 223, Y = 167, NoSpawnEffect = TRUE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Fluchtpunkt1Erreicht", UpdateInterval = 60},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8683"},
		ChangeRace{Race = 152, NpcId = 8683},
		Outcry { NpcId = 8683, Tag = "oca2flinkP204_001", String = "Seht mal! Das ist doch der Mensch, auf den 100 Goldstücke ausgesetzt sind!" },
		SetGlobalFlagFalse{Name = "g_P204_Fluchtpunkt1Erreicht"},
		SetGlobalFlagTrue{Name = "g_P204_Hinterhalt1a"},
		SetGlobalFlagTrue{Name = "g_P204_Hinterhalt1b"},
		SetGlobalFlagTrue{Name = "g_P204_Fluchtpunkt2Start"},
	}
}


--- Flink rennt zum zweiten Fluchtpunkt ---
OnIdleGoHome
{
	X = 246, Y = 169, WalkMode = Run, Direction = South,

	Conditions =
	{
		   IsGlobalFlagTrue {Name = "g_P204_Fluchtpunkt2Start", UpdateInterval = 60},
	},

	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_Fluchtpunkt2Erreicht"},
		SetGlobalFlagFalse{Name = "g_P204_Fluchtpunkt2Start"},
		SetEffect{Effect = "ObeliskBeam", Length = 0, TargetType = Figure, NpcId = Self},
	}
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Fluchtpunkt2Erreicht", UpdateInterval = 60},
		PlayerUnitInRange {X = 245, Y = 169, Range = 2 , FigureType = FigureAll , UpdateInterval = 20},
	}
}


--- Zweiter Hinterhalt ---
Respawn
{
	WaitTime = 2, UnitId = self , X = 254, Y = 171, NoSpawnEffect = TRUE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Fluchtpunkt2Erreicht", UpdateInterval = 60},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8683"},
		ChangeRace{Race = 152, NpcId = 8683},
		Outcry { NpcId = 8683, Tag = "oca2flinkP204_002", String = "Heda! Wer will sich das Kopfgeld auf den Runenkrieger verdienen?" },
	 	SetGlobalFlagFalse{Name = "g_P204_Fluchtpunkt2Erreicht"},
	 	SetGlobalFlagTrue{Name = "g_P204_Hinterhalt2"},
	 	SetGlobalFlagTrue{Name = "g_P204_Fluchtpunkt3Start"},
	 	SetGlobalFlagTrue{Name = "g_P204_Hinterhalt2a"},
		SetGlobalFlagTrue{Name = "g_P204_Hinterhalt2b"},
		SetGlobalFlagTrue{Name = "g_P204_Hinterhalt2c"},
	}
} 


--- Flink rennt zum dritten Fluchtpunkt ---
OnIdleGoHome
{
	X = 284, Y = 187, WalkMode = Run, Direction = West,

	Conditions =
	{
		   IsGlobalFlagTrue {Name = "g_P204_Fluchtpunkt3Start", UpdateInterval = 60},
	},

	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_Fluchtpunkt3Erreicht"},
		SetGlobalFlagFalse{Name = "g_P204_Fluchtpunkt3Start"},
		SetEffect{Effect = "ObeliskBeam", Length = 0, TargetType = Figure, NpcId = Self},
	}
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Fluchtpunkt3Erreicht", UpdateInterval = 60},
		PlayerUnitInRange {X = 284, Y = 187, Range = 2 , FigureType = FigureAll , UpdateInterval = 20},
	}
}


--- Dritter Hinterhalt ---
Respawn
{
	WaitTime = 2, UnitId = self , X = 291, Y = 187, NoSpawnEffect = TRUE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Fluchtpunkt3Erreicht", UpdateInterval = 60},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8683"},
		ChangeRace{Race = 152, NpcId = 8683},
		Outcry { NpcId = 8683, Tag = "oca2flinkP204_003", String = "Hilfe! Man will mich entführen, Hilfe!" },
	 	SetGlobalFlagFalse{Name = "g_P204_Fluchtpunkt3Erreicht"},
	 	SetGlobalFlagTrue{Name = "g_P204_Hinterhalt3a"},
	 	SetGlobalFlagTrue{Name = "g_P204_Hinterhalt3b"},
	 	SetGlobalFlagTrue{Name = "g_P204_Hinterhalt3c"},
	 	SetGlobalFlagTrue{Name = "g_P204_Fluchtpunkt4Start"},
	}
} 


--- Flink rennt zum letzten Fluchtpunkt ---
OnIdleGoHome
{
	X = 310, Y = 166, WalkMode = Run, Direction = South,

	Conditions =
	{
		   IsGlobalFlagTrue {Name = "g_P204_Fluchtpunkt4Start", UpdateInterval = 60},
	},

	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_FlinkFluchtpunktErreicht"},
		SetGlobalFlagFalse{Name = "g_P204_Fluchtpunkt4Start"},
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8683"},
		SetGlobalFlagTrue {Name = "g_P204_FlinkHomepointSackgasse"},		
		SetEffect{Effect = "ObeliskBeam", Length = 0, TargetType = Figure, NpcId = Self},
	}
}


OnIdleGoHome
{
X = 310, Y = 166, Direction = South, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_FlinkHomepointSackgasse", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}



--- Flink folgt Spieler bis zum Stadttor ---
OnFollowForever
{
	Target = Avatar, NpcId = self,
	
	Conditions =
	{
		   IsGlobalFlagTrue {Name = "g_P204_FlinkFolgtAvatar", UpdateInterval = 60},	
	},
	Actions = {},
}


--- Flink verliert follow und geht zu Alyah ---
OnOneTimeEvent
{
	Conditions =
	{
	   	FigureInRange {X = 199, Y = 188, NpcId = self , Range = 10, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P204_FlinkFolgtAvatar"},
	},

	Actions =
	{
		Stop {Target = self},
		StopFollow{Target = Avatar, NpcId = self},
		SetGlobalFlagFalse {Name = "g_P204_FlinkFolgtAvatar"},
		SetGlobalFlagTrue {Name = "g_P204_FlinkGehtZuAlyah"},
	}
}

OnIdleGoHome
{
	X = 176, Y = 195, WalkMode = Run, Direction = West,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_FlinkGehtZuAlyah", UpdateInterval = 60},
	},

	HomeActions = 
	{
		SetGlobalFlagTrue {Name = "g_P204_FlinkHomepointAlyah"},
		SetGlobalFlagFalse {Name = "g_P204_FlinkGehtZuAlyah"},		
	}
}


OnIdleGoHome
{
X = 167, Y = 195, Direction = NorthWest, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_FlinkHomepointAlyah", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


--- Flink Dialog weg wenn Tempeltor auf ---
OnOneTimeEvent
{
	Conditions =
	{
	    IsGlobalFlagTrue {Name = "g_P204_TempeltorOffen", UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8683"},
	}
}


--- Flink lenkt Wache ab wenn in Range ---
OnIdleGoHome
{
	X = 227, Y = 189, WalkMode = Run, Direction = North,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_FlinkLenktWacheAb", UpdateInterval = 10},
	},

	HomeActions =
	{
		StopFollow{Target = Avatar, NpcId = self},
		Outcry { NpcId = 8683 , Tag = "oca2flinkP204_004", String = "Heda, Wachmann! Stimmt es, dass du der Sohn einer Hündin und eines Schweines bist?"},
		Outcry { NpcId = 8906 , Tag = "oca2gatekeeper_praijosP204_001", String = "Na warte! Dich kauf ich mir!" },
		SetGlobalFlagTrue{Name = "g_P204_TempeltorwacheAttacke"},
		SetGlobalFlagFalse{Name = "g_P204_TempeltorBewacht"},
		SetGlobalFlagFalse {Name = "g_P204_FlinkBeiAlyah"},
		QuestSolve {QuestId = 943},
	}
}


--- Tempeltor unbewacht wenn Flink in Range ---
OnOneTimeEvent
{
	Conditions =
	{
	    IsGlobalFlagTrue {Name = "g_P204_FlinkLenktWacheAb"},
	    PlayerUnitInRange {X = 223, Y = 191, Range = 5 , FigureType = Avatar , UpdateInterval = 10}
	},

	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_TempeltorUnbewacht"},
	}
}


--- Flink rennt in den Hinterhof ---
OnIdleGoHome
{
	X = 235, Y = 167, WalkMode = Run, Direction = East,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_WacheVerfolgtFlink", UpdateInterval = 60},
	},

	HomeActions = 
	{	
		SetGlobalFlagTrue {Name = "g_P204_WacheEntkommen"},
		SetGlobalFlagFalse {Name = "g_P204_FlinkLenktWacheAb"},
	}
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_WacheEntkommen", UpdateInterval = 60},
	}
}


--- Flink respawn wenn Tempeltor offen ---
Respawn
{
	WaitTime = 3, UnitId = self , X = 228, Y = 167, NoSpawnEffect = TRUE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_FlinkAusserGefahr", UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_WacheEntkommen"},	
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8683"},
		ChangeRace{Race = 152, NpcId = 8683},
		SetGlobalFlagTrue{Name = "g_P204_FlinkZuAlyah"},		
	}
} 


--- Flink geht zu Alyah wenn Tempeltor offen ---
OnIdleGoHome
{
	X = 175, Y = 199, WalkMode = Run, Direction = South,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_FlinkZuAlyah"},
	},

	HomeActions = 
	{	
		Stop {Target = self},
		StopFollow{Target = Avatar, NpcId = self},	
		SetGlobalFlagFalse {Name = "g_P204_FlinkZuAlyah"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8683"},
		SetGlobalFlagTrue {Name = "g_P204_FlinkHomepointAlyah2"},	
		SetGlobalFlagTrue{Name = "g_P204_FlinkBeiAlyah"},			
	}
}


OnIdleGoHome
{
X = 175, Y = 199, Direction = South, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_FlinkHomepointAlyah2", UpdateInterval = 60},
	},
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
-- Source: C:\project\main\mission\dialoge\P204\n8683_Flink.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "TalkedAboutTraders"}),
		},
		Actions = {
			Say{Tag = "flinkP204_002", String = "Na hoppla, was wollt Ihr denn wieder hier? Mich jetzt endgültig in den Ruin treiben? Oder mich noch ein Bisschen an den Haaren umherschleifen?"},
			Answer{Tag = "flinkP204_003PC", String = "Ich könnte vielleicht Euren Rat gebrauchen.", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagTrue{Name = "TalkedAboutTraders"},
		},
		Actions = {
			Say{Tag = "flinkP204_001", String = "Nun, wie läuft Eure Schutzgeldsache?"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_004", String = "Meinen Rat? Na jetzt bin ich aber mal gespannt!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{9;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{9;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{10;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "flinkP204_006PC", String = "Dann komme ich vielleicht unbemerkt durch eines der Tore.", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_007", String = "Ich? Ich soll für Euch mein Leben riskieren? Wo Ihr mich doch gerade an den Haaren hierher geschleift und mich zum Ärmsten der Armen gemacht habt?"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_008", String = "Nun soll Ich Euch auch noch HELFEN?"},
			Answer{Tag = "flinkP204_009PC", String = "Genau das.", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_010", String = "Ehm ... Das ... Das ist gefährlich! Was ist mit meiner Frau und meinen vierzehn Kindern? Was ist wenn ich nicht zurück komme?"},
			Answer{Tag = "flinkP204_011PC", String = "Ihr habt weder Frau noch Kinder, Flink ... und selbst wenn sind sie besser ohne Euch dran.", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_012", String = "Naja, einen Versuch war es wert ...  also gut, ich werde die Wachen am Tor zum Tempelbereich ein wenig ablenken! Aber dann sind wir quitt!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_013", String = "Ihr müsst Euch mit den Dietrichen beeilen, sobald ich die Wachen fortgelockt habe ... ewig kann ich sie nicht beschäftigen! Also los!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_FlinkLenktWacheAb"}, 
							  SetGlobalFlagFalse {Name = "g_P204_FlinkHomepointAlyah"}, 
							  SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8906"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[11]Abgeschaltet"},
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
		},
		Actions = {
			Say{Tag = "flinkP204_015", String = "Aha! Wisst Ihr, Leute, die andere Leute mit Drohungen um Ihr Geld erleichtern sind meistens zu ... einfältig um es ordentlich zu stehlen!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_016", String = "Dummerweise sind sie meistens auch recht stark! Deshalb haben wir in Carmannon, meiner bescheidenen Heimat, einen ganz besonderen Trick was solche Leute angeht!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_017", String = "Was Ihr braucht ist eine Koboldmünze oder Fluchmünze! Dieses magische Geldstück verflucht denjenigen, der es mit Gier an sich nimmt! Also so ziemlich jeden ... ausser Euch vielleicht."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_018", String = "Der Fluch ist solcherart beschaffen, dass jeder, solange er üble Gedanken hat, zu seinem Gegenteil verkehrt wird! Starke werden schwach, Schnelle werden langsam und so weiter!"},
			Answer{Tag = "flinkP204_019PC", String = "Und wo finde ich eine solche Münze?", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_020", String = "Hm, Kobolde sind selten ... aber wenn Ihr mich fragt, dann sucht im Westteil der Stadt der Seelen! Ist zwar gruselig da, aber diese Fremden haben alle möglichen Wesen aus unserer Welt gesammelt, vielleicht ist auch ein Kobold dabei!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_021", String = "Bringt mir die Fluchmünze, wenn Ihr eine gefunden habt! Dann werden wir für Euren Geldeintreiber ein hübsches Geschenk daraus machen!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 1073},
			SetNpcFlagTrue{Name = "TalkedAboutTraders"},
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
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			IsNpcFlagTrue{Name = "AskedForGold"},
		},
		Actions = {
			Say{Tag = "flinkP204_023", String = "Nun, jetzt bereit 50 Gold für unseren kleinen Trick auszugeben?"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "AskedForGold"}),
		},
		Actions = {
			Say{Tag = "flinkP204_024", String = "Ah, werft sie hier in den Beutel, ja? Ich fasse sie besser nicht an, Ihr wisst schon warum ... So, jetzt noch ein paar Steine dazu, damit es schön schwer wird ..."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
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
			PlayerHasMoney{Gold = 50},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_026PC", String = "In Ordnung, hier sind 50 Gold!", AnswerId = 34},
			OfferAnswer{Tag = "flinkP204_032PC", String = "Ich fürchte, das kann ich mir gerade nicht leisten", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 50}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_032PC", String = "Ich fürchte, das kann ich mir gerade nicht leisten", AnswerId = 38},
		}}

	OnAnswer{33;
		Conditions = {
			PlayerHasMoney{Gold = 50},
		},
		Actions = {
			Say{Tag = "flinkP204_025", String = "Unsere kleine Geldlieferung ist fast fertig! Jetzt müssen wir aber noch etwas von Eurem Gold dazutun, damit es ordentlich klimpert im Beutel! 50 Gold sollten reichen!"},
			OfferAnswer{Tag = "flinkP204_026PC", String = "In Ordnung, hier sind 50 Gold!", AnswerId = 34},
			OfferAnswer{Tag = "flinkP204_032PC", String = "Ich fürchte, das kann ich mir gerade nicht leisten", AnswerId = 38},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 50}),
		},
		Actions = {
			Say{Tag = "flinkP204_025", String = "Unsere kleine Geldlieferung ist fast fertig! Jetzt müssen wir aber noch etwas von Eurem Gold dazutun, damit es ordentlich klimpert im Beutel! 50 Gold sollten reichen!"},
			OfferAnswer{Tag = "flinkP204_032PC", String = "Ich fürchte, das kann ich mir gerade nicht leisten", AnswerId = 38},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_027", String = "So, damit sollte es sich jetzt wie ein echter Sack voll Gold anfühlen!"},
			Answer{Tag = "flinkP204_028PC", String = "Erstaunlich, obwohl ihr doch nur 40 Gold hinein getan habt ...", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_029", String = "Ehm, nennen wir es Bearbeitungsgebühr. Ein Mann muss doch überleben ..."},
			Answer{Tag = "flinkP204_030PC", String = "Ich gönne es Euch ja. Danke für Eure Hilfe, Flink!", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_031", String = "Gern geschehen! Nehmt diesen Goldbeutel mit der verfluchten Münze und bringt ihn dem Eintreiber! Ihr müsst ihn ihm irgendwie andrehen, aber das sollte nicht allzu schwer sein!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "GoldGiven"},
							SetGlobalFlagFalse {Name = "g_P204_FlinkFluchQuest"},
							TransferMoney{Gold = 50 , Flag = Take},
							TransferItem {TakeItem = 7334, Amount = 1, Flag = Take},
							TransferItem {GiveItem = 7370, Amount = 1, Flag = Give},
							SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11199"},
							QuestSolve {QuestId = 1073},
							QuestBegin {QuestId = 1074},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_033", String = "Ohne das Gold im Beutel wird der Eintreiber den Betrug erkennen! Ich fürche wir brauchen es!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "AskedForGold"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{41;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
		}}

	OnAnswer{41;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{41;
		Conditions = {
			UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} ),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_005PC", String = "Flink, was haltet Ihr davon, wenn Ihr Euch nützlich macht und einige der Wachen ablenkt?", AnswerId = 11},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_014PC", String = "Ich muss mit einem Schutzgeldeintreiber fertig werden!", AnswerId = 19},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_022PC", String = "Ich hab eine Fluchmünze!", AnswerId = 28},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(UND( UND9{FigureAlive {NpcId = 8838},
						  IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah"}, 
						  IsGlobalFlagFalse {Name = "g_P204_TempeltorOffen"},
						  IsGlobalFlagFalse{Name = "g_P205_DryadengartenSolved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[11]Abgeschaltet"} )),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
							QuestState{QuestId = 1071, State = StateActive},
							IsNpcFlagFalse{Name = "TalkedAboutTraders"},
							IsGlobalFlagFalse{Name = "g_204TradersBorgoIsRemoved"}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7334}, QuestState {QuestId = 1073, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_FlinkFluchtpunktErreicht"}),
		},
		Actions = {
			Say{Tag = "flinkP204_050", String = "Na wenn das nicht ... der Runenkrieger!"},
			Answer{Tag = "flinkP204_051PC", String = "Grüße, Flink!", AnswerId = 61},
		}}

	OnAnswer{42;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_FlinkFluchtpunktErreicht"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_FlinkSchreitUmHilfe"}),
		},
		Actions = {
			Say{Tag = "flinkP204_034", String = "Hilfe! Hilfe! Ich werde überfallen! Raub! Mord! Hilfe!"},
			Answer{Tag = "flinkP204_035PC", String = "Hört mit dem Unsinn auf, Flink! Das glaubt Euch sowieso niemand! Jetzt kommt schon, Aylah erwartet Euch!", AnswerId = 45},
		}}

	OnAnswer{43;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_FlinkSchreitUmHilfe"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_036", String = "Ihr versteht nicht! Alyah verlangt von mir 15 Goldstücke als Abgabe für die Diebesgilde! Ich habe gerade mal fünf! Fünf hart erarbeitete Goldstücke ...!"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_037", String = "Ohne weitere zehn Goldstücke sollte ich da gar nicht erst aufkreuzen! Sonst verpassen die mir ein rotes Lächeln! Von Ohr zu Ohr, wenn Ihr versteht was ich meine!"},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_FlinkSchreitUmHilfe"}, QuestSolve {QuestId = 814},
			QuestBegin {QuestId = 889},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
			PlayerHasMoney{Gold = 10},
		},
		Actions = {
			Say{Tag = "flinkP204_038", String = "Hab ihr die 10 Goldstücke?"},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkP204_039PC", String = "(Flink die 10 Goldstücke geben)", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "flinkP204_040PC", String = "Also gut, hier habt Ihr das Geld! Ich will für Euch hoffen, dass Ihr die Wahrheit sagt!", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_041", String = "Tasächlich, zehn Goldstücke! Seid Ihr sicher, dass Ihr das machen wollt? Ich meine, sollen wir nicht lieber dafür ordentlich feiern gehen und dann ..."},
			Answer{Tag = "flinkP204_042PC", String = "...", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_043", String = "... naja, war ja nur ein Vorschlag."},
			Answer{Tag = "flinkP204_044PC", String = "Kommt schon, Alyah wartet. Abmarsch!", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_FlinkFolgtAvatar"}, 
							SetGlobalFlagFalse {Name = "g_P204_FlinkHomepointSackgasse"}, 
							QuestBegin {QuestId = 897},
			TransferMoney{Gold = 10, Flag = Take}, QuestSolve {QuestId = 889},
			StopEffect{NpcId = 8683},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{55;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_FlinkWill10Gold"},
		},
		Actions = {
			Say{Tag = "flinkP204_045", String = "Ich brauche noch 10 Gold, vorher komme ich nicht mit! Ihr wisst ja nicht, was die hier mit Schuldnern machen!"},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{55;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_FlinkWill10Gold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "flinkP204_046PC", String = "Ich würde euch vielleicht aushelfen, aber ich habe selbst keine zehn Goldstücke.", AnswerId = 57},
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

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_047", String = "Da, seht Ihr! Selbst ein Held wie Ihr kann Alyahs Schröpfungen nicht standhalten!"},
			Answer{Tag = "flinkP204_048PC", String = "Ich werde versuchen noch etwas Geld aufzutreiben.Ihr rührt Euch derweil nicht vom Fleck!", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_049", String = "Keine Sorge, bin genug gelaufen für heute. Ich warte hier, bis Ihr zehn Goldstücke aufgetrieben habt!"},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_FlinkWill10Gold"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_052", String = "Ihr hier in Xu? Ach, was frag ich ... es ist Krieg, sie spielen Euer Lied! Kein Wunder, dass Ihr hier Auftaucht!"},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_053", String = "Und, was kann Flink McWinter für Euch tun?"},
			Answer{Tag = "flinkP204_054PC", String = "Ihr könnt mich zu einer Dame namens Alyah begleiten.", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkP204_055", String = "Alyah? Ich kenne keine Alyah!"},
			Answer{Tag = "flinkP204_056PC", String = "Nun, sie sagt, sie hat noch etwas geschäftliches mit Euch zu regeln und ich soll Euch ... abholen.", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_FlinkFluchtStart"}, 
							SetGlobalFlagFalse {Name = "g_P204_FlinkHomepoint"}, 
							QuestBegin {QuestId = 814}, 
							QuestSolve {QuestId = 813},
			Say{Tag = "flinkP204_057", String = "Geschäftlich? Ja, natürlich .. Diese Alyah, ja! Ich errinnere mich, ha ha! Ehm ...seht mal, ist das nicht ein Drache dort oben ...?"},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end