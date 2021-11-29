-->INFO: Hortar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OneTimeInitAction (ChangeRace {Race = 152} )

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		RemoveDialog {},
	}
}
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 294, Y = 280, Range = 15 , FigureType = FigureAll , UpdateInterval = 20}
	},
	Actions =
	{
--		Outcry { NpcId = 5640 , String = "Wir werden angegriffen! Beschützt mich mit eurem Leben!" , Tag = "" },	
		Goto{X = 279, Y = 264, NpcId = self, Range = 1 , WalkMode = Run , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 294, Y = 280, Range = 15 , Owner = OwnerAll , BuildingId = 0 , UpdateInterval = 20}),
--		Negated(EnemyUnitInRange {X = 294, Y = 280, NpcId = 5640, Range = 15 , UnitId = 0 , UpdateInterval = 20}),
	},
	Actions =
	{
		EnableDialog {},
		QuestBegin {QuestId = 718},
--		Outcry { NpcId = 5640 , String = "Ich ergebe mich! Kommt zu mir, ich habe euch etwas zu sagen!" , Tag = "" },	
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Hortar_geht_zum_Wartepunkt", UpdateInterval = 10},
	},
	Actions =
	{
		RemoveDialog {},
		QuestSolve{QuestId = 718, ActivateNextQuest = FALSE},
		Goto{X = 234, Y = 318, NpcId = self, Range = 1 , WalkMode = Run , GotoMode = GotoNormal , XRand = 0 , YRand = 0},

	}
}

OnIdleGoHome
{
	X = 214, Y = 327, Direction = South, Range = 1, WalkRange = 1,
	WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Ressourcentor_offen", UpdateInterval = 10},
	},
	HomeActions =
	{
		EnableDialog {},
		SetGlobalFlagFalse{Name = "Ressourcentor_offen"},
		RevealUnExplored {X = 214, Y = 327, Range = 15},
	}
}

OnIdleGoHome
{
	X = 214, Y = 355, Direction = South, Range = 1, WalkRange = 1,
	WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{ 

		IsGlobalFlagTrue{Name = "Hortar_geht_zum_Froschtor"},
		
	},
	Actions =
	{
		RemoveDialog {},
		SetGlobalFlagFalse{Name = "Hortar_geht_zum_Froschtor"},
	}
}	
	
OnIdleGoHome
{
	X = 332, Y = 402, Direction = South, Range = 1, WalkRange = 1,
	WalkMode = Run, GotoMode = GotoNormal,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "Nordtor_auf", UpdateInterval = 10},
	},

	HomeActions =
	{
		EnableDialog {},
		SetGlobalFlagTrue{Name = "Hortar_am_Froschtor"},
		SetGlobalFlagFalse{Name = "Nordtor_auf"},
	}
}



-- Cutscene Init Frogs
Umspawn
{
	UnitId = self, Clan = 0, X = 332, Y = 402, Target = None, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitFrogs", UpdateInterval = 5},
		-- Negated(FigureInRange{NpcId = self, X = 332, Y = 402, Range = 5}),		
	}, 
	Actions = 
	{
		RemoveDialog {},
		SetGlobalFlagFalse {Name = "CutsceneInitFrogs"},				
	},
}




	

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p103\n5640_Hortar.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagHortarKnown"},
		},
		Actions = {
			Say{Tag = "hortar103_001", String = "Es ist nicht nötig mich zu erschlagen, Runenknecht! Ich ... ich habe Geld ..."},
			Answer{Tag = "hortar103_002PC", String = "Ich trachte nach Runensteinen, nicht nach Eurem Beutel, Handlanger!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagHortarKnown"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hortar103_003", String = "Der Runenstein des Reowys? Ha! Reowys ist der letzte Grund, der verhindert, dass ich nicht schon längst mit Whorims Gold durchgebrannt bin! An diese Rune kommt Ihr nicht heran!"},
			Answer{Tag = "hortar103_004PC", String = "Wie unvorteilhaft - für uns beide ...", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hortar103_005", String = "Nicht so schnell, nicht so schnell! Ich kann Euch helfen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hortar103_006", String = "Es gibt ein Nachschublager gleich in der Nähe. Ich werde es Euch öffnen, als Zeichen meines guten Willens. Dann erkläre ich Euch, wie Ihr Whorim schlagen könnt!"},
			Answer{Tag = "hortar103_007PC", String = "Also gut, geht voran. Wollen wir hoffen, dass Eure Hinweise etwas taugen, Verräter!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Hortar_geht_zum_Wartepunkt"},
			SetPlayerFlagTrue{Name = "FlagHortarKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
			IsGlobalFlagTrue{Name = "Hortar_Quests"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Hortar_Quests"}),
		},
		Actions = {
			Say{Tag = "hortar103_013", String = "Hier haben die Orks ein paar Waren gelagert. Bedient Euch, ich hoffe, sie sind Euch von Nutzen!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagTrue{Name = "Waldschrate_tot"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Waldschrate_tot"}),
		},
		Actions = {
			Say{Tag = "hortar103_012", String = "Höre ich da nicht einen Waldschrat knurren? Solange nur eine dieser Bestien noch am Leben ist, gehe ich da nicht hinaus!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Froschitem_dabei", UpdateInterval = 10}),
		},
		Actions = {
			Say{Tag = "hortar103_011", String = "Geht und besorgt mir die Flöte von Svera! Ohne sie können wir unseren Weg nicht fortsetzen."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			IsGlobalFlagTrue{Name = "Froschitem_dabei", UpdateInterval = 10},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Hortar_hat_Froschitem"}),
		},
		Actions = {
			Say{Tag = "hortar103_009", String = "Ah, Ihr habt die Flöte, sehr gut! Damit kann ich die Kriecher auf die Wachen treiben."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagTrue{Name = "Hortar_hat_Froschitem"},
		},
		Actions = {
			Say{Tag = "hortar103_008", String = "Nun geht schon, dann werde ich das Tor öffnen."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hortar103_010", String = "Es könnte gefährlich werden! Zieht Euch mit Euren Truppen hinter den Felsübergang im Westen zurück, dann werde ich sie frei lassen."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Avatar_soll_sich_zurueckziehen"},
			SetItemFlagFalse{Name = "PlayerHasItemFroschitem"},
			SetGlobalFlagTrue{Name = "Hortar_hat_Froschitem"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hortar103_014", String = "Nun zu meinem Plan ... Whorim haust auf dem Rotfels oben im Osten. Der einzige Weg dort hinauf führt durch das alte Flussbett."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hortar103_015", String = "Aber der Aufgang wird von den besten Kriegern der Orks bewacht! Nehmt es mir nicht übel, aber da kommt Ihr mit Euren Truppen nicht durch."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hortar103_016", String = "Aber es gibt etwas, mit dem man die Orkwachen aus dem Weg räumen kann! Sveras Kriecher! Widerliche Biester, aber stark! Sie hören allerdings nur auf Sveras Flöte!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hortar103_017", String = "Also brauchen wir diese Flöte! Svera hat ihr Lager im Nordwesten, dort wird sie zu finden sein! Wenn Ihr sie habt, gehen wir weiter."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hortar103_018", String = "Nein wartet! Eins noch! Whorim hält sich diese widerlichen Waldschrate. Sie streifen den ganzen Tag vor dem Gehege der Kriecher herum!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hortar103_019", String = "Seht zu, dass sie verschwinden! Vorher mache ich keinen Schritt da raus, ich hasse diese Bestien!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 591}, QuestBegin {QuestId = 592}, QuestBegin {QuestId = 593},
			SetGlobalFlagTrue{Name = "Hortar_Quests"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end