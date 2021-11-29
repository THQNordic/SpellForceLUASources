-->INFO: Shain_Tal_Ach
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions =
	{		
	},
	Actions =
	{
		ChangeRace {Race = 152},
	},
}

OnOneTimeEvent
{
	Conditions =
	{	
		IsGlobalFlagTrue{Name = "g_sP207StartDraconNebenQuest"},	
	},
	Actions =
	{
		ChangeRace {Race = 1},
		SetHealth {HitPoints = 35, NpcId = self, Decrease = FALSE},
	},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P207\n11071_Shain_Tal_Ach.txt


	

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
			Say{Tag = "shainP207_001", String = "Was gibt es?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "shainP207_002", String = "Ihr dürft hier nicht rasten! Das Portal hier führt ins Innere einer der Festungen, das sollte Euch einen Vorteil verschaffen! Ihr müsst weiter!"},
			Answer{Tag = "shainP207_003PC", String = "Zuerst sollten ich mich um Euch kümmern!", AnswerId = 4},
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
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_004", String = "Ihr könnt mir nicht helfen! Ihr müsst weiter! Die Kreaturen ... "},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "shainP207_010PC", String = "Sie sind fort, Ihr seid in Sicherheit, Norcaine!", AnswerId = 11},
		}}

	OnAnswer{5;
		Conditions = {
			IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "shainP207_005PC", String = "Sie sind fort, wir sind in Sicherheit Shain Tal'Ach.", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_006", String = "Ihr kennt mich, Lichtbeter?"},
			Answer{Tag = "shainP207_007PC", String = "Wir haben uns einmal im Nachtflüstertal getroffen. Aber das ist lange her.", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_008", String = "Ich erinnere mich! Ihr habt die Eisernen geschlagen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_009", String = "Dann kann ich Euch vielleicht vertrauen ..."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_011", String = "Nehmt meinen Dank ... auch wenn mein Leben dennoch verwirkt ist!"},
			Answer{Tag = "shainP207_012PC", String = "Wovon sprecht Ihr?", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "shainP207_013", String = "Das ist meine Sache! Euch Lichtbetern ist nicht zu trauen!"},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_015", String = "Ihr Lichtbeter seid schwach! Seht Euch doch an! Anbiederei und Stiefelgeleck sind Eure Tugenden!"},
			Answer{Tag = "shainP207_016PC", String = "Haltet Frieden, ich will Euch nur helfen.", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_017", String = "Wer will schon Hilfe von einem schwafelnden Bettler! Lieber höre ich meinen eignenen Todesschrei als solche Honigklänge! Fort mit Euch!"},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_019", String = "Euch Lichtbeter kann man nicht beleidigen! Ihr seid so niedrig, dass jedes Wort eines Norcaine ein Lob für Euch ist!"},
			Answer{Tag = "shainP207_020PC", String = "Ich habe Euch gerettet Dunkelelf, Euer Leben gehört mir! Und ich kann es Euch ebenso wieder nehmen! Jetzt und hier!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_021", String = "Ah! Ein Kämpfer! Gut!"},
			Answer{Tag = "shainP207_022PC", String = "Ihr habt nicht zu entscheiden, ob ich gut oder schlecht bin, Milchhaut! Und sprecht nicht in Andeutungen!", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Trusted"},
			Say{Tag = "shainP207_023", String = "Ich sehe, Ihr seid vom rechten Geist! Hört zu ..."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_026", String = "Ich bringe schlechte Kunde aus den Landen der Norcaine  ... unser Volk richtet sich selbst zu Grunde!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_027", String = "Eine neue Macht breitet sich unter den Archonen aus ... eine Macht, die widernatürlich ist. Nicht von dieser Welt!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_028", String = "Viele erfreut dieses Geschenk und sie bereiten schon neue Feldzüge gegen das Licht vor! Aber andere, so wie ich, sehen, wie die Seele der Norcaine dadurch verdorben wird!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_029", String = "Unser Volk zerbricht! Die Kaste der Dracon hat sich erhoben, aber wir sind zu wenige! Die Norcaine brauchen jetzt einen starken Anführer, einen der sie wieder zusammenführt!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_030", String = "Deshalb bin ich hier. Ich suche Craig Un'Shallach, den letzten, wahren Dracon! Er muss heimkehren und unser Volk von diesem Einfluss befreien!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_031", String = "Aber der Maskierte hat ihn aus Shal'Dun entführt und irgendwo in den Süden Xus verschleppt!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_032", String = "Nun suche ich ihn, um ihm das Siegel der Norcaine zu bringen, das Zeichen der obersten Herrschaft! Mit diesem Siegel wird er zum rechtmäßgien Führer der Dunkelelfen!"},
			Answer{Tag = "shainP207_033PC", String = "Wenn der Maskierte Craig in den Dschungel gebracht hat, dann werdet Ihr scheitern! Alleine kommt Ihr nie dorthin!", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_034", String = "Ja, das erkenne ich jetzt! Ich bin zu schwach, die Wunden, die meine Brüder mir geschlagen haben, wollen nicht heilen ... Ich kann nicht mehr weiter!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestHint"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[20]Abgeschaltet"},
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
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_014PC", String = "Bitte, erzählt, Ihr könnt mir vertrauen!", AnswerId = 13},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_018PC", String = "Ich rette Euer Leben und Ihr beleidigt mich?", AnswerId = 15},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"}),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_024PC", String = "Sterbt alleine, Dunkelelf, ich bin mit Euch fertig!", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_025PC", String = "Erzählt. Was bringt Euch hierher?", AnswerId = 20},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "QuestHint"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainP207_035PC", String = "Mein Weg führt nach Süden, ich werde versuchen Craig zu finden.", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND(IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagFalse{Name = "Trusted"})),
			Negated(UND( ODER(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"} , IsNpcFlagTrue{Name = "Trusted"}), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "QuestHint"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_036", String = "Er ist ein Dracon, ein großer Kämpfer! Ihr erkennt ihn ..."},
			Answer{Tag = "shainP207_037PC", String = "Ich kenne Craig! Sollte er noch leben, werde ich ihn finden!", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_038", String = "Ihr kennt ihn? Dann ... dann nehmt das Siegel der Norcaine! Bringt es ihm! Sagt ihm er soll heimkehren! Sagt ihm, er soll seinen rechtmäßigen Platz einnehmen und unser Volk von den Fremden befreien!"},
			Answer{Tag = "shainP207_039PC", String = "Was geschieht mit Euch?", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_040", String = "Ich bin schon tot, Runenkrieger. Mein Wille hält mich am Leben, aber die Wunden sind zu tief. Ich werde hier mein Grab finden. Ich werde zu Nor für Euch beten."},
			Answer{Tag = "shainP207_041PC", String = "Ich verstehe. Lebt wohl, Norcaine!", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_042", String = "Lebt wohl! Nor sei mit Euch ... was war das? Habt Ihr das gehört?"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainP207_043", String = "Da! Die Häscher haben mich gefunden! Macht Euch bereit zum Kampf!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP207StartDraconNebenQuest"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end