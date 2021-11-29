-->INFO: Wiesel
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
X = _X, Y = _Y, Direction = North, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P204_WieselUndZanzabarSlums", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11197"},				
	}
}


OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalFlagTrue {Name = "g_P204_WieselKampf"},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11197"},	
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11198"},	
		AttackTarget{Target = 11198, NpcId = self, FriendlyFire = TRUE},				
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
		FigureHasHealth{Percent = 60, NpcId = self, UpdateInterval = 2},
		FigureHasHealth{Percent = 60, NpcId = 11198, UpdateInterval = 2},
		}
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_StreitWachenSpawn"},		
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
		FigureHasHealth{Percent = 50, NpcId = self, UpdateInterval = 2},
		FigureHasHealth{Percent = 50, NpcId = 11198, UpdateInterval = 2},
		}
	},

	Actions =
	{
		SetNoFightFlagTrue{NpcId = self},
		SetNoFightFlagTrue{NpcId = 11198},		
		ChangeRace{Race = 152, NpcId = self},
		ChangeRace{Race = 152, NpcId = 11198},
		SetGlobalTimeStamp{Name = "c_P204_CounterHaendlerFriedlich"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterHaendlerFriedlich", Seconds = 2, UpdateInterval = 10}, 
	},

	Actions =
	{
		SetNoFightFlagFalse{NpcId = self},
		SetNoFightFlagFalse{NpcId = 11198},	
		ChangeRace{Race = 152, NpcId = self},
		ChangeRace{Race = 152, NpcId = 11198},
	}
}


OnIdleGoHome
{

	X = 248, Y = 269, WalkMode = Walk, Direction = North,
	
	Conditions =
	{
			IsGlobalFlagTrue {Name = "g_P204_WieselAbgang"},
	},
	
	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_WieselAbgang"},
		SetGlobalFlagTrue{Name = "g_P204_WieselDespawn"},
	}
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_WieselDespawn", UpdateInterval = 60},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_WieselUndZanzabarSlums"},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11197"},	
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11198"},
		Goto {X = 167, Y = 180, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},	
		SetGlobalFlagTrue{Name = "g_P204_ZanziSlums"},				
	}
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11197_Wiesel.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l�sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersAtPeace"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersAtPeace"}),
		},
		Actions = {
			Say{Tag = "weaselP204_037", String = "Oh! Gr��e, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "known"}),
		},
		Actions = {
			Say{Tag = "weaselP204_002", String = "Was gafft Ihr denn so?"},
			Answer{Tag = "weaselP204_003PC", String = "Nun, ich dachte Ihr h�ttet etwas zu verkaufen ...", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagTrue{Name = "known"},
		},
		Actions = {
			Say{Tag = "weaselP204_001", String = "Ah, Ihr schon wieder!"},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_004", String = "Das h�tte ich vielleicht, h�tte nicht dieser verdammte Zanzabar mein Gesch�ft verdorben!"},
			Answer{Tag = "weaselP204_005PC", String = "Ihr meint den H�ndler dort dr�ben?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_006", String = "Ja, genau der! Kauft bei dem nichts ich beschw�re Euch! Er ist ein L�gner und ein Dieb!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11198"},
						QuestBegin {QuestId = 1075}, QuestBegin {QuestId = 1076},
			SetGlobalFlagTrue{Name = "g_204ZanFirstSentence"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalCounter{Name = "204TradersPositive" , Value = 2 , Operator = IsGreaterOrEqual , UpdateInterval = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalCounter{Name = "204TradersPositive" , Value = 2 , Operator = IsGreaterOrEqual , UpdateInterval = 10},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_007", String = "Ach wisst Ihr ... eigentlich bin ich ja schuld."},
			Answer{Tag = "weaselP204_008PC", String = "Woran?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_009", String = "Ach, ich Narr habe unser gemeinsaes Gesch�ft auf dem Gewissen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_010", String = "Ich bin auf einen Schwindler reingefallen ... und habe all unser Geld verloren. Jetzt sind wir beide arm wie die Wassertr�ger!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_011", String = "Und er hat zu guter Letzt noch unser Lager abgebrannt! Jetzt k�nnen wir Borgos Schutzgeld nicht mehr bezahlen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_012", String = "Dieser Borgo aus der Unterstadt, wisst ihr? Ein �bler Schl�ger! Bald wird er kommen, und uns noch unser letztes Geld nehmen! Dann ist es aus mit uns!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204TradersAtPeace"},
					SetRewardFlagTrue {Name = "SQHaendlerFriedlich" }, QuestSolve {QuestId = 1075}, QuestSolve {QuestId = 1076},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{16;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
		}}

	OnAnswer{16;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{16;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
			IsGlobalCounter{Name = "204TradersNegative" , Value = 2 , Operator = IsGreaterOrEqual , UpdateInterval = 10},
		},
		Actions = {
			Say{Tag = "weaselP204_013", String = "Jetzt ist das Mass voll! Ich werde diesen Kasper Manieren lehren! Passt mal auf!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsGlobalCounter{Name = "204TradersNegative" , Value = 2 , Operator = IsGreaterOrEqual , UpdateInterval = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_WieselKampf"},
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
			UND(IsGlobalFlagTrue{Name = "g_204WeaselFirstSentence"}, IsNpcFlagFalse{Name = "WSentenceOneOff"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_014PC", String = "Zanzabar sagt ...", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "g_204WeaselFirstSentence"}, IsNpcFlagFalse{Name = "WSentenceOneOff"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "g_204WeaselSecondSentence"}, IsNpcFlagFalse{Name = "WSentenceTwoOff"}),
			UND(IsGlobalFlagTrue{Name = "g_204WeaselThirdSentence"}, IsNpcFlagFalse{Name = "WSentenceThreeOff"}),
		},
		Actions = {
			Say{Tag = "weaselP204_015", String = "Ja? Was hat diese Made zu sagen?"},
			OfferAnswer{Tag = "weaselP204_016PC", String = "... Ihr seid ein Preistreiber und ein L�gner!", AnswerId = 21},
			OfferAnswer{Tag = "weaselP204_020PC", String = "... nur gutes �ber Euch!", AnswerId = 26},
			OfferAnswer{Tag = "weaselP204_014PC", String = "Zanzabar sagt ...", AnswerId = 31},
			OfferAnswer{Tag = "weaselP204_014PC", String = "Zanzabar sagt ...", AnswerId = 42},
		}}

	OnAnswer{20;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "g_204WeaselSecondSentence"}, IsNpcFlagFalse{Name = "WSentenceTwoOff"}),
			Negated(UND(IsGlobalFlagTrue{Name = "g_204WeaselThirdSentence"}, IsNpcFlagFalse{Name = "WSentenceThreeOff"})),
		},
		Actions = {
			Say{Tag = "weaselP204_015", String = "Ja? Was hat diese Made zu sagen?"},
			OfferAnswer{Tag = "weaselP204_016PC", String = "... Ihr seid ein Preistreiber und ein L�gner!", AnswerId = 21},
			OfferAnswer{Tag = "weaselP204_020PC", String = "... nur gutes �ber Euch!", AnswerId = 26},
			OfferAnswer{Tag = "weaselP204_014PC", String = "Zanzabar sagt ...", AnswerId = 31},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "g_204WeaselSecondSentence"}, IsNpcFlagFalse{Name = "WSentenceTwoOff"})),
			UND(IsGlobalFlagTrue{Name = "g_204WeaselThirdSentence"}, IsNpcFlagFalse{Name = "WSentenceThreeOff"}),
		},
		Actions = {
			Say{Tag = "weaselP204_015", String = "Ja? Was hat diese Made zu sagen?"},
			OfferAnswer{Tag = "weaselP204_016PC", String = "... Ihr seid ein Preistreiber und ein L�gner!", AnswerId = 21},
			OfferAnswer{Tag = "weaselP204_020PC", String = "... nur gutes �ber Euch!", AnswerId = 26},
			OfferAnswer{Tag = "weaselP204_014PC", String = "Zanzabar sagt ...", AnswerId = 42},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "g_204WeaselSecondSentence"}, IsNpcFlagFalse{Name = "WSentenceTwoOff"})),
			Negated(UND(IsGlobalFlagTrue{Name = "g_204WeaselThirdSentence"}, IsNpcFlagFalse{Name = "WSentenceThreeOff"})),
		},
		Actions = {
			Say{Tag = "weaselP204_015", String = "Ja? Was hat diese Made zu sagen?"},
			OfferAnswer{Tag = "weaselP204_016PC", String = "... Ihr seid ein Preistreiber und ein L�gner!", AnswerId = 21},
			OfferAnswer{Tag = "weaselP204_020PC", String = "... nur gutes �ber Euch!", AnswerId = 26},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_017", String = "Hoo! Dieser aufgeblasene Popanz! Sagt ihm, ich werde aller Welt erz�hlen, dass er fr�her Sklavenh�ndler war, jawohl!"},
			Answer{Tag = "weaselP204_018PC", String = "Sagt es ihm doch selber!", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_019", String = "Ach, ich rede nicht mit dieser Wanze!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersNegative"},
			SetGlobalFlagTrue{Name = "g_204ZanSecondSentence"},
						SetNpcFlagTrue{Name = "WSentenceOneOff"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_021", String = "Wirklich? Hm. Ach! Der will mich nur einlullen, weil er wieder irgendeine Teufelei vorhat!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_022", String = "Dem ist nicht zu trauen! Wusstet Ihr, das er fr�her Sklavenh�ndler war? Da staunt Ihr, was?"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersPositive"},
			SetGlobalFlagTrue{Name = "g_204ZanSecondSentence"},
						SetNpcFlagTrue{Name = "WSentenceOneOff"},
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
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_023PC", String = "... Ihr habt Eure Mutter verkauft!", AnswerId = 32},
			OfferAnswer{Tag = "weaselP204_026PC", String = "... Ihr seid sein Vorbild!", AnswerId = 37},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_024", String = "Dieser Bastard! Meine ehrw�rdige Mutter? So ein schamloser L�gner, ich h�tte nicht �bel Lust ihm eine �berzuziehen"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_025", String = "Sagt ihm,er soll aufpassen, oder ich spreche mal �ber seine Orgien! W�rde ihm nicht gefallen, wenn ich den Leuten von all den M�dchen erz�hle ..."},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersNegative"},
			SetGlobalFlagTrue{Name = "g_204ZanThirdSentence"},
						SetNpcFlagTrue{Name = "WSentenceTwoOff"},
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
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_027", String = "Hm, hm. Nun, ja, er ist ja schon ein guter Mann. Zumindest war er das."},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_028", String = "Wenn er nur nicht immer so viele Orgien gefeiert h�tte! Der ganze Trausmtaub hat ihm den Geist verwirrt!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersPositive"},
			SetGlobalFlagTrue{Name = "g_204ZanThirdSentence"},
						SetNpcFlagTrue{Name = "WSentenceTwoOff"},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_029PC", String = "... Ihr seid der Sohn von Tausend V�tern!", AnswerId = 43},
			OfferAnswer{Tag = "weaselP204_032PC", String = "... Ihr seid der beste Freund, den er je hatte!", AnswerId = 48},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_030", String = "Das ... Das ist unglaublich! Ich schlage ihn gr�n und blau, diesen aufgedunsenen Prahlhans! So ein L�genbold!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_031", String = "Er denkt wohl, ich kann nicht mit meinen F�usten umgehen! Der kann was erleben!"},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersNegative"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_033", String = "Wirklich? Oh! Ich dachte ... ich dachte ..."},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_034", String = "Ehem, verflixt, da ist mir doch was ins Auge gekommen! Nicht, das Ihr denkt ich weine oder so etwas!"},
			Answer{Tag = "weaselP204_035PC", String = "Nat�rlich nicht!", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_036", String = "Ach ja, wisst Ihr  ... Zanzabar ist ja schon ein verflixt feiner Kerl! und jeder der etwas anders behauptet, bekommt es mit mir zu tun!"},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersPositive"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{54;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{54;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
		}}

	OnAnswer{54;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{54;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
		}}

	OnAnswer{54;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{54;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
		}}

	OnAnswer{54;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{54;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_039", String = "Ein Schutzgeldeintreiber! Wer nicht monatlich zahlt bekommt erst den Kn�ppel und dann das Messer zu sp�ren! Schnipp! Versteht Ihr? Die Kehle aufgeschlitzt!"},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_040", String = "Hm, Ihr seid doch ein Runekrieger ... Ihr kennt Euch mit K�mpfen aus ..."},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_041", String = "Am besten Ihr sch�chtert ihn auch mal t�chtig ein! Oder noch besser, Ihr schafft ihn ganz aus der Welt! Der Kerl ist eine echte Plage!"},
			Answer{Tag = "weaselP204_042PC", String = "Ich wei� nicht, ob ich ihn umbringen sollte, guter Freund", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_043", String = "Oder Ihr fragt einmal einen vom Fach, wie man solche Leute los wird ... wie w�re es mit diesem McWinter? Ich glaube der hat mal f�r ihn gearbeitet!"},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
					SetGlobalFlagTrue {Name = "g_P204_FlinkFluchQuest"},	
					SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8683"},
					SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11199"},
					QuestBegin {QuestId = 1071}, QuestBegin {QuestId = 1072},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{61;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
		}}

	OnAnswer{61;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{61;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
		}}

	OnAnswer{61;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{61;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
		}}

	OnAnswer{61;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{61;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_045", String = "Was? Ihr macht gemeinsame Sache mit diesem Borgo? Was f�r eine ehrlose Kreatur seid Ihr?"},
			Answer{Tag = "weaselP204_046PC", String = "Ehre ist etwas f�r Tr�umer! Jetzt her mit dem Geld!", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_047", String = "Wir haben das Geld nicht! Wir brauchen mehr Zeit ..."},
			Answer{Tag = "weaselP204_048PC", String = "Hm, wenn ich einen von euch beiden erschlage, wird der andere bestimmt zahlen!  Warum nicht mit Euch anfangen?", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_049", String = "Wartet! Eure Ahnen m�gen Euch verdammen! Hier nehmt unser letztes Geld! Nun bleibt uns nur noch das Armenviertel!"},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7369, Amount = 1, Flag = Give},
			SetGlobalFlagTrue{Name = "g_P204_WieselUndZanzabarSlums"}, QuestSolve {QuestId = 1075}, QuestSolve {QuestId = 1076},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			EndDialog(),
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{67;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
		}}

	OnAnswer{67;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{67;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_038PC", String = "Was ist dieser Borgo f�r ein Kerl?", AnswerId = 55},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_044PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 62},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "weaselP204_050PC", String = "Borgo wird euch nicht mehr bel�stigen!", AnswerId = 68},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},
							Negated(PlayerHasItem{ItemId = 7370}),							
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[62]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{68;
		Conditions = {
			FigureDead{NpcId = 11199},
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"},
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"},
		},
		Actions = {
			Say{Tag = "weaselP204_051", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "weaselP204_052PC", String = "Ich habe ihn ... in den Ruhestand versetzt.", AnswerId = 69},
			OfferAnswer{Tag = "weaselP204_055PC", String = "Ich habe ihn verflucht ...er ist keine Gefahr mehr!", AnswerId = 72},
			OfferAnswer{Tag = "weaselP204_059PC", String = "Ich habe ihn ausbezalht.", AnswerId = 75},
		}}

	OnAnswer{68;
		Conditions = {
			FigureDead{NpcId = 11199},
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"},
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"}),
		},
		Actions = {
			Say{Tag = "weaselP204_051", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "weaselP204_052PC", String = "Ich habe ihn ... in den Ruhestand versetzt.", AnswerId = 69},
			OfferAnswer{Tag = "weaselP204_055PC", String = "Ich habe ihn verflucht ...er ist keine Gefahr mehr!", AnswerId = 72},
		}}

	OnAnswer{68;
		Conditions = {
			FigureDead{NpcId = 11199},
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"}),
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"},
		},
		Actions = {
			Say{Tag = "weaselP204_051", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "weaselP204_052PC", String = "Ich habe ihn ... in den Ruhestand versetzt.", AnswerId = 69},
			OfferAnswer{Tag = "weaselP204_059PC", String = "Ich habe ihn ausbezalht.", AnswerId = 75},
		}}

	OnAnswer{68;
		Conditions = {
			FigureDead{NpcId = 11199},
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"}),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"}),
		},
		Actions = {
			Say{Tag = "weaselP204_051", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "weaselP204_052PC", String = "Ich habe ihn ... in den Ruhestand versetzt.", AnswerId = 69},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(FigureDead{NpcId = 11199}),
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"},
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"},
		},
		Actions = {
			Say{Tag = "weaselP204_051", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "weaselP204_055PC", String = "Ich habe ihn verflucht ...er ist keine Gefahr mehr!", AnswerId = 72},
			OfferAnswer{Tag = "weaselP204_059PC", String = "Ich habe ihn ausbezalht.", AnswerId = 75},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(FigureDead{NpcId = 11199}),
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"},
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"}),
		},
		Actions = {
			Say{Tag = "weaselP204_051", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "weaselP204_055PC", String = "Ich habe ihn verflucht ...er ist keine Gefahr mehr!", AnswerId = 72},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(FigureDead{NpcId = 11199}),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"}),
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"},
		},
		Actions = {
			Say{Tag = "weaselP204_051", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "weaselP204_059PC", String = "Ich habe ihn ausbezalht.", AnswerId = 75},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(FigureDead{NpcId = 11199}),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"}),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"}),
		},
		Actions = {
			Say{Tag = "weaselP204_051", String = "Wundervoll! Was habt Ihr getan?"},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_053", String = "Eine harte Tat, aber Ihr habt zum Wohle aller gehandelt! Borgo hat viele der H�ndler hier auf dem Gewissen!"},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_054", String = "Nehmt unseren Dank ... und diese kleine Entsch�digung f�r Eure M�he! Nun k�nnen wir vielleicht unser Gesch�ft wieder aufbauen!"},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 100, Flag = Give}, SetRewardFlagTrue {Name = "SQSchutzgeldSmall"}, QuestSolve {QuestId = 1071}, SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11198"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_056", String = "Dann ist es wahr, was man sich erz�hlt? Er ist nun ein Winzling?"},
			Answer{Tag = "weaselP204_057PC", String = "Ja, ihn wird so schnell keiner mehr ernst nehmen! Jetzt muss er sich anst�ndige Arbeit suchen!", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_058", String = "Ihr habt weise gehandelt! Ich m�chte Euch dies geben, als Anerkennung! Lebt wohl!"},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 100, Flag = Give}, SetRewardFlagTrue {Name = "SQSchutzgeldLarge" }, QuestSolve {QuestId = 1071}, SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11198"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_060", String = "Danke! Jetzt halten wir zumindest bis n�chsten Monat aus!"},
			Answer{Tag = "weaselP204_061PC", String = "Ich habe ihm genug Gold gegeben, das es f�r euer restliches Leben reicht! Ihr seid ihn los!", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_062", String = "Danke! Oh, Danke! Was f�r ein Opfer! Ihr seid wundervoll!"},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "weaselP204_063", String = "Nehmt wenigstens dieses kleine Geschenk zum Ausgleich! Als Geste der Freundschaft! M�ge Euch die Sonne des Gl�cks immer scheinen!"},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 100, Flag = Give}, SetRewardFlagTrue {Name = "SQSchutzgeldMedium" }, QuestSolve {QuestId = 1071}, SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11198"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end