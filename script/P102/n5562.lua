function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



AddGotoLocation{X = 295, Y = 392, Radius = 1}
AddGotoLocation{X = 295, Y = 389, Radius = 1}
AddGotoLocation{X = 302, Y = 394, Radius = 1}
AddGotoLocation{X = 302, Y = 389, Radius = 1}
AddGotoLocation{X = 311, Y = 395, Radius = 1}
AddGotoLocation{X = 314, Y = 386, Radius = 1}
AddGotoLocation{X = 316, Y = 387, Radius = 1}
AddGotoLocation{X = 315, Y = 390, Radius = 1}

--Fackeln anzünden im WaldläuferCamp Setrius

--OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

OnIdleDoTorchJob
{
	Name = "FackelTest", X = 299, Y = 393, Direction = 6,
	TurnOff = FALSE , WaitForIdle = TRUE , UpdateInterval = 60
}



EndDefinition()

end
