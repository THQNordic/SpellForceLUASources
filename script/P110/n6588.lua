function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen 
{
	X = _X, Y = _Y, 
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P110_MoonHandBurned"},
	},
	Actions =
	{
	}

}

EndDefinition()

end
