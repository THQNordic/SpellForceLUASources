--> BOTE

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209BoteSpawn"},	
	},
	Actions =
	{
		ChangeRace { Race = 152, NpcId = self},
	}	
}

--Umspawn in der Boten Cutszene
Umspawn 
{
	UnitId = self,  
	X = 230, 
	Y = 319,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnHelden", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		ChangeRace { Race = 152, NpcId = self},
	}

}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209BoteAngriff"},
	},
	Actions = 
	{ 
		ChangeRace { Race = 208, NpcId = self},
	}
}

--Bote dreht sich in der 3 Cutszene um, sobald er angekommen ist.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 210, Y = 321, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBote"},
	},
	Actions = 
	{ 
		LookAtDirection {Direction = East, NpcId = self},
	}
}

EndDefinition()

end
