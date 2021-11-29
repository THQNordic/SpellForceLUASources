function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=20}
--!EDS RESPAWN END
OnIdleGoHome{X = 144, Y = 316, Direction = 1}

EndDefinition()

end
