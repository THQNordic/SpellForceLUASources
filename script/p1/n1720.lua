function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=460, Chief = {1365} }
--!EDS RESPAWN END

OnIdleGoHome{X = 161, Y = 157, Direction = SouthEast}

EndDefinition()

end
