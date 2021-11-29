-->INFO: WacheRedWaste
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 9878},
		SetGlobalFlagTrue {Name = "g_P204_WacheRedWasteHomepoint"},
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_9878"},				
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = West, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_WacheRedWasteHomepoint", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


OnOneTimeEvent
{
	Conditions = 
	{	
		FigureInRange { X = 334, Y = 169, NpcId = 9877, Range = 2, UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagFalse {Name = "g_P204_IshtarZumTor"},
		SetGlobalFlagTrue {Name = "g_P204_IshtarVerstecktSich"},
		SetGlobalFlagFalse {Name = "g_P204_WacheRedWasteHomepoint"},			
	}
}

OnIdleGoHome
{

	X = 331, Y = 177, WalkMode = Run, Direction = North,
	
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_IshtarVerstecktSich", UpdateInterval = 60},
	},
	
	HomeActions = 
	{
		SetGlobalFlagFalse {Name = "g_P204_IshtarVerstecktSich"},
		SetGlobalFlagTrue {Name = "g_P204_RedWasteWacheDespawnt"},
		SetGlobalFlagTrue {Name = "g_P204_IshtarNachHause"},		
	},
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_RedWasteWacheDespawnt", UpdateInterval = 60},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n9878_WacheRedWaste.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagRedWasteWacheKnown"},
		},
		Actions = {
			Say{Tag = "gatekeeper_ulyoP204_001", String = "Weitergehen, hier gibt es nichts zu sehen! Weitergehen!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagRedWasteWacheKnown"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "gatekeeper_ulyoP204_002PC", String = "Euch fragen, was hinter diesem Tor liegt?", AnswerId = 2},
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
			Say{Tag = "gatekeeper_ulyoP204_003", String = "Das Portal in die Rote Wüste! Ein verbranntes Ödland voller Hazim und Untoter!"},
			Answer{Tag = "gatekeeper_ulyoP204_004PC", String = "Darf man es betreten?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_ulyoP204_005", String = "Seid Ihr von Sinnen? Ausserdem habt Ihr bestimmt keinen Passierschein!"},
			Answer{Tag = "gatekeeper_ulyoP204_006PC", String = "Nein, den habe ich nicht.", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_ulyoP204_007", String = "Dann wird das nichts! Aber ganz im ernst, da würdet Ihr auch nicht hin wollen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagRedWasteWacheKnown"},
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