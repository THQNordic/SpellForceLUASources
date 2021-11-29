function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UmspawnIntroBone"},
	},
	
}

Despawn
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "t_P213_HokanNachHause", Seconds = 10},
		IsNpcFlagFalse {Name = "n_P213_Block"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P213_BelialErscheint"},
		SetNpcFlagTrue {Name = "n_P213_Block"}
	}
}

Respawn
{
	--Target = 11190, 
	WaitTime = 1,
	NoSpawnEffect = TRUE,
	X = 442, Y = 244,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_HokanWiederDa", UpdateInterval = 2},
	},
	Actions =
	{
		SetNoFightFlagTrue {},
		SetEffect {Effect = "OccludeBlack", TargetType = World, X = 442, Y = 244, Length = 2000},
		LookAtDirection {Direction = South},
	}
}

--Umspawn
--{
--	X = 442, Y = 244,
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "g_P213_BelialNachHause"},
--	}
--}
EndDefinition()

end
