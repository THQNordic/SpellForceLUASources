function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 245, Y = 233, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 239, Y = 227, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 234, Y = 224, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 232, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 229, Y = 216, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 225, Y = 208, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 223, Y = 204, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 220, Y = 198, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 215, Y = 193, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 212, Y = 187, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 209, Y = 182, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 207, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 197, Y = 180, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 188, Y = 182, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 181, Y = 183, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 173, Y = 183, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 167, Y = 182, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 178, Y = 184, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 187, Y = 183, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 193, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 201, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 208, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 207, Y = 169, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 207, Y = 162, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 207, Y = 157, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 211, Y = 151, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 217, Y = 148, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 227, Y = 144, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 228, Y = 139, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 226, Y = 134, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 223, Y = 130, Radius = 2}
DefineLocationCircle{Name = "Point032", X = 221, Y = 125, Radius = 2}
DefineLocationCircle{Name = "Point033", X = 217, Y = 123, Radius = 2}
DefineLocationCircle{Name = "Point034", X = 214, Y = 116, Radius = 2}
DefineLocationCircle{Name = "Point035", X = 209, Y = 108, Radius = 2}
DefineLocationCircle{Name = "Point036", X = 209, Y = 102, Radius = 2}
DefineLocationCircle{Name = "Point037", X = 208, Y = 96, Radius = 2}
DefineLocationCircle{Name = "Point038", X = 202, Y = 88, Radius = 2}
DefineLocationCircle{Name = "Point039", X = 196, Y = 81, Radius = 2}
DefineLocationCircle{Name = "Point040", X = 192, Y = 75, Radius = 2}
DefineLocationCircle{Name = "Point041", X = 190, Y = 73, Radius = 2}
DefineLocationCircle{Name = "Point042", X = 187, Y = 66, Radius = 2}
DefineLocationCircle{Name = "Point043", X = 187, Y = 60, Radius = 2}
DefineLocationCircle{Name = "Point044", X = 186, Y = 51, Radius = 2}
DefineLocationCircle{Name = "Point045", X = 186, Y = 44, Radius = 2}
DefineLocationCircle{Name = "Point046", X = 186, Y = 54, Radius = 2}
DefineLocationCircle{Name = "Point047", X = 186, Y = 63, Radius = 2}
DefineLocationCircle{Name = "Point048", X = 193, Y = 76, Radius = 2}
DefineLocationCircle{Name = "Point049", X = 199, Y = 83, Radius = 2}
DefineLocationCircle{Name = "Point050", X = 204, Y = 94, Radius = 2}
DefineLocationCircle{Name = "Point051", X = 209, Y = 102, Radius = 2}
DefineLocationCircle{Name = "Point052", X = 208, Y = 105, Radius = 2}
DefineLocationCircle{Name = "Point053", X = 198, Y = 105, Radius = 2}
DefineLocationCircle{Name = "Point054", X = 190, Y = 102, Radius = 2}
DefineLocationCircle{Name = "Point055", X = 183, Y = 98, Radius = 2}
DefineLocationCircle{Name = "Point058", X = 185, Y = 100, Radius = 2}
DefineLocationCircle{Name = "Point059", X = 196, Y = 104, Radius = 2}
DefineLocationCircle{Name = "Point060", X = 207, Y = 104, Radius = 2}
DefineLocationCircle{Name = "Point061", X = 214, Y = 118, Radius = 2}
DefineLocationCircle{Name = "Point062", X = 221, Y = 127, Radius = 2}
DefineLocationCircle{Name = "Point063", X = 227, Y = 134, Radius = 2}
DefineLocationCircle{Name = "Point064", X = 227, Y = 144, Radius = 2}
DefineLocationCircle{Name = "Point065", X = 230, Y = 153, Radius = 2}
DefineLocationCircle{Name = "Point066", X = 231, Y = 172, Radius = 2}
DefineLocationCircle{Name = "Point067", X = 233, Y = 164, Radius = 2}
DefineLocationCircle{Name = "Point068", X = 231, Y = 142, Radius = 2}
DefineLocationCircle{Name = "Point069", X = 210, Y = 154, Radius = 2}
DefineLocationCircle{Name = "Point070", X = 206, Y = 172, Radius = 2}
DefineLocationCircle{Name = "Point071", X = 216, Y = 194, Radius = 2}
DefineLocationCircle{Name = "Point072", X = 230, Y = 217, Radius = 2}
DefineLocationCircle{Name = "Point073", X = 235, Y = 225, Radius = 2}
DefineLocationCircle{Name = "Point074", X = 246, Y = 234, Radius = 2}

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
AddControlPoint{Name = "058", Location = "Point058",WalkMode = Walk}
AddControlPoint{Name = "059", Location = "Point059",WalkMode = Walk}
AddControlPoint{Name = "060", Location = "Point060",WalkMode = Walk}
AddControlPoint{Name = "061", Location = "Point061",WalkMode = Walk}
AddControlPoint{Name = "062", Location = "Point062",WalkMode = Walk}
AddControlPoint{Name = "063", Location = "Point063",WalkMode = Walk}
AddControlPoint{Name = "064", Location = "Point064",WalkMode = Walk}
AddControlPoint{Name = "065", Location = "Point065",WalkMode = Walk}
AddControlPoint{Name = "066", Location = "Point066",WalkMode = Walk}
AddControlPoint{Name = "067", Location = "Point067",WalkMode = Walk}
AddControlPoint{Name = "068", Location = "Point068",WalkMode = Walk}
AddControlPoint{Name = "069", Location = "Point069",WalkMode = Walk}
AddControlPoint{Name = "070", Location = "Point070",WalkMode = Walk}
AddControlPoint{Name = "071", Location = "Point071",WalkMode = Walk}
AddControlPoint{Name = "072", Location = "Point072",WalkMode = Walk}
AddControlPoint{Name = "073", Location = "Point073",WalkMode = Walk}
AddControlPoint{Name = "074", Location = "Point074",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
