-- Kathai Sammelscript

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = 269, Y = 455, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE,
	Conditions = 
		{
			IsGlobalFlagTrue {Name = "g_P211_KathaiFallenEin", UpdateInterval = 20},
			IsGlobalTimeElapsed {Name = "gt_P211_KathaiTimer", Seconds = random(15)+3, UpdateInterval = 10 } 
		}, 
	Actions = 
	{
		Goto {X = _X, Y = _Y, NpcId = self, Range = 2, WalkMode = Run, GotoMode = GotoContinuous},
		ChangeFigureOwner {NpcId = self},
		--ChangeRace {Race = 2, NpcId = self}
	} 
}

--nach Platformwechsel immer noch Change Owner
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P211_KathaiFallenEin", UpdateInterval = 20}
	},
	Actions = 
	{ 
	 ChangeFigureOwner {NpcId = self}
	}
}

EndDefinition()

end










