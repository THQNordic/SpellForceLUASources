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
DefineLocationCircle{Name = "Point001", X = 210, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 198, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 186, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 176, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 166, Y = 275, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 176, Y = 288, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 180, Y = 299, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 184, Y = 308, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 196, Y = 308, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 208, Y = 302, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 214, Y = 292, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 218, Y = 284, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 222, Y = 274, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 222, Y = 264, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 226, Y = 252, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 230, Y = 238, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 220, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 216, Y = 202, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 204, Y = 191, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 198, Y = 180, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 188, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 180, Y = 170, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 168, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 148, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 132, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 118, Y = 168, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 105, Y = 162, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 83, Y = 163, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 65, Y = 168, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 51, Y = 172, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 43, Y = 184, Radius = 2}
DefineLocationCircle{Name = "Point032", X = 45, Y = 196, Radius = 2}
DefineLocationCircle{Name = "Point033", X = 55, Y = 206, Radius = 2}
DefineLocationCircle{Name = "Point034", X = 69, Y = 214, Radius = 2}
DefineLocationCircle{Name = "Point035", X = 69, Y = 225, Radius = 2}
DefineLocationCircle{Name = "Point036", X = 69, Y = 237, Radius = 2}
DefineLocationCircle{Name = "Point037", X = 69, Y = 245, Radius = 2}
DefineLocationCircle{Name = "Point038", X = 69, Y = 257, Radius = 2}
DefineLocationCircle{Name = "Point039", X = 69, Y = 271, Radius = 2}
DefineLocationCircle{Name = "Point040", X = 63, Y = 281, Radius = 2}
DefineLocationCircle{Name = "Point041", X = 57, Y = 290, Radius = 2}
DefineLocationCircle{Name = "Point042", X = 61, Y = 302, Radius = 2}
DefineLocationCircle{Name = "Point043", X = 69, Y = 310, Radius = 2}
DefineLocationCircle{Name = "Point044", X = 75, Y = 322, Radius = 2}
DefineLocationCircle{Name = "Point045", X = 88, Y = 323, Radius = 2}
DefineLocationCircle{Name = "Point046", X = 99, Y = 321, Radius = 2}
DefineLocationCircle{Name = "Point047", X = 112, Y = 322, Radius = 2}
DefineLocationCircle{Name = "Point048", X = 130, Y = 321, Radius = 2}
DefineLocationCircle{Name = "Point049", X = 141, Y = 315, Radius = 2}
DefineLocationCircle{Name = "Point050", X = 148, Y = 308, Radius = 2}
DefineLocationCircle{Name = "Point051", X = 167, Y = 312, Radius = 2}
DefineLocationCircle{Name = "Point052", X = 179, Y = 309, Radius = 2}
DefineLocationCircle{Name = "Point053", X = 191, Y = 309, Radius = 2}
DefineLocationCircle{Name = "Point054", X = 203, Y = 304, Radius = 2}
DefineLocationCircle{Name = "Point055", X = 213, Y = 296, Radius = 2}
DefineLocationCircle{Name = "Point056", X = 217, Y = 289, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
