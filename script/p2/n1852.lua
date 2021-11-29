function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=1200}
--!EDS RESPAWN END

OnIdleGoHome{X = 188, Y = 233, Direction = 2}

EndDefinition()

end
