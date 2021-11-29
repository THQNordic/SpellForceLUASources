-->INFO: Dritte_Festung_Schalter_Eins
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Eins_Umgelegt"},
	},
	Actions =
	{
		ChangeObject {X = _X, Y = _Y, Object = 3039},
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P207\n10966_Dritte_Festung_Schalter_Eins.txt


	

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
			Say{Tag = "lever01P207_001", String = "(Ein alter rostiger Hebel.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lever01P207_002PC", String = "(Den Hebel umlegen.)", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "lever01P207_003PC", String = "(Ein Knirschen ist tief im Fels zu hören.)", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "lever01P207_004PC", String = "(Ein Tor innerhalb der Festung öffnet sich)", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Eins_Umgelegt"},
			RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end