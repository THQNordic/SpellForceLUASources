-->INFO: Tisch
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions =
	{
			IsGlobalFlagTrue {Name = "g_P204_BierHinstellen", UpdateInterval = 60},
	Negated (PlayerUnitInRange {X = 217, Y = 278, Range = 10, FigureType = Avatar, UpdateInterval = 60}),
	},
	
	Actions =
	{
	SetGlobalFlagTrue{Name = "g_P204_WacheKommtAusKneipe"},
	SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9011"},
	}
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10489_Tisch.txt


	

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
			Say{Tag = "winetableP204_001", String = "(Auf diesem Tisch steht ein Krug braunes Wasser. Hier scheinen die Wachen des nahen Tores ihren Durst zu stillen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 4631},
		},
		Actions = {
			Say{Tag = "winetableP204_002", String = "(Des Füllstandes nach tun sie dies wohl nur widerwillg, was Euch bei diesem schmutzigen Gebräu auch nicht wundert.)"},
			OfferAnswer{Tag = "winetableP204_003PC", String = "(Den Wein auf den Tisch stellen)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 4631}),
		},
		Actions = {
			Say{Tag = "winetableP204_002", String = "(Des Füllstandes nach tun sie dies wohl nur widerwillg, was Euch bei diesem schmutzigen Gebräu auch nicht wundert.)"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "winetableP204_004", String = "(Den Wein sieht neben dem fauligen Wasser recht verlockend aus.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 4631, Flag = Take},
			SetGlobalFlagTrue{Name ="g_P204_BierHinstellen"}, QuestSolve {QuestId = 877}, SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9668"},
			ChangeObject{X = 215, Y = 280, Object = 3194},
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


	EndDefinition()
end