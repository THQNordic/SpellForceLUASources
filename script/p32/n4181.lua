-->INFO: gateSharrowLow
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 373, Y = 150, StayOpen = TRUE , Type = SteinTorGross, 
	OpenConditions = { IsGlobalFlagTrue{Name = "SharrowGateLowOpen", UpdateInterval = 1}} ,
	OpenActions = { },
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p32\n4181_gateSharrowLow.txt


	

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
			SetGlobalFlagTrue{Name = "Q543HassSeenLowGate"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateSharLow001PC", String = "(Die drei Metallkeile einsetzen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 3462} , UND(PlayerHasItem{ItemId = 3463} , PlayerHasItem{ItemId = 3464}))),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q543HassSeenLowGate"},
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
			SetGlobalFlagTrue{Name = "SharrowGateLowOpen"} , TransferItem{TakeItem = 3462 , Amount = 1 , Flag = Take},
			TransferItem{TakeItem = 3463 , Amount = 1 , Flag = Take} , TransferItem{TakeItem = 3464 , Amount = 1 , Flag = Take},
			SetRewardFlagTrue{ Name = "KreisSchluss1Tor1"},
			QuestSolve{QuestId = 545} , RemoveDialog{}, EndDialog{},
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