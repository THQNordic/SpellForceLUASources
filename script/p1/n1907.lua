function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 140, Y = 82, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 151, Y = 91, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 165, Y = 103, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 173, Y = 103, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 190, Y = 90, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 176, Y = 101, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 170, Y = 112, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 169, Y = 122, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 172, Y = 133, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 170, Y = 117, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 161, Y = 107, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 147, Y = 107, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 136, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 122, Y = 112, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 111, Y = 119, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 97, Y = 129, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 91, Y = 131, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 91, Y = 131, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 103, Y = 127, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 108, Y = 120, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 118, Y = 114, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 127, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 145, Y = 109, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 153, Y = 101, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 156, Y = 94, Radius = 2}

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
AddControlPoint{Name = "022", Location = "Point022",WalkMode = Walk}
AddControlPoint{Name = "023", Location = "Point023",WalkMode = Walk}
AddControlPoint{Name = "024", Location = "Point024",WalkMode = Walk}
AddControlPoint{Name = "025", Location = "Point025",WalkMode = Walk}
--!EDS PATROL END
--!EDS RESPAWN BEGIN
Respawn{WaitTime=300}
--!EDS RESPAWN END

EndDefinition()

end
