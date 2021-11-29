--Alyah

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 269, Y = 455, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_KathaiFallenEin", UpdateInterval = 20},
		IsGlobalTimeElapsed {Name = "gt_P211_KathaiTimer", Seconds = random(15)+3, UpdateInterval = 10 } 
	}, 
	Actions = 
	{
		Goto {X = _X, Y = _Y, NpcId = self, Range = 2, WalkMode = Run, GotoMode = GotoContinuous},
		Follow{Target = 0, NpcId = self},
	} 
}

---------------------------------------------------------
-----------------------------------------------------------
--Umspawn bwei spielertod, Kartenwechsel, Bindstonereisen
-----------------------------------------------------------
-- umspawn flag setzen bei spielertod
OnToggleEvent
{
	OnConditions = 
	{
		FigureDead{NpcId = Avatar},
	},
	OnActions = 
	{
	},
	OffConditions = 
	{
		FigureAlive{NpcId = Avatar},
		IsGlobalFlagFalse {Name = "g_P211TruppeRuecktAb", UpdateInterval = 20}
	},
	OffActions = 
	{
		SetNpcFlagTrue{Name = "BitteUmspawnen"},
	}
}


-- umspawn flag setzen bei plattformwechsel
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P211TruppeRuecktAb", UpdateInterval = 20}
	},
	Actions = 
	{
		SetNpcFlagTrue{Name = "BitteUmspawnen"},
	}
}

--OnOneTimeEvent	-- gleich wieder löschen beim allerersten mal (verhindert vor- bzw. nach-cutscene umspawn-problem)
NewState{Name = "AvoidUmspawnAfterMapStartCutscene"}
AddTransition
{
	From = "_IDLE", To = "AvoidUmspawnAfterMapStartCutscene", RemoveTransitionAfterUse = TRUE,
	Conditions = {IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 1}},
	Actions = {SetNpcFlagFalse{Name = "BitteUmspawnen"}},
}
AddTransition
{
	From = "AvoidUmspawnAfterMapStartCutscene", To = "_IDLE", RemoveTransitionAfterUse = TRUE,
	Conditions = { }, Actions = { },
}

--Umspawn mit Follow
Umspawn 
{
	UnitId = self , 
	Clan = 0 , 
	X = startX , 
	Y = startY ,
	Target = Avatar ,
	NoSpawnEffect = FALSE ,
	OnlyOnce = FALSE,
	Conditions = 
	{
		ODER                                       
		(                                  
			AvatarLocalTeleport{},
			IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3}
		),
		--IsGlobalFlagTrue {Name = "g_P211AlyahFollow"}, 
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		
		Follow{Target = Avatar},
		
	}
}




--Alyah löst den FollowMode auf
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen", UpdateInterval = 20}, 
	},
	Actions = 
	{ 
		SetGlobalFlagFalse {Name = "g_P211AlyahFollow"}, 
	}
}


------------------------------------------------------------
--Umspawn für CS Ishtar
Umspawn
{
	UnitId = self, Clan = 0, X = 249, Y = 193, Target = none, NoSpawnEffect = FALSE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P211CSIshtarUmspawnInit", UpdateInterval = 20}
	} , 
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_P211CSIshtarUmspawnInit"},
	}
}

--beim Portal nach Kathai
Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		FigureInRange {X = 269, Y = 455, NpcId = self, Range = 0},
		IsGlobalFlagTrue {Name = "g_P211TruppeRuecktAb", UpdateInterval = 20},
	}, 
	Actions =
	{
		SetEffect {Effect = "DeMaterialize", Length = 2000, TargetType = Figure, NpcId = self},
		SetGlobalFlagTrue {Name = "P211_AlyahDespawned"}
	}
}

Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P212"},
		IsGlobalFlagFalse {Name = "P211_AlyahDespawned", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_P211TruppeRuecktAb", UpdateInterval = 20}
	}, 
	Actions =
	{
		SetGlobalFlagTrue {Name = "P211_AlyahDespawned"}
	}
}

EndDefinition()

end
