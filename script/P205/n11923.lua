function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


---I++++++++++++++++++++++++++++++++++++++++++++++++++++I
---I                                                    I
---I                  Das große Irfit-                  I
---I       Spawn-Respawn-Despawn-Umspawn-Inferno        I
---I                                                    I
---I++++++++++++++++++++++++++++++++++++++++++++++++++++I

OneTimeInitAction( SetEffect{Effect = "SimpleInvis", Length = 0} )

-- erstmal despawnen auf jeder karte
Despawn
{
	Conditions = 
	{
		Negated(IsGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead", UpdateInterval = 30}),
		IsNpcFlagFalse{Name = "DespawnOnlyOnce", UpdateInterval = 30},
	},
	Actions = 
	{
		SetNpcFlagTrue{Name = "DespawnOnlyOnce"},
		--SetGlobalFlagFalse{Name = "g_Irfit_IrfitIsDead"},
	},
}


Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead", UpdateInterval = 10},
	},
	Actions =
	{
		SetNpcFlagTrue{Name = "IrfitRespawnOnlyOnce"},
	},
}

OnDeath
{
	Actions = 
	{
		SetGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead"},
		SetNpcFlagTrue{Name = "IrfitRespawnOnlyOnce"},
	},
}


Respawn
{
	WaitTime = 0.1, UnitId = 2706, NoSpawnEffect = FALSE, X = 230, Y = 280,
	Conditions =
	{
		FigureDead{NpcId = 11221}, -- irfit, der erst gefüttert werden muss und dann despawned
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsEvil", UpdateInterval = 10},
		IsNpcFlagFalse{Name = "IrfitRespawnOnlyOnce"},
	},
	DeathActions =
	{
		SetGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead"},
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_Irfit_IrfitIsDead"},
		SetNpcFlagTrue{Name = "IrfitRespawnOnlyOnce"},
	}
}
Respawn
{
	WaitTime = 0.1, UnitId = 2705, NoSpawnEffect = FALSE, X = 230, Y = 280,
	Conditions =
	{
		FigureDead{NpcId = 11221}, -- irfit, der erst gefüttert werden muss und dann despawned
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsGood", UpdateInterval = 10},
		IsNpcFlagFalse{Name = "IrfitRespawnOnlyOnce"},
	},
	DeathActions =
	{
		SetGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead"},
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_Irfit_IrfitIsDead"},
		SetNpcFlagTrue{Name = "IrfitRespawnOnlyOnce"},
	}
}


OnPlatformOneTimeEvent
{
	Conditions =
	{
		Negated(IsGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead"}),
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsPlayerUnit", UpdateInterval = 30},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_Irfit_UmspawnToAvatar"},
		IncreaseNpcCounter{Name = "UmspawnOnlyOnSecondTime"},
	}
}
OnEvent
{
	Conditions =
	{
		AvatarLocalTeleport{},
		--Negated(IsGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead", UpdateInterval = 10}),
	},
	Actions =
	{
		IncreaseNpcCounter{Name = "UmspawnOnlyOnSecondTime"},
		SetGlobalFlagTrue{Name = "g_Irfit_UmspawnToAvatar"},
		SetNpcFlagTrue{Name = "BitteUmspawnen"},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Irfit_UmspawnToAvatar"},
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsPlayerUnit"},
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_Irfit_UmspawnToAvatar"},
		IncreaseNpcCounter{Name = "UmspawnOnlyOnSecondTime"},
		Follow{Target = Avatar},
		ChangeOwner{},
	}
}

UmspawnToAvatar
{
	UnitId = 2706, OnlyOnce = FALSE, Target = Avatar, DisableFirstMapLoadUmspawn = FALSE,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsPlayerUnit"},
		IsGlobalFlagTrue{Name = "g_Irfit_UmspawnToAvatar", UpdateInterval = 10},
		IsNpcCounter{Name = "UmspawnOnlyOnSecondTime", Value = 2, Operator = IsGreaterOrEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsEvil", UpdateInterval = 30},
		Negated(IsGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead", UpdateInterval = 30}),
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_Irfit_UmspawnToAvatar"},
		SetGlobalFlagFalse{Name = "g_Irfit_IrfitIsDead"},
		ChangeOwner{},
	}
}

UmspawnToAvatar
{
	UnitId = 2705, OnlyOnce = FALSE, Target = Avatar, DisableFirstMapLoadUmspawn = FALSE,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsPlayerUnit"},
		IsGlobalFlagTrue{Name = "g_Irfit_UmspawnToAvatar", UpdateInterval = 10},
		IsNpcCounter{Name = "UmspawnOnlyOnSecondTime", Value = 2, Operator = IsGreaterOrEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsGood", UpdateInterval = 30},
		Negated(IsGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead", UpdateInterval = 30}),
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_Irfit_UmspawnToAvatar"},
		SetGlobalFlagFalse{Name = "g_Irfit_IrfitIsDead"},
		ChangeOwner{},
	}
}

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag", UpdateInterval = 10},
	},
	OnActions =
	{
		SetNoFightFlagTrue{},
	},
	OffConditions = 
	{
		IsGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag", UpdateInterval = 30},
	},
	OffActions =
	{
		SetNoFightFlagFalse{},
	},
}


---I++++++++++++++++++++++++++++++++++++++++++++++++++++I
---I                                                    I
---I                    Irfit-Spawn-                    I
---I          Respawn-Despawn-Umspawn-Inferno           I
---I                    ends here                       I
---I                                                    I
---I++++++++++++++++++++++++++++++++++++++++++++++++++++I

EndDefinition()

end
