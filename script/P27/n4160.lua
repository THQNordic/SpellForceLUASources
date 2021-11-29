function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 173, Y = 405, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 176, Y = 405, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 180, Y = 405, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 182, Y = 404, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 184, Y = 401, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 183, Y = 398, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 183, Y = 392, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 178, Y = 392, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 175, Y = 389, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 175, Y = 388, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 171, Y = 385, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 165, Y = 385, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 161, Y = 386, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 156, Y = 386, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 156, Y = 389, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 156, Y = 394, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 156, Y = 399, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 159, Y = 402, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 162, Y = 403, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 167, Y = 404, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 170, Y = 405, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 170, Y = 408, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 170, Y = 412, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 170, Y = 417, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 171, Y = 421, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 171, Y = 425, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 171, Y = 429, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 169, Y = 432, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 165, Y = 436, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 161, Y = 440, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 158, Y = 444, Radius = 2}
DefineLocationCircle{Name = "Point032", X = 155, Y = 444, Radius = 2}
DefineLocationCircle{Name = "Point033", X = 151, Y = 446, Radius = 2}
DefineLocationCircle{Name = "Point034", X = 148, Y = 446, Radius = 2}
DefineLocationCircle{Name = "Point035", X = 145, Y = 447, Radius = 2}
DefineLocationCircle{Name = "Point036", X = 143, Y = 445, Radius = 2}
DefineLocationCircle{Name = "Point037", X = 143, Y = 445, Radius = 2}
DefineLocationCircle{Name = "Point038", X = 141, Y = 443, Radius = 2}
DefineLocationCircle{Name = "Point039", X = 140, Y = 439, Radius = 2}
DefineLocationCircle{Name = "Point040", X = 139, Y = 435, Radius = 2}
DefineLocationCircle{Name = "Point041", X = 142, Y = 431, Radius = 2}
DefineLocationCircle{Name = "Point042", X = 146, Y = 427, Radius = 2}
DefineLocationCircle{Name = "Point043", X = 145, Y = 425, Radius = 2}
DefineLocationCircle{Name = "Point044", X = 147, Y = 421, Radius = 2}
DefineLocationCircle{Name = "Point045", X = 148, Y = 418, Radius = 2}
DefineLocationCircle{Name = "Point046", X = 148, Y = 414, Radius = 2}
DefineLocationCircle{Name = "Point047", X = 148, Y = 409, Radius = 2}
DefineLocationCircle{Name = "Point048", X = 143, Y = 405, Radius = 2}
DefineLocationCircle{Name = "Point049", X = 137, Y = 405, Radius = 2}
DefineLocationCircle{Name = "Point050", X = 131, Y = 407, Radius = 2}
DefineLocationCircle{Name = "Point051", X = 129, Y = 409, Radius = 2}
DefineLocationCircle{Name = "Point052", X = 129, Y = 411, Radius = 2}
DefineLocationCircle{Name = "Point053", X = 129, Y = 415, Radius = 2}
DefineLocationCircle{Name = "Point054", X = 130, Y = 415, Radius = 2}
DefineLocationCircle{Name = "Point055", X = 137, Y = 420, Radius = 2}
DefineLocationCircle{Name = "Point056", X = 140, Y = 423, Radius = 2}
DefineLocationCircle{Name = "Point057", X = 143, Y = 424, Radius = 2}
DefineLocationCircle{Name = "Point058", X = 142, Y = 429, Radius = 2}
DefineLocationCircle{Name = "Point059", X = 142, Y = 433, Radius = 2}
DefineLocationCircle{Name = "Point060", X = 138, Y = 437, Radius = 2}
DefineLocationCircle{Name = "Point061", X = 138, Y = 440, Radius = 2}
DefineLocationCircle{Name = "Point062", X = 139, Y = 442, Radius = 2}
DefineLocationCircle{Name = "Point063", X = 143, Y = 445, Radius = 2}
DefineLocationCircle{Name = "Point064", X = 147, Y = 447, Radius = 2}
DefineLocationCircle{Name = "Point065", X = 151, Y = 447, Radius = 2}
DefineLocationCircle{Name = "Point066", X = 153, Y = 445, Radius = 2}
DefineLocationCircle{Name = "Point067", X = 156, Y = 443, Radius = 2}
DefineLocationCircle{Name = "Point068", X = 159, Y = 442, Radius = 2}
DefineLocationCircle{Name = "Point069", X = 161, Y = 438, Radius = 2}
DefineLocationCircle{Name = "Point070", X = 165, Y = 437, Radius = 2}
DefineLocationCircle{Name = "Point071", X = 167, Y = 433, Radius = 2}
DefineLocationCircle{Name = "Point072", X = 169, Y = 432, Radius = 2}
DefineLocationCircle{Name = "Point073", X = 171, Y = 428, Radius = 2}
DefineLocationCircle{Name = "Point074", X = 171, Y = 422, Radius = 2}
DefineLocationCircle{Name = "Point075", X = 171, Y = 421, Radius = 2}
DefineLocationCircle{Name = "Point076", X = 170, Y = 417, Radius = 2}
DefineLocationCircle{Name = "Point077", X = 170, Y = 411, Radius = 2}
DefineLocationCircle{Name = "Point078", X = 170, Y = 407, Radius = 2}

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
AddControlPoint{Name = "075", Location = "Point075",WalkMode = Walk}
AddControlPoint{Name = "076", Location = "Point076",WalkMode = Walk}
AddControlPoint{Name = "077", Location = "Point077",WalkMode = Walk}
AddControlPoint{Name = "078", Location = "Point078",WalkMode = Walk}
--!EDS PATROL END






EndDefinition()

end
