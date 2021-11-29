function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnPortalEvent
{
	UpdateInterval = 20,
	X = 265, Y = 284,		-- exact position of portal object!
	Type = StadtTor,		-- type of portal
	StayOpen = TRUE,
	OpenConditions = {
						IsGlobalFlagTrue{Name = "Q190OpenTheGate"}
						},	-- no conditions: open when player unit approaches
	OpenActions = {	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	CloseActions = {},
}

EndDefinition()

end
