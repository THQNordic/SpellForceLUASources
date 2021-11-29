-->INFO: Zanzabar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
X = _X, Y = _Y, Direction = South, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
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
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11198"},				
	}
}


OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalFlagTrue {Name = "g_P204_ZanziKampf"},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11197"},	
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11198"},			
		AttackTarget{Target = 11197, NpcId = self, FriendlyFire = TRUE},
	}
}


OnIdleGoHome
{

	X = 248, Y = 269, WalkMode = Walk, Direction = North,
	
	Conditions =
	{
			IsGlobalFlagTrue {Name = "g_P204_ZanziAbgang"},
	},
	
	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_ZanziAbgang"},
		SetGlobalFlagTrue{Name = "g_P204_ZanziDespawn"},
	}
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_ZanziDespawn", UpdateInterval = 60},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
			IsGlobalFlagTrue {Name = "g_P204_ZanziSlums"},
	},
	
	Actions =
	{
		Goto {X = 164, Y = 183, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},	
	}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11198_Zanzabar.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
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
			Say{Tag = "zanzabarP204_029", String = "Oh! Grüße, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagTrue{Name = "known"},
		},
		Actions = {
			Say{Tag = "zanzabarP204_001", String = "Was ist nun?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "known"}),
		},
		Actions = {
			Say{Tag = "zanzabarP204_002", String = "Ihr kommt von diesem Wiesel! Traut dem Kerl nicht, ich sage es Euch!"},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_003", String = "Der hat Euch bestimmt Lügen erzählt!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			IsGlobalCounter{Name = "204TradersPositive" , Value = 2 , Operator = IsGreaterOrEqual , UpdateInterval = 10},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsGlobalCounter{Name = "204TradersPositive" , Value = 2 , Operator = IsGreaterOrEqual , UpdateInterval = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_004", String = "Ach, was soll's ... ich gebe es zu. Es ist alles meine Schuld!."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_005", String = "Ich habe unser gemeinsames Geschäft ruiniert!!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_006", String = "Er hat zwar unser Geld bei seinen Spekulationen verloren ...aber ich habe unser Lager abgebrannt! Ohne das Lager mussten wir das Geschäft aufgeben"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_007", String = "Ich hätte nicht im Lagerhaus feiern sollen ... vor allem nicht mit soviel Traumstaub uns so vielen Kerzen! Jetzt können wir Borgos Schutzgeld nicht mehr bezahlen!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_008", String = "Dieser Borgo aus der Unterstadt, wisst ihr? Ein übler Schläger! Bald wird er kommen, und uns noch unser letztes Geld nehmen! Dann ist es aus mit uns!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204TradersAtPeace"},
					SetRewardFlagTrue {Name = "SQHaendlerFriedlich" }, QuestSolve {QuestId = 1075}, QuestSolve {QuestId = 1076},
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
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{15;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
		}}

	OnAnswer{15;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{15;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
			IsGlobalCounter{Name = "204TradersNegative" , Value = 2 , Operator = IsGreaterOrEqual , UpdateInterval = 10},
		},
		Actions = {
			Say{Tag = "zanzabarP204_009", String = "Diese kleine Schlange! Ich werde ihm den Kopf zurechtsetzen! Jetzt gibt es Ärger!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalCounter{Name = "204TradersNegative" , Value = 2 , Operator = IsGreaterOrEqual , UpdateInterval = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_ZanziKampf"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{18;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "g_204ZanFirstSentence"}, IsNpcFlagFalse{Name = "ZSentenceOneOff"}),
			UND(IsGlobalFlagTrue{Name = "g_204ZanSecondSentence"}, IsNpcFlagFalse{Name = "ZSentenceTwoOff"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_010PC", String = "Wiesel sagt ...", AnswerId = 19},
			OfferAnswer{Tag = "zanzabarP204_010PC", String = "Wiesel sagt ...", AnswerId = 30},
		}}

	OnAnswer{18;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "g_204ZanFirstSentence"}, IsNpcFlagFalse{Name = "ZSentenceOneOff"}),
			Negated(UND(IsGlobalFlagTrue{Name = "g_204ZanSecondSentence"}, IsNpcFlagFalse{Name = "ZSentenceTwoOff"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_010PC", String = "Wiesel sagt ...", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "g_204ZanFirstSentence"}, IsNpcFlagFalse{Name = "ZSentenceOneOff"})),
			UND(IsGlobalFlagTrue{Name = "g_204ZanSecondSentence"}, IsNpcFlagFalse{Name = "ZSentenceTwoOff"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_010PC", String = "Wiesel sagt ...", AnswerId = 30},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "g_204ZanFirstSentence"}, IsNpcFlagFalse{Name = "ZSentenceOneOff"})),
			Negated(UND(IsGlobalFlagTrue{Name = "g_204ZanSecondSentence"}, IsNpcFlagFalse{Name = "ZSentenceTwoOff"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_011PC", String = "... Ihr seid ein Lügner und ein Dieb!", AnswerId = 20},
			OfferAnswer{Tag = "zanzabarP204_014PC", String = "... nur gutes über Euch!", AnswerId = 25},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_012", String = "Was? Dieser Sandwurm! Dieses verwesende Extremente fressende Kriechtier! Der Lügner ist doch er!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_013", String = "Und ein Verbrecher ist er noch dazu! Er belügt die Kunden und richtet uns alle mit seiner Preistreiberei zugrunde! Bisher habe ich geschwiegen, aber jetzt ist es genug! Sagt ihm das!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersNegative"},
			SetGlobalFlagTrue{Name = "g_204WeaselFirstSentence"},
							SetNpcFlagTrue{Name = "ZSentenceOneOff"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_015", String = "Wirklich? Nein, nein, Ihr habt ihn bestimmt falsch verstanden! Das wäre ja die Wahrheit und die Wahrheit spricht diese Schlange nicht!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_016", String = "Er ist eben ein falscher Hund! Wusstet Ihr, dass er seine eigene Mutter verkauft hat, ums ein Geschäft zu gründen?"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersPositive"},
			SetGlobalFlagTrue{Name = "g_204WeaselFirstSentence"},
							SetNpcFlagTrue{Name = "ZSentenceOneOff"},
			Say{Tag = "", String = ""},
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "g_204ZanThirdSentence"}, IsNpcFlagFalse{Name = "ZSentenceThreeOff"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_017PC", String = "... Ihr wart ein elender Skalvenhändler!", AnswerId = 31},
			OfferAnswer{Tag = "zanzabarP204_020PC", String = "... Ihr seid sein Vorbild!", AnswerId = 36},
			OfferAnswer{Tag = "zanzabarP204_010PC", String = "Wiesel sagt ...", AnswerId = 41},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "g_204ZanThirdSentence"}, IsNpcFlagFalse{Name = "ZSentenceThreeOff"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_017PC", String = "... Ihr wart ein elender Skalvenhändler!", AnswerId = 31},
			OfferAnswer{Tag = "zanzabarP204_020PC", String = "... Ihr seid sein Vorbild!", AnswerId = 36},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_018", String = "Alles Lüge! Diese Ratte, will mich anschwärzen! Gut, ich habe mal ein paar Diner vermittelt, aber Sklaven? Nein!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_019", String = "Fragt ihn doch einmal, was mit seiner Mutter war! Er hat nämlich seine eigene Mutter verkauft! So hat er sein Gold für sein schmutzigen Geschäfte bekommen!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersNegative"},
			SetGlobalFlagTrue{Name = "g_204WeaselSecondSentence"},
							SetNpcFlagTrue{Name = "ZSentenceTwoOff"},
			Say{Tag = "", String = ""},
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_021", String = "Hm, hm. Also nun ja, er ist ja nun nicht ganz so schlimm, vielleicht übertreibe ich ...."},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_022", String = "Aber man merkt nun mal wo er herkommt! Er weiss ja nicht einmal, wer von den Tausenden Kerlen seiner Mutter sein Vater war!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersPositive"},
			SetGlobalFlagTrue{Name = "g_204WeaselSecondSentence"},
							SetNpcFlagTrue{Name = "ZSentenceTwoOff"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_023PC", String = "... Ihr feiert schamlose Orgien!", AnswerId = 42},
			OfferAnswer{Tag = "zanzabarP204_026PC", String = "... Ihr seid der beste Freund, den er je hatte!", AnswerId = 47},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_024", String = "Bei allen heulenden  Wüstengeistern! Dieser Skorpion! Diese Giftnatter! Wenn ich den erwische, hoo! Orgien! Pah!"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_025", String = "Gut ich feiere ganz gern im Kreis meiner Freunde ...aber fragt ihn doch mal nach den Orgien die seine käufliche Mutter auf dem Rücken gefeiert hat! Der Kerl ist der Sohn von Tausend Vätern!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersNegative"},
			SetGlobalFlagTrue{Name = "g_204WeaselThirdSentence"},
							SetNpcFlagTrue{Name = "ZSentenceThreeOff"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_027", String = "Das hat er gesagt? Ich? Sein bester Freund?"},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_028", String = "Wisst Ihr, so ganz im Vertrauen ...er ist eigentlich auch mein bester Freund! Wir hatten da nur diesen unseligen Streit ..."},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "204TradersPositive"},
			SetGlobalFlagTrue{Name = "g_204WeaselThirdSentence"},
							SetNpcFlagTrue{Name = "ZSentenceThreeOff"},
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{52;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{52;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
		}}

	OnAnswer{52;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{52;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_031", String = "Ein Schutzgeldeintreiber! Wer nicht monatlich zahlt bekommt erst den Knüppel und dann das Messer zu spüren! Schnipp! Versteht Ihr? Die Kehle aufgeschlitzt!"},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_032", String = "Hm, Ihr seid doch ein Runekrieger ... Ihr kennt Euch mit Kämpfen aus ..."},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_033", String = "Am besten Ihr schüchtert ihn auch mal tüchtig ein! Oder noch besser, Ihr schafft ihn ganz aus der Welt! Der Kerl ist eine echte Plage!"},
			Answer{Tag = "zanzabarP204_034PC", String = "Ich weiß nicht, ob ich ihn umbringen sollte, guter Freund", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_035", String = "Oder Ihr fragt einmal einen vom Fach, wie man solche Leute los wird ... wie wäre es mit diesem McWinter? Ich glaube der hat mal für ihn gearbeitet!"},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204TradersGotoBorgoStarted"},
					SetGlobalFlagTrue {Name = "g_P204_FlinkFluchQuest"},	
					SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8683"},
					SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11199"},
					QuestBegin {QuestId = 1071}, QuestBegin {QuestId = 1072},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{59;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
		}}

	OnAnswer{59;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{59;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
		}}

	OnAnswer{59;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{59;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
		}}

	OnAnswer{59;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{59;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_037", String = "Was? Ihr macht gemeinsame Sache mit diesem Borgo? Was für eine ehrlose Kreatur seid Ihr?"},
			Answer{Tag = "zanzabarP204_038PC", String = "Ehre ist etwas für Träumer! Jetzt her mit dem Geld!", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_039", String = "Wir haben das Geld nicht! Wir brauchen mehr Zeit ..."},
			Answer{Tag = "zanzabarP204_040PC", String = "Hm, wenn ich einen von euch beiden erschlage, wird der andere bestimmt zahlen!  Warum nicht mit Euch anfangen?", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_041", String = "Wartet! Eure Ahnen mögen Euch verdammen! Hier nehmt unser letztes Geld! Nun bleibt uns nur noch das Armenviertel!"},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7369, Amount = 1, Flag = Give},
			SetGlobalFlagTrue{Name = "g_P204_WieselUndZanzabarSlums"}, QuestSolve {QuestId = 1075}, QuestSolve {QuestId = 1076},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			EndDialog(),
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
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{65;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
		}}

	OnAnswer{65;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{65;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"},
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_030PC", String = "Was ist dieser Borgo für ein Kerl?", AnswerId = 53},
		}}

	OnAnswer{65;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{65;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} ),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_036PC", String = "Ich komme, um Euer Schutzgeld einzutreiben!", AnswerId = 60},
		}}

	OnAnswer{65;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zanzabarP204_042PC", String = "Borgo wird euch nicht mehr belästigen!", AnswerId = 66},
		}}

	OnAnswer{65;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_204TradersGotoBorgoStarted"}),
			Negated(UND( UND9{IsGlobalFlagTrue{Name = "g_204TradersPlayerHasTalkedToBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasPaidBorgo"},
							IsGlobalFlagFalse{Name = "g_204TradersPlayerHasCursedBorgo"},	
							Negated(PlayerHasItem{ItemId = 7370}),						
							Negated(FigureDead{NpcId = 11199})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[60]Abgeschaltet"} )),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersBorgoIsRemoved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{66;
		Conditions = {
			FigureDead{NpcId = 11199},
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"},
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"},
		},
		Actions = {
			Say{Tag = "zanzabarP204_043", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "zanzabarP204_044PC", String = "Ich habe ihn ... in den Ruhestand versetzt.", AnswerId = 67},
			OfferAnswer{Tag = "zanzabarP204_047PC", String = "Ich habe ihn verflucht ...er ist keine Gefahr mehr!", AnswerId = 70},
			OfferAnswer{Tag = "zanzabarP204_051PC", String = "Ich habe ihn ausbezalht.", AnswerId = 73},
		}}

	OnAnswer{66;
		Conditions = {
			FigureDead{NpcId = 11199},
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"},
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"}),
		},
		Actions = {
			Say{Tag = "zanzabarP204_043", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "zanzabarP204_044PC", String = "Ich habe ihn ... in den Ruhestand versetzt.", AnswerId = 67},
			OfferAnswer{Tag = "zanzabarP204_047PC", String = "Ich habe ihn verflucht ...er ist keine Gefahr mehr!", AnswerId = 70},
		}}

	OnAnswer{66;
		Conditions = {
			FigureDead{NpcId = 11199},
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"}),
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"},
		},
		Actions = {
			Say{Tag = "zanzabarP204_043", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "zanzabarP204_044PC", String = "Ich habe ihn ... in den Ruhestand versetzt.", AnswerId = 67},
			OfferAnswer{Tag = "zanzabarP204_051PC", String = "Ich habe ihn ausbezalht.", AnswerId = 73},
		}}

	OnAnswer{66;
		Conditions = {
			FigureDead{NpcId = 11199},
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"}),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"}),
		},
		Actions = {
			Say{Tag = "zanzabarP204_043", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "zanzabarP204_044PC", String = "Ich habe ihn ... in den Ruhestand versetzt.", AnswerId = 67},
		}}

	OnAnswer{66;
		Conditions = {
			Negated(FigureDead{NpcId = 11199}),
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"},
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"},
		},
		Actions = {
			Say{Tag = "zanzabarP204_043", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "zanzabarP204_047PC", String = "Ich habe ihn verflucht ...er ist keine Gefahr mehr!", AnswerId = 70},
			OfferAnswer{Tag = "zanzabarP204_051PC", String = "Ich habe ihn ausbezalht.", AnswerId = 73},
		}}

	OnAnswer{66;
		Conditions = {
			Negated(FigureDead{NpcId = 11199}),
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"},
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"}),
		},
		Actions = {
			Say{Tag = "zanzabarP204_043", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "zanzabarP204_047PC", String = "Ich habe ihn verflucht ...er ist keine Gefahr mehr!", AnswerId = 70},
		}}

	OnAnswer{66;
		Conditions = {
			Negated(FigureDead{NpcId = 11199}),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"}),
			IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"},
		},
		Actions = {
			Say{Tag = "zanzabarP204_043", String = "Wundervoll! Was habt Ihr getan?"},
			OfferAnswer{Tag = "zanzabarP204_051PC", String = "Ich habe ihn ausbezalht.", AnswerId = 73},
		}}

	OnAnswer{66;
		Conditions = {
			Negated(FigureDead{NpcId = 11199}),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasCursedBorgo"}),
			Negated(IsGlobalFlagTrue{Name = "g_204TradersPlayerHasPaidBorgo"}),
		},
		Actions = {
			Say{Tag = "zanzabarP204_043", String = "Wundervoll! Was habt Ihr getan?"},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_045", String = "Eine harte Tat, aber Ihr habt zum Wohle aller gehandelt! Borgo hat viele der Händler hier auf dem Gewissen!"},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_046", String = "Nehmt unseren Dank ... und diese kleine Entschädigung für Eure Mühe! Nun können wir vielleicht unser Geschäft wieder aufbauen!"},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 100, Flag = Give}, SetRewardFlagTrue {Name = "SQSchutzgeldSmall"}, QuestSolve {QuestId = 1071}, SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11197"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_048", String = "Dann ist es wahr, was man sich erzählt? Er ist nun ein Winzling?"},
			Answer{Tag = "zanzabarP204_049PC", String = "Ja, ihn wird so schnell keiner mehr ernst nehmen! Jetzt muss er sich anständige Arbeit suchen!", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_050", String = "Ihr habt weise gehandelt! Ich möchte Euch dies geben, als Anerkennung! Lebt wohl!"},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 100, Flag = Give}, SetRewardFlagTrue {Name = "SQSchutzgeldLarge" }, QuestSolve {QuestId = 1071}, SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11197"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_052", String = "Danke! Jetzt halten wir zumindest bis nächsten Monat aus!"},
			Answer{Tag = "zanzabarP204_053PC", String = "Ich habe ihm genug Gold gegeben, das es für euer restliches Leben reicht! Ihr seid ihn los!", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_054", String = "Danke! Oh, Danke! Was für ein Opfer! Ihr seid wundervoll!"},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zanzabarP204_055", String = "Nehmt wenigstens dieses kleine Geschenk zum Ausgleich! Als Geste der Freundschaft! Möge Euch die Sonne des Glücks immer scheinen!"},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 100, Flag = Give}, SetRewardFlagTrue {Name = "SQSchutzgeldMedium" }, QuestSolve {QuestId = 1071}, SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11197"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end