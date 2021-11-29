function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
PlatformInitAction( SetEffect{Effect = "IcePackForever", NpcId = _NpcId, Length = 0} )
PlatformInitAction( SetEffect{Effect = "SimpleInvis"} )

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 91, Y = 241, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 54, Y = 260, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 82, Y = 277, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 54, Y = 295, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 85, Y = 282, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 71, Y = 297, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 58, Y = 303, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 57, Y = 279, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 82, Y = 266, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 84, Y = 252, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 54, Y = 253, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 70, Y = 270, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 72, Y = 239, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "014", Location = "Point014",WalkMode = Walk}
AddControlPoint{Name = "015", Location = "Point015",WalkMode = Walk}
AddControlPoint{Name = "016", Location = "Point016",WalkMode = Walk}
AddControlPoint{Name = "017", Location = "Point017",WalkMode = Walk}
AddControlPoint{Name = "018", Location = "Point018",WalkMode = Walk}
AddControlPoint{Name = "019", Location = "Point019",WalkMode = Walk}
AddControlPoint{Name = "020", Location = "Point020",WalkMode = Walk}
AddControlPoint{Name = "021", Location = "Point021",WalkMode = Walk}
AddControlPoint{Name = "022", Location = "Point022",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
