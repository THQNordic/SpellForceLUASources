-->INFO: Schalter
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Der Schalter für die bösen Anführer


-- Nur nachts und nur wenn die Bosse in der Nähe sind ist der Schalter benutzbar
--OnToggleEvent
--{
--	OffConditions =
--	{
--		TimeNight {},
--		FigureInRange{X = 270, Y = 250, NpcId = 8716, Range = 5},
--		FigureInRange{X = 265, Y = 250, NpcId = 8717, Range = 5},
--		IsGlobalFlagFalse {Name = "g_P206_SchalterBenutzt"},
--	},
--	OffActions =
--	{
--		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9229"},
--		SetEffect {NpcId = 9229, Effect = "Spawnboss", Length = 0},
--	},
--	OnConditions =
--	{
--		Negated (TimeNight {}),
--		Negated (FigureInRange{X = 270, Y = 250, NpcId = 8716, Range = 5}),
--		Negated (FigureInRange{X = 265, Y = 250, NpcId = 8717, Range = 5}),
--		IsGlobalFlagFalse {Name = "g_P206_SchalterBenutzt"},
--	},
--	OnActions =
--	{
--		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9229"},
--		StopEffect {NpcId = 9229},
--	}
--}    

-- Nur nachts und nur wenn die Bosse in der Nähe sind ist der Schalter benutzbar
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange{X = 270, Y = 250, NpcId = 8716, Range = 5},
		FigureInRange{X = 265, Y = 250, NpcId = 8717, Range = 5},
		IsGlobalFlagFalse {Name = "g_P206_SchalterBenutzt"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9229"},
		SetEffect {NpcId = 9229, Effect = "Spawnboss", Length = 0},
	},
}

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_SchalterBenutzt", UpdateInterval = 2},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9229"},
		StopEffect {NpcId = 9229},
		ChangeObject {X = 260, Y = 277, Object = 3039}
	}
}

--OnEvent
--{
--	Conditions =
--	{
--		IsGlobalFlagFalse {Name = "g_P206_SchalterBenutzt", UpdateInterval = 2},
--		FigureInRange{X = 279, Y = 250, NpcId = 8716, Range = 5},
--		FigureInRange{X = 265, Y = 250, NpcId = 8717, Range = 5},
--	},
--	Actions =
--	{
--		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9229"},
--	}
--}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p206\n9229_Schalter.txt


	

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
			Say{Tag = "lever_redwastesP206_001", String = "(Dieser Hebel sieht sehr alt aus, so als ob er seit langer Zeit nicht mehr benutzt worden wäre.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lever_redwastesP206_002PC", String = "(Den Hebel betätigen.)", AnswerId = 2},
			OfferAnswer{Tag = "lever_redwastesP206_004PC", String = "(Den Hebel in Ruhe lassen.)", AnswerId = 5},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lever_redwastesP206_003", String = "(Ein Knirschen wie Stein auf Stein ist zu hören, als der Hebel sich langsam bewegt. Schließlich dringt ein lautes Zischen an Euer Ohr.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			SetGlobalFlagTrue {Name = "g_P206_SchalterBenutzt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end