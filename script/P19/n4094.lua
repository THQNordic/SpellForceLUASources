function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 365, Y = 231, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 367, Y = 222, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 373, Y = 223, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 379, Y = 232, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 374, Y = 237, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
