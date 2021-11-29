-- Marcus zum Monument ...
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- ursprüngliches home bei einar
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 6 , 
	Conditions = {
		IsGlobalFlagTrue{Name = "Q18MarcusInCamp"},
	},
}

-- ursprüngliches home, zwischenweg,
OnIdleGoHome
{
	WalkMode = Walk, X = 196, Y = 140, Direction = 4 , 
	Conditions = {
		IsGlobalFlagTrue{Name = "Q18MarcusInCamp2"},
	},
	HomeActions = {
		SetGlobalFlagTrue{Name = "Q18MarcusInCamp"},
		SetGlobalFlagFalse{Name = "Q18MarcusInCamp2"},
	},
}

-- ok, jetzt darf er erstmalig loslaufen
OnOneTimeEvent
{
	Conditions = {
		IsGlobalFlagFalse{Name = "Q18MarcusToMonument", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "Q18MarcusToMonument2", UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "Q18MarcusGo", UpdateInterval = 20},
	},
	Actions = {
		SetGlobalFlagTrue{Name = "Q18MarcusToMonument"},
		SetGlobalFlagTrue{Name = "Q18MarcusWalking"},
	},
}

-- wenn er aus dem range kommt, stoppen
OnEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "Q18MarcusGo", UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "Q18MarcusWalking", UpdateInterval = 20},
		Negated(FigureInRangeNpc{TargetNpcId = Avatar, Range = 16 , UpdateInterval = 20}),
	},
	Actions = {
		SetGlobalFlagFalse{Name = "Q18MarcusWalking"},
	},
}

-- wenn er wieder in range ist, weiterlaufen
OnEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "Q18MarcusGo"},
		IsGlobalFlagFalse{Name = "Q18MarcusWalking"},
		FigureInRangeNpc{TargetNpcId = Avatar, Range = 5 , UpdateInterval = 20},
	},
	Actions = {
		SetGlobalFlagTrue{Name = "Q18MarcusWalking"},
	},
}

-- zum ersten punkt laufen
OnIdleGoHome{
	WalkMode = Run, X = 193, Y = 138, Direction = 0 , 
	Conditions = {
		IsGlobalFlagTrue{Name = "Q18MarcusWalking", UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "Q18MarcusToMonument", UpdateInterval = 20},
	},
	AbortConditions = {
		IsGlobalFlagFalse{Name = "Q18MarcusWalking", UpdateInterval = 20},
		FigureAlive{NpcId = Avatar},
	},
	AbortActions = {
		Stop{},
		LookAtFigure{Target = Avatar},
		Follow{Target = Avatar},
	},
}

-- wenn er beim ersten punkt ist, umschalten auf den zweiten
OnOneTimeEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "Q18MarcusWalking", UpdateInterval = 20},
		FigureInRange{X = 193, Y = 138, Range = 3},
	},
	Actions = {
		SetGlobalFlagFalse{Name = "Q18MarcusToMonument"},
		SetGlobalFlagTrue{Name = "Q18MarcusToMonument2"},
	},
}

-- zum zweiten punkt laufen
OnIdleGoHome{
	WalkMode = Run, X = 230, Y = 175, Direction = 3 , 
	Conditions = {
		IsGlobalFlagTrue{Name = "Q18MarcusWalking", UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "Q18MarcusToMonument2", UpdateInterval = 20},
	},
	HomeActions = {
		SetGlobalFlagFalse{Name = "Q18MarcusToMonument"},
		SetGlobalFlagFalse{Name = "Q18MarcusToMonument2"},
		SetGlobalFlagFalse{Name = "Q18MarcusWalking"},
		SetGlobalFlagFalse{Name = "Q18MarcusGo"},
		SetGlobalTimeStamp{Name = "Q18MarcusWaitBeforeGoHome"},
	},
	AbortConditions = {
		IsGlobalFlagFalse{Name = "Q18MarcusWalking", UpdateInterval = 10},
	},
	AbortActions = {
		Stop{},
		LookAtFigure{Target = Avatar},
		Follow{Target = Avatar},
	},
}

-- nach wartezeit am monument auf Player Follow
OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "Q18MarcusWaitBeforeGoHome", Seconds = 10},
	},
	Actions = {
		SetNpcFlagTrue{Name = "FollowPlayer"},
	},
}
OnPlatformOneTimeEvent
{
Conditions = {
				IsNpcFlagTrue{Name = "FollowPlayer"},
				FigureJob{Job = JobIdle , NpcId = self},
				},
Actions = 	{
				-- safe, da nur über aggro und dem follow flag getoggled wird
				Follow{Target = 1362 , NpcId = self},
				},

}


REM = [[
OffConditions = {
				ODER(
					FigureHasAggro{NpcId = self , UpdateInterval = 10},
					FigureDead{NpcId = Avatar}
					),
				},
OffActions =	{
				StopFollow{Target = Avatar , NpcId = self},
				}
]]

EndDefinition()
end
