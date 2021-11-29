function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- portal events zum �ffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 20,
	X = 373, Y = 292,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "OpenSesame", UpdateInterval = 10},
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
