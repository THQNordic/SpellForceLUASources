function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = West,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "PostenkettenAlarm"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc {TargetNpcId = 1979, Range = 2},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "LaufLos3"},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LaufLos3", Seconds = 3},
	},
	Actions =
	{
		Goto{X = 360, Y = 380, NpcId = _NpcId, WalkMode = Run, GotoMode = GotoForced},
	}
}
----Posten vor mir wird angegriffen
--OnEvent
--{
--	Conditions = 
--	{
--		PlayerUnitInRange {X = 246, Y = 347, Range = 5},
--		FigureAlive{NpcId = 1979}
--	},
--	Actions = 
--	{
--		SetGlobalTimeStamp {Name = "Postenverzoegerung3"},
--	}
--}
--
---- Posten läuft verzögert los
--OnEvent
--{
--	Conditions = 
--	{
--		IsGlobalTimeElapsed {Name = "Postenverzoegerung3", Seconds = 3, UpdateInterval = 5},
--		
--	},
--	Actions = 
--	{
--		Goto{X = 295, Y = 343, NpcId = _NpcId, WalkMode = Run},
--		SetGlobalFlagTrue{Name = "SpielerGreiftPostenketteAn3"},
--	}
--}
--
---- Posten vor mir kommt mit Warnung für Posten 1 an
--OnEvent
--{
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "SpielerGreiftPostenketteAn1"},
--		FigureInRange {NpcId = 1979, X = 271, Y = 345, Range = 2},
--	},
--	Actions = 
--	{
--		SetGlobalTimeStamp {Name = "Postenverzoegerung3"},
--	}
--}
--
---- Posten vor mir kommt mit Warnung für Posten 2 an
--OnEvent
--{
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "SpielerGreiftPostenketteAn2"},
--		FigureInRange {NpcId = 1979, X = 271, Y = 345, Range = 2},
--	},
--	Actions = 
--	{
--		SetGlobalTimeStamp {Name = "Postenverzoegerung3"},
--	}
--}
--
--
--
--OnIdleGoHome
--{
--	X = 271 , Y = 345, Direction = 1, WalkMode = Walk,
--	Conditions = 
--	{
--		IsGlobalFlagFalse {Name = "SpielerGreiftPostenketteAn1"},
--		IsGlobalFlagFalse {Name = "SpielerGreiftPostenketteAn2"},
--		IsGlobalFlagFalse {Name = "SpielerGreiftPostenketteAn3"},
--		IsGlobalFlagFalse {Name = "SpielerGreiftPostenketteAn4"},
--		FigureInRange {NpcId = 1981, X = 295, Y = 343, Range = 2},
--	},
--	Actions = 
--	{
--		
--	}
--}
--
--




EndDefinition()

end
