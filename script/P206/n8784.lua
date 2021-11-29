-------------------------------------------------
--
--		Urias
--
-------------------------------------------------

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

---- umspawn flag setzen bei plattformwechsel
--OnPlatformOneTimeEvent
--{
--	Conditions =
--	{
--	},
--	Actions = 
--	{
--		SetNpcFlagTrue{Name = "BitteUmspawnen"},
--	}
--}
--
---- Urias folgt, außer der Spieler ist am Monument
--UmspawnToAvatar 
--{
--	FollowPlayer = TRUE, DisableFirstMapLoadUmspawn = TRUE,
--	Conditions =
--	{
--		IsGlobalFlagFalse {Name = "g_P206_HauptheldenFolgenNicht"},
--	}
--	
--}


-- AB hier neuer Kram
-- Ist Urias tot oder auf Empyria "abgestellt" taucht er hier nicht mehr auf
Despawn
{
	Conditions =
	{
		QuestState {QuestId = 818, State = StateSolved},
	},
}


-- umspawn flag setzen bei spielertod
OnToggleEvent
{
	OnConditions = 
	{
		FigureDead{NpcId = Avatar},
		IsGlobalFlagFalse {Name = "g_P206_HauptheldenFolgenNicht"},
		
	},
	OnActions = 
	{
	},
	OffConditions = 
	{
		FigureAlive{NpcId = Avatar},
		IsGlobalFlagFalse {Name = "g_P206_HauptheldenFolgenNicht"},
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
		IsGlobalFlagFalse {Name = "g_P206_HauptheldenFolgenNicht"},
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
		IsGlobalFlagFalse {Name = "g_P206_HauptheldenFolgenNicht"},
	}, 
	Actions = 
	{
		Follow {Target = Avatar},
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		RemoveDialog {},	
	}
}

EndDefinition()

end
