-->INFO: Raum9zHebel9a
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnToggleEvent 
{
	UpdateInterval = 30,
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "g_P210Room9zSwitch9aOn", UpdateInterval = 30},
	},
	OnActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3039},     
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210Room9zSwitch9aOn", UpdateInterval = 30},
	},
	OffActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3040},
	}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n10024_Raum9zHebel9a.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l�sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
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
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room9zlever9aP210_001PC", String = "(Den Hebel umlegen)", AnswerId = 2},
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
			FlipGlobalFlag { Name = "g_P210Room9zSwitch9aOn"},
			FlipGlobalFlag { Name = "g_P210Room9zEye05On"},
			FlipGlobalFlag { Name = "g_P210Room9zEye06On"},
			FlipGlobalFlag { Name = "g_P210Room9zEye08On"},
			FlipGlobalFlag { Name = "g_P210Room9zEye09On"},
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