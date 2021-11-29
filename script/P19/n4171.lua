function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 185, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 168, Y = 296, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 161, Y = 317, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 167, Y = 345, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 162, Y = 332, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 161, Y = 317, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 167, Y = 298, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 181, Y = 282, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
