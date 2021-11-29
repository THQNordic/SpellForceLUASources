function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Nur für den Phoenixsteinspieler gibt es einen Urias, dieser folgt dem Spieler
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
			UND9
			{
				IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
				IsGlobalFlagTrue {Name = "g_P204_TorOnyxOffen"}
			}
		}
	},
	Actions = 
	{
		Follow {Target = Avatar},
		SetNpcFlagTrue{Name = "BitteUmspawnen"}
	},
}

-- Ist Urias tot oder auf Empyria "abgestellt" taucht er hier nicht mehr auf
Despawn
{
	Conditions =
	{
		ODER9
		{
			QuestState {QuestId = 894, State = StateSolved},
			IsGlobalFlagTrue {Name  = "g_sP209UriasStirbt"},
		}
	},
}


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


Umspawn 
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
		ODER                                       
		(                                  
			AvatarLocalTeleport{},
			IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3}
		),
	}, 
	Actions = 
	{
		Follow {Target = Avatar},
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
	}
}

EndDefinition()

end
