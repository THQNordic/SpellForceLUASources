-->INFO: MenhirTempel
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p111\n6996_MenhirTempel.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhirTemple_P111_001", String = "(Ein gewaltiger Stein, der über und über mit Flammensymbolen verziert ist.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSchattenring"},
		},
		Actions = {
			Say{Tag = "menhirTemple_P111_002", String = "(Einen Runeninschrift: Empfange die unheilige Flamme Zarachs.)"},
			OfferAnswer{Tag = "menhirTemple_P111_003PC", String = "(Die Runeninschrift berühren.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSchattenring"}),
		},
		Actions = {
			Say{Tag = "menhirTemple_P111_002", String = "(Einen Runeninschrift: Empfange die unheilige Flamme Zarachs.)"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhirTemple_P111_004", String = "(Flammen lodern um den Stein, und formen sich zu einer Gestalt.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "ElementarBeschwoertP111"},
				QuestSolve{QuestId = 674 },
				QuestBegin{QuestId = 675 },
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end