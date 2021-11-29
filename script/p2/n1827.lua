function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=410, Chief = {1800} }
--!EDS RESPAWN END


OnIdleGoHome{X = 229, Y = 135, Direction = SouthEast}


EndDefinition()

end
