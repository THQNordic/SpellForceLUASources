function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
	X = 160 , Y = 360, Direction = 1, WalkMode = Run,
	Conditions = 
	{
		FigureInRange { NpcId = 1980, X = 360, Y = 380, Range = 2},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "PostenkettenAlarm"},
		SetGlobalTimeStamp {Name = "Attacke"},
	}
}

OnIdleGoHome
{
	X = _X , Y = _Y, Direction = 1, WalkMode = Run,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "Attacke", Seconds = 600},
	},
}


--OnIdleGoHome
--{
--	X = 160 , Y = 360, Direction = 1, WalkMode = Run,
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "SpielerGreiftPostenketteAn2"},
--		FigureInRange { NpcId = 2077, X = 360, Y = 380, Range = 2},
--	},
--	Actions = 
--	{
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn1"},
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn2"},
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn3"},
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn4"},
--		SetGlobalFlagTrue{Name = "PostenkettenAlarm"},
--		SetGlobalFlagFalse{Name = "Posten2"},
--	}
--}
--
--OnIdleGoHome
--{
--	X = 160 , Y = 360, Direction = 1, WalkMode = Run,
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "SpielerGreiftPostenketteAn3"},
--		FigureInRange { NpcId = 2077, X = 360, Y = 380, Range = 2},
--	},
--	Actions = 
--	{
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn1"},
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn2"},
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn3"},
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn4"},
--		SetGlobalFlagTrue{Name = "PostenkettenAlarm"},
--	}
--}
--
--OnIdleGoHome
--{
--	X = 160 , Y = 360, Direction = 1, WalkMode = Run,
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "SpielerGreiftPostenketteAn4"},
--		FigureInRange { NpcId = 2077, X = 360, Y = 380, Range = 2},
--	},
--	Actions = 
--	{
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn1"},
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn2"},
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn3"},
--		SetGlobalFlagFalse{Name = "SpielerGreiftPostenketteAn4"},
--		
--	}
--}
--



EndDefinition()

end
