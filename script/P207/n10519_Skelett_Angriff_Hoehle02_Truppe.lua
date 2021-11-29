function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		UND
		(
		IsGlobalTimeElapsed {Name = "g_p207_first_attack_wave_on_base", Seconds = 1020},
		Negated(IsGlobalFlagTrue {Name = "g_p207_Hoehle02_versperrt"}),
		Negated(IsGlobalFlagTrue {Name = "g_P207_Erste_Festung_Eingenommen"})
		),
	},
	Actions = 
	{
	},
}

-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = 10519},  -- Anf�hrer lebt noch
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = 10519} ,
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}

    

-- Solange der Entsprechende Lagerabschnitt nocht steht wird gespawnt

--		Respawn
--		{
--			X = _X, 
--			Y = _Y, 
--			NoSpawnEffect = TRUE, 
--			WaitTime = 420,
--			Conditions = 
--			{ 
--				IsGlobalFlagFalse {Name = "g_p207_Hoehle02_versperrt"},
--				IsGlobalFlagFalse {Name = "g_P207_Erste_Festung_Eingenommen"},
--				FigureAlive {NpcId = 10519},
--			},
--			DeathActions = 
--			{
--				SetNpcFlagFalse{Name = "FollowModeAlreadySet"},
--			}
--		}


-- wenn der anf�hrer tot ist, bricht panik aus!
-- alle st�rzen sich auf das  Monument des Spielers weil ihnen die "strategie" fehlt...

OnIdleGoHome
{
	X = 208,
	Y = 464, 
	Direction = NorthWest, 
	WalkMode = Run, 
	Range = 5,
	Conditions = 
	{
		FigureDead{NpcId = 10519},		
	},  
	Actions = 
	{
		StopFollow{Target = 10519},
	}
}


EndDefinition()

end