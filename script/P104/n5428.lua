-->INFO: Lea
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


Despawn
{
	Conditions =
	{
		QuestState {QuestId = 585, State = StateSolved},
	},
}

--OnFollowMe
--{
--	X = 405, Y = 106, Direction = SouthEast, LeadRange = 20,
--	Conditions =
--	{
--		IsNpcFlagTrue {Name = "ZeigeOrkLager"},
--		IsNpcFlagFalse {Name = "SpielerImOrkCamp"},
--		IsNpcFlagFalse {Name = "LeaBlocker"},
--	},
--	Actions =
--	{
--	},
--	HomeActions =
--	{
--		SetNpcFlagTrue {Name = "LeaBlocker"},
--	},
--}

-- umspawn flag setzen bei spielertod
OnToggleEvent
{
	OnConditions = 
	{
		FigureDead{NpcId = Avatar},
	},
	OnActions = 
	{
	},
	OffConditions = 
	{
		FigureAlive{NpcId = Avatar},
	},
	OffActions = 
	{
		SetNpcFlagTrue{Name = "BitteUmspawnen"},
	}
}
-- umspawn flag setzen bei plattformwechsel
OnPlatformOneTimeEvent
{
	Conditions =
	{
	},
	Actions = 
	{
		SetNpcFlagTrue{Name = "BitteUmspawnen"},
	}
}

--OnOneTimeEvent	-- gleich wieder löschen beim allerersten mal (verhindert vor- bzw. nach-cutscene umspawn-problem)
NewState{Name = "AvoidUmspawnAfterMapStartCutscene"}
AddTransition
{
	From = "_IDLE", To = "AvoidUmspawnAfterMapStartCutscene", RemoveTransitionAfterUse = TRUE,
	Conditions = {IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 1}},
	Actions = {SetNpcFlagFalse{Name = "BitteUmspawnen"}},
}
AddTransition
{
	From = "AvoidUmspawnAfterMapStartCutscene", To = "_IDLE", RemoveTransitionAfterUse = TRUE,
	Conditions = { }, Actions = { },
}


Umspawn 
{
	UnitId = self, 
	Clan = 0, 
	X = startX, 
	Y = startY,
	Target = Avatar,
	NoSpawnEffect = FALSE,
	OnlyOnce = FALSE,
	Conditions = 
	{
		ODER                                       
		(                                  
			AvatarLocalTeleport{},
			IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3}
		),
		IsNpcFlagFalse {Name = "LenaNichtUmspawnen"},
	}, 
	Actions = 
	{
		Follow {Target = Avatar},
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		RemoveDialog {},	
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "ZeigeOrkLager"},
		IsNpcFlagFalse {Name = "SpielerImOrkCamp"},
		IsNpcFlagFalse {Name = "LeaBlocker"},
	},
	Actions =
	{
		Follow {Target = Avatar},
	}
	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsMonumentInUse {X = 386, Y = 146, Range = 0},
	},
	Actions =
	{
		StopFollow {Target = Avatar},
		SetNpcFlagTrue {Name = "LeaBlocker"},
		SetNpcFlagTrue {Name = "LenaNichtUmspawnen"},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		RevealUnExplored {X = 341, Y = 264, Range = 5},
	}
}


 --Lea  wartet am Lager so lange der Spieler hier aufbaut
OnIdleGoHome
{
	WalkMode = Run, X = 376, Y = 151, Direction = 0,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "LeaGehtZumPass"},
		--IsGlobalFlagTrue {Name = "LeaEinsFertig"},
		IsMonumentInUse {X = 386, Y = 146, Range = 0},
		IsNpcFlagTrue {Name = "LeaBlocker"},
		IsGlobalFlagFalse {Name = "LeaAmPass"},
		IsGlobalFlagFalse {Name = "P104_LenaGehtZuDenElfen"},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "LeaImOrkCamp"},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 376, Y = 151, Direction = 0,
	Conditions =
	{
		IsMonumentInUse {X = 386, Y = 146, Range = 0, UpdateInterval = 10},
		IsNpcFlagFalse {Name = "LeaImOrkCamp"},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "LagerDialog"},
		SetNpcFlagTrue {Name = "LeaImOrkCamp"},
	}
}



 --Lea  geht zum ELfenlager
OnIdleGoHome
{
	WalkMode = Run, X = 300, Y = 215, Direction = 0,
	Conditions =
	{
		--IsGlobalFlagTrue{Name = "LeaGehtZumPass"},
		--IsGlobalFlagFalse {Name = "LeaAmPass"},
		IsGlobalFlagTrue {Name = "P104_LenaGehtZuDenElfen"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "LeaAmPass"},
	},
	HomeActions =
	{
		SetGlobalFlagFalse {Name = "P104_LenaGehtZuDenElfen"},
		SetNpcFlagTrue {Name = "P104_LenaDialogElfenlager"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "P104_LenaDialogElfenlager"},
	},
	Actions =
	{
		EnableDialog {},
	}
}

--SwapBlocker
OnOneTimeEvent 
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "ElfenLagerDialog"},
		IsGlobalFlagFalse {Name = "p104_LenaDurchsTorElfen"},
		FigureInRange {X = 301, Y = 248, Range = 5}
	},
	Actions =
	{
		EnableDialog {},
	}
}

 --Lea  geht ins Elfenlager
OnIdleGoHome
{
	WalkMode = Run, X = 301, Y = 248, Direction = 0,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "FugitivesGate1", Seconds = 20},
		IsGlobalFlagFalse {Name = "p104_LenaDurchsTorElfen"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "p104_LenaDurchsTorElfen"},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "ElfenLagerDialog"},
	}
}

 --Lea  geht zum Tor mit den Eiselfen
OnIdleGoHome
{
	WalkMode = Run, X = 443, Y = 337, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DENearElfenlager"},
		IsGlobalFlagFalse {Name = "Vorbereitung"},
		IsNpcFlagTrue {Name = "LeaBlocker"},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "FugitivesReachedPosition2"},
		--SetGlobalFlagTrue {Name = "Vorbereitung"},
		SetGlobalFlagFalse {Name = "LeaAmPass"},
		
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "P104_LenaAmEiselfentor"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "P104_LenaAmEiselfentor"},
	},
	Actions =
	{
		EnableDialog {},
	}
}



--Lea geht zur Garnison
OnIdleGoHome
{
	WalkMode = Run, X = 240, Y = 445, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "TorAufLeaLos"},
		--IsGlobalFlagTrue {Name = "SpawnenDerElfen"},
		IsNpcFlagTrue {Name = "LeaBlocker"},
		IsGlobalFlagFalse {Name = "InGarnison"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "Vorbereitung"},
		
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "InGarnison"},
		IncreaseGlobalCounter {Name = "DraconWanderCounter"},
		--EnableDialog {},
	}
}




-- Der SPieler hat das Lager mit Leas Hilfe gefunden, also bekommt sie erst mal den Follow abgeschaltet
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "LeaDorfBefreit"},
		IsNpcFlagTrue {Name = "LeaBlocker"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "SpielerImOrkCamp"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "InGarnison"},
	},
	Actions =
	{
		EnableDialog {},
	}
}


OnIdleGoHome
{
	WalkMode = Run, X = 157, Y = 361, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "FugitivesMovingToPosition5"},
		IsGlobalFlagTrue{Name = "InGarnison"},
		IsGlobalFlagFalse {Name = "P104_LenaAmPortal"}
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "P104_LenaAmPortal"}
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 162, Y = 358, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "LenaGeht"},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "LenaDespawn"},
	}
}


Despawn
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "DespawnLena", Seconds = 50},
		IsGlobalFlagTrue {Name = "LenaDespawn"},
		IsGlobalFlagTrue {Name = "P104_DraconTot"},
		QuestState {QuestId = 584, State = StateActive},
	},
	Actions =
	{
		QuestSolve {QuestId = 584},
		QuestBegin {QuestId = 585},
	},
}

Despawn
{
	Conditions =
	{
		QuestState {QuestId = 584, State = StateSolved},
	},
	Actions =
	{
	},
}
----------------------------------------------------------------------------
--
-- Sterben und Dialoge Block, der wird etwas größer, weil für jede Dialog-
-- bedingung, auch wenn es sie schon als Event in n0 gibt, ein extra Script 
-- nötig ist, damit der Dialog immer an ist so lange die Bedingungen gelten
--
-----------------------------------------------------------------------------
--
--
--OnEvent
--{
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "FugeesHabenHunger"},
--		IsGlobalFlagTrue {Name = "FugeesHabenHungerDialogReon"},
--		IsNpcFlagFalse {Name = "LeaTot"},
--	},
--	Actions =
--	{
--		EnableDialog {},
--		SetNpcFlagTrue {Name = "LeaTot"},
--	},
--}
--
--OnEvent
--{
--	Conditions =
--	{
--		IsGlobalFlagTrue{Name = "LeaAmPass"},
--		IsNpcFlagFalse {Name = "LeaTotII"},
--		IsGlobalFlagFalse {Name = "SpielerHatElfen"},
--	},
--	Actions =
--	{
--		EnableDialog {},
--		SetNpcFlagTrue {Name = "LeaTotII"},
--	}
--}
--
--OnEvent
--{
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "ZeigeSeelenstein1"},
--		IsNpcFlagFalse {Name = "LeaTot"},
--	},
--	Actions =
--	{
--		SetNpcFlagTrue {Name = "LeaTot"},
--		EnableDialog {},
--	}
--}
--
--
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\P104\n5428_Lea.txt


	

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "lea104_001", String = "Freund?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_003", String = "Das sollten wir, es bleibt nicht mehr viel Zeit."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_004", String = "Hoffen wir, dass die Torgs nicht schon alles geplündert haben. Sobald wir einen Stützpunkt haben, können wir den Flüchtlingen Schutz gewähren."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ZeigeOrkLager"}, SetGlobalFlagTrue {Name = "LeaEinsFertig"}, SetGlobalFlagFalse {Name = "ZeigeSeelenstein1Blocker"}, QuestBegin {QuestId = 574}, QuestBegin {QuestId = 575}, SetGlobalFlagTrue {Name = "OrkLagerBlocker"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
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
		},
		Actions = {
			Say{Tag = "lea104_007", String = "Die Leute sind völlig erschöpft! Die meisten waren nie gut genährt und die letzten Tage haben es auch nicht besser gemacht."},
			Answer{Tag = "lea104_008PC", String = "Was können wir tun?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_009", String = "Wir müssen den Leuten Nahrung besorgen, sonst brechen sie uns zusammen. So schaffen sie den Weg in die Berge nie!"},
			Answer{Tag = "lea104_010PC", String = "Sie sollen sich aus meinen Lagern nehmen, was sie brauchen.", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_011", String = "Ich werde es ihnen sagen. Sobald sie wieder gestärkt sind, können wir weiterziehen."},
			Answer{Tag = "lea104_012PC", String = "Sie sollen sich beeilen, hier sind wir nicht sicher!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			 SetGlobalFlagFalse {Name = "FugeesHabenHunger"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
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
			Say{Tag = "lea104_014", String = "Das müssen wir! Noch plündern die Imperialen das Orkdorf, aber sie werden nicht lange zögern, um uns nachzusetzen."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_015", String = "Ich werde die Flüchtlinge den Berg hinauf führen. Halte die Imperialen auf, so lange du kannst! Benutze das Monument und die Befestigungen der Elfen ... damit solltest du sie eine Weile aufhalten können!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "SpielerHatElfen"}, SetGlobalFlagTrue {Name = "DialogElfenlager"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
			Say{Tag = "", String = ""},
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
			Say{Tag = "lea104_017", String = "Der Weg ins Eis ist verschlossen! Verflucht seien die Elfen und ihre Tore!"},
			Answer{Tag = "lea104_018PC", String = "Was tun wir jetzt? Jemand aus der Feste muss es doch öffnen können!", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_019", String = "Nein, die Schlüsselbewahrerin der Feste ist gefallen! Es gibt aber noch einen Außenposten der Winterwacht, einige Meilen westlich von hier. Dort gibt es eine weitere Schlüsselbewahrerin!"},
			Answer{Tag = "lea104_020PC", String = "Genau, was wir jetzt brauchen ... noch mehr Verzögerungen! Also gut, bleib hier bei den Flüchtlingen, ich werde nach der zweiten Bewahrerin suchen!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_021", String = "Nimm ein paar Leute der Winterwacht mit, diese Berge sind auch ohne die Imperialen gefährlich!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "DialogElfenGeben"}, SetGlobalFlagTrue {Name = "Schluessel"}, SetGlobalFlagTrue {Name = "DunkelElfenAttacken"}, SetGlobalTimeStamp {Name = "DETimer"}, SetGlobalFlagFalse {Name = "ElfenGeben"}, QuestBegin {QuestId = 578},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
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
			Say{Tag = "lea104_023", String = "Ein paar Kinder sind fortgelaufen! Ihre Eltern suchen sie bereits, aber wir können nicht mehr warten! Wenn sie sich doch nur beeilen würden!"},
			Answer{Tag = "lea104_024PC", String = "Zieht weiter! Ich kümmere mich darum!", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "SpawnenDerElfen"}, SetGlobalFlagFalse {Name = "DunkelElfenAttacken"}, QuestBegin {QuestId = 579}, QuestBegin {QuestId = 580}, QuestBegin {QuestId = 581}, QuestBegin {QuestId = 582}, QuestBegin {QuestId = 583},
			Say{Tag = "lea104_025", String = "Gut, wir sind auf dem Weg! Beeil dich! Komm nach, sobald du kannst!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_026", String = "Und ... Danke! Es ist gut, dass du hier bist, ohne deine Hilfe ..."},
			Answer{Tag = "lea104_027PC", String = "Nun geh schon, wir sehen uns auf dem Gipfel.", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_029", String = "Halte sie fern, so lange du kannst! Die Elfen der Garnison werden dich unterstützen!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_030", String = "Der Dracon kocht vor Wut! Mach dich auf einen harten Kampf gefasst."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "GarnisonsTruppenDialog"}, SetGlobalFlagTrue {Name = "TruppenSchonGegeben"}, QuestSolve {QuestId = 583}, QuestBegin {QuestId = 584},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lea104_032", String = "Einer ist gleich hier beim Portal. Oben in den Bergen gibt es weitere und noch einen hier im Sumpf, auf der großen Insel im Osten."},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "Seelenstein"}, SetGlobalFlagTrue {Name = "SeelenSteinGezeigt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ,
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_002PC", String = "Holen wir uns diese Orksiedlung!", AnswerId = 1},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_006PC", String = "Das Land ist zu offen. Wir können hier nicht lange aushalten!", AnswerId = 5},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"}),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_013PC", String = "Können wir diese Festung für uns einsetzen?", AnswerId = 10},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			IsGlobalFlagTrue {Name = "ElfenGeben"},
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_016PC", String = "Worauf wartet Ihr?", AnswerId = 14},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"}),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_022PC", String = "Warum seid Ihr noch hier? Wir müssen weiter!", AnswerId = 19},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"}),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_028PC", String = "Schaff die Leute durch das Portal! Sie werden bald hier sein!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			IsNpcFlagTrue {Name = "IchWerdeNieWahr"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lea104_031PC", String = "Gibt es hier Seelenfelsen?", AnswerId = 27},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse{Name = "LeaDorfBefreit"}, IsGlobalFlagFalse {Name = "FugeesHabenHunger"}) ),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
			Negated(UND(IsGlobalFlagTrue {Name = "LeaAmPass"}, IsGlobalFlagFalse {Name = "DialogElfenlager"})),
			Negated(IsGlobalFlagTrue {Name = "ElfenGeben"}),
			Negated(UND(UND(IsGlobalFlagTrue {Name = "DEAngriffTot"}, IsGlobalFlagFalse {Name = "InGarnison"}), IsGlobalFlagTrue {Name = "P104_NeverNeverNeverTrue"})),
			Negated(UND(IsGlobalFlagTrue {Name = "InGarnison"}, IsGlobalFlagFalse {Name = "TruppenSchonGegeben"})),
			Negated(IsNpcFlagTrue {Name = "IchWerdeNieWahr"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end