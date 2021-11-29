function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 247, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 238, Y = 227, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 235, Y = 225, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 231, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 228, Y = 214, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 225, Y = 207, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 221, Y = 200, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 218, Y = 195, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 212, Y = 189, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 209, Y = 182, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 207, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 201, Y = 180, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 193, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 186, Y = 183, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 179, Y = 184, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 169, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 175, Y = 184, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 182, Y = 183, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 190, Y = 183, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 195, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 199, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 207, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 211, Y = 186, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 217, Y = 193, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 223, Y = 203, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 227, Y = 211, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 231, Y = 219, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 236, Y = 226, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 242, Y = 231, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 250, Y = 237, Radius = 2}

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
