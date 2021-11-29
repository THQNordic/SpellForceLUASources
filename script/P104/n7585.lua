function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 400, Y = 342, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 402, Y = 364, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 381, Y = 363, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 386, Y = 348, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
--!EDS PATROL END

SpawnOnlyWhen
{ 
	Conditions = 
	{
		QuestState {QuestId = 703, State = StateActive},
	}, 
	Actions = 
	{
	
	}
}

EndDefinition()

end
