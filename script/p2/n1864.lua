function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=100, Chief = {1953}}
--!EDS RESPAWN END

OnToggleEvent
{
	OnConditions = {
		FigureInRange{X = 208, Y = 228, Range = 12},
	},
	OnActions = {
		SetGlobalFlagTrue{Name = "AngriffImWesten"},
	},
	OffConditions = {
		FigureInRange{X = 322, Y = 266, Range = 16},
	},
	OffActions = {
		SetGlobalFlagFalse{Name = "AngriffImWesten"},
	},
}

OnIdleGoHome
{
	Conditions = {
		IsGlobalFlagFalse{Name = "AngriffImWesten"},
		FigureAlive{NpcId = 1864},
		FigureAlive{NpcId = 1865},
		FigureAlive{NpcId = 1866},
		FigureAlive{NpcId = 1867},
		FigureAlive{NpcId = 1868},
		FigureAlive{NpcId = 1869},
		FigureAlive{NpcId = 1870},
	},
	X = 198, Y = 238, Direction = floor(random(8)) - 1, WalkMode = Run
}


OnIdleGoHome
{
	Conditions = {
		IsGlobalFlagTrue{Name = "AngriffImWesten"},
		FigureAlive{NpcId = 1864},
		FigureAlive{NpcId = 1865},
		FigureAlive{NpcId = 1866},
		FigureAlive{NpcId = 1867},
		FigureAlive{NpcId = 1868},
		FigureAlive{NpcId = 1869},
		FigureAlive{NpcId = 1870},
	},
	X = 333, Y = 273, Direction = floor(random(8)) - 1, WalkMode = Run
}


EndDefinition()

end
