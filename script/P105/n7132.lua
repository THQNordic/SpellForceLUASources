-->INFO: _TorNachNorden
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 20,
	X = 199, Y = 95,		-- exact position of portal object!
	Type = ElfenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue { Name = "P105_SouthTorOpen" },
	},
	OpenActions = 
	{ 
		SetItemFlagFalse {Name = "PlayerHasItemRaworKey"},
		SetGlobalFlagTrue { Name = "P105_SouthTorAuf" }, -- sorry für die beiden fast gleichnamigen Flags
														 -- wenn dieses Flag true ist, dann laufen die Fugis weiter
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n7132__TorNachNorden.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "tornachnorden105_001", String = "(Das Grenztor ist verschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemRaworKey"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tornachnorden105_002PC", String = "(Den Torschlüssel verwenden.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemRaworKey"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tornachnorden105_003", String = "(Der Schlüssel passt. Das Tor öffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue { Name = "P105_SouthTorOpen" },
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