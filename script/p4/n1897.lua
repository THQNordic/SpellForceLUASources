function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

REM = [[
--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 360, Y = 310, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 356, Y = 330, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 341, Y = 322, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 332, Y = 323, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 333, Y = 305, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 334, Y = 284, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 331, Y = 273, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 336, Y = 265, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
--!EDS PATROL END
]]

EndDefinition()

end
