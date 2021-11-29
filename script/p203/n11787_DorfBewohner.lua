function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Dorfbewohner
timer = 7
OnPlatformOneTimeEvent
{
	Actions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	},
}

OnIdleGoHome
{
	X = 315, Y = 289, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 0, Operator = IsEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}

OnIdleGoHome
{
	X = 309, Y = 285, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 1, Operator = IsEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}

OnIdleGoHome
{
	X = 299, Y = 285, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 2, Operator = IsEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}

OnIdleGoHome
{
	X = 293, Y = 264, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 3, Operator = IsEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}


OnIdleGoHome
{
	X = 303, Y = 260, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 4, Operator = IsEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}

OnIdleGoHome
{
	X = 309, Y = 264, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 5, Operator = IsEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}

OnIdleGoHome
{
	X = 319, Y = 268, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 6, Operator = IsEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}

OnIdleGoHome
{
	X = 324, Y = 275, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 7, Operator = IsEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}

OnIdleGoHome
{
	X = 304, Y = 269, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 8, Operator = IsEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}

OnIdleGoHome
{
	X = 287, Y = 276, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 9, Operator = IsEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}


OnIdleGoHome
{
	X = 305, Y = 294, 
	WalkMode = Walk,
	Direction = 4,
	Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsNpcCounter {Name = "n_P203_WanderCounter", Value = 10, Operator = IsGreaterOrEqual},
	},
	HomeActions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 10},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P203_Halt", Seconds = 30},
		IsGlobalTimeElapsed {Name = "n_P203RandomGenerator", Seconds = 100}
	},
	Actions =
	{
		RandomizeNpcCounter {Name = "n_P203_WanderCounter", MaxValue = 5},
		SetGlobalTimeStamp {Name = "n_P203RandomGenerator"},
		SetGlobalTimeStamp {Name = "gt_P203_Halt"},
	}
}

EndDefinition()

end

