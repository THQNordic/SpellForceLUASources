--------------------------------------------------------
--
--	Mumien dritter Teil
--
--------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- so lange der Teil des Lagers steht respawnen 
Respawn
{
	X = g_P206_DritterMumienX, Y = g_P206_DritterMumienY, NoSpawnEffect = TRUE, WaitTime = 169,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P206_MumienAbschnittDreiKaputt"},
	},
	Actions = 
	{
		Follow {Target = NpcId, NpcId = 9293},
		Follow {Target = NpcId, NpcId = 9294},
		Follow {Target = NpcId, NpcId = 9295},
		Follow {Target = NpcId, NpcId = 9296},
		Follow {Target = NpcId, NpcId = 9297},
		Follow {Target = NpcId, NpcId = 9298},
		Follow {Target = NpcId, NpcId = 9299},
		Follow {Target = NpcId, NpcId = 9300},
	}
}



-- Am Anfang gibt es Angriffe auf den Spieler
OnAttackPattern
{
	Name = "AP3_MUM",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 2,		
		GuardTime = 3,		
		[1] = {X = g_P206_EingangSchluchtX, Y = g_P206_EingangSchluchtY, WalkMode = Run, Direction = East},
		[2] = {X = g_P206_SchluchtPortalX, Y = g_P206_SchluchtPortalY, WalkMode = Run, Direction = East},
	},
	PatternDelta = 
	{
		Retries = 1,		
		GuardTime = 10,		
		[1] = {X = g_P206_SchluchtPortalX, Y = g_P206_SchluchtPortalY, WalkMode = Run, Direction = East},
		
	},
	PatternOmega = 
	{
		Retries = 3,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = g_P206_SchluchtPortalX, Y = g_P206_SchluchtPortalY, WalkMode = Run, Direction = SouthEast},
		[2] = {X = g_P206_EingangSchluchtX, Y = g_P206_EingangSchluchtY, WalkMode = Run, Direction = East},
		[3] = {X = g_P206_SchluchtPortalX, Y = g_P206_SchluchtPortalY, WalkMode = Run, Direction = East},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = g_P206_SchluchtPortalX, Y = g_P206_SchluchtPortalY, WalkMode = Run, GuardTime = 30},
}

EndDefinition()

end
