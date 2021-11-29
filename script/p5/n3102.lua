function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 67, Y = 372, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 68, Y = 379, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 67, Y = 393, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 77, Y = 393, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 83, Y = 386, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 79, Y = 374, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
--!EDS PATROL END



--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END



-- Utraner nach Hause
OnIdleGoHome
{
	X = 320, Y = 145, Direction = 1 ,
	Conditions =
	{
		QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}
	}
}


EndDefinition()

end
