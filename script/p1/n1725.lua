function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=330, Chief = {1365} }
--!EDS RESPAWN END

OnIdleGoHome{X = 158, Y = 197, Direction = SouthEast}

EndDefinition()

end
