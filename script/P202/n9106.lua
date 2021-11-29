-- Zirkelmagier Raith, der Schwarze

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
 	X = 386, Y = 106, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE, 
	Conditions = 
	{  
		IsGlobalFlagTrue {Name = "g_P202RaithErwache", UpdateInterval = 5},
	}, 
	Actions = 
	{ 
		ChangeRace {Race = 152, NpcId = self},
	}
}

OnOneTimeEvent
{
	Actions =
	{
		SetEffect{Effect = "Amok", Length = 4000},
		SetNpcTimeStamp{Name = "RaithAmokEffect"},
	},
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed{Name = "RaithAmokEffect", Seconds = 3, UpdateInterval = 10},
	},
	Actions =
	{
		SetEffect{Effect = "Amok", Length = 4000},
		SetNpcTimeStamp{Name = "RaithAmokEffect"},
	},
}

-- nach CS Ende Despawn Raith
Despawn
{
	
	PlayDeathAnim = FALSE ,
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "g_P202HokanUndRaithDespawn", Seconds = 2, UpdateInterval = 10},
	}, 
	Actions = 
	{
			--SetEffect {Effect = "DeMaterialize", Length = 2000 , TargetType = Figure , NpcId = 9106},
	},

}


EndDefinition()

end
