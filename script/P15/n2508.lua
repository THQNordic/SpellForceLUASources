function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

rem = [[
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 6},
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "SkelettGehZumDialog"},
	},
},

OnIdleGoHome
{
	WalkMode = Run, X = 448, Y = 226, Direction = 6},
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "SkelettGehZumDialog", UpdateInterval = 5},
	},
},
]]
rem = nil

EndDefinition()

end
