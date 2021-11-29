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
DefineLocationCircle{Name = "Point002", X = 222, Y = 267, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 224, Y = 257, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 230, Y = 242, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 226, Y = 230, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 220, Y = 222, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 219, Y = 212, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 215, Y = 203, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 212, Y = 197, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 200, Y = 190, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 193, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 179, Y = 175, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 165, Y = 174, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 155, Y = 175, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 161, Y = 192, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 167, Y = 218, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 167, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 173, Y = 245, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 173, Y = 254, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 171, Y = 267, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 175, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 191, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 207, Y = 280, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
