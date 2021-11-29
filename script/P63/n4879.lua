-->INFO: Höhle
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n4879_Höhle.txt


	

	OnBeginDialog{
		Conditions = {
			UND(QuestState {QuestId = 332, State = StateActive}, FigureInRange {X = 167, Y = 220, NpcId = 2867, Range = 10}),
		},
		Actions = {
			Say{Tag = "caveGrf001", String = "(Eine alte, verwitterte Höhle, die wohl einmal ein Grab war. Ein entferntes Flüstern ist zu hören, vielleicht ist es der Wind.)"},
			OfferAnswer{Tag = "caveGrf001PC", String = "(Nach Shin Tar Guar rufen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(QuestState {QuestId = 332, State = StateActive}, FigureInRange {X = 167, Y = 220, NpcId = 2867, Range = 10})),
		},
		Actions = {
			Say{Tag = "caveGrf001", String = "(Eine alte, verwitterte Höhle, die wohl einmal ein Grab war. Ein entferntes Flüstern ist zu hören, vielleicht ist es der Wind.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "caveGrf002", String = "(Als Ihr den Namen aussprecht, beginnt die Luft zu beben. Etwas bewegt sich im Inneren der Höhle.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			 QuestSolve {QuestId = 332}, QuestBegin {QuestId = 333} , RemoveDialog{},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end