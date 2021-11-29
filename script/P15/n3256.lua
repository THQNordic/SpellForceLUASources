-->INFO: Wandspalt
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p15\n3256_Wandspalt.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "Wandspalt001", String = "(Ein tiefer Spalt zieht sich durch die Wand.)", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 421 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "Wandspalt001PC", String = "(In den Spalt hineingreifen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 421 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Wandspalt002", String = "(Im Innern der Wand war ein Kristall verborgen - der Schattenkristall.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 0 , GiveItem = 3200 , Flag = Give},
			SetRewardFlagTrue{ Name = "Schattenwelt4Kristall"},
			QuestSolve{QuestId = 421},
			QuestBegin{QuestId = 422},
			RemoveDialogFromNpc{NpcId = 3256},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end