function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=45}
--!EDS RESPAWN END

OnIdleGoHome{X = 105, Y = 110, Direction = SouthWest}

EndDefinition()

end
