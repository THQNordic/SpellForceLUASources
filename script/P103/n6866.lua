-->INFO: gate
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 56, Y = 346,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = { 
		IsGlobalFlagTrue{ Name = "OrkTor_offen", UpdateInterval =10},
	},
	CloseConditions = {},
	StayOpen = TRUE,
		
}

OnOneTimeEvent
{
	Conditions = { 
		IsGlobalFlagTrue{ Name = "OrkTor_offen", UpdateInterval =10},
	},
	Actions =
	{
		RemoveDialog {},
	}
}

	EndDefinition()
end