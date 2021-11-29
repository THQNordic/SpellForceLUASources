-->INFO: Urias
-->Urias

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Urias FollowMode
OnFollowToggle
{
		Target = Avatar, NpcId = self, FollowOnlyOnce = TRUE,
		FollowConditions = 
		{
			IsPlatformFlagTrue {Name = "g_sP209UriasFollow"},
		},
		FollowActions = {},
		StopFollowConditions = 
		{
		
			IsPlatformFlagFalse {Name = "g_sP209UriasFollow"}
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
			FigureDead {NpcId = Avatar}
		),
		IsGlobalFlagTrue {Name = "g_sP209UriasFollow"}, 
		
	}, 
	Actions = 
	{
		RemoveDialog {},
		Follow { NpcId = self, Target = Avatar},
	}

}

--Urais lösst den FollowMode auf und begibt sich zur Arena
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209ArtefaktAuftragErhalten"},
	},
	Actions = 
	{ 
		SetGlobalFlagFalse {Name = "g_sP209UriasFollow"}, 
		Goto {X = 324, Y = 185, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},	
	}
}

--Urias wurde als Mitstreiter auserwählt.
OnOneTimeEvent
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





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P209\n8598_Urias.txt


	

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
			Say{Tag = "Urias209_001", String = "Willkommen Fremder, wie seid ihr an den Belagerern vorbei gekommen"},
			Answer{Tag = "Urias209_002PC", String = "Das ist nicht wichtig, nur dass ich hier bin ist wichtig", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "Urias209_004", String = "Wieder zurück?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Urias209_003", String = "Ihr habt recht"},
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
			OfferAnswer{Tag = "Urias209_005PC", String = "Ich möchte dich als Mitstreiter bestimmen.", AnswerId = 6},
			OfferAnswer{Tag = "Urias209_008PC", String = "Ich überlege es mir noch dich als Mitstreiter zu bestimmen.", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "Urias209_008PC", String = "Ich überlege es mir noch dich als Mitstreiter zu bestimmen.", AnswerId = 9},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Urias209_006", String = "Kein Problem"},
			Answer{Tag = "Urias209_007PC", String = "Gut", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFLagTrue {Name = "g_sP209MitstreiterUrias"},
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
			Say{Tag = "Urias209_009", String = "Überlegt es euch gut. Es wird ein Kampf auf Leben und Tod!"},
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