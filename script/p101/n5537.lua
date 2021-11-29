--Lea bis Ende Rune1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Despawn, wenn Spieler Rune 1 gespielt hat 
Despawn
{
	Conditions =
	{
		--QuestState {QuestId = 569, State = StateSolved},
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
		IsGlobalFlagFalse{Name = "P101Gelöst", UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "P101RebirthFollowLea1An", UpdateInterval = 3},
		IsGlobalFlagFalse{Name = "P101RebirthFollowLea2An", UpdateInterval = 3},
		
	} , 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		--Outcry{NpcId = 5537, String = "Umspawn Lena mit Follow auf Avatar hat funktioniert" , Tag = "" , Color = ColorWhite},
		Follow{Target = 0},
	}

}
---------------------------------------------------------

--Lea folgt Grim nach der Cutscene Beginning 
OnOneTimeEvent
{
	UpdateInterval = 30,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "P101LeaFolgtAvatar", UpdateInterval = 20},
	},
	Actions = 
	{ 
		Follow {Target = 0},
	},
}


-----------------------------
--Cutscene Inits
-----------------------------
-- Cutscene Init Sklavenlager
Umspawn
{
	UnitId = self, Clan = 0, X = 204, Y = 94, Target = None, NoSpawnEffect = TRUE, OnlyOnce = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitSklavenlagerLena", UpdateInterval = 1},
		Negated(FigureInRange{NpcId = self, X = 204, Y = 94, Range = 5}),		
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},
		SetGlobalFlagFalse {Name = "CutsceneInitSklavenlagerLena"},	
		SetGlobalFlagTrue {Name = "GrimFollowAbschalten"},	
	},
}



                                              	
EndDefinition()                                     
end                                                 
                                                                             
                                                               
                                              
                                                                                                          
                                                        
                                                     
                                                  
                                                     
                                                                                                               
                                                                                                                  