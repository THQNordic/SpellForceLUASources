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
DefineLocationCircle{Name = "Point001", X = 223, Y = 269, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 222, Y = 259, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 225, Y = 253, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 227, Y = 247, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 229, Y = 239, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 229, Y = 232, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 225, Y = 227, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 221, Y = 221, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 219, Y = 215, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 217, Y = 203, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 211, Y = 195, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 207, Y = 191, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 203, Y = 187, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 197, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 193, Y = 177, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 187, Y = 175, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 183, Y = 171, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 175, Y = 171, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 169, Y = 177, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 161, Y = 177, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 157, Y = 177, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 159, Y = 191, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 163, Y = 203, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 167, Y = 216, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 171, Y = 221, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 171, Y = 233, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 179, Y = 245, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 177, Y = 251, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 177, Y = 265, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 179, Y = 277, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 191, Y = 277, Radius = 2}
DefineLocationCircle{Name = "Point032", X = 201, Y = 277, Radius = 2}
DefineLocationCircle{Name = "Point033", X = 213, Y = 277, Radius = 2}
DefineLocationCircle{Name = "Point034", X = 219, Y = 277, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
