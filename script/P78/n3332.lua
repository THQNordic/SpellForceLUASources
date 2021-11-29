-- info: extro gate
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)


OnPortalEvent
{
	X = 159, Y = 193,
	Type = SteinTorGross,
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "OpenLastGate", UpdateInterval = 5},
	},
	StayOpen = TRUE,
}

EndDefinition()

end
