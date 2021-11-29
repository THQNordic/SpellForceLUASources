-->INFO: AmrasGrabstein
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p15\n2911_AmrasGrabstein.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState {QuestId = 391, State = StateActive},
		},
		Actions = {
			Say{Tag = "amrasGrabstein001", String = "(Hier fiel Amra im ehrenvollen Kampf)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState {QuestId = 391, State = StateActive}),
		},
		Actions = {
			Say{Tag = "genericGrave001", String = "(Ein verwitterter Grabstein)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			 SetGlobalFlagTrue {Name = "SpawnAmra"},
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end