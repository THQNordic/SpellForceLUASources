function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsNpcFlagFalse {Name = "P105_FirstSpawn"},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "P105_Kartenstart"},
		ChangeFigureOwner {},
	},
}


Respawn
{
	X = (PortalX+random(6)-3), Y = (PortalY+random(6)-3), NoSpawnEffect = TRUE, WaitTime = 150,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "P105_ElfenTrupp_StopSpawn"},
	},
	Actions =
	{
		ChangeFigureOwner {},
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


EndDefinition()

end