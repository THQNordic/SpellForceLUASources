-->INFO: Goblin1Gelb

MyFarbe =
{
	[1] = { Zeile = "g_Mastergame_Zeile1Gruen", Spalte = "g_Mastergame_Spalte1Gruen"},
	[2] = { Zeile = "g_Mastergame_Zeile2Gruen", Spalte = "g_Mastergame_Spalte2Gruen"},
	[3] = { Zeile = "g_Mastergame_Zeile3Gruen", Spalte = "g_Mastergame_Spalte3Gruen"},
	[4] = { Zeile = "g_Mastergame_Zeile4Gruen", Spalte = "g_Mastergame_Spalte4Gruen"},
	[5] = { Zeile = "g_Mastergame_Zeile5Gruen", Spalte = "g_Mastergame_Spalte5Gruen"},
}

MyColorCode = 1   --  1: grün
				  --  2: gelb
				  --  3: rot
				  --  4: braun
				  --  5: weiß
				  
MyRound = 1

MyFunctionInGame = 1     -- 1: Goblin
                 		 -- 2: Spielmeister


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/P208/n11440_Spielgoblins.lua")
dofile("script/P208/n11440_Dialogue.lua")




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p208\n11440_Goblin1Gelb.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval", UpdateInterval = 10},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval", UpdateInterval = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "(Goblin auf die Spielfläche schicken)", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue { Name ="npc_Mastergame_GoNow"},
			SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
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