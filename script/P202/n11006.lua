-->INFO: Opfer
--Opfer

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}


SpawnOnlyWhen
{
	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = {}, 
	Actions = 
	{
		SetEffect {Effect = "Chain", Length = 0, TargetType = Figure, NpcId = self},
		HoldPosition {NpcId = self, FreeWill = FALSE}
	} 
}


--wenn mit Opfer Dialog begonnen, egal welche Option gewählt wird, Quest wachgeist begin
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcFlagTrue{Name = "Known"}
	},
	Actions = 
	{ 
		QuestBegin {QuestId = 1047, SubQuestActivate = FALSE}, --Opfer Quest allg.
	}
}
---------------------------------------------------------------------
---------------------------------------------------------------------

--wenn Option Opfer befreien gewählt
--------------------------------------------------------

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202_OptionOpferBefreien", UpdateInterval = 20},
	},
	Actions = 
	{ 
		QuestBegin {QuestId = 1049, SubQuestActivate = FALSE}, --Opfer befreit Quest
		StopEffect {TargetType = Figure, NpcId = self}, --ketten weg
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11006"},
		Goto {X = 120, Y = 223, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		SetGlobalFlagTrue {Name = "g_P202OpferBefreit"},
		SetGlobalFlagTrue {Name = "g_P202_OpferDespawn"}
		
	}
}

--wenn zu hause, despawn
Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{ 
		--IsGlobalFlagTrue{Name = "g_P202_OptionOpferBefreien", UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "g_P202_OpferDespawn", UpdateInterval = 20},
		FigureInRange {X = 120, Y = 223, NpcId = self, Range = 0},
		--FigureAlive {NpcId = 11005},
	}, 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P202OpferZuHause"},
		SetGlobalFlagFalse {Name = "g_P202_OpferDespawn"}
	}
}

Respawn
{
 	WaitTime = 10, UnitId = self, Clan = 0, Target = none, X = 120, Y = 223, Chief = none, NoSpawnEffect = TRUE, 
 	Conditions = 
 	{
 		--IsGlobalFlagTrue{Name = "g_P202_OptionOpferBefreien", UpdateInterval = 20},
 		FigureDead {NpcId = 11005},
 		IsGlobalFlagTrue {Name = "g_P202OpferZuHause", UpdateInterval = 10},
 		IsGlobalFlagFalse {Name = "g_P202InfoDialogGefuehrt", UpdateInterval = 20}
 	}, 
 	Actions = 
 	{ 
 		Follow {NpcId = self, Target = 0},
 		SetGlobalFlagFalse {Name = "g_P202OpferZuHause"},
 		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_11006"},
 	}, 
 	DeathActions = { } 
}


----------------------------------
--wenn Option Opfer töten gewählt
-----------------------------------


OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202_OptionOpferTöten", UpdateInterval = 20},
	},
	Actions = 
	{ 
		ChangeRace {Race = 150, NpcId = self},
		QuestBegin {QuestId = 1048, SubQuestActivate = FALSE}  --Opfer töten Quest
	}
}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n11006_Opfer.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			 IsGlobalFlagTrue {Name = "g_P202OpferBefreit", UpdateInterval = 10},
		},
		Actions = {
			Say{Tag = "victimP202_001", String = "Ich bin frei! Der Traumdieb ist fort!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated( IsGlobalFlagTrue {Name = "g_P202OpferBefreit", UpdateInterval = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_002", String = "Ihr habt ihn besiegt! Und ich lebe!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_003", String = "Nach all den Jahren ... endlich kann ich heim! Sollen die Schätze dieser elenden Stadt doch mit ihr verrotten!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_004", String = "Wenn ihr weiter in die Stadt wollt, noch einen Hinweis: Der Gnomling ist nicht was er scheint, Ihr müsst den Wahren finden um siegreich zu sein!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_005", String = "Und jetzt nach Hause! Ich werde Euch nie vergessen, Freund, danke!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P202InfoDialogGefuehrt"},
													StopFollow {Target = 0, NpcId = 11006},
													Goto {X = 120, Y = 223, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous, XRand = 0, YRand = 0},
													SetGlobalFlagTrue {Name = "g_P202_OpferDespawn"},
													SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11006"} 
													,
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagTrue{Name = "Known"},
		},
		Actions = {
			Say{Tag = "victimP202_006", String = "So ...kalt! Ich erfriere ..."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "victimP202_007", String = "Tötet mich! Bitte!"},
			Answer{Tag = "victimP202_008PC", String = "Was? Warum?", AnswerId = 11},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_009", String = "Der Traumdieb! Ich bin sein Opfer! Er frisst meine Gedanken, meine Gefühle...! Es ist tut so weh! Bitte, tötet mich! Macht dem ein Ende!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "victimP202_013PC", String = "Redet keinen Unsinn, ich befreie Euch!", AnswerId = 14},
			OfferAnswer{Tag = "victimP202_018PC", String = "Wenn dies Euer Wunsch ist, dann beende ich Euer Leben.", AnswerId = 18},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_009", String = "Der Traumdieb! Ich bin sein Opfer! Er frisst meine Gedanken, meine Gefühle...! Es ist tut so weh! Bitte, tötet mich! Macht dem ein Ende!"},
			Answer{Tag = "victimP202_010PC", String = "Kann ich den Traumdieb erschlagen?", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_011", String = "Er nährt sich von meiner Kraft! So lange ich lebe, ist er stark! Ihr müsst mich töten, dann könnt Ihr ihn besiegen! Bitte, zögert nicht! Seine Gedanken sind so...schrecklich kalt!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "victimP202_012", String = "Tut es! Schnell! Bitte! Ihr seid mein einziger Ausweg! Lasst mich nicht noch mehr Jahre leiden!"},
			OfferAnswer{Tag = "victimP202_013PC", String = "Redet keinen Unsinn, ich befreie Euch!", AnswerId = 14},
			OfferAnswer{Tag = "victimP202_018PC", String = "Wenn dies Euer Wunsch ist, dann beende ich Euer Leben.", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_014", String = "Ihr seid ein guter Mensch, aber dumm! Versteht Ihr nicht, meine Kraft nährt ihn!"},
			Answer{Tag = "victimP202_015PC", String = "Das lasst meine Sorge sein! Ich löse Eure Ketten.", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_016", String = "Da! Er hat Euch bemerkt! Jetzt werdet Ihr gegen ihn kämpfen müssen!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_017", String = "Er wartet in der Stadt auf Euch! Seid vorsichtig! Ich hoffe Ihr wisst, was Ihr tut!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P202_OptionOpferBefreien"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_019", String = "Endlich! Erlösung! Tut es!"},
			Answer{Tag = "victimP202_020PC", String = "Seid Ihr bereit?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_021", String = "Ja, redet nicht! Der Traumdieb hat Euch bemerkt! Er erwacht! Schlagt zu!"},
			Answer{Tag = "victimP202_022PC", String = "Verzeiht mir.", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "victimP202_023", String = "Tut es! Bitte!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P202_OptionOpferTöten"},
	SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11006"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end