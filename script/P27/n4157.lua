function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 122, Y = 362, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 120, Y = 360, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 120, Y = 357, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 120, Y = 355, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 122, Y = 351, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 123, Y = 350, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 126, Y = 349, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 131, Y = 351, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 133, Y = 355, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 135, Y = 357, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 140, Y = 360, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 147, Y = 365, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 145, Y = 363, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 143, Y = 362, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 137, Y = 359, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 136, Y = 357, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 133, Y = 354, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 132, Y = 351, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 128, Y = 349, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 125, Y = 350, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 122, Y = 353, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 119, Y = 357, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 119, Y = 359, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 122, Y = 362, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 120, Y = 360, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 120, Y = 357, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 121, Y = 354, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 123, Y = 351, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 125, Y = 350, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 128, Y = 350, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 131, Y = 350, Radius = 2}
DefineLocationCircle{Name = "Point032", X = 133, Y = 353, Radius = 2}
DefineLocationCircle{Name = "Point033", X = 134, Y = 354, Radius = 2}
DefineLocationCircle{Name = "Point034", X = 135, Y = 356, Radius = 2}
DefineLocationCircle{Name = "Point035", X = 136, Y = 358, Radius = 2}
DefineLocationCircle{Name = "Point036", X = 139, Y = 360, Radius = 2}
DefineLocationCircle{Name = "Point037", X = 142, Y = 361, Radius = 2}
DefineLocationCircle{Name = "Point038", X = 145, Y = 363, Radius = 2}
DefineLocationCircle{Name = "Point039", X = 147, Y = 365, Radius = 2}
DefineLocationCircle{Name = "Point040", X = 144, Y = 362, Radius = 2}
DefineLocationCircle{Name = "Point041", X = 141, Y = 360, Radius = 2}
DefineLocationCircle{Name = "Point042", X = 138, Y = 359, Radius = 2}
DefineLocationCircle{Name = "Point043", X = 136, Y = 358, Radius = 2}
DefineLocationCircle{Name = "Point044", X = 135, Y = 357, Radius = 2}
DefineLocationCircle{Name = "Point045", X = 133, Y = 359, Radius = 2}
DefineLocationCircle{Name = "Point046", X = 130, Y = 360, Radius = 2}
DefineLocationCircle{Name = "Point047", X = 127, Y = 361, Radius = 2}
DefineLocationCircle{Name = "Point048", X = 125, Y = 362, Radius = 2}
DefineLocationCircle{Name = "Point049", X = 122, Y = 362, Radius = 2}

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
AddControlPoint{Name = "043", Location = "Point043",WalkMode = Walk}
AddControlPoint{Name = "044", Location = "Point044",WalkMode = Walk}
AddControlPoint{Name = "045", Location = "Point045",WalkMode = Walk}
AddControlPoint{Name = "046", Location = "Point046",WalkMode = Walk}
AddControlPoint{Name = "047", Location = "Point047",WalkMode = Walk}
AddControlPoint{Name = "048", Location = "Point048",WalkMode = Walk}
AddControlPoint{Name = "049", Location = "Point049",WalkMode = Walk}
--!EDS PATROL END




EndDefinition()

end
