--Schattenkrieger

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
		{
			IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 20} 
		}, 
	Actions = 
		{
			SetEffect {Effect = "Chain", Length = 0, TargetType = Figure, NpcId = self},
			HoldPosition {NpcId = self, FreeWill = FALSE},
			LookAtDirection {Direction = SouthEast, NpcId = self},
			ChangeRace{NpcId = self, Race = 152}
		} 
}


-- nach CS Befreiung Change Owner
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 10}
	},
	Actions = 
	{
		ChangeFigureOwner {NpcId = self},
		ChangeRace {Race = 185, NpcId = self}
	}
}



---------------------------------------------------------
-----------------------------------------------------------
-- Umspawn bei Kartenwechsel
-----------------------------------------------------------
-- umspawn flag setzen bei plattformwechsel
OnToggleEvent
{
	NotInDialog = FALSE , ResetOnPlatformLoad = FALSE , ResetOnDeath = FALSE , UpdateInterval = 60 ,
	OnConditions = 
	{
		FigureDead {NpcId = 0},
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 10} 
	},
	OnActions = {},
	OffConditions = 
	{
		FigureAlive {NpcId = 0},
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 10} 
	},
	OffActions = 
	{
		SetNpcFlagTrue{Name = "BitteUmspawnen"}
	},
}


--Umspawn mit Change Owner und Change Race
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
			IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3},
			IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 10}
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		ChangeFigureOwner {NpcId = self},
		ChangeRace {Race = 185, NpcId = self}
	}
}



----------------------------------------------------
-- respawn am Bindpoint nach Tod

--Bindstone Anfangsportal Clockwork
Respawn
{
 	WaitTime = 20, X = 382, Y = 387, Chief = none, NoSpawnEffect = FALSE, 
 	Conditions = 
 	{
 		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P212"},
 		--QuestState {QuestId = 956, State = StateUnknown, UpdateInterval = 10},
 		IsGlobalFlagTrue {Name = "g_P211_BindStoneEins"},
		IsGlobalFlagFalse {Name = "g_P211_BindStoneZwei"},
		IsGlobalFlagFalse {Name = "g_P211_BindStoneDrei"},
		IsGlobalFlagFalse {Name = "g_P211BindStoneVier"},
		IsGlobalFlagFalse {Name = "g_P211BindStoneFuenf"},
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 10}
 	}, 
 	Actions = 
 	{
 		ChangeFigureOwner {NpcId = self},
 		ChangeRace {Race = 185, NpcId = self}
 	}, 
 	DeathActions = {} 
}


-- Zweiter Bindstone am Portal Kathai
Respawn
{
	X = 257, Y = 437,
	WaitTime = 20,
	Conditions =
	{
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P212"},
		--QuestState {QuestId = 956, State = StateUnknown, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P211_BindStoneZwei"},
		IsGlobalFlagFalse {Name = "g_P211_BindStoneDrei"},
		IsGlobalFlagFalse {Name = "g_P211_BindStoneVier"},
		IsGlobalFlagFalse {Name = "g_P211BindStoneFuenf"},
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 10}
	},
	Actions =
	{
		ChangeFigureOwner {NpcId = self},
 		ChangeRace {Race = 185, NpcId = self}
	}
}

-- Dritter Bindstone Zwergenmonument2
Respawn
{
	X = 260, Y = 263,
	WaitTime = 20,
	Conditions =
	{
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P212"},
		--QuestState {QuestId = 956, State = StateUnknown, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P211_BindStoneDrei"},
		IsGlobalFlagFalse {Name = "g_P211_BindStoneVier"},
		IsGlobalFlagFalse {Name = "g_P211BindStoneFuenf"},
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 10}
	},
	Actions =
	{
		ChangeFigureOwner {NpcId = self},
 		ChangeRace {Race = 185, NpcId = self}
	}
}

-- Vierter Bindstone Gefängnis
Respawn
{
	X = 176, Y = 109,
	WaitTime = 20,
	Conditions =
	{
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P212"},
		--QuestState {QuestId = 956, State = StateUnknown, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P211_BindStoneVier"},
		IsGlobalFlagFalse {Name = "g_P211BindStoneFuenf"},
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 10}
	},
	Actions =
	{
		ChangeFigureOwner {NpcId = self},
 		ChangeRace {Race = 185, NpcId = self}
	}
}


-- Fuenfter Bindstone Endportal nach Gorge
Respawn
{
	X = 96, Y = 118,
	WaitTime = 20,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P211_BindStoneFuenf"},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P212"},
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 10},
		--QuestState {QuestId = 956, State = StateUnknown, UpdateInterval = 10}
	},
	Actions =
	{
		ChangeFigureOwner {NpcId = self},
 		ChangeRace {Race = 185, NpcId = self}
	}
}



----------------------------------------------------

--Für CS Ende
Respawn
{
	X = 100, Y = 100,
	WaitTime = 1,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P211CSInitEndePhoenix", UpdateInterval = 10},
	},
	Actions =
	{
		ChangeFigureOwner {NpcId = self},
 		ChangeRace {Race = 185, NpcId = self},
 		SetGlobalFlagTrue {Name = "g_P211SchattenkriegerIstRespawned"},
	}
}

Umspawn
{
	UnitId = self, Clan = 0, 
	X = 100, Y = 100,
	--Target = 10820, 
	NoSpawnEffect = TRUE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P211SchattenkriegerCSEndeUmspawnInit", UpdateInterval  = 10},
		IsGlobalFlagFalse {Name = "g_P211SchattenkriegerIstRespawned", UpdateInterval  = 10},
	} , 
	Actions = 
	{
		SetGlobalFlagFalse{Name = "g_P211SchattenkriegerCSEndeUmspawnInit"},
		ChangeFigureOwner {NpcId = self},
	}
}

-------------------------------------------------------------------------
-------------------------------------------------------------------------
--endgültig weg
Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P212"},
		--Negated (QuestState {QuestId = 956, State = StateUnknown, UpdateInterval = 10})
	}, 
	Actions = {}
}


EndDefinition()

end
