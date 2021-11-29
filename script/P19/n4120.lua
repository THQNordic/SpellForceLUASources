function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 98, Y = 251, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 92, Y = 258, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 85, Y = 251, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 93, Y = 244, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
