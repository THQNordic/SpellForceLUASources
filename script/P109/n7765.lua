function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Tor zu den Trollen geht auf wenn Finsterwehr kaputt

OnPortalEvent
{
	UpdateInterval = 20,
	X = _X, Y = _Y,		-- exact position of portal object!
	Type = DunkelelfenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue {Name = "P109_DunkelElfenTorZerstört"},
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
