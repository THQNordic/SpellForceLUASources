function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=30}
--!EDS RESPAWN END
OnIdleGoHome
{
	Conditions = {
		FigureAlive{NpcId = 1879},
		FigureAlive{NpcId = 1880},
		FigureAlive{NpcId = 1881},
		FigureAlive{NpcId = 1882},
		FigureAlive{NpcId = 1883},
		FigureAlive{NpcId = 1884},
		FigureAlive{NpcId = 1885},
		FigureAlive{NpcId = 1886},
		FigureAlive{NpcId = 1887},
		FigureAlive{NpcId = 1888},
		FigureAlive{NpcId = 1889},
		FigureAlive{NpcId = 1890},
	},
	X = 152, Y = 312, Direction = floor(random(8)) - 1, WalkMode = Run
}

EndDefinition()

end
