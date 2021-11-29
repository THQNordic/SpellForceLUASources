function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=290, Chief = {1365} }
--!EDS RESPAWN END

OnIdleGoHome{X = 161, Y = 202, Direction = South}

EndDefinition()

end
