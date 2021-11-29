function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 0,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "ZwergeBefreitP108"},
	}
}

-- Zwerge wieder dem Spieler geben wenn er auf die Platform zurück kommt
OnPlatformOneTimeEvent 
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "WiederZwergeWechseln"},  
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
	},
	Actions =
	{
		
		ChangeRace {Race = 135},
		ChangeOwner {Owner = OwnerPlayer},
	}
	
}

-- Wenn der Spieler die Platform verläßt und zurück kommt hat er leider keinen Zwerg mehr --> Fix
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
		IsNpcFlagTrue {Name = "WiederZwergeWechseln"},
	},
	Actions =
	{
		ChangeRace {Race = 135},
		ChangeOwner {Owner = OwnerPlayer},
		SetGlobalFlagFalse {Name = "WiederZwergeWechseln"},
	}
	
}

Respawn
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 1,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
		FigureAlive {NpcId = 6396},
		IsGlobalFlagTrue {Name = "TruppSpawn"},
	},
	Actions =
	{
		ChangeRace {Race = 135},
		ChangeOwner {Owner = OwnerPlayer},
	},
	DeathActions = 
	{
		IncreaseGlobalCounter{Name = "ZwergenDeadCounter"},
		SetGlobalFlagTrue {Name = "ZwergeMindestensEinmalTot"},
	},
}




EndDefinition()

end
