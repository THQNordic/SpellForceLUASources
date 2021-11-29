function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-----------------------------------------------------------
-- Spawnen, wenn Alyha durch die Höhlen verschwunden ist --
-----------------------------------------------------------

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		--UND
		--(
		--IsGlobalFlagTrue {Name = "g_p207_Erste_Festung_Truppe_NW_Dead"},
		--IsGlobalFlagTrue {Name = "g_p207_Erste_Festung_Truppe_NW_Spawned"}
		--),
		IsGlobalFlagTrue {Name = "g_p207_Erste_Festung_Tore_Offen"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "1F_NA"},
	},
}

-- Am Anfang gibt es Angriffe auf den Spieler
OnAttackPattern
{
	Name = "1F_NA",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 5,		-- sekunden die an jedem punkt gewartet werden
		[1] = 	{	
					X = 185, 
					Y = 318, 
					WalkMode = Run, 
					Direction = North
				},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = 185, Y = 333, WalkMode = Run, GuardTime = 30},
}

EndDefinition()

end
