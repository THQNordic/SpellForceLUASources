function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 321, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 334, Y = 192, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 321, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 308, Y = 180, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
--!EDS PATROL END











EndDefinition()

end
