function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, 
	Direction = 3,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "Uebergeben"},
	}
}
--!EDS ONIDLEGOHOME END



-- nur wenn die Flüchtlinge ankommen spawnen
SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "DENearElfenlager"},
		IsGlobalFlagFalse {Name = "Uebergeben"},
		IsGlobalFlagFalse {Name = "NurEineLebensperiode"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "NurEineLebensperiode"},
	}
}	

-- Nach dem Dialog werden die Elfen übergeben
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DialogElfenGeben"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "Uebergeben"},
		ChangeOwner {Owner = OwnerPlayer},
	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DialogElfenGeben"},
	},
	Actions =
	{
		ChangeOwner {Owner = OwnerPlayer},
	}
}

EndDefinition()

end
