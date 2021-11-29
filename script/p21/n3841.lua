-->INFO: EisMenhir
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p21\n3841_EisMenhir.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 334 , State = StateActive},
		},
		Actions = {
			Say{Tag = "eisMenhir001", String = "(Der große Stein scheint kürzlich bewegt worden zu sein.)"},
			OfferAnswer{Tag = "eisMenhir001PC", String = "(Unter dem Stein nach dem Splitter suchen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 334 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "eisMenhir001", String = "(Der große Stein scheint kürzlich bewegt worden zu sein.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "eisMenhir002", String = "(Im Boden verscharrt liegt der Splitter des Herbstlichts.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "eisMenhir003", String = "(Plötzlich umgibt ein weißes Glühen den Stein.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2797 , Amount = 1 , Flag = Give}, 
				QuestSolve{QuestId = 334}, QuestSolve{QuestId = 301},
				SetRewardFlagTrue{ Name = "ShardAutum"},
				RemoveDialog{},
			 SetGlobalFlagTrue {Name = "SpawnIce"},
			EndDialog(),
		}}


	EndDefinition()
end