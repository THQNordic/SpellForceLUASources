-->INFO: Alyah
--INFO Aysha

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
		IsGlobalFlagTrue {Name = "g_sP209AlyahFollow"}, 
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8590"},
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
			
			IsGlobalFlagTrue {Name = "g_sP209AlyahFollow"},
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagFalse {Name = "g_sP209AlyahFollow"}
		},
		StopFollowActions = {},
}

--Aliah lösst den FollowMode auf und begibt sich zur Arena.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209ArtefaktAuftragErhalten"},
	},
	Actions = 
	{ 
		SetGlobalFlagFalse {Name = "g_sP209AlyahFollow"}, 
		--SetPlatformFlagFalse {Name = "g_sP209JenquaiFollow"}, 
		Goto {X = 322, Y = 187, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoContinuous},	
	}
}


--Umspawn zum Westtor aus der Arena
Umspawn
{
	X = 294,
	Y = 266,
	NoSpawnEffect = TRUE,
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnCutszeneBote1"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8590"},
	}
}

--Umspawn in der 2 Cutszene
Umspawn 
{
	X = 364, 
	Y = 254,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209CutszeneKathaiBefreitStart", UpdateInterval = 10},
		Negated(FigureInRange {X = 370, Y = 251, NpcId = self, Range = 20}),	
		IsGlobalFlagFalse {Name = "g_sP209ArtefaktAuftragErhalten"},		
	}, 
	Actions = 
	{
		
		SetGlobalFlagFalse {Name = "g_sP209AlyahFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8590"},
		Goto {X = 370, Y = 251, NpcId = self, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},
		
	}

}



--Umspawn in der Boten Cutszene
Umspawn 
{
	UnitId = self,  
	X = 233, 
	Y = 320,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnHelden", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_sP209AlyahFollow"}, 
		--SetPlatformFlagFalse {Name = "g_sP209AlyahFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8590"},		
	}

}

--Umspawn2 in der Boten Cutszene
Umspawn 
{
	UnitId = self,  
	X = 379, 
	Y = 253,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnCutszeneBote2", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209AlyahFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8590"},		
	}

}


--Umspawn in der Kaiser Cutszene
Umspawn 
{
	UnitId = self,  
	X = 238, 
	Y = 317,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		Negated(EnemyUnitInRange {X = 225, Y = 300, NpcId = Avatar, Range = 20, UnitId = 0, UpdateInterval = 10}),
		IsGlobalFlagTrue {Name = "g_sP209CutszeneKaiserStart", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8590"},
		SetGlobalFlagFalse {Name = "g_sP209AlyahFollow"}, 
	}

}

--Umspawn2 in der Kaiser Cutszene
Umspawn 
{
	UnitId = self,  
	X = 379, 
	Y = 253,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnKaiserCutsazene1", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209AlyahFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8590"},		
	}

}


--Nach der Cutszene mit der Dryade wird ihr Dialog freigeschaltet.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneDryadeEnded"},
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8590"},
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
		SetGlobalFlagFalse {Name = "g_sP209AlyahFollow"},	
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
		SetGlobalFlagFalse {Name = "g_sP209AlyahFollow"},
	}
}

--Outcries.
--1 Streitgespräch zwischen Alyah und Urias.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneStartEnded"},
		IsGlobalTimeElapsed {Name = "g_tnP209OutcryStartAlyah", Seconds = 6}, 
	},
	Actions = 
	{ 
		Outcry {NpcId = 8590, String = "Wenn die Kathai schon aus der Stadt geflohen sind, dann sollten wir das auch tun!" , Tag = "oca2alyahP209_001" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8694, String = "Wollt Ihr schon wieder davonlaufen?" , Tag = "oca2uriasP209_001" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8694, String = "Zum Schutze aller Völker müssen wir die Untoten zurückschlagen, koste es, was es wolle!" , Tag = "oca2uriasP209_002" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8590, String = "Klingt wie berühmte letzte Worte." , Tag = "oca2alyahP209_002" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8694, String = "So ist der Weg meines Ordens!" , Tag = "oca2uriasP209_003" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8590, String = "Ja ja, ich lasse es Euch aufs Grab schreiben!" , Tag = "oca2alyahP209_003" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8590, String = "Hier ruht Urias, erschlagen von seiner eigenen Dummheit!" , Tag = "oca2alyahP209_004" , Delay = FALSE , Color = ColorWhite},
	}
}

--2 Streitgespräch zwischen Alyah und Urias.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneKathaiBefreitEnded"},
	},
	Actions = 
	{ 
		Outcry {NpcId = 8694, String = "Plunder sammeln und unnötige Zweikämpfe! Soll das Gastfreundschaft sein?" , Tag = "oca2uriasP209_004" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8590, String = "Mäßigt Euch! Der Runenkrieger braucht die Hilfe der Kathai!" , Tag = "oca2alyahP209_005" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8694, String = "Wir werden den Gefahren des Dschungels auch alleine trotzen!" , Tag = "oca2uriasP209_005" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8694, String = "Hokan Ashir kann keinen Zauber weben, der den Glauben an Aonir überwindet!" , Tag = "oca2uriasP209_006" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8590, String = "Darf ich mich jetzt bitte in meinen Dolch stürzen ..." , Tag = "oca2alyahP209_006" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8590, String = "Das ist ja nicht auszuhalten!" , Tag = "oca2alyahP209_007" , Delay = FALSE , Color = ColorWhite},
	}
}

--1 Streitgespräch zwischen Alyah und Jenquai.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209Uru4malGeredet"},
	},
	Actions = 
	{ 
		Outcry {NpcId = 8590, String = "Urias ist tot! Dieser verdammte, dickschädelige, Dummkopf!" , Tag = "oca2alyahP209_008" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8576, String = "Er hat sein Leben für dich gegeben, Rabenhaar! Du solltest Ihn ehren!" , Tag = "oca2jenquaiP209_004" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8590, String = "Ich wollte aber nicht, dass er sein leben für mich gibt!" , Tag = "oca2alyahP209_009" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8590, String = "Er hat kein Recht, mir solch eine Schuld aufzuladen!" , Tag = "oca2alyahP209_010" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8576, String = "Er ist nur seinem herzen gefolgt! Rede nicht schlecht von ihm!" , Tag = "oca2jenquaiP209_005" , Delay = FALSE , Color = ColorWhite},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P209\n8590_Alyah.txt


	

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
			Say{Tag = "alyahP209_001", String = "Ich bin gleich wieder kampfbereit, Runenkrieger."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP209_002", String = "Gebt mir nur eine Weile um auszuruhen ..."},
			Answer{Tag = "alyahP209_003PC", String = "Ihr seid völlig erschöpft!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP209_004", String = "Nein, nein, es geht mir gut, ich bin gleich wieder bei Euch ..."},
			Answer{Tag = "alyahP209_005PC", String = "Ruht Euch aus! Immerhin habt Ihr eine Schlacht geschlagen und Euren eigenen Vater im Zweikampf besiegt!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP209_006", String = "Mein Vater, dieser Hund! Ich war Urias sein Leben schuldig! Was habt Ihr nun vor?"},
			Answer{Tag = "alyahP209_007PC", String = "Ich durchquere die Uhrwerkhallen und versuche von der Südseite her die Wachfeste zu öffnen. Dann werden die Kathai nachkommen..", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "alyahP209_008PC", String = "Bleibt hier und ruht, Ihr könnt dann mit den Kathai wieder zu mir stossen, wenn Ihr wollt.", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP209_009", String = "Ihr habt recht. Gebt in den Uhrwerkhallen gut auf Euch acht! Wir sehen uns in der Wachfeste."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end