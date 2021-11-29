-->INFO: Quelle
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p102\n5566_Quelle.txt


	

	OnBeginDialog{
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemGift"},
		},
		Actions = {
			Say{Tag = "quelle102_001", String = "(Dies ist die einzige klare Quelle in dieser Gegend.)"},
			OfferAnswer{Tag = "quelle102_002PC", String = "(Gift in die Quelle geben.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGift"}),
		},
		Actions = {
			Say{Tag = "quelle102_001", String = "(Dies ist die einzige klare Quelle in dieser Gegend.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "quelle102_003", String = "(Das Gift vermischt sich spurlos mit dem Wasser. Jeder, der davon trinkt, wird die Wirkung des Wildfeuergiftes spüren.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 565},
					QuestBegin{QuestId = 566},
					SetItemFlagFalse{Name = "PlayerHasItemGift"},
					SetGlobalFlagTrue{Name = "DialogWasserquelleEnded"},
					RemoveDialog{NpcId = 5566},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end