function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-->INFO: gate

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 23, Y = 27,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = {
		IsGlobalFlagTrue{Name = "EloniGateOpen"},
		--IsGlobalState{Name = "Plot", State = "JourneyFour" , Operator = IsEqual},
	 },	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = FALSE,
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.0
-- Source: C:\project\main\mission\dialoge\p2\n3034_gate.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{String = "(Das Tor ist verschlossen. Ein großer Schlüssel könnte es öffnen.)"},
			Answer{String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 3178},
		},
		Actions = {
			Say{String = ""},
			OfferAnswer{String = "(Den großen Torschlüssel verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3178}),
		},
		Actions = {
			Say{String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{String = "(Der Schlüssel passt, das Tor öffnet sich.)"},
			Answer{String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3178 , Amount = 1 , Flag = Take}, SetGlobalFlagTrue{Name = "EloniGateOpen"},
			Say{String = ""},
			Answer{String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{String = ""},
		}}


	EndDefinition()
end
