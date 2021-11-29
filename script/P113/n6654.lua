-- Lea

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Umspawn, wenn Spieler tot / Kartenwechsel / Bindstonereise mit Follow auf Avatar

-- LENA MUSS ZU BEGINN BEREITS AUF DER MAP SEIN WEGEN DER STARTCUTSCENE !!!
REM = [[
SpawnOnlyWhen
{
	X = 0 , Y = 0 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "P113SpawnWillit", UpdateInterval = 20},
	} , 
	Actions = 
	{

	}	
}
]]

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
		IsGlobalFlagFalse{Name = "P113LeaTot", UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "P113LeaFolgtAvatar", UpdateInterval = 3},
	}, 
	Actions = 
	{
		Follow {Target = Avatar},
		SetNpcFlagFalse{Name = "BitteUmspawnen"},	
	}
}




--------------------------------------------
--Lea folgt dem Spieler
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P113LeaFolgtAvatar", UpdateInterval = 30},
	},
	Actions = 
	{
		Follow{Target = Avatar, NpcId = self},
	
	}
}

--------------------------------------------
--Outcry an den Monumenten
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		FigureInRange{X = 443, Y = 273, NpcId = 6654 , Range = 7},
	},
	Actions = 
	{
		Outcry{NpcId = 6654, String = "Diese Kreaturen! Es muss etwas geben was sie verletzen kann!" , Tag = "ocLena_P113_001" , Color = ColorWhite},
		QuestBegin {QuestId = 711, SubQuestActivate = FALSE},
	}
}

OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		FigureInRange{X = 115, Y = 365, NpcId = 6654 , Range = 7},
	},
	Actions = 
	{
		Outcry{NpcId = 6654, String = "Diese Kreaturen! Es muss etwas geben was sie verletzen kann!" , Tag = "ocLena_P113_001" , Color = ColorWhite},
		QuestBegin {QuestId = 711, SubQuestActivate = FALSE},
	}
}


--Outcry Schattenklinge
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		FigureInRange{X = 178, Y = 205, NpcId = 6654 , Range = 5},
	},
	Actions = 
	{
		Outcry{NpcId = 6654, String = "Der Fial Darg ist nahe! Rüste dich mit der Schattenklinge!" , Tag = "ocLena_P113_002" , Color = ColorWhite},
	
	}
}
	
-------------------------------------------------------		
-- Cutscene Init Showdown	
Despawn
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitShowdown", UpdateInterval = 15},
	},
}



				
EndDefinition()

end
