function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome
{
	X = 156, Y = 91, Direction = 0, Range = 0,
	WalkMode = Run,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Q537AssembleMen", UpdateInterval = 10},
	},
	HomeActions =
	{
		SetGlobalFlagFalse {Name = "Q537AssembleMen"},
		SetNpcFlagTrue{Name = "ThisManMustChangeOwner"},
	}
}

OnEvent
{
	Conditions = {
		IsNpcFlagTrue{Name = "ThisManMustChangeOwner", UpdateInterval = 10},
	},
	Actions = {
		ChangeFigureOwner {},
		SetNpcFlagFalse{Name = "ThisManMustChangeOwner"},
		SetNpcFlagTrue{Name = "ThisManIsOwnedByThePlayerNow"},
	},
}

OnPlatformOneTimeEvent
{
	Conditions = {
		IsNpcFlagTrue{Name = "ThisManIsOwnedByThePlayerNow", UpdateInterval = 10},
	},
	Actions = {
		ChangeFigureOwner {},
		ChangeRace {Race = 185},
	},
}

Respawn 
{
	WaitTime = 120,
	DeathActions = {
		SetNpcFlagFalse{Name = "ThisManIsOwnedByThePlayerNow"},
	},
}

EndDefinition()

end
