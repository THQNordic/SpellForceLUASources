--INFO LENA

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "P113LenaIstTot"},
	} ,
	Actions = 
	{
		SetGlobalFlagTrue {Name = "P110NewLenaTod"}, 
	}
}

REM = [[
Umspawn -- CUTSCENE DEBUG
{
	UnitId = self , Clan = 0 , X = 325, Y = 385, Target = none , NoSpawnEffect = TRUE , OnlyOnce = TRUE ,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "cutscenedebug"}, 
	}, 
	Actions = { },
}	

Umspawn -- CUTSCENE ARENA
{
	UnitId = self , Clan = 0 , X = 198, Y = 354, Target = none , NoSpawnEffect = TRUE , OnlyOnce = TRUE ,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "StartFinish", UpdateInterval = 10}, 
	}, 
	Actions = { },
}	
]]
OnOneTimeEvent
{
	Conditions =
	{
	
	},
	Actions =
	{
		ChangeRace {Race = 185, NpcId = self},	
	}
}

OnFollowToggle
{
		Target = Avatar ,
		NpcId = self ,
		FollowOnlyOnce = FALSE ,
		FollowConditions = 
		{
				
				IsGlobalFlagTrue { Name = "LeaFollowP110" },
		},
		FollowActions = {},
		StopFollowConditions = 
		{
				IsGlobalFlagFalse { Name = "LeaFollowP110" },
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
				IsGlobalFlagTrue {Name = "CutsceneGrimQuestioningP109Ended"},	
				IsGlobalFlagTrue { Name = "LeaFollowP110" },
		},
		FollowActions = {},
		StopFollowConditions = 
		{
				IsGlobalFlagFalse { Name = "LeaFollowP110" },
		},
		StopFollowActions = {},
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
		IsGlobalFlagFalse {Name = "P110NewLenaTod"}, 
	} , 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		Follow {Target = Avatar, NpcId = self},
	}

}

-- Cutscene Init GrimQuestioning
Umspawn
{
	UnitId = self , Clan = 0 , X = 424, Y = 288, Target = None , NoSpawnEffect = TRUE , OnlyOnce = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitGrimQuestLena", UpdateInterval = 10},
		Negated(FigureInRange{NpcId = self, X = 417, Y = 283, Range = 5}),
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},
		SetGlobalFlagFalse {Name = "CutsceneInitGrimQuestLena"},			
	},
}



EndDefinition()

end
