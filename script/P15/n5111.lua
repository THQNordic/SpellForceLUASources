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
DefineLocationCircle{Name = "Point001", X = 222, Y = 264, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 223, Y = 258, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 224, Y = 250, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 228, Y = 244, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 230, Y = 238, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 226, Y = 232, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 222, Y = 222, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 220, Y = 212, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 216, Y = 206, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 214, Y = 198, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 220, Y = 186, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 215, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 224, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 224, Y = 190, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 220, Y = 199, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 213, Y = 201, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 204, Y = 204, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 194, Y = 205, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 184, Y = 204, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 178, Y = 204, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 174, Y = 212, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 174, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 174, Y = 232, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 174, Y = 243, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 180, Y = 250, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 172, Y = 264, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 178, Y = 274, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 188, Y = 274, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 202, Y = 277, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 212, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 220, Y = 276, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
