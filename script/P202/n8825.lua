--Wächter-Boss4
--(Schale West = 8811)

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Autoheal, solange Kristall noch Effekt hat
OnEvent
{
	NotInDialog = FALSE,
	Conditions =
	{
		FigureHasHealth{Percent = 50, NpcId = self, UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P202KristallEffekt4Aus", UpdateInterval = 10}
	},
	Actions = 
	{
		SetHealth {HitPoints = 1400, NpcId = self, Decrease = FALSE}
	}
}

OnDeath
{
	Actions = 
	{
		StopEffect{TargetType = Figure, NpcId = self},
		SetGlobalFlagTrue {Name = "g_P202KristallEffekt4Aus"}
	}
}

EndDefinition()

end
