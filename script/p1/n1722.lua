function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=400, Chief = {1365} }
--!EDS RESPAWN END

OnIdleGoHome{X = 144, Y = 191, Direction = East}

EndDefinition()

end
