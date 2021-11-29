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
		IsGlobalTimeElapsed {Name = "g_p207_first_attack_wave_on_base", Seconds = 960}, -- 6 Minuten
		Negated(IsGlobalFlagTrue {Name = "g_p207_Hoehle01_versperrt"}),
		Negated(IsGlobalFlagTrue {Name = "g_P207_Erste_Festung_Eingenommen"})
		),
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "1H_A"},
	},
}

-- so lange der Teil des Lagers steht respawnen 
Respawn
{
	X = _X,
	Y = _Y,
	NoSpawnEffect = TRUE,
	WaitTime = 550,
	Conditions = 
	{ 		
		IsGlobalFlagFalse {Name = "g_P207_Erste_Festung_Eingenommen"},
		IsGlobalFlagFalse {Name = "g_p207_Hoehle01_versperrt"},
	},
	Actions = 
	{
		Follow {Target = NpcId, NpcId = 10515},
		Follow {Target = NpcId, NpcId = 10516},
		Follow {Target = NpcId, NpcId = 10517},
		Follow {Target = NpcId, NpcId = 10518},
	}
}



-- Am Anfang gibt es Angriffe auf den Spieler
OnAttackPattern
{
	Name = "1H_A",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 25,		-- sekunden die an jedem punkt gewartet werden
		[1] = 	{	
					X = 253, 
					Y = 416, 
					WalkMode = Run, 
					Direction = East
				},
		[2] = 	{
					X = 211, 
					Y = 405, 
					WalkMode = Run, 
					Direction = East
				},
	},
	PatternDelta = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 15,		-- sekunden die an jedem punkt gewartet werden
		[1] =	{
					X = 308,
					Y = 451,
					WalkMode = Run,
					Direction = East
				},
		[2] = 	{
					X = 270, 
					Y = 452, 
					WalkMode = Run, 
					Direction = East
				},
	},
	PatternOmega = 
	{
		Retries = 3,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = 	{
					X = 308, 
					Y = 451, 
					WalkMode = Run, 
					Direction = SouthEast
				},
		[2] = 	{
					X = 270, 
					Y = 452, 
					WalkMode = Run, 
					Direction = East
				},
		[3] = 	{
					X = 173, 
					Y = 417, 
					WalkMode = Run, 
					Direction = East
				},
		[4] = 	{
					X = 173, 
					Y = 434, 
					WalkMode = Run, 
					Direction = East
				},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = 208, Y = 454, WalkMode = Run, GuardTime = 30},
}

EndDefinition()

end
