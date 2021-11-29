function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 146, Y = 92, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 137, Y = 94, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 131, Y = 111, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 129, Y = 136, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 136, Y = 151, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 150, Y = 161, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 157, Y = 156, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 154, Y = 142, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 151, Y = 129, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 154, Y = 115, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 150, Y = 106, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Walk}
AddControlPoint{Name = "010", Location = "Point010",WalkMode = Walk}
AddControlPoint{Name = "011", Location = "Point011",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
