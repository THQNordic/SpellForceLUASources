-->INFO: TorNachKathai
--Tor nach Kathai
--wird geöffnet mit Schlüssel des Skelettgenerals


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 269, Y = 446, StayOpen = TRUE, EnableClosing = FALSE, Type = SteinTorKlein,
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_PortalKathaiAuf", UpdateInterval = 20},
	} ,
	OpenActions = 
	{
		SetGlobalFlagTrue {Name = "g_P211_JenquaiHoltKathai"},
		SetGlobalTimeStamp {Name = "gt_P211_JenquaiHoltKathai"},
		SetRewardFlagTrue {Name = "TorJenquaiGeoeffnet"},
		QuestSolve{QuestId = 935, ActivateNextQuest = FALSE }--Hilfe aus Kathai (Öffne das Tor)
		
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p211\n9810_TorNachKathai.txt


	

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
			Say{Tag = "kathaigate_dkwP211_001", String = "(Das Tor ist verschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7215, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 20}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem {ItemId = 7215, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 20},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kathaigate_dkwP211_002PC", String = "(Schlüssel des Skelettgenerals benutzen.)", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P211_PortalKathaiAuf"},
			RemoveDialog {NpcId = 9810},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kathaigate_dkwP211_003", String = "(Um das Tor zu öffnen, benötigt man einen passenden Schlüssel.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end