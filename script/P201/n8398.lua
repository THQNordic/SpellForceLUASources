-->INFO: Ordensritter2
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
		IsGlobalFlagTrue {Name = "g_sP201SpawnStartOrdensritter2"},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions = 
	{
		
		SetGlobalFlagTrue {Name = "g_sP201Ordensritter2Gespawned"},	
	}
} 


Respawn 
{
	WaitTime = 1, 
	X = 131,
	Y = 220,
	NoSpawnEffect = FALSE ,
 	Conditions = 
 	{
 		IsGlobalCounter {Name = "g_cnP201OrdensritterStart2", Value = 0, Operator = IsEqual, UpdateInterval = 10},
 		IsGlobalFlagFalse {Name = "g_sP201StartCutszeneOutpost", UpdateInterval = 10},
 		IsGlobalFlagFalse {Name = "g_sP201Ordensritter2Verpflichtung"},	
 		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
 	} ,
 	Actions = 
 	{
 		Goto {X = _X, Y = _Y, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoForced},
 		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8398"},
 	} ,
 	DeathActions = 
 	{
 	
 	} 
}

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		
		IsGlobalFlagTrue {Name = "g_sP201StartCutszeneOutpost"},
	},
	Actions =
	{
	
	}
}

--Sicherheitsabfrage, wenn sich der Ordensritter zurück zieht und Idle wird, soll er sich wieder zum Kampfplatz begeben.
OnIdleEvent
{
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_sP201Ordensritter2Verpflichtung"},			
	},
	Actions = 
	{ 
		Goto {X = _X, Y = _Y, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoForced},
	},
}

--Wenn der Ordenskrieger rekrutiert wurde und dann stirbt.
Respawn 
{
	WaitTime = 30, 
	X = 131,
	Y = 220,
	NoSpawnEffect = FALSE ,
 	Conditions = 
 	{
 		IsGlobalFlagTrue {Name = "g_sP201Ordensritter2Verpflichtung"},			
 		IsGlobalFlagFalse {Name = "g_sP201StartCutszeneOutpost", UpdateInterval = 10},
 		IsGlobalFlagFalse {Name = "g_sP201CanyonDurchwandert"},
 		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
 	} ,
 	Actions = 
 	{
 		ChangeUnit {Unit = 2058, NpcId = self, ChangeLevel = TRUE},
 		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8398"},
		ChangeFigureOwner {NpcId = self},	
		Follow {Target = 0, NpcId = self},	
 	} ,
 	DeathActions = 
 	{
 	
 	} 
}



--Wenn der Ordenskrieger rekrutiert wurde und der Spieler schon durch den Canyon gewandert ist und dann stirbt.
Respawn 
{
	WaitTime = 30, 
	X = 98,
	Y = 100,
	NoSpawnEffect = FALSE ,
 	Conditions = 
 	{
 		IsGlobalFlagTrue {Name = "g_sP201Ordensritter2Verpflichtung"},			
 		IsGlobalFlagFalse {Name = "g_sP201StartCutszeneOutpost", UpdateInterval = 10},
 		IsGlobalFlagTrue {Name = "g_sP201CanyonDurchwandert"},
 	} ,
 	Actions = 
 	{
 		ChangeUnit {Unit = 2058, NpcId = self, ChangeLevel = TRUE},
 		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8398"},
		ChangeFigureOwner {NpcId = self},	
		Follow {Target = 0, NpcId = self},	
 	} ,
 	DeathActions = 
 	{
 	
 	} 
}







--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P201\n8398_Ordensritter2.txt


	

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
			Say{Tag = "dawnknight2_001", String = "Ein Mensch! Ihr glaubt ja nicht, wie froh ich bin, Euch zu sehen!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawnknight2_002", String = "Ich bin ein Ritter aus Nortander ... und wer auch immer Ihr seid, Euch können nur die Götter geschickt haben!"},
			Answer{Tag = "dawnknight2_003PC", String = "Verlasst Euch nicht auf die Götter, Freund. Was geschieht hier?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawnknight2_004", String = "Dieses Land stirbt! Jede Stunde kriechen hier mehr und mehr Untote herum! Verflucht sei der Tag an dem wir hier her gezogen sind!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawnknight2_005", String = "Irgend etwas Grauenvolles geht hier um!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawnknight2_006", String = "Und es wird uns alle holen! So wie Urias!"},
			Answer{Tag = "dawnknight2_007PC", String = "Urias ist hier?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawnknight2_008", String = "Er ist unser Kommandant! Doch er ist seit Tagen verschollen! Ich war auf der Suche nach ihm!"},
			Answer{Tag = "dawnknight2_009PC", String = "Ob Urias auch wegen Darius hier ist? Ich muss ihn finden!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawnknight2_010", String = "Dann lasst uns ihn gemeinsam suchen!"},
			Answer{Tag = "dawnknight2_011PC", String = "Wohlan, kommt!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP201Ordensritter2Verpflichtung"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end