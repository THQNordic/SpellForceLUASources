function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=600}
--!EDS RESPAWN END

OnIdleGoHome{X = 190, Y = 237, Direction = 0}

EndDefinition()

end
