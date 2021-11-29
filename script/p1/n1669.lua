function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- "Fackel An" Guard am Nordausgang

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END

AddGotoLocation{X = 164, Y = 119, Radius = 1}
AddGotoLocation{X = 168, Y = 119, Radius = 1}
AddGotoLocation{X = 169, Y = 135, Radius = 1}
AddGotoLocation{X = 172, Y = 138, Radius = 1}
AddGotoLocation{X = 166, Y = 144, Radius = 1}
AddGotoLocation{X = 163, Y = 141, Radius = 1}

OnIdleDoTorchJob
{
	Name = "NordAusgang", X = _X, Y = _Y, Direction = 6,
	TurnOff = FALSE , WaitForIdle = TRUE , UpdateInterval = 60
}


EndDefinition()
end
