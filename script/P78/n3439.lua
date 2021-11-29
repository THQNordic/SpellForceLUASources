function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 5,
	Conditions = {
		IsGlobalFlagFalse{Name = "OpenDoor3281"},
	},
}

OnIdleGoHome
{
	X = 326, Y = 431, Direction = 4,
	Conditions = {
		IsGlobalFlagTrue{Name = "OpenDoor3281"},
	},
}

EndDefinition()
end
