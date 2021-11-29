--------------------------------------------------------
--
--	Trakans Truppen Gruppe eins der Anführer
--
--------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- so lange der Teil des Lagers steht respawnen 
Respawn
{
	X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY, NoSpawnEffect = TRUE, WaitTime = 311,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P206_TraAbschnittEinsKaputt"},
	},
	Actions = 
	{
		Follow {Target = NpcId, NpcId = 8749},
		Follow {Target = NpcId, NpcId = 8745},
		Follow {Target = NpcId, NpcId = 8748},
		Follow {Target = NpcId, NpcId = 8744},
	}
}


-- Am Anfang gibt es Angriffe auf den Spieler
OnAttackPattern
{
	Name = "AP1_TRA",			-- muss unique sein, sollte kurz sein...
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
		[2] = {X = g_P206_SeelensteinX, Y = g_P206_SeelensteinY, WalkMode = Run, Direction = East},
	},
	PatternOmega = 
	{
		Retries = 3,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_OestlicherSammelpunktX, Y = g_P206_OestlicherSammelpunktY, WalkMode = Run, Direction = SouthEast},
		[2] = {X = g_P206_OestlicherLagereingangX, Y = g_P206_OestlicherLagereingangY, WalkMode = Run, Direction = East},
		[3] = {X = g_P206_MonumentX, Y = g_P206_MonumentY, WalkMode = Run, Direction = East},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY, WalkMode = Run, GuardTime = 30},
}

-- Wenn Trokan tot ist werden die Jungs in Trakans Lager angegriffen
OnAttackPattern
{
	Name = "AP2_TRA",			-- muss unique sein, sollte kurz sein...
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
	CommonGoal = {X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY, WalkMode = Run, GuardTime = 30},
}

EndDefinition()

end
