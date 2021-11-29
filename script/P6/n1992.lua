function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn
{
	WaitTime= 5 ,  
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Q103TroopsDied"},
		IsGlobalState {Name = "Plot", State = "JourneyOne"}
	}
}
--!EDS RESPAWN END
OnIdleGoHome
{
	X = 105 , Y = 301 , Direction = East , Range = 0 , WalkMode = Run , UpdateInterval = 10 ,
	Conditions = 	
	{
		IsGlobalFlagTrue{Name = "Q103KnightsFormUp", UpdateInterval = 10}
	},
	Actions = 	
	{
	}
}

Despawn
{
	Conditions =
	{
		Negated (IsGlobalState {Name = "Plot", State = "JourneyOne"})
	}
}

EndDefinition()

end
