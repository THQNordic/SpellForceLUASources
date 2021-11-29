--------------------------------------------------------
--
--	Trokan
--
--------------------------------------------------------

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
KillOnDominate {}

-- Der Unterhändler hat Trokan auf den Berg geschickt
OnIdleGoHome
{
	X = 270, Y = 250, WalkMode = Run, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue {Name = "g_P206_Plateau"},
	},
	HomeActions =
	{
		LookAtDirection {Direction = 4},
	}
	
}

---- Der Unterhändler hat Trokan auf den Berg geschickt, aber es ist Tag, also geht er zurück
--OnIdleGoHome
--{
--	X = _X, Y = _Y, WalkMode = Run, Direction = 0,
--	Conditions =
--	{
--		IsNpcFlagTrue {Name = "g_P206_Lager"},
--	},
--	HomeActions =
--	{
--		SetGlobalFlagFalse {Name = "g_P206_SchalterBenutzt"},
--	}
--	
--}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_AlleBenachrichtigt"},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "g_P206_Plateau"},
		SetNpcFlagFalse {Name = "g_P206_Lager"}
	},
	
}

-- Bedingungen für den Standplatz tageszeitabhängig ändern
--OnToggleEvent
--{
--	OnConditions =
--	{
--		IsGlobalFlagTrue {Name = "g_P206_AlleBenachrichtigt"},
--		TimeNight {},
--	},
--	OnActions =
--	{
--		SetNpcFlagTrue {Name = "g_P206_Plateau"},
--		SetNpcFlagFalse {Name = "g_P206_Lager"}
--	},
--	OffConditions =
--	{
--		IsGlobalFlagTrue {Name = "g_P206_AlleBenachrichtigt"},
--		Negated(TimeNight {}),
--	},
--	OffActions =
--	{
--		SetNpcFlagFalse {Name = "g_P206_Plateau"},
--		SetNpcFlagTrue {Name = "g_P206_Lager"}
--	},
--	
--}


-- Wenn die Wolke schwebt kriegen die Health abgenommen und humpeln weg
OnIdleGoHome
{
	X = 279, Y = 250,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_ChefsDespawn", UpdateInterval = 2},
	},
	Actions = 
	{
		SetHealth {HitPoints = 2400, Decrease = TRUE},
		SetGlobalFlagTrue {Name = "g_P206_DespawnJetzt"},
		SetNpcFlagTrue {Name = "n_P206_Sterben"},
	}
}


-- Wenn der Unkillable mit dem Hebel getötet wird, wird auch noch ein Flag gesetzt
Despawn
{
	PlayDeathAnim = TRUE,
	Conditions =
	{
		--ODER
		--(
			IsGlobalFlagTrue {Name = "g_P206_DespawnJetzt"},
		--	QuestState {QuestId = 886, State = StateActive}
		--)
	},
	Actions =
	{
			SetGlobalFlagTrue {Name = "g_P206_UnKillTrokanTot"}
	}
	
}

-- Wenn die Version getauscht wird, weil der Deal abgelehnt wurde, darf das Flag nicht gesetzt werden
Despawn
{
	Conditions =
	{
		QuestState {QuestId = 886, State = StateActive}
	},
}

EndDefinition()

end
