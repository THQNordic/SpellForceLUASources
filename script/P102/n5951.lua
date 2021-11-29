-->INFO GRIM

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
	Conditions =
	{
		QuestState {QuestId = 569, State = StateSolved},
	},
}

-- Cutscene Init Arena
Umspawn
{
	UnitId = self, Clan = 0, X = 196, Y = 352, Target = none, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "StartFinish", UpdateInterval = 10}, 
		-- Negated (FigureInRange {NpcId = self, X = 176, Y = 352, Range = 5}),
	}, 
	Actions = {},
}	

-- Cutscene Init Setrius
Umspawn 
{
	UnitId = self, Clan = 0, X = 326, Y = 388, Target = none, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "CutsceneInitSetriusGrim", UpdateInterval = 10},
		Negated( FigureInRange{NpcId = self, X = 326, Y = 388, Range = 20}), 
	}, 
	Actions = 
	{ 
		SetNoFightFlagTrue {NpcId = self},
		SetGlobalFlagFalse {Name = "CutsceneInitSetriusGrim"},				
	},
}	


OnOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		ChangeRace {Race = 185, NpcId = self},	
		SetGlobalFlagTrue {Name = "GrimFollowP102"},
		
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
		)	
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		Follow{Target = Avatar},
	}
}

OnFollowToggle
{
		Target = Avatar,
		NpcId = self,
		FollowOnlyOnce = FALSE,
		FollowConditions = 
		{
			IsGlobalFlagTrue { Name = "GrimFollowP102" },
			IsGlobalFlagFalse { Name = "SetriusDialogEndedP102" },
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagFalse { Name = "GrimFollowP102" },
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
			IsGlobalFlagTrue { Name = "GrimFollowP102" },
			IsGlobalFlagTrue { Name = "SetriusDialogEndedP102" },
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagFalse { Name = "GrimFollowP102" },
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
			IsGlobalFlagTrue { Name = "GrimFollowP102" },
			IsGlobalFlagFalse { Name = "ArenaOver" },
		},
		FollowActions = {},
		StopFollowConditions = 
		{
			IsGlobalFlagFalse { Name = "GrimFollowP102" },
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
		IsGlobalFlagTrue { Name = "GrimFollowP102" },
		IsGlobalFlagTrue { Name = "ArenaOver" },
	},
	FollowActions = {},
	StopFollowConditions = 
	{
			IsGlobalFlagFalse { Name = "GrimFollowP102" },
	},
	StopFollowActions = {},
}


--Dorf in Sichtweite (Hulu)

OnPlatformOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc {TargetNpcId = 5533, NpcId = self, Range = 40,  UpdateInterval = 10},
	},
	Actions =
	{
		Outcry { NpcId = 5951, String = "Da ist das Dorf!", Tag = "ocGrimP001_003"},
	}
}

--Mitten im Sumpf

OnOneTimeEvent
{
	Conditions =
	{
		ODER(FigureInRange {X = 361, Y = 316, NpcId = 5951 , Range = 10}, FigureInRange { X = 395, Y = 318, NpcId = 5951 , Range = 10}),
	},
	Actions =
	{
		Outcry {NpcId = 5951, String = "Rostende Waffen und Wasser in den Stiefeln ... dieser Sumpf schlägt mir langsam auf das Gemüt!", Tag = "ocGrimP001_005"},
		Outcry {NpcId = 6311, String = "Du findest auch immer etwas zum jammern!" ,Tag = "ocLenaP001_005" },
	}
}


OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "WaldlaeuferRange" },		
	},
	Actions =
	{
		Outcry {NpcId = 5951, String = "Hm, wenn Setrius noch einige der Waldläufer um sich geschart hat, werden sie auf Orks nicht gut zu sprechen sein.", Tag = "ocGrimP001_006"},
		Outcry {NpcId = 6311, String = "Das stimmt. Sobald wir uns dem Lager nähern, solltest du deine Truppen zurücklassen, sonst kommt es zum Kampf!", Tag = "ocLenaP001_006"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DialogJaninaEnded"},		
	},
	Actions =
	{
		Outcry {NpcId = 5951, String = "Dann auf zum Dorf der Skergs!", Tag = "ocGrimP001_002"},
		
	}
}


--Riese in Sicht

OnPlatformOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc {TargetNpcId = 6335, NpcId = self, Range = 30, UpdateInterval = 10},
	},
	Actions =
	{
		Outcry {NpcId = 5951, String = "Vorsicht! Da! Ein Riese!", Tag = "ocGrimP001_007"},
		Outcry {NpcId = 6311, String = "Vielleicht sollten wir dem besser ausweichen!", Tag = "ocLenaP001_007"},
	}
}

--Wenn Schlußszene beendet wurde

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ArenaOver"},	
		IsItemFlagTrue { Name = "PlayerHasItemRune01"},	
	},
	Actions =
	{
		Outcry {NpcId = 5951, String = "Wir haben hier getan was wir konnten. Lass uns nach Mirraw Thur zurückkehren. Benutze den Seelenfelsen.", Tag = "ocGrimP001_008"},
	}
}


EndDefinition()

end


