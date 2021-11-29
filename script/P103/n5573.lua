-->INFO: gate
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 214, Y = 357,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = 
	{ 
		FigureInRange{ X = 214, Y = 355, NpcId = 5640, Range = 2},
	},
	CloseConditions = {},
	StayOpen = TRUE,

	OpenActions =
	{
		SetGlobalFlagTrue{Name = "Nordtor_auf"},
		RemoveDialog {},
		
	}
}
	EndDefinition()
end