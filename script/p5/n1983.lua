function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
--	DefineLocationCircle{Name = "Point001", X = 191, Y = 361, Radius = 2}
--	DefineLocationCircle{Name = "Point002", X = 186, Y = 362, Radius = 2}
--	DefineLocationCircle{Name = "Point003", X = 183, Y = 356, Radius = 2}
--	DefineLocationCircle{Name = "Point004", X = 187, Y = 352, Radius = 2}
--	DefineLocationCircle{Name = "Point005", X = 190, Y = 352, Radius = 2}
--	
--	AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
--	AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
--	AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
--	AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
--	AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END

OnOneTimeEvent
{
	Conditions =
	{
		ODER (PlayerUnitInRange {X = 138, Y = 392, Range = 10, UpdateInterval = 15}, PlayerUnitInRange {X = 190, Y = 347, Range = 10, UpdateInterval = 15}),
	},
	Actions =
	{
		Goto{X = 237, Y = 348, NpcId = _NpcId, WalkMode = Run, GotoMode = GotoForced},
		SetMinimapAlert { X = _X, Y = _Y, Type = AlertScout},
		SetGlobalFlagTrue {Name = "OutcryPostenkette"},
	}
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = West,
	Conditions = 
	{
		--HoldPosition{},
		IsGlobalFlagTrue {Name = "PostenkettenAlarm"},
	},
}

--Sicherheitshack, falls die Triggerfelder nich klappen
--
--OnOneTimeEvent
--{
--	UpdateInterval = 30,
--	Conditions =
--	{
--		FigureHasAggro {UpdateInterval = 30},
--	},
--	Actions =
--	{
--		Goto{X = 214, Y = 354, NpcId = _NpcId, WalkMode = Run, GotoMode = GotoForced},
--	}
--}
--


EndDefinition()

end
