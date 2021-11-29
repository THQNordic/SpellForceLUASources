-->INFO: Final_Gate
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 450 , Y = 283,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
	{

		IsGlobalFlagTrue {Name = "OpenFinalGateP110"}, -- Tor wird nun per Dialog geöffnet
	},	
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n5777_Final_Gate.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatefinal110_001", String = "(Dar Tor zum Abgrund. Eine leere, goldene Fassung ist darauf angebracht.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemGlowstone"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatefinal110_002PC", String = "(Glutstein in die Fassung setzen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGlowstone"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItemEquipped{ItemId = 3764 , UpdateInterval = 20}),
		},
		Actions = {
			Say{Tag = "gatefinal110_004", String = "(Ihr solltet Euch zuerst mit dem Schattenschwert bewaffnen, bevor Ihr dieses Tor öffnet.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItemEquipped{ItemId = 3764 , UpdateInterval = 20},
		},
		Actions = {
			Say{Tag = "gatefinal110_003", String = "(Der Stein glüht auf. Brennende Linien bilden sich auf dem Tor, das sich schließlich teilt und im Boden versinkt.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "OpenFinalGateP110"}, 
						RemoveDialog{NpcId = 5777},
						SetItemFlagFalse{Name = "PlayerHasItemGlowstone"},
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

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "LenaHintOutcryP110"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end