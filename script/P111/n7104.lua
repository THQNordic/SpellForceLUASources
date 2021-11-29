-->INFO: Einsiedlerkiste
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p111\n7104_Einsiedlerkiste.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedlerkiste111_001", String = "(Die Kiste ist verschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemHermitKey"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "Einsiedlerkiste_002PC", String = "(Den Schlüssel des Einsiedlers verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemHermitKey"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedlerkiste111_003", String = "(Der Schlüssel passt. Die Kiste kann nun geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetItemFlagFalse{Name = "PlayerHasItemHermitKey"},
			RemoveDialogFromNpc{NpcId = 7104},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end