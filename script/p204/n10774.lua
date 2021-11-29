function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 174, Y = 160, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 184, Y = 170, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 180, Y = 180, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 188, Y = 182, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 190, Y = 170, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 176, Y = 162, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 174, Y = 155, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
--!EDS PATROL END


--!EDS RESPAWN BEGIN
Respawn{WaitTime=120, X=174, Y=155}
--!EDS RESPAWN END




EndDefinition()

end
