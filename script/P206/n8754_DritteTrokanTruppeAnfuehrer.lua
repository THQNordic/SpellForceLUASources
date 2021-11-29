--------------------------------------------------------
--
--	Trokans Truppen
--
--------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- so lange der Teil des Lagers steht respawnen 
Respawn
{
	X = g_P206_DritterTrokanX, Y = g_P206_DritterTrokanY, NoSpawnEffect = FALSE, WaitTime = 666,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P206_TroAbschnittDreiKaputt"},
	},
	Actions = 
	{
		Follow {Target = NpcId, NpcId = 8774},
		Follow {Target = NpcId, NpcId = 8772},
		Follow {Target = NpcId, NpcId = 8771},
		Follow {Target = NpcId, NpcId = 8765},
		Follow {Target = NpcId, NpcId = 8766},
		Follow {Target = NpcId, NpcId = 8767},
		Follow {Target = NpcId, NpcId = 8761},
		Follow {Target = NpcId, NpcId = 8755},
		Follow {Target = NpcId, NpcId = 8753},
	}
}

-- Change Race auf Feindliche Dervische wenn der Boss tot ist
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_TrokanTot"}
	},
	Actions = 
	{
		ChangeRace {Race = 209}
	}
}

-- Am Anfang gibt es Angriffe auf den Spieler
OnAttackPattern
{
	Name = "3AP1_TRO",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 120,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_WestlicherLagereingangX, Y = g_P206_WestlicherLagereingangY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_ZweiterStreunerWPX, Y = g_P206_ZweiterStreunerWPY, WalkMode = Run, Direction = East},
	},
	PatternDelta = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_DritterStreunerWPX, Y = g_P206_DritterStreunerWPY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_SeelensteinX, Y = g_P206_SeelensteinY, WalkMode = Run, Direction = East},
		
	},
	PatternOmega = 
	{
		Retries = 3,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_WestlicherLagereingangX, Y = g_P206_WestlicherLagereingangY, WalkMode = Run, Direction = SouthEast},
		[2] = {X = g_P206_SeelensteinX, Y = g_P206_SeelensteinY, WalkMode = Run, Direction = East},
		[3] = {X = g_P206_MonumentX, Y = g_P206_MonumentY, WalkMode = Run, Direction = East},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = g_P206_DritterTrokanX, Y = g_P206_DritterTrokanY, WalkMode = Run, GuardTime = 30},
}

-- Wenn Trokan tot ist werden die Jungs in Trakans Lager angegriffen
OnAttackPattern
{
	Name = "3AP2_TRO",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_ZweiterTrakanX, Y = g_P206_ZweiterTrakanY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY, WalkMode = Run, Direction = East},
	},
	PatternDelta = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_OestlicherLagereingangX, Y = g_P206_OestlicherLagereingangY, WalkMode = Run, Direction = East},
	},
	PatternOmega = 
	{
		Retries = 3,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_ZweiterTrakanX, Y = g_P206_ZweiterTrakanY, WalkMode = Run, Direction = SouthEast},
		[2] = {X = g_P206_OestlicherLagereingangX, Y = g_P206_OestlicherLagereingangY, WalkMode = Run, Direction = East},
		[3] = {X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY, WalkMode = Run, Direction = East},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = g_P206_DritterTrokanX, Y = g_P206_DritterTrokanY, WalkMode = Run, GuardTime = 30},
}

EndDefinition()

end
