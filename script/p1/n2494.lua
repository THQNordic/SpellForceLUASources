-->INFO: locked_chest
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n2494_locked_chest.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "lockedChest001", String = "(Diese schwere Truhe scheint auf magischem Weg mit Bändern versiegelt worden zu sein. Ein rostiges Schloss befindet sich an der Vorderseite.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 2629},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lockedChest001PC", String = "(Den kleinen rostigen Schlüssel verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2629}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lockedChest002", String = "(Als der kleine rostige Schlüssel das Schloss aufschließt, springen die Bänder von der Truhe ab. Sie kann nun geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2629 , Flag = Take},
			RemoveDialogFromNpc{NpcId = 2494},
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