function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 191, Y = 346, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 178, Y = 324, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 169, Y = 306, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 197, Y = 315, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 180, Y = 327, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END


SpawnOnlyWhen
{
Conditions = {QuestState{QuestId = 528 , State = StateActive}}
}


EndDefinition()

end
