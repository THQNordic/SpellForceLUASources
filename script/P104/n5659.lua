-->INFO: Gruppe3
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

OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRange {X = 388, Y = 430, Range = 10},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "Gruppe3ZuHause"},
		QuestSolve {QuestId = 582},
		SetRewardFlagTrue {Name = "Camp3Befreit"},
	},
}

--Gruppe eins der versprengten Flüchtlinge ist in der Nähe der Grenze und läuft jetzt von alleine weiter
OnIdleGoHome
{
	WalkMode = Run, X = 269, Y = 411, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue{Name = "Gruppe3ZuHause"},
	},
	HomeActions =
	{
		SetNpcFlagTrue{Name = "Gruppe3InsPortal"},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 161, Y = 361, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue{Name = "Gruppe3InsPortal"},
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
-- Source: C:\Project\main\mission\dialoge\P104\n5659_Gruppe3.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruppe3104_001", String = "Was ist los?"},
			OfferAnswer{Tag = "gruppe3104_002PC", String = "Es geht weiter, zurück zur Gruppe!", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruppe3104_003", String = "Ich weiß nicht, ob meine müden Beine das noch schaffen ..."},
			Answer{Tag = "gruppe3104_004PC", String = "Ihr werdet entweder laufen oder hier sterben, trefft Eure Wahl!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruppe3104_005", String = "Wir folgen, Runenkrieger."},
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