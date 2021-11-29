-->INFO: Willit
--Willit

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 0 , Y = 0 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "P113SpawnWillit", UpdateInterval = 20},
	} , 
	Actions = {}	
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

--Umspawn mit Dialog
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
		IsGlobalFlagTrue{Name = "P113WillitFolgtAvatar", UpdateInterval = 3},
		IsGlobalFlagTrue{Name = "P113DialogWillitAn", UpdateInterval = 3},
	}, 
	Actions = 
	{
		Follow {Target = Avatar},
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		--RemoveDialog{NpcId = self },
		--SetGlobalFlagFalse{Name = "P113DialogWillitAn"},	
	}
}


--Umspawn ohne Dialog
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
		IsGlobalFlagTrue{Name = "P113WillitFolgtAvatar", UpdateInterval = 3},
		IsGlobalFlagFalse{Name = "P113DialogWillitAn", UpdateInterval = 3},
		
	}, 
	Actions = 
	{
		Follow {Target = Avatar},
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		RemoveDialog{NpcId = self },
		--SetGlobalFlagFalse{Name = "P113DialogWillitAn"},	
	}
}

--Willit folgt dem Spieler
OnFollowForever
{
	Target = 0, NpcId = self ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P113WillitFolgtAvatar", UpdateInterval = 30},
	},
	Actions = {},
}



--Willit folgt nach Monumentclaim nicht mehr Avatar
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		ODER
		(
			IsMonumentInUse{X = 442, Y = 287, Range = 3 , UpdateInterval = 40},
			IsMonumentInUse{X = 96, Y = 368, Range = 3 , UpdateInterval = 40}
		)
	},
	Actions = 
	{
		StopFollow{Target = Avatar, NpcId = self},
		SetGlobalFlagFalse{Name = "P113WillitFolgtAvatar"},
	}
}

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "CenwenIsFree", UpdateInterval = 20},
	} , 
	Actions = {}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P113\n6655_Willit.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "willit113_001", String = "Oh, oh! Gut! Da Ihr seid! Willit hat vergessen zu erzählen ..."},
			Answer{Tag = "willit113_002PC", String = "Was gibt es?", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "willit113_003", String = "Kreaturen hausen im Abgrund! Gefährlich! Aber Willit ihre Schwächen kennt, jaja!"},
			Answer{Tag = "willit113_004PC", String = "Lass hören!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "willit113_005", String = "Ihr glauben sie alle lieben das Feuer? Oh nein!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "willit113_006", String = "Manche mögen das Feuer, andere hassen es! Pelz gut brennen!"},
			Answer{Tag = "willit113_007PC", String = "Nun ... lass gut sein, Willit!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "willit113_008", String = "Ha! Ich helfe euch, ich komme mit!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
				
	SetGlobalFlagFalse{Name = "P113DialogWillitAn"},
	RemoveDialog{NpcId = self }
	,
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end