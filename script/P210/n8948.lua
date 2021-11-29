function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnPortalEvent
{
	UpdateInterval = 20,
	X = _X, Y = _Y,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue { Name = "P210_Gate_E_Open" },
	},
	OpenActions = 
	{ 
		SetMinimapAlert{ X = _X, Y = _Y, Type = 6},
		PlaySound{Sound = SoundDragonSpawn}  
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
