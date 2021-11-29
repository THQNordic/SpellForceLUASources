-----------
-- Urias --
-----------

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{X = 288 , Y = 481 , NoSpawnEffect = FALSE ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "p207_Urias_Beginning"},
		IsGlobalFlagFalse {Name = "g_sP209UriasStirbt"},
	},
	Actions = 
	{
		LookAtDirection {Direction = South , NpcId = self},
		SetNpcTimeStamp {Name = "t_p207_follow_npc_timer"},
	},
}

OnFollowToggle
{
		Target = Avatar, NpcId = self, FollowOnlyOnce = FALSE,
		FollowConditions = 
		{
			IsGlobalFlagTrue {Name = "g_sP207_Urias_Follow"},
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagTrue {Name = "g_sP207_Urias_Follow_Stop"},
		},
		StopFollowActions = {},
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
		IsGlobalFlagFalse {Name = "g_p207_urias_wait_for_me", UpdateInterval = 1},
		IsGlobalFlagTrue {Name = "g_sP207_Urias_Follow"},
		IsGlobalFlagFalse {Name = "g_sP209UriasStirbt"},
	}, 
	Actions = 
	{
		Follow { NpcId = self, Target = Avatar},
	}

}

-------------------------------------------------------------
-- Urias despawn, wenn man auf Kathai war und zurück kommt --
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
