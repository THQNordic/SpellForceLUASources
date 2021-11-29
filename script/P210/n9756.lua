function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Actions =
	{
		ChangeRace{Race = 139, NpcId = self }, -- Titan zu Beginn freundlich
	},
}

OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P210_Room2GoodGatesOpen"},
	},
	Actions =
	{
		ChangeFigureOwner {},
		ChangeRace{Race = 139, NpcId = self },
	},
}

Respawn
{
	X = _X, Y = _Y, NoSpawnEffect = FALSE, WaitTime = 60,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P210_Room2GoodGatesOpen"},
	},
	Actions =
	{
		ChangeFigureOwner {},
		ChangeRace{Race = 139, NpcId = self },
	},
}

EndDefinition()

end
