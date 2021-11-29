-->INFO: Gruppe1
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "SpawnenDerElfen"},
		IsGlobalFlagFalse {Name = "SpawnenDerElfenPassiert"},
	},
	Actions = 
	{
			SetGlobalFlagTrue {Name = "SpawnenDerElfenPassiert"},
	},
}


OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRange {X = 388, Y = 430, Range = 10},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "Gruppe1ZuHause"},
		QuestSolve {QuestId = 580},
		SetRewardFlagTrue {Name = "Camp1Befreit"},
	},
}

--Gruppe eins der versprengten Flüchtlinge ist in der Nähe der Grenze und läuft jetzt von alleine weiter
OnIdleGoHome
{
	WalkMode = Run, X = 269, Y = 411, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue{Name = "Gruppe1ZuHause"},
	},
	HomeActions =
	{
		SetNpcFlagTrue{Name = "Gruppe1InsPortal"},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 161, Y = 361, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue{Name = "Gruppe1InsPortal"},
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
-- Source: C:\Project\main\mission\dialoge\P104\n5645_Gruppe1.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruppe1104_001", String = "Wo sind die anderen? Wir haben uns verirrt!"},
			OfferAnswer{Tag = "gruppe1104_002PC", String = "Ich führe Euch zurück! Kommt!", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruppe1104_003", String = "Danke! Oh, Danke! Kommt Freunde!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Follow {Target = Avatar},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			RemoveDialog {},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end