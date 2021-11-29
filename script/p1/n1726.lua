function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=280, Chief = {1365} }
--!EDS RESPAWN END

OnIdleGoHome{X = 151, Y = 203, Direction = South}

EndDefinition()

end
