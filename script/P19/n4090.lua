function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point003", X = 198, Y = 255, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 183, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 186, Y = 283, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 198, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 208, Y = 261, Radius = 2}

AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
--!EDS PATROL END




EndDefinition()

end
