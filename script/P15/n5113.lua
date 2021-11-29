function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		QuestState {QuestId = 391, State = StateActive}
	},
	Actions =
	{
	}
}


--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 217, Y = 283, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 211, Y = 293, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 209, Y = 301, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 226, Y = 301, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 230, Y = 297, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 236, Y = 291, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 234, Y = 286, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 224, Y = 286, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 214, Y = 292, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 206, Y = 303, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 192, Y = 311, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 182, Y = 309, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 174, Y = 314, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 170, Y = 325, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 164, Y = 334, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 168, Y = 343, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 166, Y = 331, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 170, Y = 321, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 170, Y = 314, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 162, Y = 311, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 152, Y = 311, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 144, Y = 311, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 136, Y = 319, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 128, Y = 323, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 116, Y = 323, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 105, Y = 321, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 93, Y = 321, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 81, Y = 324, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 73, Y = 319, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 67, Y = 307, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 61, Y = 301, Radius = 2}
DefineLocationCircle{Name = "Point032", X = 57, Y = 288, Radius = 2}
DefineLocationCircle{Name = "Point033", X = 65, Y = 280, Radius = 2}
DefineLocationCircle{Name = "Point034", X = 70, Y = 272, Radius = 2}
DefineLocationCircle{Name = "Point035", X = 70, Y = 256, Radius = 2}
DefineLocationCircle{Name = "Point036", X = 70, Y = 250, Radius = 2}
DefineLocationCircle{Name = "Point037", X = 70, Y = 244, Radius = 2}
DefineLocationCircle{Name = "Point038", X = 70, Y = 232, Radius = 2}
DefineLocationCircle{Name = "Point039", X = 70, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point040", X = 64, Y = 210, Radius = 2}
DefineLocationCircle{Name = "Point041", X = 52, Y = 204, Radius = 2}
DefineLocationCircle{Name = "Point042", X = 48, Y = 198, Radius = 2}
DefineLocationCircle{Name = "Point043", X = 42, Y = 190, Radius = 2}
DefineLocationCircle{Name = "Point044", X = 42, Y = 182, Radius = 2}
DefineLocationCircle{Name = "Point045", X = 52, Y = 172, Radius = 2}
DefineLocationCircle{Name = "Point046", X = 62, Y = 168, Radius = 2}
DefineLocationCircle{Name = "Point047", X = 74, Y = 166, Radius = 2}
DefineLocationCircle{Name = "Point048", X = 82, Y = 163, Radius = 2}
DefineLocationCircle{Name = "Point049", X = 98, Y = 160, Radius = 2}
DefineLocationCircle{Name = "Point050", X = 108, Y = 160, Radius = 2}
DefineLocationCircle{Name = "Point051", X = 116, Y = 166, Radius = 2}
DefineLocationCircle{Name = "Point052", X = 122, Y = 170, Radius = 2}
DefineLocationCircle{Name = "Point053", X = 130, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point054", X = 140, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point055", X = 152, Y = 174, Radius = 2}
DefineLocationCircle{Name = "Point056", X = 168, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point057", X = 176, Y = 172, Radius = 2}
DefineLocationCircle{Name = "Point058", X = 184, Y = 172, Radius = 2}
DefineLocationCircle{Name = "Point059", X = 197, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point060", X = 208, Y = 193, Radius = 2}
DefineLocationCircle{Name = "Point061", X = 216, Y = 204, Radius = 2}
DefineLocationCircle{Name = "Point062", X = 219, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point063", X = 227, Y = 232, Radius = 2}
DefineLocationCircle{Name = "Point064", X = 227, Y = 246, Radius = 2}
DefineLocationCircle{Name = "Point065", X = 223, Y = 260, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
