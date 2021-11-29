-- Hilfs-Skelett für Aschetänzer 2



function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
 	X = 0, Y = 0, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "P202Aschetaenzer2Gespawnt", UpdateInterval = 10},
		IsGlobalTimeElapsed {Name = "gt_P202Aschetaenzer2SkelettTimer", Seconds = 8}
	} , 
	Actions = {} 
}


--Aschetaenzer bekommt Health, wenn Skelett stirbt
OnDeath
{
	Actions = 
	{
		CastSpell {Spell = 1953, Target = 11300, TargetType = Figure, NpcId = 11328, X = 0, Y = 0}
	}
}


EndDefinition()

end
