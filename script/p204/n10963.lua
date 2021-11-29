function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = West, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P204_BankgolemAttacke", UpdateInterval = 10},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_BanktorOffen", UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "g_P204_TresortorKeinAlarm", UpdateInterval = 10},		
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
	}
}


EndDefinition()

end
