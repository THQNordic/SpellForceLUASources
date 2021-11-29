--Gnomling richtig mit Keule



function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
 {
  	X = 0, Y = 0, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
		Conditions = 
		{
			IsGlobalCounter {Name = "gc_P202GnomlingsZaehler", Value = 8, Operator = IsGreaterOrEqual, UpdateInterval = 20}
		} , 
		Actions = {} 
}


--Aschetänzer spawnt, Gnomlinge despawnen alle
OnDeath
{
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P202OberGnomlingTot"},
		SetGlobalFlagTrue {Name = "g_P202Aschetaenzer1SpawnInit"},
		SetRewardFlagTrue {Name = "GnomlingBossTot"}
	}
}



EndDefinition()

end


