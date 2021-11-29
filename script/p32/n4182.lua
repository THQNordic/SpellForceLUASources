-->INFO: gateSharrowHigh
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 224, Y = 233, StayOpen = TRUE , Type = SteinTorKlein, 
	OpenConditions = { IsGlobalFlagTrue{Name = "SharrowGateHighOpen" , UpdateInterval = 1} } ,
	OpenActions = { },
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p32\n4182_gateSharrowHigh.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "gateSharHigh001", String = "(Eine schwarze Metallplatte verschließt das Tor. Eine achteckige Aussparung ist zu erkennen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 3465 , Amount = 2},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q543HassSeenHighGate"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateSharHigh001PC", String = "(Den oktagonalen Schlüssel einsetzen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3465 , Amount = 2}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q543HassSeenHighGate"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gateSharHigh002", String = "(Der Schlüssel rastet ein und dreht sich wie von selbst. Die Metallplatte teilt sich und das Tor schwingt auf.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "SharrowGateHighOpen"} ,
			TransferItem{TakeItem = 3465 , Amount = 2 , Flag = Take},
			SetRewardFlagTrue{ Name = "KreisSchluss2Tor2"},
			QuestSolve{QuestId = 546} , QuestBegin{QuestId = 548} , RemoveDialog{}, EndDialog{},
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