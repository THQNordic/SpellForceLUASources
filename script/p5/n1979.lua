function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
--DefineLocationCircle{Name = "Point001", X = 246, Y = 350, Radius = 2}
--DefineLocationCircle{Name = "Point002", X = 242, Y = 351, Radius = 2}
--DefineLocationCircle{Name = "Point003", X = 242, Y = 346, Radius = 2}
--DefineLocationCircle{Name = "Point004", X = 246, Y = 345, Radius = 2}
--DefineLocationCircle{Name = "Point005", X = 246, Y = 347, Radius = 2}

--AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
--AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
--AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
--AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
--AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END

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
		FigureInRangeNpc {TargetNpcId = 1982, Range = 2},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "LaufLos2"},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LaufLos2", Seconds = 3},
	},
	Actions =
	{
		Goto{X = 309, Y = 345, NpcId = _NpcId, WalkMode = Run, GotoMode = GotoForced},
	}
}
--OnEvent
--{
--	Conditions = 
--	{
--		PlayerUnitInRange {X = 215, Y = 350, Radius = 5},
--		FigureAlive{NpcId = 1982},
--	},
--	Actions = 
--	{
--		SetGlobalFlagTrue {Name = "Posten2"},
--	}
--}
--
--
--
---- Postenkette läuft und der vorherige Posten kommt an
--OnEvent
--{
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "SpielerGreiftPostenketteAn1"},
--		FigureInRange { X = 246, Y = 347, NpcId = 1982, Range = 2},
--		IsGlobalFlagFalse {Name = "Posten2"},
--	},
--	Actions =
--	{
--		SetGlobalFlagTrue {Name = "Posten2"},
--		--SetGlobalTimeStamp {Name = "Postenverzoegerung2"},
--	}
--}
--OnEvent 
--{
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "Posten2"},
--		IsGlobalFlagFalse {Name = "Posten2_Save"},
--	},
--	Actions =
--	{
--		SetGlobalFlagTrue {Name = "Posten2_Save"},
--		SetGlobalTimeStamp {Name = "Postenverzoegerung2"},
--	}
--}
--
---- Posten läuft verzögert los
--OnEvent
--{
--	Conditions = 
--	{
--		IsGlobalTimeElapsed {Name = "Postenverzoegerung2", Seconds = 3, UpdateInterval = 5},
--	},
--	Actions = 
--	{
--		Goto{X = 271, Y = 345, NpcId = _NpcId, WalkMode = Run},
--		SetGlobalFlagTrue{Name = "SpielerGreiftPostenketteAn2"},
--	}
--}
--
--OnIdleGoHome
--{
--	X = 246 , Y = 347, Direction = 1, WalkMode = Walk,
--	Conditions = 
--	{
--		IsGlobalFlagFalse {Name = "SpielerGreiftPostenketteAn1"},
--		IsGlobalFlagFalse {Name = "SpielerGreiftPostenketteAn2"},
--		IsGlobalFlagFalse {Name = "SpielerGreiftPostenketteAn3"},
--		IsGlobalFlagFalse {Name = "SpielerGreiftPostenketteAn4"},
--		FigureInRange {NpcId = 1980, X = 271, Y = 345, Range = 2},
--	}
--}
--
--

	EndDefinition()

end
