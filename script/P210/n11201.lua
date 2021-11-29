-->INFO: Binaerstele1
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnToggleEvent 
{
	UpdateInterval = 15,
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_Binaer1On", UpdateInterval = 15},
	},
	OnActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3049},
		IncreaseGlobalCounter {Name = "g_P210_Binaercounter", Step = 1},
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210_Binaer1On", UpdateInterval = 15},
	},
	OffActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3050},
		DecreaseGlobalCounter {Name = "g_P210_Binaercounter", Step = 1},
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n11201_Binaerstele1.txt


	

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
			Say{Tag = "binarpillar1P210_001", String = "(Auf die Vorderseite der Säule ist eine große, schwarze 1 gemalt.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "binarpillar1P210_002PC", String = "(Die Säule berühren)", AnswerId = 2},
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
			FlipGlobalFlag{Name = "g_P210_Binaer1On"},
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