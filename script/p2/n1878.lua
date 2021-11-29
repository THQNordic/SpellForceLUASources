function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=20}
--!EDS RESPAWN END
OnIdleGoHome{X = 147, Y = 319, Direction = 1}

EndDefinition()

end
