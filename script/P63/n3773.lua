function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)
-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 1,
	X = 461 , Y = 320,		-- exact position of portal object!
	Type = StadtTor,		-- type of portal
	OpenConditions = { 
		IsGlobalFlagTrue{Name = "GreyfellLiannonGateOpen" , UpdateInterval = 1}
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
