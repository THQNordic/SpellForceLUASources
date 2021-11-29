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
DefineLocationCircle{Name = "Point001", X = 220, Y = 280, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 208, Y = 282, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 199, Y = 280, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 194, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 186, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 180, Y = 274, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 173, Y = 274, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 173, Y = 285, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 175, Y = 290, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 179, Y = 300, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 181, Y = 306, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 193, Y = 309, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 204, Y = 305, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 207, Y = 302, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 211, Y = 296, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
