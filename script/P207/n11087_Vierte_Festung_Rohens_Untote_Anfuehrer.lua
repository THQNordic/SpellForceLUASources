function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

------------------------------------------------------------
-- Spawnen sobald Player beide Untote Saurier getötet hat --
------------------------------------------------------------

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Has_Entered_The_Building"},
	},
	Actions = 
	{
	},
}

--		OnIdleEvent
--		{
--			Conditions = 
--			{
--				IsGlobalFlagTrue{Name = "g_P207_Rohens_Army_Attack"},
--			},
--			Actions = 
--			{ 
--				Goto {X = 343, Y = 103, NpcId = self, Range = 7, WalkMode = Run, GotoMode = GotoContinuous},
--			}, 
--		}

OnOneTimeEvent
{
	Conditions = 
	{
		FigureDead{NpcId = 11086},	-- Rohen
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohen_Has_Spawned"},
	},  
	Actions = 
	{
		Kill {NpcId = self},
	}
}

Respawn
{
	WaitTime = 9,
	X = 273,
	Y = 36,
	Conditions = 
	{
		FigureAlive {NpcId = 11086},	-- Rohen
		IsGlobalFlagTrue {Name = "g_P207_Undead_Rohen_Has_Spawned"},
		--IsGlobalFlagFalse {Name = "g_P207_Alyha_Has_Returned"},
		IsGlobalFlagFalse {Name = "g_P207_Rohen_Wants_To_Kick_Some_Ass"},
	},
	Actions = 
	{
		Goto {X = 343, Y = 103, NpcId = self, Range = 7, WalkMode = Run, GotoMode = GotoContinuous},
	},
	DeathActions = 
	{ 
	},
}

EndDefinition()

end
