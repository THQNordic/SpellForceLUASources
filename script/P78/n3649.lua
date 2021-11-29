function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = random(0,7)}

EndDefinition()

end
