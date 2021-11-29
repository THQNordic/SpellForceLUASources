function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 160, Y = 91, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 155, Y = 98, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 148, Y = 96, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 150, Y = 87, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 157, Y = 86, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 165, Y = 88, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 170, Y = 89, Radius = 2}

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
