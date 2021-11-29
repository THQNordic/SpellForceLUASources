-->INFO: Dunkelelfentor
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 20,
	X = _X, Y = _Y,			-- exact position of portal object!
	Type = ElfenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue { Name = "P105_DarkElfGateOpen" },
	},
	OpenActions = 
	{ 
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n7434_Dunkelelfentor.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "dunkelelfentor105_001", String = "(Dieses alte Bollwerk ist verschlossen. In den silbernen Verzierungen befindet sich eine spinnenförmige Vertiefung.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemFireGateKey"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "dunkelelfentor105_002PC", String = "(Den Spinnenschlüssel des Geistes verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFireGateKey"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dunkelelfentor105_003", String = "(Der Schlüssel gleitet ins Schloss. Silberne Spinnenbeine entfalten sich und greifen in die Vertiefungen. Mit einer Drehung kann das Schloss geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue { Name = "P105_DarkElfGateOpen" },
			RemoveDialog {NpcId = self },
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