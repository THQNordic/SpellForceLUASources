function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate {}

-- Die viecher dürfen erst Spawnen wenn die Quest gegeben ist
SpawnOnlyWhen
{
	Conditions =
	{
		QuestState {State = StateActive, QuestId = 848},
	}
}

Respawn
{
	WaitTime = 	1,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P208_PrinzessinDreiTot"}, 
		FigureDead {NpcId = 9498},
		Negated (QuestState {QuestId = 848, State = StateSolved, UpdateInterval = 10})
	},
}

-- Zur Sicherheit die Viecher von der Karte nehmen, weil die partout nicht verschwinden wollen
Despawn 
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_PrinzessinDreiTot"}, 
	},
	
}

EndDefinition()

end
