function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=20}
--!EDS RESPAWN END
OnIdleGoHome{X = 150, Y = 315, Direction = 1}

EndDefinition()

end
