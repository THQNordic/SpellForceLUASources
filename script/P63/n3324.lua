-->INFO: SuedGrabstein
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

REM = [[

OnOneTimeEvent
{
Conditions = {
		IsGlobalFlagTrue{Name = "PreviewVersion"}
			},
Actions = {
		RemoveDialog{}
		}
}
]]


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n3324_SuedGrabstein.txt


	

	OnBeginDialog{
		Conditions = {
			UND (QuestState {QuestId = 325, State = StateActive}, IsGlobalFlagFalse {Name = "SouthStoneSolved"}),
		},
		Actions = {
			Say{Tag = "suedGrabstein001", String = "(Der Grabstein scheint sehr alt zu sein. Ein seltsames Raunen geht von ihm aus.)"},
			OfferAnswer{Tag = "suedGrabstein001PC", String = "(Den Stein genau untersuchen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND (QuestState {QuestId = 325, State = StateActive}, IsGlobalFlagFalse {Name = "SouthStoneSolved"})),
		},
		Actions = {
			Say{Tag = "suedGrabstein001", String = "(Der Grabstein scheint sehr alt zu sein. Ein seltsames Raunen geht von ihm aus.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "suedGrabstein002", String = "(Der Name auf dem Stein ist nicht mehr zu entziffern.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "suedGrabstein003", String = "(Eine Stimme wie ein Echo aus weiter Ferne scheint aus dem Stein ein Wort zu sprechen:)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "suedGrabstein004", String = "Tar."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "SouthStoneSolved"},SetGlobalFlagTrue {Name = "OneStoneTouched"}, SetRewardFlagTrue {Name = "EchosBuchstabe2"} ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			UND (QuestState {QuestId = 325, State = StateActive}, IsGlobalFlagFalse {Name = "SouthStoneSolved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "suedGrabstein001PC", String = "(Den Stein genau untersuchen.)", AnswerId = 1},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND (QuestState {QuestId = 325, State = StateActive}, IsGlobalFlagFalse {Name = "SouthStoneSolved"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end