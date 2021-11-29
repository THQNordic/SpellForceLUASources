-->INFO: stein
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p17\n2668_stein.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 252 , State = StateActive},
			QuestState{QuestId = 252 , State = StateActive},
		},
		Actions = {
			Say{Tag = "steinGW001", String = "(Der Stein scheint tatsächlich etwas lose zu sitzen. Es könnte sein, dass dies derjenige ist, den Vintus gemeint hat.)"},
			OfferAnswer{Tag = "steinGW002PC", String = "(Unter den Stein sehen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 252 , State = StateActive},
			Negated(QuestState{QuestId = 252 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "steinGW001", String = "(Der Stein scheint tatsächlich etwas lose zu sitzen. Es könnte sein, dass dies derjenige ist, den Vintus gemeint hat.)"},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 252 , State = StateActive}),
			QuestState{QuestId = 252 , State = StateActive},
		},
		Actions = {
			Say{Tag = "steinGW002", String = "(Kratzspuren bedecken den Stein. Hier waren zwergische Spitzhacken am Werk.)"},
			OfferAnswer{Tag = "steinGW002PC", String = "(Unter den Stein sehen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 252 , State = StateActive}),
			Negated(QuestState{QuestId = 252 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "steinGW002", String = "(Kratzspuren bedecken den Stein. Hier waren zwergische Spitzhacken am Werk.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "steinGW003", String = "(Tatsächlich befindet sich ein eingeschlagenes Bündel unter dem Stein.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "steinGW004", String = "(Das Bündel enthält ein großes Fragment aus farbigem Glas. Formen und Farben scheinen sich darin zu bewegen. Es ist rätselhaft - und wunderschön zugleich.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2634 , Amount = 1 , Flag = Give} , QuestSolve{QuestId = 252}, QuestSolve{QuestId = 264},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 252 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "steinGW002PC", String = "(Unter den Stein sehen.)", AnswerId = 1},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 252 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end