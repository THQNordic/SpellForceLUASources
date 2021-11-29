-->INFO: Dialog_01
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
	{
	Actions = 	{RemoveDialog{}}
	}

OnOneTimeEvent
	{
	Conditions = {IsGlobalFlagTrue{Name = "p84_startup_cutscene_zuende"}},
	Actions = 	{EnableDialog{}}
	}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p84\n8342_Dialog_01.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "Startup_NPC_01", String = "Bitte begib dich zur Druidin."},
			Answer{Tag = "", String = "Wo sagtet ihr, finde ich eure Stadt?", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Startup_NPC_02", String = "Begebt Euch nach Westen. Folge einfach diesem Pfad."},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end