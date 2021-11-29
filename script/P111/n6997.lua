function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		QuestState { QuestId = 671, State = StateSolved},
	} ,
	Actions = 
	{
	
	}
}


OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "EndCutsceneEntryP111" },	
	},
	Actions =
	{
		ChangeRace {Race = 185, NpcId = self},	
		SetGlobalFlagTrue {Name = "LeaFollowP111"},
		
	}
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


--Umspawn, wenn Spieler tot mit Follow auf Avatar
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
		--IsGlobalFlagTrue{Name = "GDS_PlatformLoaded", UpdateInterval = 3}
		
		
	} , 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		--Outcry{NpcId = 5537, String = "Umspawn Lena mit Follow auf Avatar hat funktioniert" , Tag = "" , Color = ColorWhite},
		Follow{Target = 0},
	}

}


OnFollowToggle
{
		Target = Avatar ,
		NpcId = self ,
		FollowOnlyOnce = FALSE ,
		FollowConditions = 
		{
			IsGlobalFlagTrue { Name = "LeaFollowP111" },
			IsGlobalFlagFalse { Name = "EndCutSceneEndP111" },
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagFalse { Name = "LeaFollowP111" },
		},
		StopFollowActions = {},
}


OnFollowToggle
{
		Target = Avatar ,
		NpcId = self ,
		FollowOnlyOnce = FALSE ,
		FollowConditions = 
		{
			IsGlobalFlagTrue { Name = "LeaFollowP111" },
			IsGlobalFlagTrue { Name = "EndCutSceneEndP111" },
		},
		FollowActions = {},
		StopFollowConditions = 
		{
				IsGlobalFlagFalse { Name = "LeaFollowP111" },
		},
		StopFollowActions = {},
}


EndDefinition()

end
