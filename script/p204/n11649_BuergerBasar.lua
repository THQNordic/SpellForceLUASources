Coords =
{
	[0] = { X = 243, Y = 269 },
	[1] = { X = 274, Y = 267 },
	[2] = { X = 294, Y = 243 },
	[3] = { X = 310, Y = 256 },
	[4] = { X = 307, Y = 272 },
	[5] = { X = 237, Y = 271 },
	[6] = { X = 246, Y = 252 },
	[7] = { X = 261, Y = 237 },
	[8] = { X = 279, Y = 248 },
	[9] = { X = 309, Y = 255 },
	[10] = { X = 308, Y = 273 },
	[11] = { X = 244, Y = 270 },
	[12] = { X = 310, Y = 257 },
	[13] = { X = 246, Y = 253 },
	[14] = { X = 274, Y = 268 },
	[15] = { X = 306, Y = 270 },
	
}

StealItem =
{
	[0] = 4755 ,
	[1] = 4556 ,
	[2] = 4618 ,
	[3] = 4484,
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