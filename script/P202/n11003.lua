-- BergkristallGolem
-- starke Erdmagie (Geschoss)
-- gegen resistente Gegner Gargoyle

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202BergkristallGolemGewaehlt", UpdateInterval = 20},
	}, 
	Actions = {}
}

EndDefinition()

end
