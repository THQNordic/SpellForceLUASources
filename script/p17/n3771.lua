-->INFO: GodwallDwarfGate
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)
-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 1,
	X = 163, Y = 182,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = { 
		IsGlobalFlagTrue{Name = "GodwallDwarfGateOpen", UpdateInterval = 1},
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p17\n3771_GodwallDwarfGate.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "godwallDwarf001", String = "(Das Tor ist verschlossen. Das Schloss ist von zwergischer Machart.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 2672},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "godwallDwarf001PC", String = "(Den Zwergenschlüssel verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2672}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "godwallDwarf002", String = "(Der Schlüssel passt. Das Tor öffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			RemoveDialog{} , 
			TransferItem{TakeItem = 2672 , Amount = 1 , Flag = Take}, 
			SetGlobalFlagTrue{Name = "GodwallDwarfGateOpen"},
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