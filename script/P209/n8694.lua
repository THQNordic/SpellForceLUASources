-->INFO: Urias
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
		IsGlobalFlagTrue {Name = "g_sP209UriasFollow"}, 
		IsGlobalFlagFalse {Name = "g_sP209UriasStirbt"},
			
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8694"},
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
			
			IsGlobalFlagTrue {Name = "g_sP209UriasFollow"},
		},
		FollowActions = {},
		StopFollowConditions = 
		{
		
			IsGlobalFlagFalse {Name = "g_sP209UriasFollow"},
		},
		StopFollowActions = {},
}


--Urias lösst den FollowMode auf und begibt sich zur Arena.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209ArtefaktAuftragErhalten"},
	},
	Actions = 
	{ 
		SetGlobalFlagFalse {Name = "g_sP209UriasFollow"}, 
		--SetPlatformFlagFalse {Name = "g_sP209UriasFollow"}, 
		Goto {X = 324, Y = 185, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoContinuous},	
	}
}

--Urias wurde als Mitstreiter auserwählt.
OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209MitstreiterUrias"},
	},
	Actions = 
	{ 
		ChangeFigureOwner {NpcId = self},
	}
}

--Umspawn in der 2 Cutszene
Umspawn 
{
	X = 363, 
	Y = 255,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209CutszeneKathaiBefreitStart", UpdateInterval = 10},
		Negated(FigureInRange {X = 371, Y = 252, NpcId = self, Range = 20}),	
		IsGlobalFlagFalse {Name = "g_sP209ArtefaktAuftragErhalten"},		
	}, 
	Actions = 
	{
		
		SetGlobalFlagFalse {Name = "g_sP209UriasFollow"}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8694"},
		Goto {X = 371, Y = 252, NpcId = self, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},
		
	}

}

--Umspawn zum Westtor aus der Arena
Umspawn
{
	X = 300,
	Y = 264,
	NoSpawnEffect = TRUE,
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnCutszeneBote1"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8694"},
	}
}


--Austausch gegen killable Urias 10137
Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnHelden"},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_sP209UriasFollow"},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P209\n8694_Urias.txt


	

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
			Say{Tag = "uriasP209_001", String = "Freund! Ich beschwöre Euch, lasst mich gegen diesen Kerl antreten! Ich werde ihm Manieren beibringen!"},
			Answer{Tag = "uriasP209_002PC", String = "Seid Ihr sicher, das Wut ein guter Ratgeber ist, Urias?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "uriasP209_004", String = "Ist es soweit?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP209_003", String = "Nach all dem, was Ihr getan habt, nun das? Wer wäre da nicht wütend? Nein! Die Götter sind auf unserer Seite! Wählt mich aus!"},
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
			OfferAnswer{Tag = "uriasP209_005PC", String = "Ihr sollt meien Mitstreiter sein Urias!", AnswerId = 6},
			OfferAnswer{Tag = "uriasP209_008PC", String = "Ich muss meine Entscheidung noch überdenken.", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasP209_008PC", String = "Ich muss meine Entscheidung noch überdenken.", AnswerId = 9},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP209_006", String = "Ihr habt gut gewählt! Jetzt lasst uns diesem Streithahn etwas Dankbarkeit einbläuen!"},
			Answer{Tag = "uriasP209_007PC", String = "Wir sehen uns auf dem Kampfplatz!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209MitstreiterUrias"},
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
			Say{Tag = "uriasP209_009", String = "Wie Ihr meint. Aber die Zeit drängt, wir haben noch einen weiten Weg vor uns!"},
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