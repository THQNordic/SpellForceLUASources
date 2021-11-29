function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 20,
	X = _X, Y = _Y,		-- exact position of portal object!
	Type = ElfenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue { Name = "P105_WestCityGateOpen" },
	},
	OpenActions = 
	{ 
		SetGlobalFlagTrue { Name = "P105_WestTorAuf" }, -- sorry für die beiden fast gleichnamigen Flags
														 -- wenn dieses Flag true ist, dann laufen die Fugis weiter
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
