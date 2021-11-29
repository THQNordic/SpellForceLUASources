function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 117, Y = 309, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 113, Y = 311, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 109, Y = 321, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 114, Y = 326, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 123, Y = 317, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 140, Y = 319, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 144, Y = 322, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 133, Y = 341, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 126, Y = 350, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 121, Y = 341, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 133, Y = 328, Radius = 2}

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
