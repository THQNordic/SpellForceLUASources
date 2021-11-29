--Gnomling falsch

--MyNumber = 1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



SpawnOnlyWhen
 {
  X = 0, Y = 0, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P202OberGnomlingTot", UpdateInterval = 10}
	}, 
	Actions = 
	{ 
		ChangeRace {Race = 154, NpcId = self}
	} 
}



Respawn
{
 	WaitTime = 1, UnitId = self, Clan = 0, Target = 0, Chief = none, NoSpawnEffect = FALSE, 
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
		SetGlobalFlagTrue {Name = "P202Gnomling01Tot"}
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


--dofile("script/P202/n11268_Gnomlinge.lua")


EndDefinition()

end