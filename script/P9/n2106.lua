function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=300, Conditions = 	{
									Negated(QuestState{QuestId = 118 , State = StateActive})
									}
}
--!EDS RESPAWN END
--Fackeln in der Stadt AUS

AddGotoLocation{X = 268, Y = 371, Radius = 1}
AddGotoLocation{X = 267, Y = 383, Radius = 1}
AddGotoLocation{X = 267, Y = 392, Radius = 1}
AddGotoLocation{X = 260, Y = 392, Radius = 1}
AddGotoLocation{X = 261, Y = 396, Radius = 1}
AddGotoLocation{X = 256, Y = 396, Radius = 1}
AddGotoLocation{X = 256, Y = 383, Radius = 1}
AddGotoLocation{X = 256, Y = 373, Radius = 1}
AddGotoLocation{X = 259, Y = 348, Radius = 1}
AddGotoLocation{X = 264, Y = 341, Radius = 1}
AddGotoLocation{X = 263, Y = 337, Radius = 1}
AddGotoLocation{X = 268, Y = 337, Radius = 1}
AddGotoLocation{X = 267, Y = 341, Radius = 1}
AddGotoLocation{X = 271, Y = 348, Radius = 1}
AddGotoLocation{X = 271, Y = 356, Radius = 1}
AddGotoLocation{X = 271, Y = 364, Radius = 1}
AddGotoLocation{X = 257, Y = 469, Radius = 1}
AddGotoLocation{X = 260, Y = 469, Radius = 1}
AddGotoLocation{X = 240, Y = 466, Radius = 1}
AddGotoLocation{X = 226, Y = 480, Radius = 1}
AddGotoLocation{X = 189, Y = 477, Radius = 1}
AddGotoLocation{X = 220, Y = 469, Radius = 1}
AddGotoLocation{X = 262, Y = 426, Radius = 1}
AddGotoLocation{X = 290, Y = 392, Radius = 1}
AddGotoLocation{X = 321, Y = 382, Radius = 1}
AddGotoLocation{X = 317, Y = 386, Radius = 1}

OnIdleDoTorchJob
{
	Name = "Stadtwache", X = _X, Y = _Y, Direction = 1,
	TurnOff = TRUE , WaitForIdle = TRUE , UpdateInterval = 60
}

EndDefinition()

end
