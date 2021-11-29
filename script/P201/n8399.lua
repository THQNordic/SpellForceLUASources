-->INFO: Ordensritter3
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions = 
	{
		--SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8399" },		
		--RemoveDialog {NpcId = self},
		SetGlobalFlagTrue {Name = "g_sP201Ordensritter3Gespawned"},	
	}
} 

Respawn 
{
	WaitTime = 1, 
	X = 98,
	Y = 100,
	NoSpawnEffect = FALSE ,
 	Conditions = 
 	{
 		IsGlobalCounter {Name = "g_cnP201OrdensritterStart3", Value = 0, Operator = IsEqual, UpdateInterval = 10},
 		IsGlobalFlagFalse {Name = "g_sP201StartCutszeneOutpost", UpdateInterval = 10},
 		IsGlobalFlagFalse {Name = "g_sP201Ordensritter3Verpflichtung"},	
 		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
 	} ,
 	Actions = 
 	{
 		Goto {X = _X, Y = _Y, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoForced},
 		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8399"},
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
		IsGlobalFlagFalse {Name = "g_sP201Ordensritter3Verpflichtung"},			
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
	X = 98,
	Y = 100,
	NoSpawnEffect = FALSE ,
 	Conditions = 
 	{
 		IsGlobalFlagTrue {Name = "g_sP201Ordensritter3Verpflichtung"},			
 		IsGlobalFlagFalse {Name = "g_sP201StartCutszeneOutpost", UpdateInterval = 10},
 		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
 	} ,
 	Actions = 
 	{
 		ChangeUnit {Unit = 2058, NpcId = self, ChangeLevel = TRUE},
 		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8399"},
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
-- Source: C:\project\main\mission\dialoge\P201\n8399_Ordensritter3.txt


	

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
			Say{Tag = "dawnknight3201_001", String = "Wo sind die anderen? Wer seid Ihr? Einer der Dorfbewohner?"},
			Answer{Tag = "dawnknight3201_002PC", String = "Sehe ich denn aus wie einer?", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawnknight3201_003", String = "Nun, jetzt wo Ihr es sagt ... nicht gerade, nein."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dawnknight3201_004", String = "Aber Ihr seht aus, als könntet Ihr Euch zur Wehr setzen! Bitte, helft mir meine Kameraden zu finden!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP201Ordensritter3Verpflichtung"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end