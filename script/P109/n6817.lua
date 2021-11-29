function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{   
	Conditions =
	{
		Negated (QuestState {QuestId = 615, State = StateUnknown})
	},
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

--Umspawn, wenn Spieler tot /  Kartenwechsel / Bindstonereise mit Follow auf Avatar
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
		IsNpcFlagFalse {Name = "P109_SpielerAmPortal"},
		
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		Follow{Target = 0, NpcId = self},
	}

}

--Outcries
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {NpcId = Avatar, X = 242, Y = 462, Range = 10},
	},
	Actions =
	{
		Outcry{Tag = "ocLena_P109_002", NpcId = 6817, String = "Das muss das geheime Portal sein! Suche dahinter nach Überlebenden der Siedler!", Color = ColorWhite},
		SetNpcFlagTrue {Name =  "P109_SpielerAmPortal"},
		StopFollow {Target = Avatar},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 54, Y = 92, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue {Name =  "P109_SpielerAmPortal"},
	},
}
EndDefinition()

end
