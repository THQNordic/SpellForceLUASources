function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

---------------------------------------------------------------------------
-- Spawnen, wenn die Tore sich Öffnen, nachdem die Türme zerstört wurden --
---------------------------------------------------------------------------

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_p207_Erste_Festung_Tore_Offen"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "1F_A"},
	},
}

-- Am Anfang gibt es Angriffe auf den Spieler
OnAttackPattern
{
	Name = "1F_A",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 25,		-- sekunden die an jedem punkt gewartet werden
		[1] = 	{	
					X = 185, 
					Y = 334, 
					WalkMode = Run, 
					Direction = East
				},
		[2] = 	{
					X = 246, 
					Y = 398, 
					WalkMode = Run, 
					Direction = East
				},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = 208, Y = 454, WalkMode = Run, GuardTime = 30},
}

EndDefinition()

end
