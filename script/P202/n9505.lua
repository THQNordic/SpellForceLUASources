--unsichtbare FakeUnit für Cure Disease Spell am Brunnen

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 56, Y = 218, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = {}, 
	Actions = 
	{
		HoldPosition {NpcId = self, FreeWill = FALSE},
		ChangeRace {Race = 152, NpcId = self}
	} 
}

--Heilen, wenn Wasser getrunken wird
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "P202_WasserGetrunken", UpdateInterval = 20}
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "P202_WasserGetrunken"},
		CastSpell {Spell = 1959, Target = 0, TargetType = Figure, X = 0, Y = 0, NpcId = self},
	}
}



EndDefinition()

end
