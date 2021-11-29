-->INFO: Janina
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})
OneTimeInitAction (SetEffect {Effect = "Chain"})
OneTimeInitAction (LookAtDirection { Direction = East, NpcId = self})

Rem = [[
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "RaceWechselJanina" },
    },
	Actions =
	{
		ChangeRace {Race = 185, NpcId = self}, --139
	}
}
]]
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


OnFollowToggle
{
		Target = Avatar, NpcId = self, FollowOnlyOnce = TRUE,
		FollowConditions = 
		{
			IsPlatformFlagTrue {Name = "JaninaFollow"},
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsPlatformFlagFalse {Name = "JaninaFollow"}
		},
		StopFollowActions = {},
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
		IsGlobalFlagTrue {Name = "DialogJaninaEnded"}, 
		IsGlobalFlagFalse {Name = "SetriusDialogEndedP102"}, 
		IsPlatformFlagTrue {Name = "JaninaFollow"},
	}, 
	Actions = 
	{
		RemoveDialog {},
		Follow { NpcId = self, Target = Avatar},
		SetNpcFlagFalse {Name = "BitteUmspawnen"},
	}

}

REM = [[
OnToggleEvent
{
NotInDialog = FALSE , UpdateInterval = 60 ,
	OnConditions = 
	{
		FigureDead { NpcId = Avatar},
		FigureDead { NpcId = 5461},
		IsPlatformFlagTrue { Name = "JaninaBefreit" },
	 },
	OnActions = { },
	OffConditions = 
	{
		FigureAlive { NpcId = Avatar},
		FigureAlive { NpcId = self},
		IsPlatformFlagTrue { Name = "JaninaBefreit" },
	},
	OffActions = 
	{
		RemoveDialog { NpcId = self} ,

	},
}
]]


REM = [[
Umspawn -- CUTSCENE DEBUG
{
	UnitId = self , Clan = 0 , X = 324 , Y = 386 , Target = none , NoSpawnEffect = TRUE , OnlyOnce = TRUE ,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "cutscenedebug"}, 
	}, 
	Actions = 
	{
	},
}	
]]

-- Cutscene Init Arena
Despawn 
{
	Conditions = 	
	{
		IsPlayerFlagTrue{Name = "StartFinish"},
 	},
 	Actions = 
 	{
   	}
}

--Respawn 
--{
--	WaitTime = 1,
--	UnitId = self ,
--	Clan = 0 ,
--	X = 180 ,
--	Y = 376 ,
--	Chief = none,
--	NoSpawnEffect = FALSE ,
--	Conditions = 
--	{
--	IsPlayerFlagTrue{Name = "StartFinish"},
--	} , 
--	Actions = 
--	{
--	LookAtFigure { Target = 5635, NpcId = self},
--	} ,
--	DeathActions = 
--	{ } 
	
--}

--Janina wird auf den Duellierplatz teleportiert

--Umspawn 
--{ 
--	UnitId = self , 
--	Clan = 0 ,
--	X = 193 , 
--	Y = 355 , 
--	Target = none , 
--	NoSpawnEffect = FALSE , 
--	OnlyOnce = TRUE ,
--	Conditions = 
--	{
--		IsGlobalFlagTrue { Name = "StartFinish" , UpdateInterval = 15}, --	Beginn der ZweikampfCutSzene
--	} ,
--	Actions = 
--	{
--		--LookAtFigure { Target = 5635, NpcId = self},
--	}
--}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p102\n5461_Janina.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "Q560_JaninaKnown"},
		},
		Actions = {
			Say{Tag = "janina102_001", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q560_JaninaKnown"}),
		},
		Actions = {
			Say{Tag = "janina102_003", String = "Habt Dank für Eure Hilfe. Eure Begleiter kenne ich, aber Euch nicht."},
			Answer{Tag = "janina102_004PC", String = "Ich bin ein Runenkrieger. Wir sind auf der Suche nach Dunhan.", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_002", String = ""},
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
			IsNpcFlagFalse{Name = "QuestionIllness"},
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "janina102_005", String = "Dunhan dieser Narr. Es wird Euch nicht gefallen, was ihr finden werdet."},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "janina102_005", String = "Dunhan dieser Narr. Es wird Euch nicht gefallen, was ihr finden werdet."},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "janina102_005", String = "Dunhan dieser Narr. Es wird Euch nicht gefallen, was ihr finden werdet."},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "janina102_005", String = "Dunhan dieser Narr. Es wird Euch nicht gefallen, was ihr finden werdet."},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "janina102_005", String = "Dunhan dieser Narr. Es wird Euch nicht gefallen, was ihr finden werdet."},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "janina102_005", String = "Dunhan dieser Narr. Es wird Euch nicht gefallen, was ihr finden werdet."},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "janina102_005", String = "Dunhan dieser Narr. Es wird Euch nicht gefallen, was ihr finden werdet."},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "janina102_005", String = "Dunhan dieser Narr. Es wird Euch nicht gefallen, was ihr finden werdet."},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_007", String = "Es ist ein Fluch. Ein Fluch geboren aus Liebe, die zu Hass geworden ist."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_008", String = "Zwei Brüder warben einst um mich, der eine ein stolzer Krieger, der andere ein stiller Zauberer. Aus ihrem Ringen um meine Gunst wurde Streit und schließlich Hass."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_009", String = "Ihr Streit riss den Widerstand entzwei und drohte uns alle zu vernichten. Viele Leben hat er gekostet und schließlich auch meines."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_010", String = "Ich stehe nur hier vor Euch, weil einer jener Brüder einen dunklen Magier beauftragte, meine Seele aus dem Totenreich zurück zu holen...doch dafür hat er die seine geopfert."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_011", String = "Nun ist er eine verblendete Kreatur voller Hass ... und ich bin zwar am Leben, aber von jenseits der Schwelle des Todes ist ein fremdes Wesen mit mir zurückgekehrt, ein Geist, der sich an meine Seele klammert."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_012", String = "Nun raunt mir dieses Wesen Tag und Nacht seine Mordgelüste zu. Es stiehlt meine Träume und suhlt sich in meiner Angst. Hätte er mich nur im Reich der Toten belassen!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionIllness"},
			SetPlayerFlagTrue{Name = "Q560_JaninaKnown"},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_014", String = "Ja, er war es, der mir dieses Schicksal auferlegte. Er ist ein Hitzkopf, aber ein guter Kämpfer. Sein Bruder Setrius ist sein stilles Gegenteil."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_015", String = "Einst kämpften wir drei gemeinsam mit Reowys für den Widerstand. Dunhan ist der geborene Anführer und die Waldläufer waren ihm treu ergeben."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_016", String = "Doch nun verschanzt er sich hier hinter Mauern und Söldnern. Widerstand und Freiheit bedeuten ihm nichts mehr. Selbst seinen Runenbruder Reowys hat er vertrieben!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionBrothers"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
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
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionIllness"},
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_006PC", String = "Die Skergs erzählten von einer Krankheit, die Euch plagt?", AnswerId = 6},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"}),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_013PC", String = "War Dunhan einer dieser Brüder?", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			QuestState{QuestId = 562 , State  = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "janina102_017PC", String = "Kommt, wir bringen Euch zu Eurem Heiler!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionIllness"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionIllness"} , IsNpcFlagFalse{Name = "QuestionBrothers"})),
			Negated(QuestState{QuestId = 562 , State  = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_018", String = "Meine Krankheit ist keine wie ihr sie kennt. Etwas wohnt in mir ... wer weiß, vielleicht ist der Tod der beste Ausweg für mich."},
			Answer{Tag = "janina102_019PC", String = "Es wird Euch nichts geschehen. Wir werden Euch sicher zu Eurem Heiler bringen, er soll entscheiden, was zu tun ist.", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "janina102_020", String = "Hulus Dorf liegt östlich von hier, jenseits der Krallenschlucht. Das ist ein gutes Stück Weg ... und die Kithar sind auf Raubzug! Aber geht nur voran, ich werde Euch folgen."},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 561},
						 QuestBegin{QuestId = 562},
						 SetPlayerFlagTrue{Name = "Q560_JaninaKnown"},
						 
						 RemoveDialog{NpcId = 5461},
						 SetPlatformFlagTrue { Name = "JaninaFollow" },
						 SetGlobalFlagTrue{Name = "DialogJaninaEnded"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end