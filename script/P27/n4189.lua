function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 309, Y =  61, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 320, Y =  62, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 334, Y =  60, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 294, Y =  61, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 282, Y =  63, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 269, Y =  63, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 262, Y =  69, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 252, Y =  70, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 251, Y =  75, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 244, Y =  75, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 240, Y =  76, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 240, Y =  81, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 226, Y =  88, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 224, Y =  89, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 218, Y =  99, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 210, Y =  98, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 214, Y = 117, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 224, Y = 133, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 228, Y = 139, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 223, Y = 130, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 216, Y = 120, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 210, Y = 109, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 210, Y = 101, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 222, Y = 109, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 232, Y = 100, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 238, Y =  82, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 241, Y =  81, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 247, Y =  74, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 253, Y =  72, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 262, Y =  70, Radius = 2}
DefineLocationCircle{Name = "Point032", X = 274, Y =  63, Radius = 2}
DefineLocationCircle{Name = "Point033", X = 280, Y =  61, Radius = 2}
DefineLocationCircle{Name = "Point034", X = 291, Y =  61, Radius = 2}
DefineLocationCircle{Name = "Point035", X = 297, Y =  61, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
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
AddControlPoint{Name = "031", Location = "Point031",WalkMode = Walk}
AddControlPoint{Name = "032", Location = "Point032",WalkMode = Walk}
AddControlPoint{Name = "033", Location = "Point033",WalkMode = Walk}
AddControlPoint{Name = "034", Location = "Point034",WalkMode = Walk}
AddControlPoint{Name = "035", Location = "Point035",WalkMode = Walk}
--!EDS PATROL END







EndDefinition()

end
