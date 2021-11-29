function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 200, Y = 369, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
