function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 347, Y = 248, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 356, Y = 251, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 356, Y = 246, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 338, Y = 231, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 315, Y = 223, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 306, Y = 229, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 308, Y = 233, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 321, Y = 233, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 329, Y = 239, Radius = 2}

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
