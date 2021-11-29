-- dofile Gnomlinge



Flag =
{
	--[1] = { Spawncondition = "P202GnomlingSpawn01", Deathaction = "P202Gnomling01Tot"},
	[2] = { Spawncondition = "P202Gnomling01Tot" , Deathaction = "P202Gnomling02Tot"},
	[3] = { Spawncondition = "P202Gnomling02Tot" , Deathaction = "P202Gnomling03Tot"},
	[4] = { Spawncondition = "P202Gnomling03Tot" , Deathaction = "P202Gnomling04Tot"},
	[5] = { Spawncondition = "P202Gnomling04Tot" , Deathaction = "P202Gnomling05Tot"}, 
	[6] = { Spawncondition = "P202Gnomling05Tot" , Deathaction = "P202Gnomling06Tot"}, 
	[7] = { Spawncondition = "P202Gnomling06Tot" , Deathaction = "P202Gnomling07Tot"}, 
	[8] = { Spawncondition = "P202Gnomling07Tot" , Deathaction = "P202Gnomling08Tot"},
	[9] = { Spawncondition = "P202Gnomling08Tot" , Deathaction = "P202Gnomling09Tot"}, 
	[10] = {Spawncondition = "P202Gnomling09Tot" , Deathaction = "P202Gnomling10Tot"}, 
	[11] = {Spawncondition = "P202Gnomling10Tot" , Deathaction = "P202Gnomling11Tot"},  
	[12] = {Spawncondition = "P202Gnomling11Tot" , Deathaction = "P202Gnomling12Tot"}, 
	[13] = {Spawncondition = "P202Gnomling12Tot" , Deathaction = "P202Gnomling13Tot"}, 
	[14] = {Spawncondition = "P202Gnomling13Tot" , Deathaction = "P202Gnomling14Tot"}, 
	[15] = {Spawncondition = "P202Gnomling14Tot" , Deathaction = "P202Gnomling15Tot"}, 
	[16] = {Spawncondition = "P202Gnomling15Tot" , Deathaction = "P202Gnomling16Tot"}, 
	[17] = {Spawncondition = "P202Gnomling16Tot" , Deathaction = "P202Gnomling17Tot"}, 
	[18] = {Spawncondition = "P202Gnomling17Tot" , Deathaction = "P202Gnomling18Tot"}, 
	[19] = {Spawncondition = "P202Gnomling18Tot" , Deathaction = "P202Gnomling19Tot"}, 
	[20] = {Spawncondition = "P202Gnomling19Tot" , Deathaction = "P202Gnomling20Tot"}, 
	[21] = {Spawncondition = "P202Gnomling20Tot" , Deathaction = "P202Gnomling21Tot"}, 
	[22] = {Spawncondition = "P202Gnomling21Tot" , Deathaction = "P202Gnomling22Tot"}, 
	[23] = {Spawncondition = "P202Gnomling22Tot" , Deathaction = "P202Gnomling23Tot"}, 
	[24] = {Spawncondition = "P202Gnomling23Tot" , Deathaction = "P202Gnomling24Tot"}, 
	[25] = {Spawncondition = "P202Gnomling24Tot" , Deathaction = "P202Gnomling25Tot"}, 
	[26] = {Spawncondition = "P202Gnomling25Tot" , Deathaction = "P202Gnomling26Tot"}, 
	[27] = {Spawncondition = "P202Gnomling26Tot" , Deathaction = "P202Gnomling27Tot"}, 
	[28] = {Spawncondition = "P202Gnomling27Tot" , Deathaction = "P202Gnomling28Tot"}, 
	[29] = {Spawncondition = "P202Gnomling28Tot" , Deathaction = "P202Gnomling29Tot"}, 
	[30] = {Spawncondition = "P202Gnomling29Tot" , Deathaction = "P202Gnomling30Tot"},
	[31] = {Spawncondition = "P202Gnomling30Tot" , Deathaction = "P202Gnomling31Tot"},
	
}

KillOnDominate{NpcId = self}

SpawnOnlyWhen
 {
  X = 0, Y = 0, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = Flag[MyNumber].Spawncondition, UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P202OberGnomlingTot", UpdateInterval = 10}
	}, 
	Actions = 
	{ 
		IncreaseGlobalCounter {Name = "gc_P202GnomlingsZaehler", Step = 1},
		ChangeRace {Race = 154, NpcId = self}
	} 
}



Respawn
{
 	WaitTime = 1, UnitId = self, Clan = 0, Target = None,  X = startX, Y = startY, Chief = none, NoSpawnEffect = FALSE, 
 	Conditions = 
 	{
 		--IsGlobalFlagTrue {Name = Flag[MyNumber].Spawncondition, UpdateInterval = 10},
 		IsGlobalFlagFalse {Name = "g_P202OberGnomlingTot", UpdateInterval = 10}
 	}, 
 	Actions = 
 	{
 		IncreaseGlobalCounter {Name = "gc_P202GnomlingsZaehler", Step = 1},
 		ChangeRace {Race = 154, NpcId = self}
 	}, 
 	DeathActions = {} 
}


OnDeath
{
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = Flag[MyNumber].Deathaction}
	}
}


Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202OberGnomlingTot", UpdateInterval = 10}
	}, 
	Actions = {}
}