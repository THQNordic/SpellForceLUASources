--Trupp2
--n10215 - 10245
--Plateau

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 6, Range = 0, WalkRange = 3, WaitTime = 0, WalkMode = Walk, GotoMode = GotoNormal,
	Conditions = {},
	Actions = { },
	HomeActions = { },
	AbortConditions = { },
	AbortActions = { },
}



EndDefinition()

end
