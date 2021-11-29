function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

---------------------------------------------------------
-- Spawnen sobald Player in Range, auf letzem Bergpfad --
---------------------------------------------------------

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_p207_Dritte_Festung_Weg_Zur_Vierten_Festung_Truppe03"},
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
		Goto {X = 103, Y = 177, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoContinuous},
	}, 
}

EndDefinition()

end
