-->INFO: Gruppe2
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "SpawnenDerElfen"},
		IsNpcFlagFalse {Name = "SpawnenDerElfenPassiert"},
	},
	Actions = 
	{
			SetNpcFlagTrue {Name = "SpawnenDerElfenPassiert"},
	},
}

--OnOneTimeEvent
--{
--	Conditions = 
--	{
--		IsNpcFlagTrue {Name = "SpawnenDerElfenPassiert"},
--	},
--	Actions = 
--	{
--		Follow {Target = Avatar},
--	},
--}


--Gruppe zwei der versprengten Flüchtlinge ist in der Nähe der Grenze und läuft jetzt von alleine weiter
OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRange {X = 388, Y = 430, Range = 10},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "Gruppe2ZuHause"},
		QuestSolve {QuestId = 581},
		SetRewardFlagTrue {Name = "Camp2Befreit"},
	},
}


OnIdleGoHome
{
	WalkMode = Run, X = 269, Y = 411, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue{Name = "Gruppe2ZuHause"},
	},
	HomeActions =
	{
		SetNpcFlagTrue{Name = "Gruppe2InsPortal"},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 161, Y = 361, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue{Name = "Gruppe2InsPortal"},
	},
	HomeActions =
	{
		IncreaseGlobalCounter {Name = "GeretteteFugis"},
		SetNpcFlagTrue{Name = "Verschwindibus"},
	}
}

Despawn 
{
	Conditions =
	{
		IsNpcFlagTrue{Name = "Verschwindibus"},
	},
	Actions =
	{
		TransferXP {XP = 10},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\P104\n5652_Gruppe2.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruppe2104_001", String = "Seht, der Runenkrieger!"},
			OfferAnswer{Tag = "gruppe2104_002PC", String = "Schnell, zurück zum Tor! Es geht weiter!", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruppe2104_003", String = "Verzeiht, aber unsere Kinder, wir mussten ..."},
			Answer{Tag = "gruppe2104_004PC", String = "Ich verzeihe Euch alles, was Ihr wollt, wenn Ihr Euch nur in Bewegung setzt! Hier wird bald der Tod Einzug halten!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruppe2104_005", String = "Ihr habt Recht, kommt!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Follow {Target = Avatar},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			RemoveDialog {},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end