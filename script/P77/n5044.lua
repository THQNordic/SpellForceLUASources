function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



OnEvent
{
	NotInDialog = FALSE ,
	Conditions = {
		FigureAlive{ NpcId = 5044},
	},
	Actions = {
		Goto{ X = 140, Y = 49, NpcId = 5044, GotoMode = GotoForced, Range = 1, WalkMode = Walk, XRand = 0, YRand = 0 },
	},
}


Respawn{WaitTime=30}
	

REM = [[

AddControlPoint

{
	Name = "1", Location = "Home", TimeToLeave= hms(9,0,0),
	
	Conditions = {
		FigureInRange{ X = 98, Y = 49, NpcId = self, Range = 2},
	},
	Actions = {
		SetEffect{Effect = "DeMaterialize"}, --Length = 9000},
	},
}	
		
AddControlPoint

{
	Name = "2", Location = "ArbeitsPlatz", TimeToLeave = hms(18,0,0),
	Conditions = {
		FigureInRange{ X = 140, Y = 49, NpcId = self, Range = 2},
	},
	Actions = {
		SetEffect{Effect = "PlasmaSmoke", Length = 9000},
	},
}	


OnToggleEvent
{
	NotInDialog = FALSE , UpdateInterval = 60,
	OnConditions = {
		TimeNight(),
		--FigureInRange{  X = 98, Y = 49, NpcId = 5044, Range = 2},
		},
	OnActions = {
		--StopEffect{ Effect = "DeMaterialize"},
		Goto{ X = 100, Y = 49, NpcId = 5044, GotoMode = GotoForced, Range = 1, WalkMode = Walk, XRand = 0, YRand = 0 },
	 			},	
	OffConditions = {
		TimeDay(),
		--FigureInRange{ X = 98, Y = 49, NpcId = 5044, Range = 2},
		},  
	OffActions = {
			Goto{ X = 140, Y = 49, NpcId = 5044, GotoMode = GotoForced, Range = 1, WalkMode = Walk, XRand = 0, YRand = 0 },
		},
}



Respawn{WaitTime=30}

OnOneTimeEvent
{
	Conditions = { 
		FigureHasAggro{},
	},
	Actions = {
		SetEffect{Effect = "PlasmaSmoke"},
		SetEffect{Effect = "AcidCloud", X = 95, Y = 46, Length = 20000},
	},
}


]]




EndDefinition()
end
