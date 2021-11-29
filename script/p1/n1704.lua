function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=300, Chief = {1716} }
--!EDS RESPAWN END

OnIdleGoHome{X = 63, Y = 128, Direction = SouthEast}

EndDefinition()

end
