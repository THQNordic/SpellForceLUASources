function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS ONIDLEGOHOME BEGIN


OnIdleGoHome
{
	X = 425, Y = 271, WalkMode = Run, Direction = 4,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "OrdensritterZuBefehl", UpdateInterval = 10},
		IsNpcFlagFalse {Name = "NachHause"},
	},
	Actions = 
	{
		-- persistenz hergestellt mittels PlatformOneTimeEvent...
		ChangeOwner{Owner = OwnerPlayer},
		SetNpcFlagTrue{ Name = "NachHause"},	
	},
	HomeActions =
	{
		LookAtDirection {Direction = 4},
	}
}

OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = West,
	Conditions =
	{
		ODER(IsGlobalFlagFalse {Name = "OrdensritterZuBefehl"},IsGlobalFlagTrue {Name = "OrksTownDead"}),
	},
	Actions =
	{
		--ChangeOwner{Owner = OwnerNpc},
	}
}

EndDefinition()

end
