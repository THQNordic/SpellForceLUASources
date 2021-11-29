function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 247, Y = 156, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 258, Y = 153, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 263, Y = 146, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 270, Y = 150, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 272, Y = 168, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 277, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 284, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 286, Y = 189, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 282, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 268, Y = 169, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 264, Y = 162, Radius = 2}

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
