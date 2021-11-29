-->INFO: Khal
--> Khal unkillable

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



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
	UnitId = self , 
	Clan = 0 , 
	X = startX , 
	Y = startY ,
	Target = Avatar ,
	NoSpawnEffect = FALSE ,
	OnlyOnce = FALSE,
	Conditions = 
	{
		ODER                                       
		(                                  
			AvatarLocalTeleport{},
			IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3}
		),
		IsGlobalFlagTrue {Name = "g_sP209KhalFollow"}, 
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10085"},
		Follow{Target = Avatar},
		
	}
}

OnFollowToggle
{
		Target = Avatar,
		NpcId = self,
		FollowOnlyOnce = FALSE,
		FollowConditions = 
		{
			IsGlobalFlagTrue {Name = "g_sP209KhalFollow"},
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagFalse {Name = "g_sP209KhalFollow"}
		},
		StopFollowActions = {},
}


OnIdleGoHome
{
	X = _X,
	Y = _Y,
	Direction = South,
	Range = 3,
	WalkRange = 5, 
	WaitTime = 0, 
	WalkMode = Run, 
	GotoMode = GotoContinuous,
	Conditions = 
	{
		Negated(FigureInRange {X = _X, Y = _Y, NpcId = self, Range = 5}),
		Negated(QuestState {QuestId = 1083, State = StateSolved}),
		IsGlobalFlagFalse{Name = "g_sP209UruWachen"},
	},
	Actions = 
	{
	
	},
	HomeActions = 
	{
	
	},
	AbortConditions = 
	{
	
	},
	AbortActions = 
	{
	
	},
}

--Khal begibt sich nach seinem Dialog mit dem Spieler, nach dem 1 Dialog mit Uru, oder bei Erfüllung aller vorhandener Quests des 1 Akts zu Uru.
OnOneTimeEvent
{
	Conditions = 
	{ 
		ODER(QuestState {QuestId = 1083, State = StateSolved}, IsGlobalFlagTrue{Name = "g_sP209UruWachen"}),
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10085" },
		ChangeRace {Race = 152, NpcId = self},
		Goto {X = 367, Y = 252, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoForced},
		SetNpcFlagTrue {Name = "npc_sP209KhalStartetDurch"},
	}
}

--Wenn Khal am 1 Zielpunkt angekommen ist läuft er weiter zum 2.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsNpcFlagTrue {Name = "npc_sP209KhalStartetDurch"},
		FigureInRange {X = 367, Y = 252, NpcId = self, Range = 1},
	},
	Actions = 
	{ 
		
		Goto {X = 379, Y = 252, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		
	}
}





--Khal dreht sich in der 2 Cutszene um, sobald er angekommen ist.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 379, Y = 252, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP209KhalMove"},
	},
	Actions = 
	{ 
		LookAtDirection {Direction = West, NpcId = self},
	}
}


--Khal dreht sich in der 2 Cutszene um, sobald er angekommen ist.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 379, Y = 252, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagFalse {Name = "g_sP209CutszeneKathaiBefreitStart"},
	},
	Actions = 
	{ 
		LookAtDirection {Direction = West, NpcId = self},
	}
}



--Khal begibt sich zum Westtor
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209KathaiMove"},
	},
	Actions = 
	{ 
		Goto {X = 268, Y = 271, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoContinuous},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10085" },
	}
}


--Umspawn in der Boten Cutszene
Umspawn 
{
	X = 231, 
	Y = 318,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnHelden", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_sP209KhalFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10085"},
	}

}


--Umspawn2 in der Boten Cutszene
Umspawn 
{
	UnitId = self,  
	X = 377, 
	Y = 251,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnCutszeneBote2", UpdateInterval = 10},
					
	}, 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209KhalFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10085"},		
	}

}

--Umspawn1 in der Kaiser Cutszene
Umspawn 
{
	UnitId = self,  
	X = 378, 
	Y = 252,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnKaiserCutsazene1", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209KhalFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10085"},
		
		--LookAtDirection {Direction = South, NpcId = self},		
	}

}


--Nach der letzten Cutszene verliert Aliah, Jenquai und Khal ihren FollowMode.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP209CutszeneDryadeEnded"},
	},
	Actions = 
	{ 
		SetGlobalFlagFalse {Name = "g_sP209KhalFollow"},	
	}
}


--Wenn der Spieler auf der Clockwork war.
Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P210"},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_sP209KhalFollow"},
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P209\n10085_Khal.txt


	

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
			Say{Tag = "khalP209_001", String = "Wer seid Ihr? Freund oder Feind?"},
			Answer{Tag = "khalP209_002PC", String = "Ich bin hier, um Eure Stadt von den Untoten zu befreien! Ist das Freund genug?", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "khalP209_003", String = "Ja! Ihr müsst der Sturmbote sein, den uns die Uru prophezeit hat! Der Runenkrieger aus dem Norden! Die Uru sagte Ihr würdet uns befreien!"},
			Answer{Tag = "khalP209_004PC", String = "Die Uru! Wo ist sie?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "khalP209_005", String = "Sie hat die Überlebenden meines Volkes nach Osten gebracht, dort wollen sie ein zweite Verteidigung aufbauen! Aber ich fürchte, sie sind bereits umzingelt!"},
			Answer{Tag = "khalP209_006PC", String = "Euer Volk? Warum seid Ihr dann noch hier?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "khalP209_007", String = "Ich bin der Khal, Führer der Kinder des Windes, die Ihr auch Kathai nennt. Die ist meine Stadt und ich werde sie zurückholen! Meine Ahnen und die Winde werden mir die Kraft geben!"},
			Answer{Tag = "khalP209_008PC", String = "Ich werde Eure Stadt beschützen, Khal. Geht zu Eurem Volk, es braucht Euren Schutz mehr, als diese Gemäuer!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "khalP209_009", String = "Hathai! Ihr seid wahrlich der Sturmbote! Hört: Sucht die Uru auf, sie wird Euch die Jäger Ihrer Wache als Unterstützung geben! Mit ihnen soltlet Ihr es leichter haben, die Stadt zurück zu nehmen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "khalP209_010", String = "Hier in der Nähe gibt es auch eine Heldenstätte der Rune! Vielleicht könnt Ihr sie nutzen!"},
			Answer{Tag = "khalP209_011PC", String = "Eure Stadt gehört bald wieder Euch, Khal!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "khalP209_012", String = "Gut! Ich werde meinem Volk von Euch berichten! Viel Glück Sturmbote, möge sich Euer Schicksal erfüllen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP209KhalGeredet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end