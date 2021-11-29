function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	X = 161 , Y = 362, Direction = 1, WalkMode = Run,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "PostenkettenAlarm"},
	},
	Actions = 
	{
		
	}
}
--!EDS ONIDLEGOHOME END

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
