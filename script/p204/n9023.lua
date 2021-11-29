-->INFO: Wachfrau
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
		SetGlobalFlagTrue {Name = "g_P204_WachfrauHomepoint"},	
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9023"},			
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = South, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_WachfrauHomepoint", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert", UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9023"},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		FigureDead{NpcId = 8830},
	},

	Actions =
	{
	   	SetGlobalFlagTrue {Name = "g_P204_WachmannTot"},	
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9023"},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
	   	IsGlobalFlagTrue {Name = "g_P204_BasarwacheSuedNachHause", UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9023"},
	}
}

OnIdleGoHome
{
	X = 280, Y = 160, WalkMode = Run, Direction = North,

	Conditions =
	{
		ODER9
		{
	   	IsGlobalFlagTrue {Name = "g_P204_BasarwacheSuedZuhause", UpdateInterval = 60},
	   	IsGlobalFlagTrue {Name = "g_P204_WachmannTot", UpdateInterval = 60},
	   	}	   	
	},

	HomeActions =
	{
		SetGlobalFlagFalse {Name = "g_P204_WachfrauHomepoint"},	
		SetGlobalFlagTrue{Name = "g_P204_WachfrauZuhause"},
	}
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_WachfrauZuhause", UpdateInterval = 60},
	}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n9023_Wachfrau.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			QuestState {QuestId = 947, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState {QuestId = 947, State = StateActive}),
		},
		Actions = {
			Say{Tag = "jylaP204_011", String = "Passt doch auf, wo Ihr hintretet! Ich hab gerade gefegt!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagWachfrauKnown"}),
		},
		Actions = {
			Say{Tag = "jylaP204_002", String = "Dieser Stinklurch! Der kann was erleben! ... Was gafft Ihr denn so?"},
			Answer{Tag = "jylaP204_003PC", String = "Nun, Ihr schreit die halbe Strasse zusammen, gute Frau.", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagWachfrauKnown"},
		},
		Actions = {
			Say{Tag = "jylaP204_001", String = "Sagt Endo er soll sich herpacken! Wachdienst oder nicht!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jylaP204_004", String = "Und dazu habe ich gutes Recht! Seht mal, wie diese Hausfassade aussieht! Zum Davonlaufen! Und er verspricht seit einem Mond sie zu richten, dieser Prahlhans!"},
			Answer{Tag = "jylaP204_005PC", String = "Euer Mann?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jylaP204_006", String = "Nein, die stinkende Pestplage die mich wie eine Sklavin hält und meinen Schmuck versäuft! Dieser Nichtsnutz! Und immer wenn ich ihn brauche hat er wieder ach so wichtigen Wachdienst! Pah!"},
			Answer{Tag = "jylaP204_007PC", String = "Wo hält er denn Wache?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jylaP204_008", String = "Am südlichen Basartor in der Mitte der Stadt! Er hat jetzt schon seit zwei Tagen Dienst! Alles Lüge! Wahrscheinlich säuft er wieder nur Wein und würfelt!"},
			Answer{Tag = "jylaP204_009PC", String = "Soll ich ihm liebe Grüße von Euch ausrichten?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jylaP204_010", String = "Liebe Grüße? Lieber schlucke ich eine Sandnatter! Bringt ihm diese Nachricht! Sagt ihm, er soll endlich seinen Wanst hierher schleppen und die Fassade in Ordnung bringen, wir erwarten Besuch! Wachdienst hin oder her!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 876}, SetGlobalFlagTrue {Name = "g_P204_FrauWillWachmann"},
			TransferItem {GiveItem = 7219, Flag = Give},
			SetPlayerFlagTrue{Name = "FlagWachfrauKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end