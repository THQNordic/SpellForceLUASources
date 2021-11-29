-->INFO: gate_sw
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 1,
	X = 215, Y = 170,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = {
						IsGlobalFlagTrue{Name = "EloniGateSWOpen" , UpdateInterval = 1},
						},	-- no conditions: open when player unit approaches
	OpenActions = {	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	CloseActions = {},
	StayOpen = TRUE,
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p2\n3163_gate_sw.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatesw001", String = "(Das Tor ist verschlossen. Ein weißer Steinschlüssel könnte es öffnen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 3183},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatesw001PC", String = "(Den weißen Steinschlüssel verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3183}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatesw002", String = "(Der Schlüssel passt, das Tor öffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			RemoveDialogFromNpc{NpcId = 3163} , 
			TransferItem{TakeItem = 3183 , Amount = 1 , Flag = Take} , 
			SetGlobalFlagTrue{Name = "EloniGateSWOpen"},
			QuestSolve{QuestId = 67} , QuestBegin{QuestId = 68},
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