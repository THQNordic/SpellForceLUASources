function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
PlatformInitAction( SetEffect{Effect = "IcePackForever", NpcId = _NpcId, Length = 0} )
PlatformInitAction( SetEffect{Effect = "SimpleInvis"} )

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 91, Y = 241, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 54, Y = 260, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 82, Y = 277, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 54, Y = 295, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 69, Y = 269, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 80, Y = 250, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 69, Y = 239, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 67, Y = 253, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 59, Y = 230, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 103, Y = 246, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 90, Y = 259, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 85, Y = 282, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 71, Y = 297, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 58, Y = 303, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 57, Y = 279, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 82, Y = 266, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 84, Y = 252, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 54, Y = 253, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 70, Y = 270, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Walk}
AddControlPoint{Name = "011", Location = "Point011",WalkMode = Walk}
AddControlPoint{Name = "012", Location = "Point012",WalkMode = Walk}
AddControlPoint{Name = "013", Location = "Point013",WalkMode = Walk}
AddControlPoint{Name = "014", Location = "Point014",WalkMode = Walk}
AddControlPoint{Name = "015", Location = "Point015",WalkMode = Walk}
AddControlPoint{Name = "016", Location = "Point016",WalkMode = Walk}
AddControlPoint{Name = "017", Location = "Point017",WalkMode = Walk}
AddControlPoint{Name = "018", Location = "Point018",WalkMode = Walk}
AddControlPoint{Name = "019", Location = "Point019",WalkMode = Walk}
AddControlPoint{Name = "020", Location = "Point020",WalkMode = Walk}
AddControlPoint{Name = "021", Location = "Point021",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
