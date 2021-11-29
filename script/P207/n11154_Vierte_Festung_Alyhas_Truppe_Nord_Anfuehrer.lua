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
		IsGlobalTimeElapsed {Name = "g_P207_Alyha_Moves_Toward_Battle", Seconds = 20},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P207_Alyha_Has_Returned"},
		ChangeRace {Race = 185, NpcId = self},
	},
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		ChangeFigureOwner {NpcId = self},
	},
}

OnIdleEvent
{
	Conditions = 
	{
	},
	Actions = 
	{ 
		Goto {X = 313, Y = 78, NpcId = self, Range = 7, WalkMode = Run, GotoMode = GotoContinuous},		
	}, 
}

EndDefinition()

end
