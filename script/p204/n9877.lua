-->INFO: Ishtar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},	
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_9877"},				
	}
}


OnIdleGoHome
{
	X = _X, Y = _Y, Direction = South, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P204_IshtarHomepoint", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


Umspawn
{
	UnitId = self, X = 195, Y = 185, NoSpawnEffect = TRUE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_IshtarSpawnt", UpdateInterval = 60},
	},
	 Actions = 
	 {
		ChangeRace{Race = 152, NpcId = self},	 
	    SetGlobalFlagTrue{Name = "g_P204_IshtarHomepoint"},
	    SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9877"},
		Goto {X = 167, Y = 197, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoNormal},	 
	 },
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_IshtarZumTor", UpdateInterval = 60},
	},

	Actions =
	{
		Goto {X = 334, Y = 169, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_IshtarVerstecktSich", UpdateInterval = 60},
	},

	Actions =
	{
		Goto {X = 331, Y = 177, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_IshtarNachHause", UpdateInterval = 60},
	},

	Actions =
	{
		Goto {X = 277, Y = 202, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	   	FigureInRange {X = 277, Y = 202, NpcId = self , Range = 1, UpdateInterval = 60},	
		IsGlobalFlagTrue {Name = "g_P204_IshtarNachHause", UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_9877"},	
		SetGlobalFlagFalse {Name = "g_P204_IshtarSpawnt"},			
		SetGlobalFlagFalse {Name = "g_P204_IshtarHomepoint"},	
		SetGlobalFlagFalse {Name = "g_P204_IshtarNachHause"},			
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n9877_Ishtar.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagIshtarKnown"},
		},
		Actions = {
			Say{Tag = "ishtarP204_001", String = "Runenkrieger?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagIshtarKnown"}),
		},
		Actions = {
			Say{Tag = "ishtarP204_002", String = "Willkomen in Empyria, Runenkrieger. Ich bin Ishtar, Kommandant der Stadtwache!"},
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
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_003", String = "Ihr solltet vorsichtig sein, Freund. Jemand sehr einflussreiches möchte, dass Ihr verschwindet. Und zwar endgültig!"},
			Answer{Tag = "ishtarP204_004PC", String = "Und wer ist das?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_005", String = "Das weiß ich nicht. Aber General Yrmir hat Order gegeben, Euch nicht in die obere Stadt zu lassen!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_006", String = "Ich hege keinen Groll gegen Euch, aber gebt mir auch besser keine Gelegenheit dazu. Haltet Frieden!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_007", String = "Ich habe genug Ärger mit den Traumstaubhändlern und den Vermisstenfällen! Ich kann nicht noch einen kampfeswütigen Runenkrieger gebrauchen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIshtarKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIshtarKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIshtarKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIshtarKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIshtarKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIshtarKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIshtarKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIshtarKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_009", String = "Ganz einfach, sie verkaufen Traumstaub!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_010", String = "Die Gesetze des Kaisers verbieten dieses Mittel, es sei denn, er wird von einem Heiler verordnet! Es benebelt den Geist!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_011", String = "Was bedeuted, dass jeder, der es trotz der Gesetze beschaffen kann, damit unter der Hand ein Vermögen verdient! Reiche Leute zahlten sehr gut für solcherart Kurzweil."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_012", String = "Die Händler sind gewitzt, sie riechen unsere Spitzel irgendwie, wir kommen ihnen nicht bei! Ihre Ahnen mögen verflucht sein!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_013", String = "Sollte Euch jemand Traumstaub anbieten, habt Ihr meine hochoffizielle Erlaubnis kurzzeitig das zu vergessen, was ich über kampfeswütige Runenkrieger gesagt habe!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_014", String = "Jedes Gramm Traumstaub und jeder Händler, die ich von der Strasse habe, ist ein Segen für diese Stadt!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_015", String = "Besonders dieser Brigor! Er ist der schlimmste von ihnen! Zweimal haben wir ihn schon gefasst, aber jedesmal ist er entwischt!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_016", String = "Nun ist er so vorsichtig, das meine Spitzel überhaupt nicht mehr an ihn herankommen! Ich weiß einfach nicht wo er sich versteckt!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_017", String = "Er kennt die größten Traumstaublager in Empyria! Wenn ich ihn lebend bekäme, wäre mir das eine ordentliche Belohnung wert!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			SetGlobalTimeStamp{Name = "g_P204_CounterBrigorSpawnt"}, QuestBegin {QuestId = 1024}, QuestBegin {QuestId = 1025}, QuestBegin {QuestId = 1026},
			SetGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[9]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{20;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{20;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{20;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_019", String = "Verdammt! Stimmt, er hat geschworen, dass er nie wieder eine Nacht in unserem Kerker verbringen wird, er hätte sich nie lebend fangen lassen."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_020", String = "Wenigstens ist dieser räudige Hund von unseren Strassen! Ohne seine Lieferungen werden einige der Traumstaubhändler auf dem Trockenen sitzen! Das allein ist viel wert!"},
			Answer{Tag = "ishtarP204_021PC", String = "Wo wir gerade von Wert sprechen ...", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_022", String = "Ja, natürlich, Ihr sollt Eure Bleohnung bekommen. Hier! Gutes Geld für einen guten Bürger Emyprias!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 1026}, TransferMoney{Gold = 10, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[21]Abgeschaltet"},
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
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{26;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(IsGlobalCounter {Name = "gc_P204_CounterTraumstaub", Value = 3, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "ishtarP204_026", String = "Ich frage Euch jetzt nicht, wie Ihr daran gekommen seid. Aber ich nehme ihn, wenigstens ist er von der Strasse!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{28;
		Conditions = {
			IsGlobalCounter {Name = "gc_P204_CounterTraumstaub", Value = 3, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "ishtarP204_024", String = "Tut mir leid, den müsst Ihr behalten! Wir wurden angewiesen, keinen Traumstaub mehr aufzukaufen!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_025", String = "Angeblich wegen Geldmangels! Aber wenn Ihr mich fragt, dann wird irgend jemand da oben bestochen!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_204_KeinTraumstaubMehr"}, QuestSolve {QuestId = 1025},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{33;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{33;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{33;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_027PC", String = "Gut, hier, nehmt ihn.", AnswerId = 35},
			OfferAnswer{Tag = "ishtarP204_029PC", String = "Nein, ich behalte ihn!", AnswerId = 39},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_028", String = "Danke. Ihr habt dieser Stadt einen Dienst erwiesen!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7220, Amount = 1, Flag = Take},
			TransferXP {XP = 3000, Flag = Give},
			IncreaseGlobalCounter {Name = "gc_P204_CounterTraumstaub", Step = 1},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{38;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{38;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{38;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_030", String = "Ihr solltet ihn mir besser geben! Das wirft kein gutes Licht auf Euch!"},
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
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_032", String = "Alles was Ihr wollt, kurz gesagt! Die Stadt teilt sich in sechs Bereiche, in denen es von Gift bis Liebe so ziemlich alles zu kaufen gib!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_033", String = "Das hier ist die Unterstadt. Hier lebt das gemeine Volk, die Arbeiter und Handwerker. Von hier aus geht es in den Basar, das Tempelviertel und den Zirkus."},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "ishtarP204_034", String = "Am höchsten Punkt der Stadt trohnt der Palast des Kaisers und ganz unten, vor den Toren findet Ihr das Armenviertel."},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
			OfferAnswer{Tag = "ishtarP204_063PC", String = "Was haltet Ihr von Eurer neuen Kasierin?", AnswerId = 87, Color = ColorDarkOrange},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "ishtarP204_034", String = "Am höchsten Punkt der Stadt trohnt der Palast des Kaisers und ganz unten, vor den Toren findet Ihr das Armenviertel."},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_036", String = "Das ist der grosse Markt, würde sagen der größte in ganz Xu. Er liegt in der Mitte der Stadt und die meisten Bürger gehen täglich dorthin."},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_037", String = "Bis auf das Armenviertel hat jeder Bereich der Stadt einen Zugang zum Basar. Man könnte sagen, er ist das Zentrum der Stadt."},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_038", String = "Dort findet Ihr alles, was das Herz begehrt, vor allem aber die wichtigsten Exportgüter der Stadt: Tücher, Gewürze und Gold! Viele fahrende Händler haben dort ihre Zelte aufgeschlagen und bieten ihre Waren feil!"},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_039", String = "Der Basar wird von den Palastwachen überwacht, von daher ist es da recht sicher. Sie sind besser ausgebildet und bewaffnet als meine Stadtwachen!"},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "BasarInfo"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
			OfferAnswer{Tag = "ishtarP204_063PC", String = "Was haltet Ihr von Eurer neuen Kasierin?", AnswerId = 87, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_041", String = "Der höchste Punkt der Stadt! Dort regiert seine Majestät der Kasier,s tets bewacht von dem bronzenen Riesen, den seine Vroväter einst bauen ließen!"},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_042", String = "Östlich des Palastes ist die Garnison der Goldenen Garde, der Palastwache. General Yrmir führt dort ein hartes Regiment."},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_043", String = "Im Westend es Palastes liegt der Garten, der schönste Ort in ganz Empyira, wenn Ihr mich fragt! Aber dort haben nur wenige Zutritt, in seiner Mitte liegt nämlich das Portal zu dem rätselhaften Dryadenhain!"},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_044", String = "Der Kaiser lässt dieses Portal argwöhnsich bewachen!"},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "PalaceInfo"},
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
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
			OfferAnswer{Tag = "ishtarP204_063PC", String = "Was haltet Ihr von Eurer neuen Kasierin?", AnswerId = 87, Color = ColorDarkOrange},
		}}

	OnAnswer{59;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_046", String = "Das ist ein wunderlicher Ort! Ihr müsst wissen, hier in Empyria gibt es nur einen Gott und das ist der Kaiser selbst!"},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_047", String = "Aber viele Händler, die hier durchreisen, gehören dem Wächterglauben an und die Priester der Wächtergötter sind ein wahrer Segen, denn sie heilen und helfen wo sie können!"},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_048", String = "Also hat der Kaiser ihnen einfach erlaubt hier einige Tempel zu bauen. Sie dürfen ihre Rituale und Gebete ausführen und Gottesdienste halten, vorausgesetzt sie bleiben damit im Tempelviertel."},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_049", String = "Und ich glaube, ich muss mir irgendwann noch einmal diesen Puppenspieler und sein Theater der blauen Rose vorknöpfen!"},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_050", String = "Seitdem die sich im Tempelviertel eingenistet haben, sind hier einige Morde geschehen, bei denen man eine blaue Rose an der Leiche gefunden hat!"},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_051", String = "Ich möchte wetten, dieses Puppentheater ist nur Maskerade für eine Gruppe von Assassinen! Vielleicht sogar eine Assassinengilde!"},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "TempleInfo"},
			SetGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
			OfferAnswer{Tag = "ishtarP204_063PC", String = "Was haltet Ihr von Eurer neuen Kasierin?", AnswerId = 87, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_053", String = "Ja, das ist ein leidiges Thema ... man nennt Empyria die goldene Stadt und doch leben da Leute in Armut und Schlamm direkt vor den Stadtoren. Es ist ein Elend!"},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_054", String = "Wir nennen es auch das Fremdenviertel. Jeder Einwanderer muss erst einmal dort bleiben, bis er eine Arbeit gefunden hat. und jeder, der seine Arbeit verliert, wird fürher oder später dorthin verstossen."},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_055", String = "Ich hasse es, weil ich gesehen habe wie gute Menschen dort zugrunde gegangen sind, die einfach mal Pech hatten! Und die Stadt ist dadurch auch nicht ruhiger geworden!"},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_056", String = "Findige Diebe wie Alyah oder dieser McWinter haben sowieso immer einen Weg parat um wieder Unfrieden zu stiften! Ich wünschte, ich könnte meinen Leuten mehr bezahlten, dann wären sie nicht so verflucht bestechlich!"},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_057", String = "Ihr solltet dort draussen vorsichtig sein! Es gibt einige Banden, die würden Euch schon Eurer Kleidung und Waffen wegen über die Klinge sprignen lassen!"},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "SlumsInfo"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
			OfferAnswer{Tag = "ishtarP204_063PC", String = "Was haltet Ihr von Eurer neuen Kasierin?", AnswerId = 87, Color = ColorDarkOrange},
		}}

	OnAnswer{76;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_059", String = "Vor allem Schaukämpfe. Der Kaiser hat wenig Gefallen daran, von daher ist die Arena ziemlich verfallen. Aber es gibt immer noch Gladiatoren und Bestien die sich dort ab und an die Schädel einschlagen."},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_060", String = "Unfug, wenn Ihr mich fragt, es gibt genug Blutvergiessen hier! Aber Ihr könnt im Zirkus etwas übers kämpfen lernen, einige der Gladiatoren sind recht geschickt!"},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_061", String = "Und nördlich der Arena liegt die kaiserliche Bank von Empyria! Das ist etwas Besonderes und wir sind recht stolz darauf, obwohl ich als Soldat nicht ganz verstehe, was da vor sich geht."},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "CircusInfo"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
			OfferAnswer{Tag = "ishtarP204_063PC", String = "Was haltet Ihr von Eurer neuen Kasierin?", AnswerId = 87, Color = ColorDarkOrange},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[87]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_035PC", String = "Was ist der Basar?", AnswerId = 46, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_040PC", String = "Erzählt mir über den Palast.", AnswerId = 53, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_045PC", String = "Was ist das Templeviertel?", AnswerId = 60},
			OfferAnswer{Tag = "ishtarP204_052PC", String = "Sprechen wir über das Armenviertel ...", AnswerId = 69, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_058PC", String = "Was gibt es im Zirkus?", AnswerId = 77, Color = ColorDarkOrange},
			OfferAnswer{Tag = "ishtarP204_062PC", String = "Danke für die Auskunft, Kommandant.", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{86;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{86;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{86;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{86;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{86;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{86;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{86;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{86;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_064", String = "Ich kann es immer noch kaum glauben! Aber Alyah hat ein gutes Herz, sie wird eine wundervolle Kaiserin werden!"},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_065", String = "Sie hat immer noch Kummer wegen Urias, Eurem Gefährten, der gefallen ist. Aber die Liebe des Volkes sollte Ihr Trost spenden."},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_066", String = "Denn die Menschen von Empyria lieben sie schon jetzt wie keinen Kaiser jemals zuvor!"},
			Answer{Tag = "", String = "", AnswerId = 90},
		}}

	OnAnswer{90;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_067", String = "Vielleicht sollte jeder Kaiser mal ein paar Jahre als Dieb im Armenviertel leben ... es scheint zu wirken!"},
			Answer{Tag = "ishtarP204_068PC", String = "Mag sein. Auch unsere Reise hat sie verändert.", AnswerId = 91},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_069", String = "Ja, Eure Taten und die Ehre und Opferbereitschaft von Urias haben sie mehr berührt als sie zugeben will."},
			Answer{Tag = "ishtarP204_070PC", String = "Wisst Ihr, ich glaube Urias ist gar nicht wirklich tot. Ich glaube, er lebt nun in ihrem Herzen und errinnert sie fortwährend, in seinem allerpentrantesten Heldentone, an ihre eigene Ehre ... und an die Verantwortung, die sie jetzt trägt.", AnswerId = 92},
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ishtarP204_071", String = "Ha, ja, so wird es sein! Ihr habt viel für uns getan, Runenkrieger, mehr als Ihr vielleicht ahnt. Ich hoffe Ihr bleibt siegreich in Eurem Kampf ... und wir sehen und vielleicht eines Tages wieder."},
			Answer{Tag = "ishtarP204_072PC", String = "Ja, vielleicht ... wer weiss. Lebt wohl, Ishtar.", AnswerId = 93},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[87]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 95},
		}}

	OnAnswer{95;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{95;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{95;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{95;
		Conditions = {
			UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_008PC", String = "Was habt Ihr für Ärger mit den Traumstaubhändlern?", AnswerId = 9},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{95;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{95;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} ),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_018PC", String = "Brigor ist tot!", AnswerId = 21},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{95;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_023PC", String = "Ich habe hier etwas Traumstaub!", AnswerId = 27},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}

	OnAnswer{95;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse{Name = "gf_204DummyNeverSetTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[9]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P204_BrigorKilled"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[21]Abgeschaltet"} )),
			Negated(UND(PlayerHasItem{ItemId = 7220}, IsGlobalFlagTrue{Name = "gf_204IshtarDreamsandTold"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ishtarP204_031PC", String = "Was gibt es sonst noch in der Stadt?", AnswerId = 43},
		}}


	EndDefinition()
end