function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{ 
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
			IsGlobalFlagTrue{Name = "g_P205_SpinnenZuHilfe"},
	},
	Actions = {},
}


OnOneTimeEvent
{
	Conditions = {},
	
	Actions =
	{
	   ChangeRace{Race = 150, NpcId = self},
	}
}

EndDefinition()

end
