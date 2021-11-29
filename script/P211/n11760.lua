-->INFO: Gefaengnistor
--GefängnisTor Schattenkrieger

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X, Y = _Y, StayOpen = TRUE, EnableClosing = FALSE, Type = MetallTorWinzig,
	OpenConditions = 
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_P211GefaengnisTorOeffneDich" },	
			IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler", UpdateInterval = 20}
		},
	},
	OpenActions = 
	{
			SetGlobalFlagTrue {Name = "g_P211CSBefreiungInit"}
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p211\n11760_Gefaengnistor.txt


	

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
			Say{Tag = "gate001", String = "(Das Tor ist verschlossen. Ein großer Schlüssel könnte es öffnen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 3178},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gate001PC", String = "(Den großen Torschlüssel verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3178}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gate002", String = "(Der Schlüssel passt, das Tor öffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P211GefaengnisTorOeffneDich" } ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end