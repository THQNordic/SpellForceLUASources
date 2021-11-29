-->INFO: LeonidarTrooper2
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = 154 , Y = 115 ,
	Conditions = {
			-- ist die "begleite troops zu portal" quest aktiv?
			QuestState{QuestId = 16 , State = StateActive, UpdateInterval = 10},
			IsGlobalFlagTrue{Name = "PortalTroopsSpawning", UpdateInterval = 10},
		},
	Actions = {
			IncreaseGlobalCounter{Name = "NumTroopsSpawned"},
			RemoveDialog{},
		},
}

Respawn
{
	WaitTime = 1, X = 154 , Y = 115 ,
	Conditions = {
			-- ist die "begleite troops zu portal" quest aktiv?
			QuestState{QuestId = 16 , State = StateActive, UpdateInterval = 20},
			IsGlobalFlagTrue{Name = "PortalTroopsSpawning", UpdateInterval = 20},
		},
	Actions = {
			IncreaseGlobalCounter{Name = "NumTroopsSpawned"},
			RemoveDialog{},
		},
	DeathActions = { 
			--ResetWalkPath{},
			IncreaseGlobalCounter{Name = "NumTroopsDead"},
		},
}


-- antreten zur portalbefreiung!
OnIdleGoHome
{
	Conditions = {
		IsGlobalFlagTrue{Name = "PortalTroopsSpawning"},
		IsGlobalFlagFalse{Name = "VorwaertsMarsch"},
	},
	X = 124, Y = 113, WalkMode = Run, Direction = West
}


DefineLocationCircle{X = 112, Y = 117, Range = 2,Name = "Point001"}
DefineLocationCircle{X = 108, Y = 122, Range = 2,Name = "Point002"}
DefineLocationCircle{X = 97, Y = 130, Range = 2, Name = "Point003"}
DefineLocationCircle{X = 91, Y = 132, Range = 2, Name = "Point004"}
DefineLocationCircle{X = 88, Y = 135, Range = 2, Name = "Point005"}
DefineLocationCircle{X = 85, Y = 147, Range = 2, Name = "Point006"}
DefineLocationCircle{X = 87, Y = 155, Range = 2, Name = "Point007"}
DefineLocationCircle{X = 85, Y = 161, Range = 2, Name = "Point008"}
DefineLocationCircle{X = 82, Y = 166, Range = 2, Name = "Point009"}
DefineLocationCircle{X = 83, Y = 171, Range = 2, Name = "Point010"}
DefineLocationCircle{X = 82, Y = 177, Range = 2, Name = "Point011"}
DefineLocationCircle{X = 81, Y = 183, Range = 2, Name = "Point012"}
--DefineLocationCircle{X = 81, Y = 190, Range = 2, Name = "Point013"}
--DefineLocationCircle{X = 80, Y = 195, Range = 2, Name = "Point014"}
DefineLocationCircle{X = 72, Y = 199, Range = 1, Name = "Point017"}

AddControlPoint{Name = "001", Location = "Point001"}
AddControlPoint{Name = "002", Location = "Point002"}
AddControlPoint{Name = "003", Location = "Point003"}
AddControlPoint{Name = "004", Location = "Point004"}
AddControlPoint{Name = "005", Location = "Point005"}
AddControlPoint{Name = "006", Location = "Point006"}
AddControlPoint{Name = "007", Location = "Point007"}
AddControlPoint{Name = "008", Location = "Point008"}
AddControlPoint{Name = "009", Location = "Point009"}
AddControlPoint{Name = "010", Location = "Point010"}
AddControlPoint{Name = "011", Location = "Point011"}
AddControlPoint{Name = "012", Location = "Point012"}
--AddControlPoint{Name = "013", Location = "Point013"}
--AddControlPoint{Name = "014", Location = "Point014"}
AddControlPoint{Name = "017", Location = "Point017", Actions = {SetNpcFlagTrue{Name = "IchBinAmPortalAngekommen"}} }

DailyJobParams
{
	Loop = FALSE,
	Conditions = {
		ODER(
			FigureInRange{NpcId = 1406, X = 120, Y = 112, Range = 1},
			IsGlobalFlagTrue{Name = "PortalTroopsWalkingSafetyNet", UpdateInterval = 10}
			),
		IsGlobalFlagTrue{Name = "PortalTroopsWalking", UpdateInterval = 10},
	},
}



-- Solver für die Portal Eroberung, temporär hier untergebracht da nicht im PFscript möglich



-- gehe und öffne das portal und FX
-- reihenfolge der beiden ist wichtig!
OnOneTimeEvent
{
	Conditions = {
		FigureInRange{X = 66, Y = 203, Range = 0},
		IsNpcFlagTrue{Name = "IchGeheZumPortal"},
		FigureJob{Job = JobIdle},
		QuestState{QuestId = 17, State = StateActive},
	},
	Actions = {
		QuestSolve{QuestId = 17},
		QuestBegin{QuestId = 262}, 
		SetPlayerFlagTrue{Name = "QuestGetToEloniSolved"},
		SetNpcFlagFalse{Name = "IchSollDasPortalAufmachen"},
		SetNpcFlagFalse{Name = "IchGeheZumPortal"},
		--SetEffect{TargetType = World, X = 66, Y = 204, Length = 2000, Effect = "AreaHit1"},
	},
}
OnIdleGoHome
{
	NotInDialog = TRUE,
	Conditions = {
		IsNpcFlagTrue{Name = "IchSollDasPortalAufmachen"},
		FigureJob{Job = JobIdle},
		IsGlobalFlagFalse{Name = "EinerGehtZumPortal", UpdateInterval = 1},
	},
	Actions = {
		SetGlobalTimeStamp{Name = "ForceLiannonPortalKeepOpen"},
		SetNpcFlagTrue{Name = "IchGeheZumPortal"},
		SetGlobalFlagTrue{Name = "EinerGehtZumPortal"},
		RemoveDialog{},
	},
	X = 66, Y = 203, Direction = NorthWest
}

-- portal nach befreirung bewachen!
OnIdleGoHome
{
	Conditions = {
		IsNpcFlagTrue{Name = "IchBinAmPortalAngekommen"},
		IsGlobalFlagTrue{Name = "Q16PortalGoblinsDead"},
		IsNpcFlagFalse{Name = "IchSollDasPortalAufmachen", UpdateInterval = 20},
	},
	HomeActions = {
	},
	X = 68, Y = 200, WalkMode = Walk, Direction = SouthEast
}

OnOneTimeEvent
{
	Conditions = {
		FigureInRange{X = 68, Y = 200, Range = 0, UpdateInterval = 5},
		IsPlayerFlagFalse{Name = "QuestGetToEloniSolved", UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "EinerGehtZumPortal", UpdateInterval = 1},
--		QuestState{QuestId = 16, State = StateActive},
	},
	Actions = {
		EnableDialog{},
		QuestSolve{QuestId = 16 , ActivateNextQuest = TRUE},
		SetGlobalFlagTrue{Name = "Q17TroopsAtPortal"},
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n1608_LeonidarTrooper2.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "Q17TroopsAtPortal"},
		},
		Actions = {
			Say{Tag = "leonidarTrooper001", String = "Wir haben es geschafft! Ihr habt Euch tapfer geschlagen! Schätze, wir werden bald mehr von Euch hören, Runenkrieger!"},
			Answer{Tag = "leonidarTrooper001PC", String = "So es den Götter gefällt! Lebt wohl!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q17TroopsAtPortal"}),
		},
		Actions = {
			Say{Tag = "leonidarTrooper003", String = "Noch haben wir es nicht geschafft! Es liegt noch ein gutes Stück Weg vor uns!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "IchSollDasPortalAufmachen"},
					RemoveDialog{NpcId = 1406},
					RemoveDialog{NpcId = 1609},
					RemoveDialog{NpcId = 1610},
					RemoveDialog{NpcId = 1611}, SetGlobalFlagFalse{Name = "Q17TroopsAtPortal"},
				SetRewardFlagTrue{ Name = "WegNachEloni2Portal"},
			Say{Tag = "leonidarTrooper002", String = "Viel Glück und passt auf Euch auf!"},
		}}


	EndDefinition()
end