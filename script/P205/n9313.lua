function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 313, Y = 211, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 317, Y = 211, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 315, Y = 205, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 309, Y = 200, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 301, Y = 203, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
