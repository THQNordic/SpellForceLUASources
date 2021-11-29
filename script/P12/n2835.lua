-->INFO: malicors_chest
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p12\n2835_malicors_chest.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "malicorsChest001", String = "(Diese schwere Truhe scheint auf magischem Weg mit Bändern aus Silber versiegelt worden zu sein. Ein silbernes Schloss befindet sich an der Vorderseite.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 2619},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "malicorsChest001PC", String = "(Den silbernen Schlüssel benutzen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2619}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "malicorsChest002", String = "(Als der silberne Schlüssel das Schloss entriegelt, springen die silbernen Bänder von der Truhe ab. Sie kann nun normal geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			RemoveDialog{} , TransferItem{TakeItem = 2619 , Flag = Take},
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