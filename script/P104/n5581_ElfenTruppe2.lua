function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, 
	Direction = 3,
	Conditions =
	{
		IsNpcFlagFalse {Name = "P104_NichtMehrNachHause"},
	}
}


-- nur wenn die Flüchtlinge ankommen spawnen
SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "SchluesselGegeben"},
		IsNpcFlagFalse {Name = "NurEinmal"},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "NurEinmal"},
		ChangeOwner {Owner = OwnerPlayer},
	}
}	

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "NurEinmal"},
	},
	Actions =
	{
		ChangeOwner {Owner = OwnerPlayer},
		SetNpcFlagTrue {Name = "P104_NichtMehrNachHause"},
	}
}

EndDefinition()

end

