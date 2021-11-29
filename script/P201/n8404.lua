-->INFO: Urias
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})
--OneTimeInitAction (SetEffect {Effect = "Chain"})
--OneTimeInitAction (LookAtDirection { Direction = SouthWest, NpcId = self})

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
		
	},
	Actions = 
	{
		ChangeRace {Race = 152, NpcId = self},
		SetEffect {Effect = "Chain"},
		LookAtDirection { Direction = SouthWest, NpcId = self},
		SetGlobalFlagTrue {Name = "g_sP201UriasGespawned"},
	}
} 


OnOneTimeEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue {Name = "g_sP201UriasBefreitVorOrt"},
		 
	},
	Actions = 
	{ 
		
		
		ChangeUnit {Unit = 931, NpcId = self, ChangeLevel = FALSE},
		SetGlobalFlagTrue {Name = "g_sP201UriasFollow"},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8404"},
		SetGlobalFlagTrue {Name = "g_sP201UriasChangeUnit"},
		ChangeRace {Race = 1, NpcId = self},
		SetNpcTimeStamp {Name = "npc_tnP201UriasOutcries"},
			
	}
}

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
		IsGlobalFlagTrue {Name = "g_sP201UriasFollow"}, 
		IsGlobalFlagTrue {Name = "g_sP201UriasBefreitVorOrt"},
		IsGlobalFlagFalse {Name = "g_sP209UriasStirbt"},	
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8404"},
		ChangeUnit {Unit = 931, NpcId = self, ChangeLevel = FALSE},
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
			IsGlobalFlagTrue {Name = "g_sP201UriasBefreitVorOrt"},
			IsGlobalFlagTrue {Name = "g_sP201UriasFollow"},
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagTrue {Name = "g_sP201UriasBefreitVorOrt"},
			IsGlobalFlagFalse {Name = "g_sP201UriasFollow"},
		},
		StopFollowActions = {},
}

--Cutszene Outpost
--Wenn Urias im Camp angekommen ist, dreht er sich zum Avatar
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 85, Y = 77, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP201StartCutszeneOutpost"},
	},
	Actions = 
	{ 
		LookAtFigure {Target = 0, NpcId = 8404},
	}
}
--Wenn der Avatar im Camp angekommen ist, dreht er sich zum Avatar
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 87, Y = 78, NpcId = 0, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP201StartCutszeneOutpost"},
	},
	Actions = 
	{ 
		LookAtFigure {Target = 8404, NpcId = 0},
	}
}

--Cutszene GrabCutszene
--Wenn Urias im Camp angekommen ist, dreht er sich zum Avatar
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 193, Y = 126, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP201CutszeneGrabStart"},
	},
	Actions = 
	{ 
		LookAtDirection {Direction = North, NpcId = self},
	}
}
--Wenn der Avatar im Camp angekommen ist, dreht er sich zum Avatar
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 191, Y = 125, NpcId = 0, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP201CutszeneGrabStart"},
	},
	Actions = 
	{ 
		LookAtFigure {Target = 8404, NpcId = 0},
	}
}


--Urias verwandelt sich in einen Schwertkämpfer, mit Follow.
OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue {Name = "g_sP201UriasChangeUnit"},
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"},
		 
	},
	Actions = 
	{ 
		
		--StopEffect {TargetType = Figure ,NpcId = self},
		ChangeUnit {Unit = 931, NpcId = self, ChangeLevel = FALSE},
		
	}
}

--Urias Outcries.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsNpcTimeElapsed {Name = "npc_tnP201UriasOutcries", Seconds = 10},
	},
	Actions = 
	{ 
		Outcry {NpcId = 8404, String = "Es ist gut, wieder mit Euch zu ziehen, Freund!" , Tag = "oca2uriasP201_001" , Delay = TRUE , Color = ColorWhite},
	}
}

--Urias Outcries.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsNpcTimeElapsed {Name = "npc_tnP201UriasOutcries", Seconds = 20},
	},
	Actions = 
	{ 
		Outcry {NpcId = 8404, String = "Die Untoten werden von Stunde zu Stunde mehr!" , Tag = "oca2uriasP201_002" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8404, String = "Kaum noch eine lebende Seele in diesem verfluchten Land!" , Tag = "oca2uriasP201_003" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 8404, String = "Was sucht Darius hier?" , Tag = "oca2uriasP201_004" , Delay = FALSE , Color = ColorWhite},
	}
}

--Urias Outcries.
OnOneTimeEvent
{
	Conditions = 
	{ 
		PlayerUnitInRange {X = 72, Y = 41, Range = 10, FigureType = FigureAll},
	},
	Actions = 
	{ 
	
		Outcry {NpcId = 8404, String = "Vorsicht!" , Tag = "oca2uriasP201_005" , Delay = TRUE , Color = ColorWhite},
	}
}
		
--Urias in der Nähe des Outposts.
OnOneTimeEvent
{
	Conditions = 
	{ 
		AvatarInRange {X = 104, Y = 91, Range = 15},
		IsGlobalFlagTrue {Name = "g_sP201UriasBefreitVorOrt"},
	},
	Actions = 
	{ 
	
		Outcry {NpcId = 8404, String = "Da, das Lager! Gleich haben wir es geschafft!" , Tag = "oca2uriasP201_006" , Delay = TRUE , Color = ColorWhite},
	}
}

--Urias in der Nähe der Leutnantleiche.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 43, Y = 51, NpcId = self, Range = 10},
	},
	Actions = 
	{ 
	
		Outcry {NpcId = 8404, String = "Da liegt mein Leutnant! Er war ein guter Mann ... verdammt sollen sie sein!" , Tag = "oca2uriasP201_007" , Delay = TRUE , Color = ColorWhite},
	}
}

--Urias in der Nähe des Portals.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 188, Y = 33, NpcId = self, Range = 15},
	},
	Actions = 
	{ 
	
		Outcry {NpcId = 8404, String = "Er ist geflohen! Weiter, durch das Portal!" , Tag = "oca2uriasP201_011" , Delay = TRUE , Color = ColorWhite},
	}
}

--Urias wenn ein Ordensritter getötet wurde und zum Bösen übergewechselt ist.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201OutcryUriasSeeleStart"},
	},
	Actions = 
	{ 
		Outcry {NpcId = 8404, String = "Da! Teufellei! Seine Seele dient nun dem Grabräuber!" , Tag = "oca2uriasP201_009" , Delay = TRUE , Color = ColorWhite},
		
	}
}

--Urias wenn ein Ordensritter getötet wurde und zum Bösen übergewechselt ist.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP201OrdensritterGerettet"},
	},
	Actions = 
	{ 
		Outcry {NpcId = 8404, String = "Ihr habt eine Seele befreit!" , Tag = "oca2uriasP201_010" , Delay = TRUE , Color = ColorWhite},
		
	}
}

Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UriasStirbt"},	
	},
	Actions = 
	{
		
	}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P201\n8404_Urias.txt


	

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
			Say{Tag = "urias201_001", String = "Ihr seid es wirklich! Darius hat recht behalten!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias201_002", String = "Nehmt meinen Dank, Freund! Wie oft habt ihr nun schon meine Haut gerettet?"},
			Answer{Tag = "urias201_003PC", String = "Lassen wir es nicht zur Gewohnheit werden, Urias. Ihr seid mit Darius hier?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias201_004", String = "Nein, er hat mich nur in einem Brief hierher gebeten! Als er schrieb, ihr würdet ebenfalls hier sein, dachte ich dem alten Narren gehen die Sinne durch!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias201_005", String = "Aber als wir hier ankamen fehlte von Darius jede Spur! Die ganze Bevölkerung scheint aus diesem Landstrich geflohen zu sein!"},
			Answer{Tag = "urias201_006PC", String = "Wenn ich diese Untoten betrachte, weiß ich, was mit der Bevölkerung geschehen ist!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias201_007", String = "Beim Seelenfluss! Wollen wir hoffen, das Darius nicht das gleiche Schicksal ereilt hat!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias201_008", String = "Sagt Freund, habt Ihr noch den Phönixstein, wie man sich erzählt?"},
			Answer{Tag = "urias201_009PC", String = "Ja. Als ich sah, wie der junge Rohen druch das Zeitportal floh, begriff ich, dass niemand ihm folgen und ihn aufhalten durfte! Sonst wäre er nie asl alter Mann unserer Rettung gewesen!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "urias201_010PC", String = "Ich habe den Phönixstein aus dem Zeitportal genommen. Das Portal zerfiel ... und ich floh. Ich zog durch ferne Lande, hoffend, dass nie mehr jemand nach der Macht des Phönix trachten würde! Ich hoffte auch, das meine Zeit des Kampfes vorbei sei.", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias201_011", String = "Ich weiß, Ihr wünscht Euch Frieden. Aber Darius hätte uns nicht gerufen, wenn es nicht wichtig wäre! Kommt, meine Ritter haben in einem verlassenen Dorf Quartier bezogen. Dort sind wir in Sicherheit. Es liegt südlich, den Weg entlang!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP201UriasBefreitVorOrt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end