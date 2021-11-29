function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 82, Y = 411, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 75, Y = 413, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 71, Y = 414, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 69, Y = 415, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 73, Y = 413, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 77, Y = 412, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 81, Y = 411, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 85, Y = 410, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 91, Y = 410, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 90, Y = 404, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 89, Y = 398, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 83, Y = 398, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 83, Y = 398, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 79, Y = 393, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 80, Y = 388, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 80, Y = 387, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 82, Y = 380, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 90, Y = 380, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 98, Y = 379, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 90, Y = 379, Radius = 2}
DefineLocationCircle{Name = "Point021", X = 87, Y = 379, Radius = 2}
DefineLocationCircle{Name = "Point022", X = 81, Y = 378, Radius = 2}
DefineLocationCircle{Name = "Point023", X = 80, Y = 376, Radius = 2}
DefineLocationCircle{Name = "Point024", X = 80, Y = 372, Radius = 2}
DefineLocationCircle{Name = "Point025", X = 81, Y = 376, Radius = 2}
DefineLocationCircle{Name = "Point026", X = 81, Y = 381, Radius = 2}
DefineLocationCircle{Name = "Point027", X = 80, Y = 388, Radius = 2}
DefineLocationCircle{Name = "Point028", X = 78, Y = 392, Radius = 2}
DefineLocationCircle{Name = "Point029", X = 81, Y = 396, Radius = 2}
DefineLocationCircle{Name = "Point030", X = 86, Y = 399, Radius = 2}
DefineLocationCircle{Name = "Point031", X = 89, Y = 403, Radius = 2}
DefineLocationCircle{Name = "Point032", X = 88, Y = 407, Radius = 2}
DefineLocationCircle{Name = "Point033", X = 89, Y = 410, Radius = 2}
DefineLocationCircle{Name = "Point034", X = 84, Y = 411, Radius = 2}
DefineLocationCircle{Name = "Point035", X = 80, Y = 412, Radius = 2}
DefineLocationCircle{Name = "Point036", X = 74, Y = 413, Radius = 2}
DefineLocationCircle{Name = "Point037", X = 70, Y = 414, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk, Conditions = {IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5},},}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "010", Location = "Point010",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "011", Location = "Point011",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "012", Location = "Point012",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "013", Location = "Point013",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "014", Location = "Point014",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "015", Location = "Point015",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "016", Location = "Point016",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "017", Location = "Point017",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "018", Location = "Point018",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "019", Location = "Point019",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "020", Location = "Point020",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "021", Location = "Point021",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "022", Location = "Point022",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "023", Location = "Point023",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "024", Location = "Point024",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "025", Location = "Point025",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "026", Location = "Point026",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "027", Location = "Point027",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "028", Location = "Point028",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "029", Location = "Point029",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "030", Location = "Point030",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "031", Location = "Point031",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "032", Location = "Point032",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "033", Location = "Point033",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "034", Location = "Point034",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "035", Location = "Point035",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "036", Location = "Point036",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
AddControlPoint{Name = "037", Location = "Point037",WalkMode = Walk, Conditions = { IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5}}}
--!EDS PATROL END


OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "GotoBlocker", Seconds = 5},
		FigureHasAggro{},
	},
	Actions =
	{
		SetNpcTimeStamp {Name = "GotoBlocker"},
	}
}

EndDefinition()

end
