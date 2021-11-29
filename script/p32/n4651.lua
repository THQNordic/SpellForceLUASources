-->INFO: gateSharrowSoulforger
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 299, Y = 394, StayOpen = TRUE , Type = SteinTorKlein,
	OpenConditions = {
		IsGlobalFlagTrue{Name = "SharrowGateSoulforgerOpen", UpdateInterval = 5},
	} ,
	OpenActions = {
		SetGlobalFlagTrue{Name = "BladeArmyAttackNow"},
	},
}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p32\n4651_gateSharrowSoulforger.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "gateSharLow001", String = "(Eine schwarze Metallplatte verschließt das Tor. Drei keilförmige Vertiefungen befinden sich darin.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			UND(PlayerHasItem{ItemId = 3462} , UND(PlayerHasItem{ItemId = 3463} , PlayerHasItem{ItemId = 3464})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "HasSeenSoulforgerGate"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateSharLow001PC", String = "(Die drei Metallkeile einsetzen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 3462} , UND(PlayerHasItem{ItemId = 3463} , PlayerHasItem{ItemId = 3464}))),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "HasSeenSoulforgerGate"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gateSharLow002", String = "(Die drei Keile passen in die Vertiefungen. Ein Teil der Platte beginnt sich zu drehen. Das Tor öffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "SharrowGateSoulforgerOpen"} , TransferItem{TakeItem = 3462 , Amount = 1 , Flag = Take},
			TransferItem{TakeItem = 3463 , Amount = 1 , Flag = Take} ,
			SetRewardFlagTrue{ Name = "KreisSchluss2Tor3"}, 
			TransferItem{TakeItem = 3464 , Amount = 1 , Flag = Take},
			QuestSolve{QuestId = 548},
			QuestSolve{QuestId = 544},
			QuestBegin{QuestId = 547},
			RemoveDialog{}, EndDialog{},
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