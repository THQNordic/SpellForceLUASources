--------------------------------------------------------
--
--	Mumien Zweiter Teil
--
--------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- so lange der Teil des Lagers steht respawnen 
Respawn
{
	X = g_P206_ZweiterMumienX, Y = g_P206_ZweiterMumienY, NoSpawnEffect = TRUE, WaitTime = 169,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P206_MumienAbschnittDreiKaputt"},
	},
	Actions = 
	{
		Follow {Target = NpcId, NpcId = 9285},
		Follow {Target = NpcId, NpcId = 9286},
		Follow {Target = NpcId, NpcId = 9287},
		Follow {Target = NpcId, NpcId = 9288},
		Follow {Target = NpcId, NpcId = 9289},
		Follow {Target = NpcId, NpcId = 9290},
		Follow {Target = NpcId, NpcId = 9291},
	}
}



-- Am Anfang gibt es Angriffe auf den Spieler
OnAttackPattern
{
	Name = "AP2_MUM",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 1,		
		GuardTime = 5,		
		[1] = {X = g_P206_SchluchtTorX, Y = g_P206_SchluchtTorY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_EingangSchluchtX, Y = g_P206_EingangSchluchtY, WalkMode = Run, Direction = East},
	},
	PatternDelta = 
	{
		Retries = 3,		
		GuardTime = 40,		
		[1] = {X = g_P206_EingangSchluchtX, Y = g_P206_EingangSchluchtY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_SchluchtTorX, Y = g_P206_SchluchtTorY, WalkMode = Run, Direction = East},
	},
	PatternOmega = 
	{
		Retries = 2,		
		GuardTime = 10,		
		[1] = {X = g_P206_EingangSchluchtX, Y = g_P206_EingangSchluchtY, WalkMode = Run, Direction = SouthEast},
		[2] = {X = g_P206_SchluchtTorX, Y = g_P206_SchluchtTorY, WalkMode = Run, Direction = East},
		[3] = {X = g_P206_SchluchtPortalX, Y = g_P206_SchluchtPortalY, WalkMode = Run, Direction = East},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = g_P206_SchluchtTorX, Y = g_P206_SchluchtTorY, WalkMode = Run, GuardTime = 30},
}



EndDefinition()

end
