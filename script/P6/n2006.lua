function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}

--!EDS RESPAWN BEGIN
Respawn{WaitTime=50}
--!EDS RESPAWN END




EndDefinition()

end
