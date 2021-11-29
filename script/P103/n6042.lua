-->INFO: gate
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 232, Y = 319,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = { 
		FigureInRange{ X = 234, Y = 318, NpcId = 5640, Range = 1},
	},
	CloseConditions = {},
	StayOpen = TRUE,
		
}

OnOneTimeEvent
{
	Conditions = { 
		FigureInRange{ X = 234, Y = 318, NpcId = 5640, Range = 1},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "Ressourcentor_offen"},
		RemoveDialog {},
	}
}

	EndDefinition()
end