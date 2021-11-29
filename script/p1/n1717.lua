function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS RESPAWN BEGIN
Respawn{WaitTime=30}
--!EDS RESPAWN END

OnIdleGoHome{X = 107, Y = 110, Direction = SouthWest}

EndDefinition()

end
