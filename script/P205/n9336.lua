function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 281, Y = 331, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 293, Y = 312, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 295, Y = 327, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 317, Y = 332, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 318, Y = 322, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 302, Y = 335, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
--!EDS PATROL END


EndDefinition()

end
