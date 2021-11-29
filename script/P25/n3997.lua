function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome
{
	X = 203, Y = 463, Direction = random (0,7),
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "SouthernGodmarkMonumentClaimedTimer", Seconds = siebterTrupp},
	},
	HomeActions =
	{
		SetNpcFlagTrue{Name = "AttackNow"},
	}
	
}

OnPlatformOneTimeEvent
{
	Conditions = {
		IsNpcFlagTrue{Name = "AttackNow", UpdateInterval = 20},
	},
	Actions = {
		AttackTarget {Target = 0},
	},
}

EndDefinition()

end
