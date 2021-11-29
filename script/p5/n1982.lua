function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
--DefineLocationCircle{Name = "Point001", X = 216, Y = 357, Radius = 2}
--DefineLocationCircle{Name = "Point002", X = 212, Y = 358, Radius = 2}
--DefineLocationCircle{Name = "Point003", X = 210, Y = 354, Radius = 2}
--DefineLocationCircle{Name = "Point004", X = 210, Y = 349, Radius = 2}
--DefineLocationCircle{Name = "Point005", X = 215, Y = 345, Radius = 2}

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
		FigureInRangeNpc {TargetNpcId = 1983, Range = 2},
	},
	Actions =
	{
		Goto{X = 272, Y = 343, NpcId = _NpcId, WalkMode = Run, GotoMode = GotoForced},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LaufLos1", Seconds = 3},
	},
	Actions =
	{
		Goto{X = 246, Y = 347, NpcId = _NpcId, WalkMode = Run, GotoMode = GotoForced},
	}
}


-- Zurück auf den Ursprungsposten, der Posten hinter mir ist schliesslich wieder auf seinem Platz
--OnEvent
--{
--	Conditions = 
--	{
--		IsGlobalFlagFalse {Name = "SpielerGreiftPostenketteAn1"},
--		FigureInRange {NpcId = 1979, X = 246, Y = 345, Range = 2},
--	},
--	Actions =
--	{
--		Goto{X = _X, Y = _Y, NpcId = _NpcId, WalkMode = Run},
--	}
--}
--
--
---- Der Spieler greift den ersten Posten an.
--OnEvent
--{
--	Conditions = 
--	{
--		PlayerUnitInRange {X = 190, Y = 357, Range = 5},
--		FigureAlive{NpcId = 1983},
--	},
--	Actions = 
--	{
--		SetGlobalTimeStamp {Name = "Postenverzoegerung1"},
--	}
--}
--   
--
---- Der Spieler greift den ersten Posten an und ich(Posten 2) hab lange genug gewartet bevor ich loslaufe
--OnEvent
--{
--	Conditions = 
--	{
--		IsGlobalTimeElapsed {Name = "Postenverzoegerung1", Seconds = 3, UpdateInterval = 5},
--	},
--	Actions = 
--	{
--		SetGlobalFlagTrue{Name = "SpielerGreiftPostenketteAn1"},
--		Goto{X = 246, Y = 347, NpcId = _NpcId, WalkMode = Run},
--	}
--}
	EndDefinition()

end
