function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{ 
	X = _X, Y = _Y,
	NoSpawnEffect = FALSE,
	Conditions = 
	{
	   IsGlobalTimeElapsed{Name = "c_P213_CounterVollAufDieFresse", Seconds = 3600, UpdateInterval = 10}, 
	},
	Actions = 
	{
		ChangeRace{Race = 150, NpcId = self},
		SetGlobalFlagTrue{Name = "g_P213_ZanzabarAufDieFresse"},		
	},
}

EndDefinition()

end
