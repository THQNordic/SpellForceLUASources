function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)


-- WICHTIG FUER DIE CUTSCENE IN UTRAN FESTE --------------------
SpawnOnlyWhen
{
	X = 303 , Y = 166,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UtranSpawns"},
	},
}

OnIdleGoHome
{
	X = 298 , Y = 159 , Direction = 2 , Range = 0 , WalkMode = Run , UpdateInterval = 10 ,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UtranIdleOn"},	
	},	
}
----------------------------------------------------------------


EndDefinition()

end
