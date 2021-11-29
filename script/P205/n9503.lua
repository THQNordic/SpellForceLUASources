-->INFO: Giftquelle
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneGartenEntgiftetStart", UpdateInterval = 10},
	},

	Actions =
	{
		RemoveDialog{NpcId = 9503},
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P205\n9503_Giftquelle.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			PlayerHasItem{ItemId = 7069},
			PlayerHasItem{ItemId = 7069},
		},
		Actions = {
			Say{Tag = "poisoned_wellP205_001", String = "(Dies ist die Quelle des Hains. Auf der Wasseroberfläche schwimmt eine dampfende, ölige Flüssigkeit. Sie scheint giftig zu sein.)"},
			OfferAnswer{Tag = "poisoned_wellP205_002PC", String = "(Das Gegengift in die Quelle schütten.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			PlayerHasItem{ItemId = 7069},
			Negated(PlayerHasItem{ItemId = 7069}),
		},
		Actions = {
			Say{Tag = "poisoned_wellP205_001", String = "(Dies ist die Quelle des Hains. Auf der Wasseroberfläche schwimmt eine dampfende, ölige Flüssigkeit. Sie scheint giftig zu sein.)"},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7069}),
		},
		Actions = {
			Say{Tag = "poisoned_wellP205_001", String = "(Dies ist die Quelle des Hains. Auf der Wasseroberfläche schwimmt eine dampfende, ölige Flüssigkeit. Sie scheint giftig zu sein.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P205_CutsceneGartenEntgiftetStart"},
			TransferItem {TakeItem = 7069, Flag = Take},
			QuestSolve {QuestId = 869},
			QuestBegin {QuestId = 870},
			Say{Tag = "poisoned_wellP205_003", String = "(Das Gegengift löst die ölige Flüssigkeit auf und wird von der Quelle aus schnell im ganzen See verteilt.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
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
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end