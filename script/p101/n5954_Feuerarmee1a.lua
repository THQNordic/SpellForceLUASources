--Feuerarmee 1a
--NpcId 5954 - 5972

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Feuerarmee1, Truppe1
SpawnOnlyWhen
{
	X = 403, Y = 248, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE, 
	Conditions = 
	{
		--IsGlobalFlagTrue{Name = "FeuerArmeeFälltEin", UpdateInterval = 30},
		IsGlobalTimeElapsed{Name = "CounterFeuerarmee1", Seconds = 1, UpdateInterval = 20 },
		
	}, 
	Actions = 
	{ 
		
		Goto{X = _X, Y = _Y, NpcId = self, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		
		
	} 
}


--Respawn
Respawn
{
	WaitTime = 15, UnitId = self, Clan = 0, Target = none, X = 403, Y = 248, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{
		ODER
		(
		Negated(QuestState{QuestId = 631, State = StateActive, UpdateInterval = 10}), --Knochenquest
		Negated(QuestState{QuestId = 615, State = StateSolved, UpdateInterval = 10}) --Q Shal Dun
		)
		
	}, 
	Actions = 
	{ 
		Goto{X = _X, Y = _Y, NpcId = self, Range = 1, WalkMode = Run, GotoMode = GotoContinuous },
		
	}, 
	DeathActions = { },
}





EndDefinition()

end