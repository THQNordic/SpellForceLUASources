function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 209, Y = 333, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 224, Y = 330, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 209, Y = 334, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 195, Y = 333, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
--!EDS PATROL END

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P205_StopSpinnen"},
	},
	
	Actions =
	{
		SetNoFightFlagTrue{NpcId = self},
	}
}


EndDefinition()

end
