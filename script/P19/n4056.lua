function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 211, Y = 161, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 191, Y = 169, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 195, Y = 182, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 213, Y = 173, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 227, Y = 177, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END




EndDefinition()

end
