function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Follow auf PatrolChief
OnFollowForever
{
Target = 5932, NpcId = self ,
Conditions = {},
Actions = {},
}

--Wenn PatrolChief tot
OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 3, Range = 5 , WalkRange = 10 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
	FigureDead {NpcId = 5932},  
	},
	Actions = { },
	HomeActions = {},
}

EndDefinition()

end
