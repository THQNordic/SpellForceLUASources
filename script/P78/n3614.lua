function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome{X = _X, Y = _Y, Direction = 5,
	Conditions = {
		IsGlobalFlagFalse{Name = "Door3331NowOpen"},
	},
}

OnIdleGoHome{X = 244, Y = 182, Direction = 4,
	Conditions = {
		IsGlobalFlagTrue{Name = "Door3331NowOpen", UpdateInterval = 20},
	},
}


EndDefinition()

end
