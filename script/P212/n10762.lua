function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
	},
}

OnPlatformOneTimeEvent
{
	Conditions = 
	{
	},
	Actions =
	{
		ChangeFigureOwner {},
	},
}

Respawn
{
	X = _X, Y = _Y, NoSpawnEffect = FALSE, WaitTime = 60,
	Conditions = 
	{ 
	},
	Actions =
	{
		ChangeFigureOwner {},
	},
}

EndDefinition()

end
