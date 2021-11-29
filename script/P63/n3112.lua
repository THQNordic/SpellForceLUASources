function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = 1,
	-- X = 150, Y = 253,
	Conditions =
	{
		IsGlobalFlagTrue {Name =  "RandolfSpawns"},
		-- PlayerUnitInRange {X = 69, Y = 260, Range = 20, UpdateInterval = 10},
	},
	Actions =
	{
		-- ChangeRace {Race = 152, NpcId = _NpcId}, 			
		Goto {X = 137, Y = 248, NpcId = _NpcId, Range = 0, WalkMode = Run, GotoMode = GotoContinous},
	}
}

OnIdleGoHome
{
	X = 199, Y = 290, Direction = South,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "RandolfGeht"},
		PlayerHasItem {ItemId = 3197}, -- avatar hat schatulle.
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "RandolfHatFertig"},
	}
}

-- Respawn
-- {
-- 	WaitTime = 0.1,
-- }

EndDefinition()

end
