--------------------------------------------------------
--
--	Mumien erster Teil
--
--------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- so lange der Teil des Lagers steht respawnen 
Respawn
{
	X = g_P206_ErsterMumienX, Y = g_P206_ErsterMumienY, NoSpawnEffect = TRUE, WaitTime = 169,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P206_MumienAbschnittEinsKaputt"},
	},
	Actions = 
	{
		Follow {Target = NpcId, NpcId = 9278},
		Follow {Target = NpcId, NpcId = 9279},
		Follow {Target = NpcId, NpcId = 9280},
		Follow {Target = NpcId, NpcId = 9281},
		Follow {Target = NpcId, NpcId = 9282},
		Follow {Target = NpcId, NpcId = 9283},
	}
}



-- Hinein in den Canyon
OnAttackPattern
{
	Name = "AP1_MUM",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 2,		
		GuardTime = 4,		
		[1] = {X = g_P206_SchluchtPortalX, Y = g_P206_SchluchtPortalY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_SchluchtTorX, Y = g_P206_SchluchtTorY, WalkMode = Run, Direction = East},
	},
	PatternDelta = 
	{
		Retries = 5,		
		GuardTime = 20,		
		[1] = {X = g_P206_EingangSchluchtX, Y = g_P206_EingangSchluchtY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_SchluchtTorX, Y = g_P206_SchluchtTorY, WalkMode = Run, Direction = East},
	},
	PatternOmega = 
	{
		Retries = 3,		
		GuardTime = 50,		
		[1] = {X = g_P206_EingangSchluchtX, Y = g_P206_EingangSchluchtY, WalkMode = Run, Direction = SouthEast},
		[2] = {X = g_P206_SchluchtPortalX, Y = g_P206_SchluchtPortalY, WalkMode = Run, Direction = East},
		[3] = {X = g_P206_SchluchtTorX, Y = g_P206_SchluchtTorY, WalkMode = Run, Direction = East},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = g_P206_EingangSchluchtX, Y = g_P206_EingangSchluchtY, WalkMode = Run, GuardTime = 30},
}



EndDefinition()

end
