function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 1,
	X = 457 , Y = 232,		-- exact position of portal object!
	Type = StadtTor,		-- type of portal
	OpenConditions = { 
		IsGlobalFlagTrue{Name = "GreyfellFarlornGateOpen" , UpdateInterval = 1}
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}
EndDefinition()

end
