-->INFO: Nazhosh
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsNpcFlagFalse {Name = "OneTimeSpawn"},
		IsGlobalFlagTrue {Name = "P103_KnochenquestSpawn"},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "OneTimeSpawn"},
	}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p103\n7059_Nazhosh.txt


	

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
			Say{Tag = "nazhosh103_001", String = "Ich lasse Euch am Leben, weil Ihr uns beigestanden habt. Doch jetzt verschwindet!"},
			Answer{Tag = "nazhosh103_002PC", String = "Ich bin kein Lichtkriecher, den Ihr nach Bedarf herumstoßen könnt, Ork! Euer Blut verrinnt ebenso gut im Schlamm wie das dieser Bestien!", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazhosh103_003", String = "Ihr wagt es, mir zu drohen?"},
			Answer{Tag = "nazhosh103_004PC", String = "Ich habe Euch gerettet, Euer Leben gehört mir! Nun zahlt den Preis, wie es Brauch ist!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazhosh103_005", String = "Was verlangt Ihr?"},
			Answer{Tag = "nazhosh103_006PC", String = "Die Knochen, die Ihr tragt!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazhosh103_007", String = "Diesen Plunder? Ha! Nehmt ihn! Wenn das Euer Preis sein soll, dann ist er mir billig genug!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 4257, Flag = Give},
							RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end