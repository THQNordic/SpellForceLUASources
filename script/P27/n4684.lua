function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 207, Y = 158, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 216, Y = 148, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 227, Y = 144, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 221, Y = 127, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 210, Y = 107, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 196, Y = 104, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 208, Y = 103, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 198, Y = 81, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 209, Y = 100, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 220, Y = 91, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 240, Y = 83, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 252, Y = 75, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 237, Y = 86, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 209, Y = 101, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 217, Y = 122, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 227, Y = 140, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 230, Y = 142, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 210, Y = 152, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 207, Y = 169, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 208, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 223, Y = 203, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 233, Y = 222, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 234, Y = 225, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 249, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 237, Y = 226, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 228, Y = 212, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 220, Y = 199, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 210, Y = 185, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 207, Y = 174, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
