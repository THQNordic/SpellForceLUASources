-->INFO: Aedar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions =
	{
		QuestState{QuestId = 585 , State = StateSolved},
	},
}

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse{Name = "P105_AedarKannSprechen"},
	},
	OnActions = 
	{ 
		RemoveDialog { NpcId = 6797} ,
	},
	OffConditions = 
	{
		IsGlobalFlagTrue{Name = "P105_AedarKannSprechen"},
	},
	OffActions = 
	{
		EnableDialog { NpcId = 6797} ,
	},
}



-- Fugis laufen los
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 0, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "FugisGo"},
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- Fugis laufen zum Elfentor
OnIdleGoHome
{
	X = Fugis1X, Y = Fugis1Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 1, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint1"},
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- Fugis laufen auf Pfadstelle hinter Elfentor (Kosmetik, da sie sonst quer über Schnee laufen)
OnIdleGoHome
{
	X = Fugis1aX, Y = Fugis1aY, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 2, Operator = IsEqual},
		IsGlobalFlagTrue { Name = "P105_SouthTorAuf" },
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- nun gehen die Flüchtlinge zur Eistempelfalle
OnIdleGoHome
{
	X = Fugis2X, Y = Fugis2Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 3, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint2"},
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}


-- Bei Angriff der Eiselementare warten sie oben im Norden
OnIdleGoHome
{
	X = Fugis2aX, Y = Fugis2aY, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 4, Operator = IsEqual},
	},
}

-- Fugis warten, bis der Spieler den Eistempel plattmacht
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 4, Operator = IsEqual},
		IsGlobalFlagTrue { Name = "P105_IcetempleDestroyed" },
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint3"},
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}


-- nun gehen die Flüchtlinge vor die Stadt
OnIdleGoHome
{
	X = Fugis3X, Y = Fugis3Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 5, Operator = IsEqual},
		
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- nun geht Aedar auf seinen Platz in der Stadt
OnIdleGoHome
{
	X = AedarCityX, Y = AedarCityY, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 6, Operator = IsEqual},
		IsGlobalFlagTrue { Name = "P105_WestTorAuf" },
	},
	HomeActions = 
	{
		SetGlobalFlagTrue{Name = "P105_AedarGotHome"},
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P105_AedarGotHome"},
	},
	Actions = 
	{
		--Outcry { NpcId = 6797, String = "Danke, Runenkrieger! Ich schulde dir mein Leben!" , Tag = "ocAedar_P105_001" , Color = ColorWhite},
		SetGlobalFlagTrue{Name = "P105_AedarKannSprechen"},
	},
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n6797_Aedar.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar105_001", String = "Ah, Freund! Was für ein Marsch! Ich bin völlig am Ende, dieser verdammte Berg mit seiner Kälte!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalCounter{Name = "P105_CountTheSurvivors", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "aedar105_002", String = "Verflixt, hättet Ihr uns nicht geholfen, sie hätten uns den Garaus gemacht!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalCounter{Name = "P105_CountTheSurvivors", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "aedar105_005", String = "Sie sind alle tot ... tot ..."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar105_003", String = "Das war verdammt knapp! Ich habe ja gleich gewusst, dass dieser Grim ein Windbeutel ist! Aber auf mich hört ja keiner!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar105_004", String = "Ich muss mich erst mal ausruhen. Hier, das ist Alles, was ich Euch geben kann. Ich hoffe, es wird Euch nützlich sein."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3957 , Flag = Give},
				TransferItem{GiveItem = 3955 , Flag = Give},
			RemoveDialog { NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar105_006", String = "Ich hätte sie warnen müssen ... hätte diesen Grim davonjagen sollen ... Ich nutzloser alter Kerl ..."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			RemoveDialog { NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end