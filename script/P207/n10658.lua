function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{	X = 349,
	Y = 451,
	NoSpawnEffect = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "p207_Giant_Spawn_Block_Caves"},
	},
	Actions = 
	{
		RemoveObject {X = 351, Y = 451, Object = 2439},
		StopEffect {X = 352, Y = 452, TargetType = World},
	},
}

OnPlatformOneTimeEvent
{
	Actions =
	{
		ChangeRace {Race = 4},
	},
}

-->
--------------------------------------
-- Riese steht vor der ersten Höhle --
--------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange{X = 307, Y = 404, NpcId = self},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "g_p207_block_cave_01"},
	},
}

---------------------------------
-- Riese blockiert erste Höhle --
---------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_p207_block_cave_01", Seconds = 5},
	},
	Actions =
	{
		PlaceObject{X = 307 ,Y = 402 ,Object = 852, DestroyNpc = TRUE},  -- Stein wird in den Höhleneingang gesetzt
		SetGlobalTimeStamp{Name = "g_p207_block_cave_goto_cave_02"},
		SetGlobalFlagTrue {Name = "g_p207_Hoehle01_versperrt"},
	},
}

----------------------------------
-- Riese geht zur zweiten Höhle --
----------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_p207_block_cave_goto_cave_02", Seconds = 5},
	},
	Actions =
	{
		Goto {X = 292, Y = 387, GotoMode = GotoContinuous, WalkMode = Walk},
	},
}

-->
---------------------------------------
-- Riese steht vor der zweiten Höhle --
---------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange{X = 292, Y = 387, NpcId = self},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "g_p207_block_cave_02"},
	},
}

----------------------------------
-- Riese blockiert zweite Höhle --
----------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_p207_block_cave_02", Seconds = 5},
	},
	Actions =
	{
		PlaceObject{X = 293 ,Y = 389 ,Object = 852, DestroyNpc = TRUE},  -- Stein wird in den Höhleneingang gesetzt
		--SetGlobalTimeStamp{Name = "g_p207_block_cave_goto_cave_03"},
		SetGlobalTimeStamp{Name = "g_p207_block_cave_goto_cave_04"},
		SetGlobalFlagTrue {Name = "g_p207_Hoehle02_versperrt"},
	},
}

--		----------------------------------
--		-- Riese geht zur dritten Höhle --
--		----------------------------------
--		
--		OnOneTimeEvent
--		{
--			Conditions =
--			{
--				IsGlobalTimeElapsed {Name = "g_p207_block_cave_goto_cave_03", Seconds = 5},
--			},
--			Actions =
--			{
--				Goto {X = 307, Y = 365, GotoMode = GotoContinuous, WalkMode = Walk},
--			},
--		}
--		
--		-->
--		---------------------------------------
--		-- Riese steht vor der dritten Höhle --
--		---------------------------------------
--		
--		OnOneTimeEvent
--		{
--			Conditions =
--			{
--				FigureInRange{X = 307, Y = 365, NpcId = self},
--			},
--			Actions =
--			{
--				SetGlobalTimeStamp{Name = "g_p207_block_cave_03"},
--			},
--		}
--		
--		----------------------------------
--		-- Riese blockiert dritte Höhle --
--		----------------------------------
--		
--		OnOneTimeEvent
--		{
--			Conditions =
--			{
--				IsGlobalTimeElapsed {Name = "g_p207_block_cave_03", Seconds = 5},
--			},
--			Actions =
--			{
--				PlaceObject{X = 309 ,Y = 365 ,Object = 852, DestroyNpc = TRUE},  -- Stein wird in den Höhleneingang gesetzt
--				SetGlobalTimeStamp{Name = "g_p207_block_cave_goto_cave_04"},
--				SetGlobalFlagTrue {Name = "g_p207_Hoehle03_versperrt"},
--			},
--		}

----------------------------------
-- Riese geht zur vierten Höhle --
----------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_p207_block_cave_goto_cave_04", Seconds = 5},
	},
	Actions =
	{
		Goto {X = 244, Y = 366, GotoMode = GotoContinuous, WalkMode = Walk},
	},
}

-->
---------------------------------------
-- Riese steht vor der vierten Höhle --
---------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange{X = 244, Y = 366, NpcId = self},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "g_p207_block_cave_04"},
	},
}

----------------------------------
-- Riese blockiert vierte Höhle --
----------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_p207_block_cave_04", Seconds = 5},
	},
	Actions =
	{
		PlaceObject{X = 244 ,Y = 368 ,Object = 852, DestroyNpc = TRUE},  -- Stein wird in den Höhleneingang gesetzt
		SetGlobalTimeStamp{Name = "g_p207_block_cave_goto_cave_05"},
		SetGlobalTimeStamp{Name = "g_p207_block_cave_goto_home"},
		SetGlobalFlagTrue {Name = "g_p207_Hoehle04_versperrt"},
	},
}

--		----------------------------------
--		-- Riese geht zur fünfte Höhle --
--		----------------------------------
--		
--		OnOneTimeEvent
--		{
--			Conditions =
--			{
--				IsGlobalTimeElapsed {Name = "g_p207_block_cave_goto_cave_05", Seconds = 5},
--			},
--			Actions =
--			{
--				Goto {X = 214, Y = 365, GotoMode = GotoContinuous, WalkMode = Walk},
--			},
--		}
--		
--		-->
--		---------------------------------------
--		-- Riese steht vor der fünften Höhle --
--		---------------------------------------
--		
--		OnOneTimeEvent
--		{
--			Conditions =
--			{
--				FigureInRange{X = 214, Y = 365, NpcId = self},
--			},
--			Actions =
--			{
--				SetGlobalTimeStamp{Name = "g_p207_block_cave_05"},
--			},
--		}
--		
--		----------------------------------
--		-- Riese blockiert fünfte Höhle --
--		----------------------------------
--		
--		OnOneTimeEvent
--		{
--			Conditions =
--			{
--				IsGlobalTimeElapsed {Name = "g_p207_block_cave_05", Seconds = 5},
--			},
--			Actions =
--			{
--				PlaceObject{X = 214 ,Y = 363 ,Object = 852, DestroyNpc = TRUE},  -- Stein wird in den Höhleneingang gesetzt
--				SetGlobalTimeStamp{Name = "g_p207_block_cave_goto_home"},
--				SetGlobalFlagTrue {Name = "g_p207_Hoehle05_versperrt"},
--			},
--		}

------------------------------------------
-- Riese geht wieder zu seine Behausung --
------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_p207_block_cave_goto_home", Seconds = 5},
	},
	Actions =
	{
		Goto {X = 350, Y = 405, GotoMode = GotoContinuous, WalkMode = Walk},
	},
}
EndDefinition()

end
