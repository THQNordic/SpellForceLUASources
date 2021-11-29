-->INFO: Spawnpoint01
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnToggleEvent 
{
	UpdateInterval = 15,
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint01On", UpdateInterval = 15},
	},
	OnActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3049},
		SetGlobalTimeStamp{ Name = "P212Spawnpoint01Running"},
		QuestBegin {QuestId = 960}, -- Subsubquest begonnen "Stein 1 ausschalten"
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "P212Spawnpoint01On", UpdateInterval = 15},
	},
	OffActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3050},
		QuestSolve {QuestId = 960}, -- Subsubquest begonnen "Stein 1 ausschalten"
		SetRewardFlagTrue { Name = "Stele1Off" },
	}
}


OnToggleEvent 
{
	UpdateInterval = 15,
	OnConditions =
	{
		ODER9
		{
		IsMonumentInUse {X = 313, Y = 423, Range = 5},
		IsMonumentInUse {X = 207, Y = 473, Range = 5},
		}, 
	},
	OnActions	=
	{
		SetGlobalTimeStamp{Name = "g_P212_Spawnpoint01_Timer"}
	},
	OffConditions =
	{
		Negated(IsMonumentInUse {X = 313, Y = 423, Range = 5}),
		Negated(IsMonumentInUse {X = 207, Y = 473, Range = 5}),
	},
	OffActions	=
	{
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p212\n10391_Spawnpoint01.txt


	

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
			OfferAnswer{Tag = "coloumn1P212_001PC", String = "(Die Säule berühren)", AnswerId = 2},
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
			FlipGlobalFlag { Name = "P212Spawnpoint01On"},
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