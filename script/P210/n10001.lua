-->INFO: Raum9Stele1
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnToggleEvent 
{
	UpdateInterval = 15,
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "P210Room9Stele01On", UpdateInterval = 15},
	},
	OnActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3049},
		IncreaseGlobalCounter {Name = "g_P210_Room9StelenRiddle1Lit"},
		IncreaseGlobalCounter {Name = "TESTSTELE9"},
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "P210Room9Stele01On", UpdateInterval = 15},
	},
	OffActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3050},
		DecreaseGlobalCounter {Name = "g_P210_Room9StelenRiddle1Lit"},
		DecreaseGlobalCounter {Name = "TESTSTELE9"},
	}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n10001_Raum9Stele1.txt


	

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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "room9pillar1P210_001PC", String = "(Die Säule berühren)", AnswerId = 2},
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
			FlipGlobalFlag { Name = "P210Room9Stele01On"},
			FlipGlobalFlag { Name = "P210Room9Stele02On"},
			FlipGlobalFlag { Name = "P210Room9Stele04On"},
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