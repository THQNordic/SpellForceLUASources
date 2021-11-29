function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
AddGotoLocation{X = 130, Y = 298}
AddGotoLocation{X = 131, Y = 303}
AddGotoLocation{X = 126, Y = 301}
AddGotoLocation{X = 119, Y = 311}
AddGotoLocation{X = 106, Y = 317}
AddGotoLocation{X = 96, Y = 325}
AddGotoLocation{X = 103, Y = 340}
AddGotoLocation{X = 109, Y = 349}
AddGotoLocation{X = 120, Y = 357}
AddGotoLocation{X = 121, Y = 369}
AddGotoLocation{X = 132, Y = 367}
AddGotoLocation{X = 137, Y = 352}
AddGotoLocation{X = 146, Y = 348}
AddGotoLocation{X = 157, Y = 336}
AddGotoLocation{X = 157, Y = 329}
AddGotoLocation{X = 153, Y = 317}
AddGotoLocation{X = 157, Y = 315}
AddGotoLocation{X = 134, Y = 331}
AddGotoLocation{X = 132, Y = 326}
AddGotoLocation{X = 150, Y = 308}
AddGotoLocation{X = 154, Y = 305}

OnIdleDoTorchJob{Name = "EloniFackeln", X = _X, Y = _Y, Direction = 0, TurnOff = TRUE,
				 WaitForIdle = TRUE , NotInDialog = FALSE , UpdateInterval = 60}

--!EDS PATROL END



EndDefinition()

end
