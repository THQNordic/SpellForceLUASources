function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 273, 
	Y = 37, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohen_Spawn"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P207_Undead_Rohen_Has_Spawned"},
		SetGlobalTimeStamp {Name = "t_P207_Alyha_Return_Timer"},
		LookAtDirection {Direction = North , NpcId = self}
	},
}

-----------------------------------------
-- Rohen greift aktiv in den Kampf ein --
-----------------------------------------
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "g_P207_Alyha_Moves_Toward_Battle", Seconds = 60},
	},  
	Actions = 
	{
		Goto {X = 343, Y = 103, NpcId = self, Range = 7, WalkMode = Run, GotoMode = GotoContinuous},
		SetGlobalFlagTrue {Name = "g_P207_Rohen_Wants_To_Kick_Some_Ass"},
	}
}

EndDefinition()

end
