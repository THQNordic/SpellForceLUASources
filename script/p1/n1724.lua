function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=360, Chief = {1365} }
--!EDS RESPAWN END

OnIdleGoHome{X = 149, Y = 194, Direction = SouthEast}

EndDefinition()

end
