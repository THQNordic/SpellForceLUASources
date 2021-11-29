function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 230, Y = 142, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 222, Y = 128, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 214, Y = 116, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 208, Y = 105, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 206, Y = 93, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 198, Y = 82, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 191, Y = 75, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 187, Y = 62, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 186, Y = 54, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 186, Y = 42, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 186, Y = 58, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 186, Y = 69, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 196, Y = 79, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 204, Y = 90, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 208, Y = 98, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 210, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 220, Y = 124, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 225, Y = 131, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 226, Y = 133, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 221, Y = 126, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 228, Y = 121, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 231, Y = 113, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 222, Y = 90, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 236, Y = 100, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 239, Y = 86, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 243, Y = 79, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 249, Y = 73, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 258, Y = 70, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 270, Y = 70, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 284, Y = 59, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 285, Y = 60, Radius = 2}
DefineLocationCircle{Name = "Point032", X = 293, Y = 59, Radius = 2}
DefineLocationCircle{Name = "Point033", X = 282, Y = 62, Radius = 2}
DefineLocationCircle{Name = "Point034", X = 269, Y = 68, Radius = 2}
DefineLocationCircle{Name = "Point035", X = 254, Y = 71, Radius = 2}
DefineLocationCircle{Name = "Point036", X = 249, Y = 77, Radius = 2}
DefineLocationCircle{Name = "Point037", X = 242, Y = 83, Radius = 2}
DefineLocationCircle{Name = "Point038", X = 234, Y = 98, Radius = 2}
DefineLocationCircle{Name = "Point039", X = 225, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point040", X = 228, Y = 116, Radius = 2}
DefineLocationCircle{Name = "Point041", X = 228, Y = 129, Radius = 2}
DefineLocationCircle{Name = "Point042", X = 228, Y = 140, Radius = 2}

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
AddControlPoint{Name = "031", Location = "Point031",WalkMode = Walk}
AddControlPoint{Name = "032", Location = "Point032",WalkMode = Walk}
AddControlPoint{Name = "033", Location = "Point033",WalkMode = Walk}
AddControlPoint{Name = "034", Location = "Point034",WalkMode = Walk}
AddControlPoint{Name = "035", Location = "Point035",WalkMode = Walk}
AddControlPoint{Name = "036", Location = "Point036",WalkMode = Walk}
AddControlPoint{Name = "037", Location = "Point037",WalkMode = Walk}
AddControlPoint{Name = "038", Location = "Point038",WalkMode = Walk}
AddControlPoint{Name = "039", Location = "Point039",WalkMode = Walk}
AddControlPoint{Name = "040", Location = "Point040",WalkMode = Walk}
AddControlPoint{Name = "041", Location = "Point041",WalkMode = Walk}
AddControlPoint{Name = "042", Location = "Point042",WalkMode = Walk}
--!EDS PATROL END






EndDefinition()

end
