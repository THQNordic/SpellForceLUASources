function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome{X = _X, Y = _Y, Direction = 3}
--OnIdleGoHome{X = 375, Y = 215, Direction = 3}

OnOneTimeEvent
{
	Conditions = {
		FigureHasAggro{NpcId = 3615, UpdateInterval = 2},
		IsGlobalFlagTrue{Name = "OpenDoor3335", UpdateInterval = 1},
	},
	Actions = {
		-- set minimap alarm
		CGdsSetMinimapAlert:new(350, 204, 1),
	},
}

EndDefinition()

end
