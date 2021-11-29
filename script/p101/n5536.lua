-- Grim bis Ende Rune1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)




WatchStateMachine()


--Despawn, wenn Rune 1 gelöst, Austausch gegen Grim 7011
Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "IchWarAufRune1", UpdateInterval = 5},
	},
	Actions = {},
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


--Umspawn, wenn Spieler tot / Kartenwechsel / Bindstonereise ohne Follow
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
		IsGlobalFlagFalse{Name = "P101GrimInFireCity", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "P101RebirthFollowGrimAn", UpdateInterval = 3},
		
	} , 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		--Outcry{NpcId = 5536, String = "Umspawn Grim ohne Follow hat funktioniert" , Tag = "" , Color = ColorWhite},
	}

}


--Umspawn, wenn Spieler tot / Kartenwechsel / Bindstonereise mit Follow auf Avatar
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
				
		IsGlobalFlagFalse{Name = "P101GrimInFireCity", UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "P101RebirthFollowGrimAn", UpdateInterval = 3},
		
	} , 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		--Outcry{NpcId = 5536, String = "Umspawn Grim mit Follow auf Avatar hat funktioniert" , Tag = "" , Color = ColorWhite},
		Follow{Target = 0, NpcId = 5536},
	}

}

---------------------------------------	
---------------------------------------
--Goto bis zum zweiten Gegner
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "P101GrimLäuftVoraus", UpdateInterval = 20},
		
	},
	Actions = 
	{ 
		Goto {NpcId = self, X = 31, Y = 135, GotoMode = GotoContinuous, WalkMode = Walk},
	}
}


--Follow auf Avatar, wenn an Punkt angekommen
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{ 
		FigureInRange {X = 31, Y = 135, NpcId = self,  Range = 7},
		
	},
	Actions = 
	{ 
		Follow {Target = Avatar, NpcId = self},
		SetGlobalFlagTrue {Name = "P101GrimFollowAvatar"},
		SetGlobalFlagFalse {Name = "P101GrimLäuftVoraus"},
	}
}



--Follow auf Avatar abschalten vor Cutscene
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{ 
		FigureInRange {X = 205, Y = 96, NpcId = self , Range = 5},
		
	},
	Actions = 
	{ 
		StopFollow {NpcId = self, Target = 0},
	}
}

-- Follow  Avatar nach Dialog mit Willit 
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "HabeMitWillitGesprochen"},
		
	},
	Actions = 
	{ 
		Follow {Target = Avatar, NpcId = self},
	}
}



----------------------------------
--Cutscene Inits
----------------------------------


-- Cutscene Init Sklavenlager
Umspawn
{
	UnitId = self, Clan = 0, X = 203, Y = 97, Target = None, NoSpawnEffect = TRUE, OnlyOnce = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitSklavenlager", UpdateInterval = 5},
		Negated(FigureInRange{NpcId = self, X = 203, Y = 97, Range = 5}),		
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},
		SetGlobalFlagFalse {Name = "CutsceneInitSklavenlager"},	
		SetGlobalFlagTrue {Name = "HalloGrimCutscene"},
		SetNpcFlagFalse {Name = "IsWalkingWaypoints_WPNum1"},	
	},
}

--AddGotoLocation{WalkMode = Walk, X = 33, Y = 84, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 25, Y = 95,  Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 27, Y = 107, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 33, Y = 113, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 33, Y = 123, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 31, Y = 137, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 30, Y = 149, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 29, Y = 162, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 31, Y = 169, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 40, Y = 174, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 52, Y = 175, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 70, Y = 175, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 78, Y = 173, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 85, Y = 169, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 93, Y = 160, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 93, Y = 143, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 83, Y = 129, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 77, Y = 112, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 81, Y = 93,  Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 90, Y = 75,  Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 100, Y = 65, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 109, Y = 67, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 125, Y = 76, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 143, Y = 85, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 158, Y = 93, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 183, Y = 92, Radius = 8}
--AddGotoLocation{WalkMode = Walk, X = 193, Y = 92, Radius = 8}
--AddGotoLocation{WalkMode = Run, X = 204, Y = 96, Radius = 8}
--AddGotoLocation{WalkMode = Run, X = 212, Y = 99, Radius = 8}
--
--OnIdleWalkPath
--{
--	WaitForIdle = FALSE , WaitForPlayerInRange = 0 , Loop = 0 , NotInDialog = FALSE , UpdateInterval = 10 ,
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "P101GrimFollowAvatar"},
--		IsGlobalFlagFalse {Name = "HalloGrimCutscene"},
--	},
--	Actions = {},
--	EndConditions = 
--	{
--		--IsGlobalFlagTrue {Name = "HalloGrimCutscene"},
--	},
--	EndActions = 
--	{
--		Follow {Target = Avatar, NpcId = self},
--	},
--}


EndDefinition()

end
