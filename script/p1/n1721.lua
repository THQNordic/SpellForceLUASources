function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=400, Chief = {1365} }
--!EDS RESPAWN END

OnIdleGoHome{X = 156, Y = 185, Direction = South}

EndDefinition()

end
