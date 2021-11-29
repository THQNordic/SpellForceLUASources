Coords =
{
	[0] = { X = 184, Y = 152 },
	[1] = { X = 163, Y = 180 },
	[2] = { X = 174, Y = 157 },
	[3] = { X = 179, Y = 184 },
	[4] = { X = 193, Y = 151 },
	[5] = { X = 175, Y = 194 },
	[6] = { X = 163, Y = 180},
	[7] = { X = 184, Y = 152 },
	[8] = { X = 179, Y = 184 },
	[9] = { X = 174, Y = 157 },
	[10] = { X = 184, Y = 152 },
	[11] = { X = 175, Y = 194 },
	[12] = { X = 182, Y = 181 },
	[13] = { X = 163, Y = 180 },
	[14] = { X = 179, Y = 184 },
	[15] = { X = 174, Y = 157 },
	
}

StealItem =
{
	[0] = 4621 ,
	[1] = 4463 ,
	[2] = 4460 ,
} 

-- Wenn Counter = 0, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[0])].X) ,
	Y = (Coords[(PersonalCounter[0])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 0, Operator = IsEqual},
	},
}


-- Wenn Counter = 1, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[1])].X) ,
	Y = (Coords[(PersonalCounter[1])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 1, Operator = IsEqual},
	},
}

-- Wenn Counter = 2, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[2])].X) ,
	Y = (Coords[(PersonalCounter[2])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 2, Operator = IsEqual},
	},
}

-- Wenn Counter = 3, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[3])].X) ,
	Y = (Coords[(PersonalCounter[3])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 3, Operator = IsEqual},
	},
}

-- Wenn Counter = 4, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[4])].X) ,
	Y = (Coords[(PersonalCounter[4])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 4, Operator = IsEqual},
	},
}

-- Wenn Counter = 5, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[5])].X) ,
	Y = (Coords[(PersonalCounter[5])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 5, Operator = IsEqual},
	},
}

-- Wenn Counter = 6, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[6])].X) ,
	Y = (Coords[(PersonalCounter[6])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 6, Operator = IsEqual},
	},
}

-- Wenn Counter = 1, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[7])].X) ,
	Y = (Coords[(PersonalCounter[7])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 7, Operator = IsEqual},
	},
}

-- Wenn Counter = 1, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[8])].X) ,
	Y = (Coords[(PersonalCounter[8])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 8, Operator = IsEqual},
	},
}

-- Wenn Counter = 9, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[9])].X) ,
	Y = (Coords[(PersonalCounter[9])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 9, Operator = IsEqual},
	},
}


-- Wenn Counter = 10, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[10])].X) ,
	Y = (Coords[(PersonalCounter[10])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 10, Operator = IsEqual},
	},
}

-- Wenn Counter = 11, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[11])].X) ,
	Y = (Coords[(PersonalCounter[11])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 11, Operator = IsEqual},
	},
}


-- Wenn Counter = 12, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[12])].X) ,
	Y = (Coords[(PersonalCounter[12])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 12, Operator = IsEqual},
	},
}


-- Wenn Counter = 13, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[13])].X) ,
	Y = (Coords[(PersonalCounter[13])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 13, Operator = IsEqual},
	},
}


-- Wenn Counter = 14, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[14])].X) ,
	Y = (Coords[(PersonalCounter[14])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 14, Operator = IsEqual},
	},
}


-- Wenn Counter = 15, dann

OnIdleGoHome
{
	X = (Coords[(PersonalCounter[15])].X) ,
	Y = (Coords[(PersonalCounter[15])].Y) ,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P204_BuergerCounter", Value = 15, Operator = IsEqual},
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc { TargetNpcId = Avatar, NpcId = self, Range = 2 },
		PlayerHasItem {ItemId = 7380},
	},
	Actions =
	{
		TransferItem{GiveItem = StealItem[MyLoot] , Flag = Give},
	},
}