function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS RESPAWN BEGIN
Respawn{WaitTime=300, Conditions = 	{
									Negated(QuestState{QuestId = 118 , State = StateActive})
									}
}
--!EDS RESPAWN END

--Fackeln auf Nordstraﬂe AUS

AddGotoLocation{X = 268, Y = 303, Radius = 1}
AddGotoLocation{X = 263, Y = 303, Radius = 1}
AddGotoLocation{X = 257, Y = 290, Radius = 1}
AddGotoLocation{X = 242, Y = 278, Radius = 1}
AddGotoLocation{X = 226, Y = 267, Radius = 1}
AddGotoLocation{X = 202, Y = 270, Radius = 1}
AddGotoLocation{X = 186, Y = 279, Radius = 1}
AddGotoLocation{X = 162, Y = 271, Radius = 1}
AddGotoLocation{X = 149, Y = 255, Radius = 1}
AddGotoLocation{X = 154, Y = 213, Radius = 1}
AddGotoLocation{X = 160, Y = 218, Radius = 1}


OnIdleDoTorchJob
{
	Name = "Strassenwache", X = _X, Y = _Y, Direction = 1,
	TurnOff = TRUE , WaitForIdle = TRUE , UpdateInterval = 60
}

EndDefinition()

end
