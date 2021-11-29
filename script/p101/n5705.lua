function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OnIdleGoHome
{
X = _X, Y = _Y, Direction = 1, Range = 5 , WalkRange = 5 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = {},
	Actions = {},
	HomeActions = 
	{
	HoldPosition {NpcId = self},
	},
}

EndDefinition()

end
