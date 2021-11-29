-->INFO: SchaleWest
-- Schale West
--(Wächter 4 = 8825)

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Effekt an am Anfang
OnOneTimeEvent
{
	Conditions = {},
	Actions = 
	{ 
		SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Object, NpcId = 8811},
		SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Figure, NpcId = 8825}
	}
}

--Effekt an / aus
OnToggleEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	OnConditions = 
	{  
		IsGlobalFlagTrue {Name = "g_P202SonnenUhrSchatten4", UpdateInterval = 10}
	},
	OnActions = 
	{  
		StopEffect{TargetType = Object, NpcId = 8811},
		StopEffect{TargetType = Figure, NpcId = 8825},
		SetGlobalFlagTrue {Name = "g_P202KristallEffekt4Aus"}
	},
	OffConditions = 
	{  
		FigureAlive {NpcId = 8825},
		IsGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten4", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P211KristallSchaleWestKaputt", UpdateInterval = 10}
	},
	OffActions = 
	{  
		SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Object, NpcId = 8811},
		SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Figure, NpcId = 8825},
		SetGlobalFlagFalse {Name = "g_P202KristallEffekt4Aus"}
	},
}


--Effekt aus, wenn Kristall zerstört
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211KristallSchaleWestKaputt", UpdateInterval = 10},
	},
	Actions = 
	{ 
		StopEffect{TargetType = Object, NpcId = 8811},
		StopEffect{TargetType = Figure, NpcId = 8825},
		SetGlobalFlagTrue {Name = "g_P202KristallEffekt4Aus"}
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n8811_SchaleWest.txt


	

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
			Say{Tag = "bowl_westP202_001", String = "(In der Schale ist ein sehr harter Kristall eingelassen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bowl_westP202_002", String = "(Eine magische Aura geht von dem Kristall aus. Das Glühen in seinem Innern erinnert Euch an einen Herzschlag.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bowl_westP202_003", String = "(Der Kristall ist sehr hart, normale Waffen sind hier nutzlos. Nur ein anderer Kristall kann ihn brechen.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			PlayerHasItem {ItemId = 7075, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7075, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "bowl_westP202_004PC", String = "(Das Diamantschwert dazu benutzen, den Kristall zu zerschlagen.)", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bowl_westP202_005", String = "(Der Kristall zersplittert in tausend Stücke. Aber auch das Kristallschwert hält den Schlag nicht aus und zerspringt.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7075, GiveItem = 0, Amount = 1, Flag = Take},
									SetGlobalFlagTrue {Name = "g_P211KristallSchaleWestKaputt"},
			RemoveDialog {NpcId = 8811},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bowl_westP202_006", String = "(Keines der Schwerter in Ihrem Besitz ist hart genug für den Kristall)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end