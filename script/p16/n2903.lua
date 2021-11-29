-->INFO: LeasGrab
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p16\n2903_LeasGrab.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState {QuestId = 387, State = StateActive},
		},
		Actions = {
			Say{Tag = "leasGrab001", String = "(Eine alte Grabstätte ohne Namen. Sie trägt allerdings das Wappen des Hauses Muir.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState {QuestId = 387, State = StateActive}),
		},
		Actions = {
			Say{Tag = "genericGrave001", String = "(Ein verwitterter Grabstein)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			 SetGlobalFlagTrue {Name = "SpawnLea"},
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end