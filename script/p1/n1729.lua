function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=290, Chief = {1365} }
--!EDS RESPAWN END

OnIdleGoHome{X = 157, Y = 208, Direction = East}

EndDefinition()

end
