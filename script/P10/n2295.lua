function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 585, Y = 579, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 571, Y = 578, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 555, Y = 564, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 561, Y = 551, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 552, Y = 539, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 562, Y = 550, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 555, Y = 565, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 574, Y = 564, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 590, Y = 565, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 603, Y = 560, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 601, Y = 575, Radius = 2}

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
