function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn
{
	WaitTime = 250,
	X = 66, Y = 199,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "LianonFakeSpawn"},
	},
}
--!EDS RESPAWN END

OnIdleGoHome{X = _X, Y = _Y, Direction = 1}

EndDefinition()

end
