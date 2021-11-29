-- Das letzte Aufgebot von Dracon

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "InGarnison"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "Einheitenwechsler"},
	},
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Einheitenwechsler"},
	},
	Actions =
	{
		ChangeOwner {Owner = OwnerPlayer},
		SetGlobalFlagFalse {Name = "Einheitenwechsel"},
	}
}

Respawn
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE, WaitTime = 180,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "InGarnison"},
		BuildingInRange {X = 249, Y = 409, Range = 20},
	},
	Actions =
	{
		ChangeOwner {Owner = OwnerPlayer},
	},
	DeathActions =
	{
		SetGlobalFlagTrue {Name = "Einheitenwechsel"},
	}
	
}
EndDefinition()

end

