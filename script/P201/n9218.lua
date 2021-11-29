function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201GolemAmLeben"}, 
		PlayerUnitInRange {X = 117, Y = 174, Range = 20, FigureType = FigureAll},
	},
	Actions = 
	{
		ChangeRace {Race = 107, NpcId = self},	
	}
} 

Respawn
{
	WaitTime = 10,
	NoSpawnEffect = FALSE ,
	
	Conditions = 
	{
		IsGlobalFlagTrue {Name= "g_sP201GolemAmLeben"},
		FigureAlive {NpcId = 9216},
	},
	Actions = 
	{	
		ChangeRace {Race = 107, NpcId = self},	
		CastSpell {Spell = 92, Target = 9213, TargetType = Figure, X = 0, Y = 0, NpcId = self},
	},
	DeathActions = 
	{

	}
}
 
EndDefinition()

end
