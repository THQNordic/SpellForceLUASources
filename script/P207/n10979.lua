function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_p207_Dritte_Festung_Wachen_Spawn"},
	},
	Actions = 
	{
		ChangeRace {Race = 152, NpcId = self},
		SetNpcTimeStamp {Name = "p207_Warten"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		FigureInRangeNpc {TargetNpcId = Avatar, NpcId = self, Range = 4},
		FigureAlive {NpcId = Avatar},
	},
	OnActions =
	{
		SetNpcFlagTrue {Name = "p207_greif_an"},
	},
	OffConditions =
	{
		ODER
		(
			FigureDead {NpcId = Avatar},
			IsGlobalFlagTrue {Name = "g_p207_urias_wait_for_me"}
		),
	},
	OffActions =
	{
		ChangeRace {Race = 152, NpcId = self},
		SetNpcFlagFalse {Name = "p207_greif_an"},
		Stop{},
	},
}

OnIdleGoHome
{
X = 113, Y = 141, Direction = North , WalkMode = Walk, 
	Conditions = 
	{
		IsNpcCounter {Name = "p207_Pfad_Laufen", Value = 0},
		IsNpcTimeElapsed {Name = "p207_Warten", Seconds = 5},
		IsNpcFlagFalse {Name = "p207_greif_an"},
	},
	Actions = 
	{},
	HomeActions = 
	{	
		IncreaseNpcCounter {Name = "p207_Pfad_Laufen"},
		SetNpcTimeStamp {Name = "p207_Warten"},
	},
	AbortConditions =
	{
		IsNpcFlagTrue {Name = "p207_greif_an", UpdateInterval = 10},
	},
	AbortActions =
	{
		ChangeRace {Race = 199, NpcId = self}, -- Race 199 Mummy		
		AttackTarget {Target = Avatar, NpcId = self, FriendlyFire = TRUE},
		SetEffect {Effect = "Spawnboss", Length = 3000},
	},
}

OnIdleGoHome
{
X = 113, Y = 114, Direction = North , WalkMode = Walk, 
	Conditions = 
	{
		IsNpcCounter {Name = "p207_Pfad_Laufen", Value = 1},
		IsNpcTimeElapsed {Name = "p207_Warten", Seconds = 5},
		IsNpcFlagFalse {Name = "p207_greif_an"},
	},
	Actions = 
	{},
	HomeActions = 
	{
		ResetNpcCounter {Name = "p207_Pfad_Laufen"},
		SetNpcTimeStamp {Name = "p207_Warten"},
	},	
	AbortConditions =
	{
		IsNpcFlagTrue {Name = "p207_greif_an", UpdateInterval = 10},
	},
	AbortActions =
	{
		ChangeRace {Race = 199, NpcId = self}, -- Race 199 Mummy		
		AttackTarget {Target = Avatar, NpcId = self, FriendlyFire = TRUE},
		SetEffect {Effect = "Spawnboss", Length = 3000},
	},
}


EndDefinition()

end
