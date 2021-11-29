-->INFO: Gefaengnis
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X,
	Y = _Y,
	StayOpen = TRUE,
	Type = DunkelelfenTor,
	OpenConditions = 
	{
		IsGlobalFlagTrue{Name = "g_p207_Gefaengnis_Tuer_Offen"},
	},
	OpenActions = 
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10665"},
	},
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P207\n10665_Gefaengnis.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsItemFlagTrue {Name = "PlayerHasItemDwarfJailKey"},
		},
		Actions = {
			Say{Tag = "prison_ravenpassP207_001", String = "(Eine verschlossene Gefängnistür.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsItemFlagTrue {Name = "PlayerHasItemDwarfJailKey"}),
		},
		Actions = {
			Say{Tag = "prison_ravenpassP207_001", String = "(Eine verschlossene Gefängnistür.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "prison_ravenpassP207_002PC", String = "(Den Gefängnisschlüssel verwenden.)", AnswerId = 2},
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
			SetGlobalFlagTrue{Name = "g_p207_Gefaengnis_Tuer_Offen"},
			Say{Tag = "prison_ravenpassP207_003", String = "(Die vielen Schlösser der Tür öffnen sich gleichzeitig mit einem lauten Schlag. Die Tür geht auf.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "prison_ravenpassP207_004", String = "(Euch fehlt der passende Schlüssel dafür.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end