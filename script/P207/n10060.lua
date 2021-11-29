-----------
-- Alyha --
-----------

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{	X = 288,
	Y = 481,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "p207_Alyah_Beginning"}
	},
	Actions = 
	{
		LookAtDirection {Direction = South , NpcId = self},
		SetNpcTimeStamp {Name = "t_p207_follow_npc_timer"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange{X = 267, Y = 479, NpcId = self}
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "p207_AlyahDespawn"},
	},
	
}

UmspawnToAvatar
{
	UnitId = self, 
	Clan = 0, 
	X = startX, 
	Y = startY,
	Target = Avatar,
	NoSpawnEffect = FALSE,
	OnlyOnce = FALSE,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_p207_alyah_wait_for_me", UpdateInterval = 1},
		IsGlobalFlagTrue {Name = "g_P207_Alyha_Follow_Avatar"},
	}, 
	Actions = 
	{
		Follow { NpcId = self, Target = Avatar},
	}

}

Despawn
{
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P207_Alyha_Has_Despawned_On_Map_Start"},
		IsGlobalFlagTrue{Name = "p207_AlyahDespawn"},
	},
	Actions = 
	{
		SetGlobalTimeStamp {Name = "p207_EnemiesTimer_Lower_Map"},
		SetGlobalFlagTrue {Name = "g_P207_Alyha_Has_Despawned_On_Map_Start"},
	},
}

Respawn
{
	WaitTime = 8,
	X = 407,
	Y = 149,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "t_P207_Alyha_Return_Timer", Seconds = 45},
	},
	Actions = 
	{
		Goto {X = 313, Y = 78, NpcId = self, Range = 7, WalkMode = Run, GotoMode = GotoContinuous},		
		SetGlobalTimeStamp {Name = "g_P207_Alyha_Moves_Toward_Battle"},
		SetGlobalFlagTrue {Name = "oc_P207_Alyha_Kehrt_Zurueck_Mit_Verstaerkung"},
	},
	DeathActions = 
	{ 
	},
}

-----------------------------------------------
-- Wenn Rohen tot ist folgt Alyha dem Avatar --
-----------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureDead{NpcId = 11086},	-- Rohen
	},
	Actions =
	{
		Follow{Target = Avatar},
	},
}

--------------------------------------------------
-- Follow auf den Avatar, nachdem Rohen tot ist --
--------------------------------------------------

OnFollowToggle
{
		Target = Avatar, NpcId = self, FollowOnlyOnce = FALSE,
		FollowConditions = 
		{
			FigureDead {NpcId = 11086},
			IsGlobalFlagTrue{Name = "g_P207_Undead_Rohen_Has_Spawned"},			
		},
		FollowActions = 
		{
			SetGlobalFlagTrue{Name = "g_P207_Alyha_Follow_Avatar"},
		},
		StopFollowConditions = 
		{
			IsGlobalFlagTrue {Name = "g_sP207_Alyha_Follow_Stop"}
		},
		StopFollowActions = {},
}

--	Umspawn 
--	{
--		UnitId = self, 
--		Clan = 0, 
--		X = startX, 
--		Y = startY,
--		Target = Avatar,
--		NoSpawnEffect = FALSE,
--		OnlyOnce = FALSE,
--		Conditions = 
--		{
--			IsGlobalFlagTrue{Name = "g_P207_Alyha_Follow_Avatar"},
--			ODER                                       
--			(                                  
--				AvatarLocalTeleport{},
--				FigureDead {NpcId = Avatar}
--			),		
--		}, 
--		Actions = 
--		{
--			Follow { NpcId = self, Target = Avatar},
--		}
--	
--	}

-------------------------------------------------------------------
-- Letzt Cutscene / Alyah geht durch das Portal und verschwindet --
-------------------------------------------------------------------

Despawn
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P207_Last_Cutscene_Has_Started"},
		FigureInRange{X = 273, Y = 36, NpcId = self, Range = 1},
	},
	Actions = 
	{
	},
}

-------------------------------------------------------------
-- Alyah despawn, wenn man auf Kathai war und zurück kommt --
-------------------------------------------------------------

Despawn
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P209"},
	},
	Actions = 
	{
	},
}

------------------------------------------------------------------------------------------------
-- Alyah despawn, wenn letzte Cutscene gelaufen ist, und Alyah durchs Portal verschwunden ist --
------------------------------------------------------------------------------------------------

Despawn
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_p207_Alyah_Despawn_After_Leaving_Map_Trough_Portal"},
	},
	Actions = 
	{
	},
}

OnEvent
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_p207_stop_follow_in_cutscenes"},
		IsNpcTimeElapsed {Name = "t_p207_follow_npc_timer", Seconds = 5},
	},
	Actions =
	{
		SetNpcTimeStamp {Name = "t_p207_follow_npc_timer"},
		Follow {Target = 0},
	},
}


EndDefinition()

end
