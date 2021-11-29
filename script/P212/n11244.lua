function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



KillOnDominate{NpcId = self}




Coords =
{
	HomeBase = { X = 247, Y = 245 },
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
-- Soulforger l�uft zu Camp03
OnIdleGoHome
{
	X = (Coords.Camp03.X) ,
	Y = (Coords.Camp03.Y) ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 2, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue{ Name = "g_P212_Stele03Reached" },
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
-- Soulforger l�uft zu Camp06
OnIdleGoHome
{
	X = (Coords.Camp06.X) ,
	Y = (Coords.Camp06.Y) ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 4, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue{ Name = "g_P212_Stele06Reached" },
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
-- Soulforger l�uft zu Camp01
OnIdleGoHome
{
	X = (Coords.Camp01.X) ,
	Y = (Coords.Camp01.Y) ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "g_P212_MiniforgerCounter", Value = 6, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue{ Name = "g_P212_Stele01Reached" },
	},
}


EndDefinition()

end
