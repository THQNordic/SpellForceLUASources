-->INFO: gateStoneblade
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnPortalEvent
{
	UpdateInterval = 20,
	X = 248, Y = 377,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	StayOpen = TRUE,
	OpenConditions = {
						IsGlobalFlagTrue{Name = "StonebladeGateOpen" , UpdateInterval = 20}
						},	-- no conditions: open when player unit approaches
	OpenActions = {	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	CloseActions = {},
}	




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p10\n3327_gateStoneblade.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "gateStonebalde001", String = "(Das Tor zum Schwertfels ist verschlossen. Ein spezieller Schlüssel wird benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 3241},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateStonebalde001PC", String = "(Den Schlüssel für den Schwertfels verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3241}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gateStonebalde002", String = "(Der Schlüssel passt. Das Tor öffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3241 , Amount = 1 , Flag = Take}, 
			SetGlobalFlagTrue{Name = "StonebladeGateOpen"} , RemoveDialog{},
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