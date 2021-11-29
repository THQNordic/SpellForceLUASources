function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=300, Chief = {1627} }
--!EDS RESPAWN END

OnIdleGoHome{X = _X, Y = _Y, Direction = NorthEast}

EndDefinition()

end
