function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Blade
SpawnOnlyWhen
{
	X = _X, Y = _Y, 
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P203_BladesSpawnen", UpdateInterval = 2}
	}
}

-- Pro CHar anderes Ziel
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_nP201PhoenixSteinSpieler"},
	},
	Actions =
	{
		AttackTarget {Target = 11594},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
	},
	Actions =
	{
		AttackTarget {Target = 11677},
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_RohenNachHause"},
	}
}
EndDefinition()

end
