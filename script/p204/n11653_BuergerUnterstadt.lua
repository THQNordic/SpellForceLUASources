Coords =
{
	[0] = { X = 218, Y = 192 },
	[1] = { X = 213, Y = 160 },
	[2] = { X = 241, Y = 169 },
	[3] = { X = 268, Y = 157 },
	[4] = { X = 295, Y = 169 },
	[5] = { X = 318, Y = 184 },
	[6] = { X = 317, Y = 188 },
	[7] = { X = 328, Y = 218 },
	[8] = { X = 278, Y = 188 },
	[9] = { X = 258, Y = 191 },
	[10] = { X = 239, Y = 187 },
	[11] = { X = 308, Y = 192 },
	[12] = { X = 309, Y = 164 },
	[13] = { X = 226, Y = 158 },
	[14] = { X = 225, Y = 198 },
	[15] = { X = 262, Y = 200 },
	
}

StealItem =
{
	[0] = 4654 ,
	[1] = 4427 ,
	[2] = 4439 ,
	[3] = 5420,
	[4] = 5548,
	[5] = 7020,
	[6] = 5384,
	[7] = 5356,
	[8] = 5580,
	[9] = 7397,
	[10] = 7080,
	[11] = 7079,
	[12] = 4079,
	[13] = 4554,
	[14] = 4542,
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