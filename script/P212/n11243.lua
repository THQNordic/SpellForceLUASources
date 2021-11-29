function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



KillOnDominate{NpcId = self}



Coords =
{
	HomeBase = { X = 273, Y = 243 },
	Camp06   = { X = 440, Y = 89 },
	Camp05   = { X = 87, Y = 56 },
	Camp04  = { X = 469, Y = 210 },
	Camp03   = { X = 76, Y = 235 },
	Camp02   = { X = 479, Y = 415 },
	Camp01   = { X = 42, Y = 395 },
	
}


-- Wenn Counter = 1, dann
-- Soulforger l�uft zu Homestation
OnIdleGoHome
{
	X = (Coords.HomeBase.X) ,
	Y = (Coords.HomeBase.Y) ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 1, Operator = IsEqual},
	},
}


-- Wenn Counter = 2, dann
-- Soulforger l�uft zu Camp02
OnIdleGoHome
{
	X = (Coords.Camp02.X) ,
	Y = (Coords.Camp02.Y) ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 2, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue{ Name = "g_P212_Stele02Reached" },
	},
}


-- Wenn Counter = 3, dann
-- Soulforger l�uft zu Homestation
OnIdleGoHome
{
	X = (Coords.HomeBase.X) ,
	Y = (Coords.HomeBase.Y) ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 3, Operator = IsEqual},
	},
}


-- Wenn Counter = 4, dann
-- Soulforger l�uft zu Camp05
OnIdleGoHome
{
	X = (Coords.Camp05.X) ,
	Y = (Coords.Camp05.Y) ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 4, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue{ Name = "g_P212_Stele05Reached" },
	},
}


-- Wenn Counter = 5, dann
-- Soulforger l�uft zu Homestation
OnIdleGoHome
{
	X = (Coords.HomeBase.X) ,
	Y = (Coords.HomeBase.Y) ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 5, Operator = IsEqual},
	},
}


-- Wenn Counter = 6, dann
-- Soulforger l�uft zu Camp04
OnIdleGoHome
{
	X = (Coords.Camp04.X) ,
	Y = (Coords.Camp04.Y) ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 6, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue{ Name = "g_P212_Stele04Reached" },
	},
}


EndDefinition()

end
