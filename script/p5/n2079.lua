function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome
{
	X = 160 , Y = 360, Direction = 1, WalkMode = Run,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "PostenkettenAlarm"},
	},
	Actions = 
	{
		
	}
}

OnIdleGoHome
{
	X = _X , Y = _Y, Direction = 1, WalkMode = Run,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "Attacke", Seconds = 600},
	},
}


EndDefinition()

end
