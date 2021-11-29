function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 90, Y = 362, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 86, Y = 360, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 87, Y = 356, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 88, Y = 351, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 91, Y = 349, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 95, Y = 349, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 99, Y = 349, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 101, Y = 356, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 96, Y = 360, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Walk}
--!EDS PATROL END








EndDefinition()

end
