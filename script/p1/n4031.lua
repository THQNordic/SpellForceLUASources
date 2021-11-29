-->INFO: UtranGuard
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 6}
--!EDS ONIDLEGOHOME END

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END


OnOneTimeEvent
{
Conditions = {
				Negated(QuestState{QuestId = 90, State = StateUnknown}),
				},
Actions = {
		RemoveDialog{}
		}
}

--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n4031_UtranGuard.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "utranGuard001", String = "Bleibt zurück! In Shiel wird gekämpft! Das Portal auf der anderen Seite ist in der Hand des Gegners!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "utranGuard002", String = "Ihr könnt nicht passieren! Es ist zu Eurem eigenen Schutz!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end