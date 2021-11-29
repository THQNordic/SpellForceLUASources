function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 306, Y = 60, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 294, Y = 60, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 285, Y = 62, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 279, Y = 86, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 268, Y = 70, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 257, Y = 74, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 251, Y = 73, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 245, Y = 72, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 239, Y = 77, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 231, Y = 79, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 221, Y = 80, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 213, Y = 79, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 207, Y = 80, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 197, Y = 80, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 203, Y = 89, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 209, Y = 99, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 209, Y = 106, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 213, Y = 112, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 217, Y = 120, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 223, Y = 129, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 227, Y = 137, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 227, Y = 143, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 231, Y = 157, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 231, Y = 170, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 239, Y = 186, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 243, Y = 193, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 249, Y = 198, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 249, Y = 206, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 253, Y = 213, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 258, Y = 219, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 253, Y = 213, Radius = 2}
DefineLocationCircle{Name = "Point032", X = 248, Y = 205, Radius = 2}
DefineLocationCircle{Name = "Point033", X = 248, Y = 200, Radius = 2}
DefineLocationCircle{Name = "Point034", X = 248, Y = 195, Radius = 2}
DefineLocationCircle{Name = "Point035", X = 242, Y = 189, Radius = 2}
DefineLocationCircle{Name = "Point036", X = 242, Y = 184, Radius = 2}
DefineLocationCircle{Name = "Point037", X = 242, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point038", X = 236, Y = 173, Radius = 2}
DefineLocationCircle{Name = "Point039", X = 232, Y = 168, Radius = 2}
DefineLocationCircle{Name = "Point040", X = 232, Y = 160, Radius = 2}
DefineLocationCircle{Name = "Point041", X = 232, Y = 154, Radius = 2}
DefineLocationCircle{Name = "Point042", X = 227, Y = 143, Radius = 2}
DefineLocationCircle{Name = "Point043", X = 227, Y = 137, Radius = 2}
DefineLocationCircle{Name = "Point044", X = 219, Y = 126, Radius = 2}
DefineLocationCircle{Name = "Point045", X = 214, Y = 116, Radius = 2}
DefineLocationCircle{Name = "Point046", X = 210, Y = 109, Radius = 2}
DefineLocationCircle{Name = "Point047", X = 210, Y = 103, Radius = 2}
DefineLocationCircle{Name = "Point048", X = 206, Y = 96, Radius = 2}
DefineLocationCircle{Name = "Point049", X = 202, Y = 89, Radius = 2}
DefineLocationCircle{Name = "Point050", X = 198, Y = 84, Radius = 2}
DefineLocationCircle{Name = "Point051", X = 210, Y = 79, Radius = 2}
DefineLocationCircle{Name = "Point052", X = 222, Y = 81, Radius = 2}
DefineLocationCircle{Name = "Point053", X = 227, Y = 80, Radius = 2}
DefineLocationCircle{Name = "Point054", X = 237, Y = 83, Radius = 2}
DefineLocationCircle{Name = "Point055", X = 245, Y = 81, Radius = 2}
DefineLocationCircle{Name = "Point056", X = 251, Y = 77, Radius = 2}
DefineLocationCircle{Name = "Point057", X = 263, Y = 70, Radius = 2}
DefineLocationCircle{Name = "Point058", X = 279, Y = 68, Radius = 2}
DefineLocationCircle{Name = "Point059", X = 282, Y = 60, Radius = 2}
DefineLocationCircle{Name = "Point060", X = 291, Y = 61, Radius = 2}
DefineLocationCircle{Name = "Point061", X = 300, Y = 61, Radius = 2}

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
AddControlPoint{Name = "050", Location = "Point050",WalkMode = Walk}
AddControlPoint{Name = "051", Location = "Point051",WalkMode = Walk}
AddControlPoint{Name = "052", Location = "Point052",WalkMode = Walk}
AddControlPoint{Name = "053", Location = "Point053",WalkMode = Walk}
AddControlPoint{Name = "054", Location = "Point054",WalkMode = Walk}
AddControlPoint{Name = "055", Location = "Point055",WalkMode = Walk}
AddControlPoint{Name = "056", Location = "Point056",WalkMode = Walk}
AddControlPoint{Name = "057", Location = "Point057",WalkMode = Walk}
AddControlPoint{Name = "058", Location = "Point058",WalkMode = Walk}
AddControlPoint{Name = "059", Location = "Point059",WalkMode = Walk}
AddControlPoint{Name = "060", Location = "Point060",WalkMode = Walk}
AddControlPoint{Name = "061", Location = "Point061",WalkMode = Walk}
--!EDS PATROL END




EndDefinition()

end
