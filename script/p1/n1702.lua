function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=500, Chief = {1716} }
--!EDS RESPAWN END

OnIdleGoHome{X = 66, Y = 119, Direction = SouthEast}


EndDefinition()

end
