function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END


SpawnOnlyWhen
{
	Conditions =
	{
		Negated(IsGlobalState {Name = "Plot", State = "JourneyFour"}),
	},
	Actions =
	{
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalState {Name = "Plot", State = "JourneyFour"},
	},
}
EndDefinition()

end
