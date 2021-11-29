-->INFO: HebelLinks
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Stein1Deaktiviert"},
		IsGlobalFlagTrue{Name = "g_P204_Stein2Deaktiviert"},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_AlarmLinksDeaktiviert"},
		ChangeObject{X = 376, Y = 265, Object = 3050}, 		
	}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10989_HebelLinks.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "g_P204_Stein1Deaktiviert"}, IsGlobalFlagTrue{Name = "g_P204_Stein2Deaktiviert"}),
		},
		Actions = {
			Say{Tag = "lever_leftP204_001", String = "(Eine Alarmglocke ist hier angebracht.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "g_P204_Stein1Deaktiviert"}, IsGlobalFlagTrue{Name = "g_P204_Stein2Deaktiviert"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lever_leftP204_002", String = "(Der goldene Hammer, der die Glocke schlägt, ist durch eine Riegel blockiert. Der Alarm ist ausgeschaltet.)"},
			OfferAnswer{Tag = "lever_leftP204_003PC", String = "(Den Hebel umlegen.)", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lever_leftP204_004", String = "(Der Hammer wird druch den Riegel gehalten, der Alarm bleibt stumm.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			ChangeObject{X = 374, Y = 265, Object = 3040}, SetGlobalFlagTrue {Name = "g_P204_HebelLinksBewegt"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_HebelLinksBewegt"},
		},
		Actions = {
			Say{Tag = "lever_leftP204_005", String = "Der Hebel lässt sich nicht mehr bewegen"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_HebelLinksBewegt"}),
		},
		Actions = {
			Say{Tag = "lever_leftP204_001", String = "(Eine Alarmglocke ist hier angebracht.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lever_leftP204_006", String = "(Ein goldener Hammer an der Glocke wird scheinbar druch ein Gewirr von Zahnrädern betrieben. Er könnte jederzeit Alarm schlagen.)"},
			OfferAnswer{Tag = "lever_leftP204_003PC", String = "(Den Hebel umlegen.)", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			ChangeObject{X = 374, Y = 265, Object = 3040}, SetGlobalFlagTrue {Name = "g_P204_HebelLinksBewegt"},
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
			UND(IsGlobalFlagTrue {Name = "g_P204_HebelLinksBewegt", UpdateInterval = 1},IsGlobalFlagTrue {Name = "g_P204_HebelRechtsBewegt", UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "lever_leftP204_007", String = "(Der Alarm wurde ausgelöst! Die Wächter der Bank erwachen!)"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue {Name = "g_P204_HebelLinksBewegt", UpdateInterval = 1},IsGlobalFlagTrue {Name = "g_P204_HebelRechtsBewegt", UpdateInterval = 5})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end