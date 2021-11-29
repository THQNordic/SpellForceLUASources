function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 181, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 191, Y = 182, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 189, Y = 190, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 186, Y = 198, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 194, Y = 194, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 195, Y = 186, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 197, Y = 180, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 187, Y = 180, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 180, Y = 175, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 176, Y = 178, Radius = 2}

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
--!EDS PATROL END


--!EDS RESPAWN BEGIN
Respawn{WaitTime=120, X=176, Y=178}
--!EDS RESPAWN END



EndDefinition()

end
