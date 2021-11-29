function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


AddGotoLocation{X = 93, Y = 81, Radius = 1}
AddGotoLocation{X = 95, Y = 69, Radius = 1}
AddGotoLocation{X = 79, Y = 65, Radius = 1}
AddGotoLocation{X = 74, Y = 74, Radius = 1}
AddGotoLocation{X = 67, Y = 67, Radius = 1}

--Fackeln anzünden im Outpost Ordensritter



OnIdleDoTorchJob
{
	Name = "FackelTest", X = 95, Y = 64, Direction = 6,
	TurnOff = FALSE , WaitForIdle = TRUE , UpdateInterval = 60
}



EndDefinition()

end
