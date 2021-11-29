function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=420, Chief = {1800} }
--!EDS RESPAWN END

OnIdleGoHome{X = 228, Y = 185, Direction = North}

EndDefinition()

end
