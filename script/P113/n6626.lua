--FialDarg

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- for cutscene: fial darf am anfang der szene nicht zu sehen sein.
SpawnOnlyWhen
{
	X = _X , Y = _Y , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "P113FialDargSpawnt", UpdateInterval = 15},
	} , 
	Actions = 
	{ } 
}


OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{},
	Actions = 
	{
		HoldPosition{NpcId = 6626},
	}
}


-- Cutscene Despawn
Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "FialDespawn", UpdateInterval = 30},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "FialDespawn"},
	},
}

-- Cutscene Respawn
Respawn
{
	X = 155, Y = 223, NoSpawnEffect = TRUE, WaitTime = 1,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "FialRespawn", UpdateInterval = 15},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "FialRespawn"},
	},
}


-- endkampf stuff
dofile("script/p113/n6626_Endkampf.lua")

EndDefinition()

end
