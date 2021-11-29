-->INFO: Jenquai
--Jenquai

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = {}, 
	Actions = {
		LookAtDirection{Direction = South},
	} 
}


--Dialog aus am Anfang, wenn Spieler Clockwork Crypt gelöst
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P210_SpielerKommtVonClockwork", UpdateInterval = 20}
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9811"},
	}
}

------------------------------------------------------------------------
------------------------------------------------------------------------
--wenn Portal nach Kathai (9810) auf, holt Jenquai die Kathai
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_JenquaiHoltKathai", UpdateInterval = 20},
	},
	Actions = 
	{
		Outcry {NpcId = 9811, String = "Der Weg ist frei! Ich hole meine Männer!", Tag = "oca2jenquaiP211_005", Delay = TRUE, Color = ColorWhite},
		
	}
}

OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_JenquaiHoltKathai", UpdateInterval = 20},
		IsGlobalTimeElapsed {Name = "gt_P211_JenquaiHoltKathai", Seconds = 5, UpdateInterval = 10} 
	},
	Actions = 
	{
		Goto {X = 269, Y = 455, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoNormal}
	}
}

--pseudo "despawn"
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		FigureInRange {X = 269, Y = 455, NpcId = self, Range = 0},
		IsGlobalFlagTrue {Name = "g_P211_JenquaiHoltKathai", UpdateInterval = 20},
	},
	Actions = 
	{
		SetEffect {Effect = "DeMaterialize", Length = 2000, TargetType = Figure, NpcId = self},
		SetEffect {Effect = "SimpleInvis", Length = 5000, TargetType = Figure, NpcId = self},
		SetGlobalTimeStamp {Name = "gt_P211_JenquaiKommtWieder"},
	}
}

--pseudo "respawn"
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P211_JenquaiKommtWieder", Seconds = 5, UpdateInterval = 10},
	}, 
	Actions = 
	{
		StopEffect {TargetType = Figure, NpcId = 9811},
		Goto {X = 263, Y = 417, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoNormal},
		SetGlobalFlagTrue {Name = "g_P211_KathaiFallenEin"},
		SetGlobalTimeStamp {Name = "gt_P211_KathaiTimer"},
		
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9811"},
		Follow{Target = 0, NpcId = self},
	}
}




-----------------------------------------------------------
--Umspawn bwei spielertod, Kartenwechsel, Bindstonereisen
-----------------------------------------------------------
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
		IsGlobalFlagTrue {Name = "g_P211_KathaiFallenEin", UpdateInterval = 20},
		IsGlobalFlagFalse {Name = "g_P211_CSIshtargelaufen", UpdateInterval = 20}
	},
	OffActions = 
	{
		SetNpcFlagTrue{Name = "BitteUmspawnen"},
	}
}


-- umspawn flag setzen bei plattformwechsel, nachdem tor offen
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P211_KathaiFallenEin", UpdateInterval = 20},
		IsGlobalFlagFalse {Name = "g_P211_CSIshtargelaufen", UpdateInterval = 20}
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

--Umspawn mit Follow
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
			IsGlobalFlagTrue {Name = "g_P211_KathaiFallenEin", UpdateInterval = 20},
			IsGlobalFlagFalse {Name = "g_P211_CSIshtargelaufen", UpdateInterval = 20}
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9811"},
		Follow{Target = Avatar},
		
	}
}


--Jenquai löst den FollowMode auf
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen", UpdateInterval = 20}, 
	},
	Actions = 
	{ 
		SetGlobalFlagFalse {Name = "g_P211JenquaiFollow"}, 
	}
}

---------------------------------------
--OC, wenn Verstärkung
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P211_Kathai2FallenEin", UpdateInterval = 20},
		IsGlobalTimeElapsed {Name = "gt_P211_Kathai2Timer", Seconds = 17, UpdateInterval = 10} 
	},
	Actions = 
	{ 
		Outcry {NpcId = 9811, String = "Da ist Verstärkung!" , Tag = "oca2jenquaiP211_006" , Delay = TRUE , Color = ColorWhite},
	}
}

 
------------------------------------------------------------------------------------

--CS Ishtar Umspawn
Umspawn
{
	UnitId = self, Clan = 0, X = 249, Y = 195, Target = none, NoSpawnEffect = FALSE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P211CSIshtarUmspawnInit", UpdateInterval = 20}
	} , 
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9811"},
	}
}

-------------------------------------------------------------------------------------

-- nach CS position mit seinen Männern

OnIdleGoHome
{
	X = 293, Y = 252, Direction = 2, Range = 2, WalkRange = 10, WaitTime = 0, WalkMode = Walk, GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen", UpdateInterval = 20}, 
	},
	Actions = 
	{
		
	},
	HomeActions = {},
	AbortConditions = {},
	AbortActions = {},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p211\n9811_Jenquai.txt


	

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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquaiP211_001", String = "Hier gibt es kein Durchkommen, Freund! Das Tor läßt sich von dieser Seite aus nicht öffnen!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquaiP211_002", String = "Ihr müsst durch die Uhrwerkhallen und von dort aus in die Wachfeste! Öffnet dann dieses Tor von Innen, ich werde mit meinen Jägern dann zu euch stossen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			RemoveDialog {NpcId = 9811},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end