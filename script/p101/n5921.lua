function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Follow auf PatrolChief
OnFollowForever
{
Target = 5930, NpcId = self ,
Conditions = {},
Actions = {},
}




--Wenn PatrolChief tot
OnIdleGoHome
{
	X = 321, Y = 219, Direction = 1, Range = 5 , WalkRange = 10 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
	FigureDead {NpcId = 5930},  
	},
	Actions = { },
	HomeActions = {},
}

EndDefinition()

end
