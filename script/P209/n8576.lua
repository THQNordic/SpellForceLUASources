-->INFO: Jenquai


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
		IsGlobalFlagTrue {Name = "g_sP209JenquaiFollow"}, 
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8576"},
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
			
			IsGlobalFlagTrue {Name = "g_sP209JenquaiFollow"},
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagFalse {Name = "g_sP209JenquaiFollow"}
		},
		StopFollowActions = {},
}


--Umspawn in der 2 Cutszene
Umspawn 
{
	X = 362, 
	Y = 254,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209CutszeneKathaiBefreitStart", UpdateInterval = 10},
		Negated(FigureInRange {X = 371, Y = 250, NpcId = self, Range = 20}),	
		IsGlobalFlagFalse {Name = "g_sP209ArtefaktAuftragErhalten"},	
	}, 
	Actions = 
	{
		
		SetGlobalFlagFalse {Name = "g_sP209JenquaiFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8576"},
		Goto {X = 371, Y = 250, NpcId = self, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},
		
	}

}

--Jenquai lösst den FollowMode auf und begibt sich zur Arena.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209ArtefaktAuftragErhalten"},
	},
	Actions = 
	{ 
		SetGlobalFlagFalse {Name = "g_sP209JenquaiFollow"}, 
		--SetPlatformFlagFalse {Name = "g_sP209JenquaiFollow"}, 
		Goto {X = 324, Y = 185, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoContinuous},	
	}
}

--Jenquai wurde als Mitstreiter auserwählt.
OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209MitstreiterJenquai"},
	},
	Actions = 
	{ 
		ChangeFigureOwner {NpcId = self},
	}
}



--Umspawn zum Westtor aus der Arena
Umspawn
{
	X = 292,
	Y = 261,
	NoSpawnEffect = TRUE,
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnCutszeneBote1"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8576"},
	}
}


--Umspawn in der Boten Cutszene
Umspawn 
{
	X = 235, 
	Y = 320,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnHelden", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_sP209JenquaiFollow"}, 
		--SetPlatformFlagFalse {Name = "g_sP209JenquaiFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8576"},
	}

}

--Umspawn2 in der Boten Cutszene
Umspawn 
{
	UnitId = self,  
	X = 378, 
	Y = 252,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnCutszeneBote2", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209JenquaiFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8576"},		
	}

}

--Umspawn1 in der Kaiser Cutszene
Umspawn 
{
	UnitId = self,  
	X = 377, 
	Y = 251,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnKaiserCutsazene1", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209JenquaiFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8576"},
		--LookAtDirection {Direction = South, NpcId = self},			
	}

}



--Jenquai Outcry nachdem die Spieler in die Stadt gekommen sind.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209InnenstadtErreicht"},
	},
	Actions = 
	{ 
		Outcry {NpcId = 8576, String = "Der Khal ist in Not! Wir müssen ihm helfen!" , Tag = "oca2jenquaiP209_003" , Delay = TRUE , Color = ColorWhite},
	}
}

--Nach der Cutszene mit dem Kaiser und nachdem der Spieler mit Uru geredet hat, wird ihr FollowMode wieder eingeschaltet.
OnOneTimeEvent
{
	Conditions = 
	{ 
		QuestState {QuestId = 794, State = StateSolved, UpdateInterval = 60}, 
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209JenquaiFollow"},	
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
		SetGlobalFlagFalse {Name = "g_sP209JenquaiFollow"},	
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
		SetGlobalFlagFalse {Name = "g_sP209JenquaiFollow"},
	}
}

--Outcries.
--Jenquai ist in der Nähe des geheimen Portals.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 231, Y = 168, NpcId = self , Range = 10},
	},
	Actions = 
	{ 
		Outcry {NpcId = 8576, String = "Hier ist das Portal! Es führt direkt in die Stadt!" , Tag = "oca2jenquaiP209_001" , Delay = TRUE , Color = ColorWhite},
	}
}

--Der Spieler ist in der Nähe der Mantis.
OnOneTimeEvent
{
	Conditions = 
	{ 
		PlayerUnitInRange {X = 77, Y = 467, Range = 15, FigureType = FigureAll},
	},
	Actions = 
	{ 
		Outcry {NpcId = 8576, String = "Das sind Sensenläufer! Sie sind sehr stark, aber anfällig gegen Bezauberung!" , Tag = "oca2jenquaiP209_002" , Delay = TRUE , Color = ColorWhite},
		SetGlobalTimeStamp {Name = "g_tnP209OutcryStartAlyah"},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P209\n8576_Jenquai.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
		},
		Actions = {
			Say{Tag = "jenquaiP209_001", String = "Ihr habt Euch gut geschlagen! Ich bin stolz, mit Euch gekämpft zu haben!"},
			Answer{Tag = "jenquaiP209_002PC", String = "Wie es scheint, sind nicht alle Eures Volkes so feundlich.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "jenquaiP209_004", String = "Seid Ihr bereit?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquaiP209_003", String = "Ihr meint den Zweikampf? Ich kämpfe gerne ein zweites Mal an Eurer Seite! Wählt mich als Mitstreiter!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "known"},
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
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquaiP209_005PC", String = "Ich möchte Euch als meinen Mitstreiter bestimmen!", AnswerId = 6},
			OfferAnswer{Tag = "jenquaiP209_008PC", String = "Ich bin noch unentschlossen, welchen Mitstreiter ich auswählen soll.", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquaiP209_008PC", String = "Ich bin noch unentschlossen, welchen Mitstreiter ich auswählen soll.", AnswerId = 9},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquaiP209_006", String = "Es ist mir eine Ehre! Mein Schwert und meine Magie gehören Euch!"},
			Answer{Tag = "jenquaiP209_007PC", String = "Dann lasst uns Xalabar gegenüber treten!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209MitstreiterJenquai"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquaiP209_009", String = "Zögert nicht zu lange, Ihr werdet in den Augen der Krieger schwach erscheinen!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}


	EndDefinition()
end