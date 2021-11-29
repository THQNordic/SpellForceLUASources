function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 323, Y = 296, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 323, Y = 288, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 329, Y = 284, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 336, Y = 290, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 346, Y = 307, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 341, Y = 311, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 335, Y = 305, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
--!EDS PATROL END




EndDefinition()

end
