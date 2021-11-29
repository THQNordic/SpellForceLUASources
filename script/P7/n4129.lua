function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 116, Y = 191, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 127, Y = 214, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 150, Y = 218, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 173, Y = 220, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
