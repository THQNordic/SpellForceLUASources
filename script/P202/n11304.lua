-- LowLevelSkelett f�r Aschet�nzer 1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


KillOnDominate{NpcId = self}


SpawnOnlyWhen
{
	X = 157, Y = 249, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "P202Aschetaenzer1Umspawn75", UpdateInterval = 10},
	} , 
	Actions = 
	{
		Goto {X = _X, Y = _Y, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0}
	}
}

OnDeath
{
	Actions = 
	{
		SetGlobalFlagTrue {Name =  "g_P202HelferSkelett4Tot"}
	}
}

EndDefinition()

end
