function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=300, Chief = {1716} }
--!EDS RESPAWN END

OnIdleEvent
{
	Conditions = {
		FigureInRange{X = 85, Y = 99, Range = 6, NpcId = 1708},
	},
	Actions = {
		Goto{X = 89, Y = 100, WalkMode = Walk},
	},
}

OnIdleGoHome{X = 61, Y = 122, Direction = East}

EndDefinition()

end
