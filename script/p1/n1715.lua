function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=45}
--!EDS RESPAWN END

OnIdleGoHome{X = 106, Y = 108, Direction = SouthWest}

EndDefinition()

end
