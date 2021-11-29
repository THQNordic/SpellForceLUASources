
---I++++++++++++++++++++++++++++++++++++++++++++++++++++I
---I                                                    I
---I                  Das große Irfit-                  I
---I       Spawn-Respawn-Despawn-Umspawn-Inferno        I
---I                                                    I
---I++++++++++++++++++++++++++++++++++++++++++++++++++++I

-- unsichtbar zu beginn, just in case
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

-- endgültiger despawn bei erstmaligem tod des irfit im spiel (egal wo)
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

-- erstmaliger respawn wenn man den irfit hat, jeweils gut & böse
Respawn
{
	WaitTime = 0.1, UnitId = 2706, NoSpawnEffect = FALSE, Target = Avatar,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsPlayerUnit"},
		--Negated(IsGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead", UpdateInterval = 10}),
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsEvil", UpdateInterval = 10},
		IsNpcFlagFalse{Name = "IrfitRespawnOnlyOnce"},
	},
	DeathActions =
	{
		SetGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead"},
		SetNpcFlagTrue{Name = "IrfitRespawnOnlyOnce"},
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_Irfit_IrfitIsDead"},
		SetNpcFlagTrue{Name = "IrfitRespawnOnlyOnce"},
		ChangeOwner{},
	}
}
Respawn
{
	WaitTime = 0.1, UnitId = 2705, NoSpawnEffect = FALSE, Target = Avatar,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsPlayerUnit"},
		--Negated(IsGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead", UpdateInterval = 10}),
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsGood", UpdateInterval = 10},
		IsNpcFlagFalse{Name = "IrfitRespawnOnlyOnce"},
	},
	DeathActions =
	{
		SetGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead"},
		SetNpcFlagTrue{Name = "IrfitRespawnOnlyOnce"},
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_Irfit_IrfitIsDead"},
		SetNpcFlagTrue{Name = "IrfitRespawnOnlyOnce"},
		ChangeOwner{},
	}
}

-- umspawnen bei jedem platform betreten
OnPlatformOneTimeEvent
{
	Conditions =
	{
		Negated(IsGlobalFlagTrue{Name = "g_Irfit_IrfitIsDead", UpdateInterval = 10}),
		IsGlobalFlagTrue{Name = "g_P204_IrfitIsPlayerUnit", UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_Irfit_UmspawnToAvatar"},
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
		SetGlobalFlagTrue{Name = "g_Irfit_UmspawnToAvatar"},
		SetNpcFlagTrue{Name = "BitteUmspawnen"},
	}
}

UmspawnToAvatar
{
	UnitId = 2706, OnlyOnce = FALSE, Target = Avatar, DisableFirstMapLoadUmspawn = FALSE,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Irfit_UmspawnToAvatar", UpdateInterval = 10},
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
		IsGlobalFlagTrue{Name = "g_Irfit_UmspawnToAvatar", UpdateInterval = 10},
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
