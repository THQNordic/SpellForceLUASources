function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{}

---------------------------------------------------------------------------
-- Spawnen, wenn die Tore sich Öffnen, nachdem die Türme zerstört wurden --
---------------------------------------------------------------------------

SpawnOnlyWhen 
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P207_Zweite_Festung_Angreifer_Gespawnt"},	
	},
	Actions = 
	{
	},
}

OnIdleEvent
{
	Conditions = 
	{
	},
	Actions = 
	{ 
		Goto {X = 441, Y = 260, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoContinuous},
	}, 
}

EndDefinition()

end
