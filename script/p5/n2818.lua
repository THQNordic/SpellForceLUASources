function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = 
	{
		AvatarIsLevel {Level = 23},	
	},
	Actions = 
	{
	},
}

EndDefinition()

end