-->INFO: Cave
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P108\n6305_Cave.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "cave108_001", String = "(Die Höhle führt hinab in dunkle Schächte. Jemand regt sich darin.)"},
			OfferAnswer{Tag = "cave108_002PC", String = "(Windjalf befreien.)", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cave108_003", String = "(Windjalf kommt aus der Dunkelheit gewankt. Er sieht erschöpft aus.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "WindjalfBefreitP108"}, RemoveDialog{},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end