function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 306, Y = 252, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 298, Y = 252, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 291, Y = 251, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 299, Y = 245, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 306, Y = 244, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 306, Y = 230, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 306, Y = 226, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 301, Y = 217, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 287, Y = 217, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 281, Y = 218, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 281, Y = 204, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 282, Y = 188, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 282, Y = 182, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 275, Y = 173, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 269, Y = 167, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 267, Y = 158, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 276, Y = 149, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 283, Y = 143, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 296, Y = 133, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 288, Y = 138, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 279, Y = 145, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 276, Y = 159, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 275, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 283, Y = 184, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 281, Y = 197, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 281, Y = 214, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 292, Y = 219, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 303, Y = 219, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 305, Y = 236, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 307, Y = 248, Radius = 2}

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
AddControlPoint{Name = "026", Location = "Point026",WalkMode = Walk}
AddControlPoint{Name = "027", Location = "Point027",WalkMode = Walk}
AddControlPoint{Name = "028", Location = "Point028",WalkMode = Walk}
AddControlPoint{Name = "029", Location = "Point029",WalkMode = Walk}
AddControlPoint{Name = "030", Location = "Point030",WalkMode = Walk}
--!EDS PATROL END




EndDefinition()

end
