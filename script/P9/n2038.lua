function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OneTimeInitAction (HoldPosition{})
--!EDS ONIDLEGOHOME BEGIN
--!EDS ONIDLEGOHOME END
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 1 ,
	Conditions = 	
	{
		IsGlobalState{Name = "Plot" , State = "JourneyTwo" , Operator = IsEqual},
		IsGlobalFlagFalse{Name = "Q120TroopsRetakePortal"}
	}
}

OnIdleGoHome
{
	WalkMode = Walk, X = 226, Y = 43, Direction = 1, Range = 10,
	Conditions = 	
	{
		IsGlobalState{Name = "Plot" , State = "JourneyTwo" , Operator = IsEqual},
		IsGlobalFlagTrue{Name = "Q120TroopsRetakePortal"}
	}
}
-- !TO DO! Random X Y
OnIdleGoHome
{
	WalkMode = Walk, X = 263, Y = 378, Direction = 1, Range = 20,
	Conditions = 	
	{
		IsGlobalState{Name = "Plot" , State = "JourneyTwo" , Operator = IsNotEqual},
	}
}

EndDefinition()

end
