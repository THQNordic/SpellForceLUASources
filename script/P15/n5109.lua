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
DefineLocationCircle{Name = "Point001", X = 222, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 216, Y = 291, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 210, Y = 301, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 198, Y = 308, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 199, Y = 324, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 189, Y = 324, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 181, Y = 324, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 171, Y = 324, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 171, Y = 315, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 155, Y = 310, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 147, Y = 310, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 143, Y = 296, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 137, Y = 290, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 131, Y = 280, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 124, Y = 269, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 120, Y = 259, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 130, Y = 259, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 141, Y = 255, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 147, Y = 256, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 153, Y = 261, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 162, Y = 259, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 169, Y = 259, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 175, Y = 259, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 175, Y = 272, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 183, Y = 272, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 190, Y = 275, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 199, Y = 280, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 205, Y = 280, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 219, Y = 280, Radius = 2}

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
--!EDS PATROL END


EndDefinition()

end
