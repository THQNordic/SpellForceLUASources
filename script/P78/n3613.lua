function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome{X = _X, Y = _Y, Direction = 3,
	Conditions = {
		IsGlobalFlagFalse{Name = "Door3331NowOpen"},
	},
}

OnIdleGoHome{X = 244, Y = 180, Direction = 3,
	Conditions = {
		IsGlobalFlagTrue{Name = "Door3331NowOpen", UpdateInterval = 10},
	},
	HomeActions = {
		-- set minimap alarm
		CGdsSetMinimapAlert:new(250, 180, 1),
		SetGlobalFlagTrue{Name = "OrcAlarmIssued"},
	},
}

OnOneTimeEvent
{
	Conditions = {
		ODER(
			FigureHasAggro{NpcId = 3613, UpdateInterval = 2},
			FigureHasAggro{NpcId = 3614, UpdateInterval = 2}
		),
		IsGlobalFlagFalse{Name = "OrcAlarmIssued", UpdateInterval = 5},
	},
	Actions = {
		-- set minimap alarm
		CGdsSetMinimapAlert:new(250, 180, 1),
	},
}

EndDefinition()

end
