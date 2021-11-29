--INFO LENA

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
	Conditions =
	{
		QuestState {QuestId = 569, State = StateSolved},
	},
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
]]

-- Cutscene Init Setrius
Umspawn 
{
	UnitId = self, Clan = 0, X = 326, Y = 386, Target = none, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "CutsceneInitSetriusLena", UpdateInterval = 10},
		Negated( FigureInRange{NpcId = self, X = 326, Y = 386, Range = 20}),
	}, 
	Actions = 
	{ 
		SetNoFightFlagTrue {NpcId = self},
		SetGlobalFlagFalse {Name = "CutsceneInitSetriusLena"},				
	},
}

-- Cutscene Init Arena
Umspawn
{
	UnitId = self, Clan = 0, X = 198, Y = 354, Target = none, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "StartFinish", UpdateInterval = 10}, 
	}, 
	Actions = {},
}	

OnOneTimeEvent
{
	Conditions =
	{
				
	},
	Actions =
	{
		ChangeRace {Race = 185, NpcId = self},	
		SetGlobalFlagTrue {Name = "LeaFollowP102"},
		
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
		)
		
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		Follow{Target = Avatar},
	}

}


----Follow Mode nach Setrius
 
OnFollowToggle
{
		Target = Avatar,
		NpcId = self,
		FollowOnlyOnce = FALSE,
		FollowConditions = 
		{
			IsGlobalFlagTrue { Name = "LeaFollowP102" },
			IsGlobalFlagFalse { Name = "SetriusDialogEndedP102" },
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagFalse { Name = "LeaFollowP102" },
		},
		StopFollowActions = {},
}


OnFollowToggle
{
	Target = Avatar,
	NpcId = self,
	FollowOnlyOnce = FALSE,
	FollowConditions = 
	{
		IsGlobalFlagTrue { Name = "LeaFollowP102" },
		IsGlobalFlagTrue { Name = "SetriusDialogEndedP102" },
	},
	FollowActions = {},
	StopFollowConditions = 
	{
			IsGlobalFlagFalse { Name = "LeaFollowP102" },
	},
	StopFollowActions = {},
}


--Follow Mode nach Arena 

OnFollowToggle
{
		Target = Avatar,
		NpcId = self,
		FollowOnlyOnce = FALSE,
		FollowConditions = 
		{
			IsGlobalFlagTrue { Name = "LeaFollowP102" },
			IsGlobalFlagFalse { Name = "ArenaOver" },
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagFalse { Name = "LeaFollowP102" },
		},
		StopFollowActions = {},
}


OnFollowToggle
{
	Target = Avatar,
	NpcId = self,
	FollowOnlyOnce = FALSE,
	FollowConditions = 
	{
		IsGlobalFlagTrue { Name = "LeaFollowP102" },
		IsGlobalFlagTrue { Name = "ArenaOver" },
	},
	FollowActions = {},
	StopFollowConditions = 
	{
			IsGlobalFlagFalse { Name = "LeaFollowP102" },
	},
	StopFollowActions = {},
}






--Outcries Lena

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "DialogStartEnded" },		
	},
	Actions =
	{
		
		Outcry {Delay = FALSE, NpcId = 6311, String = "Janina ... Den Namen habe ich lange nicht mehr gehört. Wir dachten alle sie sei tot.", Tag = "ocLenaP001_001" },
		Outcry {Delay = FALSE, NpcId = 6311, String = "Ihretwegen hat Dunhan den Widerstand verlassen.", Tag = "ocLenaP001_002" },
		Outcry {Delay = FALSE, NpcId = 5951, String = "Narretei!", Tag = "ocGrimP001_001" },
		Outcry {Delay = FALSE, NpcId = 6311, String = "Liebe, mein großer Krieger. Wir sollten versuchen sie zu befreien, aber wir werden Verstärkung brauchen.", Tag = "ocLenaP001_003" },
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "DialogHuluEnded" },		
	},
	Actions =
	{
		Outcry { NpcId = 6311 , String = "Die Skerg stellen uns ihre Siedlung zur Verfügung! Damit können wir unsere Truppen verstärken! Schickt Arbeiter in die Häuser!" , Tag = "ocLenaP001_004" },
	}
}



EndDefinition()

end
