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
	X = g_P206_VierterTrakanX, Y = g_P206_VierterTrakanY, NoSpawnEffect = TRUE, WaitTime = 377,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P206_TraAbschnittVierKaputt"},
	},
	Actions = 
	{
		Follow {Target = NpcId, NpcId = 8735},
		Follow {Target = NpcId, NpcId = 8737},
		Follow {Target = NpcId, NpcId = 8736},
		Follow {Target = NpcId, NpcId = 8719},
		Follow {Target = NpcId, NpcId = 8729},
		Follow {Target = NpcId, NpcId = 8730},
		Follow {Target = NpcId, NpcId = 8731},
	}
}

-- Am Anfang gibt es Angriffe auf den Spieler
OnAttackPattern
{
	Name = "4AP1_TRA",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 30,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_OestlicherSammelpunktX, Y = g_P206_OestlicherSammelpunktY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_ErsterStreunerWPX, Y = g_P206_ErsterStreunerWPY, WalkMode = Run, Direction = East},
	},
	PatternDelta = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_OestlicherSammelpunktX, Y = g_P206_OestlicherSammelpunktY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_ZweiterStreunerWPX, Y = g_P206_ZweiterStreunerWPY, WalkMode = Run, Direction = East},
	},
	PatternOmega = 
	{
		Retries = 3,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_OestlicherSammelpunktX, Y = g_P206_OestlicherSammelpunktY, WalkMode = Run, Direction = SouthEast},
		[2] = {X = g_P206_SeelensteinX, Y = g_P206_SeelensteinY, WalkMode = Run, Direction = East},
		[3] = {X = g_P206_MonumentX, Y = g_P206_MonumentY, WalkMode = Run, Direction = East},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY, WalkMode = Run, GuardTime = 30},
}

-- Wenn Trokan tot ist werden die Jungs in Trakans Lager angegriffen
OnAttackPattern
{
	Name = "4AP2_TRA",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_ZweiterTrokanX, Y = g_P206_ZweiterTrokanY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY, WalkMode = Run, Direction = East},
	},
	PatternDelta = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_OestlicherLagereingangX, Y = g_P206_OestlicherLagereingangY, WalkMode = Run, Direction = East},
	},
	PatternOmega = 
	{
		Retries = 3,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_ZweiterTrokanX, Y = g_P206_ZweiterTrokanY, WalkMode = Run, Direction = SouthEast},
		[2] = {X = g_P206_OestlicherLagereingangX, Y = g_P206_OestlicherLagereingangY, WalkMode = Run, Direction = East},
		[3] = {X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY, WalkMode = Run, Direction = East},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY, WalkMode = Run, GuardTime = 30},
}

EndDefinition()

end
