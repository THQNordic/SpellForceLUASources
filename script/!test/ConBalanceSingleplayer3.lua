-- ===========================================================================================================
-- ===========================================================================================================
-- ------------------------------   SINGLEPLAYER BALANCING!   ------------------------------------------------
-- ===========================================================================================================
-- ===========================================================================================================

-- TEST:
CategoryName 	= "DorfBauer"			-- << change
DorfBauer = 								-- << change
{
	[1] = { Unit = 1160, Name = "Greyfell_Bauer",		Creo = nil, CatName = CategoryName },
}

CategoryName = "DorfOrk"
DorfOrk = {
	[1] = { Unit = 1161, Name = "Greyfell_Ork",		Creo = nil, CatName = CategoryName },
}

Dorf = 	-- << change
{
	MinUnits = 3, MaxUnits = 15, MixFightsOnly = FALSE,	Distance = 8, UnitsPerRow = 5,
	Challenger = DorfBauer, Opponents =	{ DorfOrk },	-- << 2x change
}



-- ------------------------------------------  GREYFELL P63  ------------------------------------------------
CurrentCreo		= 137	-- human lvl 1		-- << change
CategoryName 	= "MenschenLev1"			-- << change
MenschenLev1 = 								-- << change
{
	[1] = { Unit = 543, Name = "1_Recruit",		Creo = CurrentCreo, CatName = CategoryName },
	[2] = { Unit = 544, Name = "1_Scout",		Creo = CurrentCreo, CatName = CategoryName },
--	[3] = { Unit = 538, Name = "2_Cleric",		Creo = CurrentCreo, CatName = CategoryName },
--	[4] = { Unit = 540, Name = "2_Marksman",	Creo = CurrentCreo, CatName = CategoryName },
--	[5] = { Unit = 537, Name = "3_Armsman",		Creo = CurrentCreo, CatName = CategoryName },
--	[6] = { Unit = 539, Name = "3_Enchanter",	Creo = CurrentCreo, CatName = CategoryName },
--	[7] = { Unit = 542, Name = "3_Paladin",		Creo = CurrentCreo, CatName = CategoryName },
--	[8] = { Unit = 541, Name = "3_Mentalist",	Creo = CurrentCreo, CatName = CategoryName },
--	[9] = { Unit = 1099, Name = "4_Titan",		Creo = CurrentCreo, CatName = CategoryName },
}

CategoryName = "P63"
RtsSpawnNTUnitListP63 = {
	[1] = { Unit = 655, Name = "Unit_655",		Creo = nil, CatName = CategoryName },
	[2] = { Unit = 777, Name = "Unit_777",		Creo = nil, CatName = CategoryName },
	[3] = { Unit = 779, Name = "Unit_779",		Creo = nil, CatName = CategoryName },
	[4] = { Unit = 1161, Name = "Unit_1161",	Creo = nil, CatName = CategoryName },
}

Greyfell = 	-- << change
{
	MinUnits = 3, MaxUnits = 10, MixFightsOnly = FALSE,	Distance = 8, UnitsPerRow = 5,
	Challenger = MenschenLev1, Opponents =	{ RtsSpawnNTUnitListP63 },	-- << 2x change
}


-- ------------------------------------------  LIANNON P1  ------------------------------------------------

-- kein aufbau!


-- ------------------------------------------  ELONI P2  ------------------------------------------------

CurrentCreo		= 138	-- human lvl 2		-- << change
CategoryName 	= "MenschenLev2"			-- << change
MenschenLev2 = 								-- << change
{
	[1] = { Unit = 543, Name = "1_Recruit",		Creo = CurrentCreo, CatName = CategoryName },
	[2] = { Unit = 544, Name = "1_Scout",		Creo = CurrentCreo, CatName = CategoryName },
	[3] = { Unit = 538, Name = "2_Cleric",		Creo = CurrentCreo, CatName = CategoryName },
	[4] = { Unit = 540, Name = "2_Marksman",	Creo = CurrentCreo, CatName = CategoryName },
	[5] = { Unit = 539, Name = "3_Enchanter",	Creo = CurrentCreo, CatName = CategoryName },
	[6] = { Unit = 541, Name = "3_Mentalist",	Creo = CurrentCreo, CatName = CategoryName },
--	[5] = { Unit = 537, Name = "3_Armsman",		Creo = CurrentCreo, CatName = CategoryName },
--	[7] = { Unit = 542, Name = "3_Paladin",		Creo = CurrentCreo, CatName = CategoryName },
--	[9] = { Unit = 1099, Name = "4_Titan",		Creo = CurrentCreo, CatName = CategoryName },
}

CategoryName = "P2"
RtsSpawnNTUnitListP2 = {
	[1] = { Unit = 262, Name = "Unit_262",		Creo = nil, CatName = CategoryName },
	[2] = { Unit = 266, Name = "Unit_266",		Creo = nil, CatName = CategoryName },
	[3] = { Unit = 686, Name = "Unit_686",		Creo = nil, CatName = CategoryName },
	[4] = { Unit = 687, Name = "Unit_687",		Creo = nil, CatName = CategoryName },
	[5] = { Unit = 689, Name = "Unit_689",		Creo = nil, CatName = CategoryName },
	[6] = { Unit = 690, Name = "Unit_690",		Creo = nil, CatName = CategoryName },
	[7] = { Unit = 706, Name = "Unit_706",		Creo = nil, CatName = CategoryName },
	[8] = { Unit = 777, Name = "Unit_777",		Creo = nil, CatName = CategoryName },
	[9] = { Unit = 779, Name = "Unit_779",		Creo = nil, CatName = CategoryName },
	[10] = { Unit = 783, Name = "Unit_783",		Creo = nil, CatName = CategoryName },
	[11] = { Unit = 784, Name = "Unit_784",		Creo = nil, CatName = CategoryName },
	[12] = { Unit = 884, Name = "Unit_884",		Creo = nil, CatName = CategoryName },
	[13] = { Unit = 885, Name = "Unit_885",		Creo = nil, CatName = CategoryName },
	[14] = { Unit = 895, Name = "Unit_895",		Creo = nil, CatName = CategoryName },
	[15] = { Unit = 1156, Name = "Unit_1156",	Creo = nil, CatName = CategoryName },
	[16] = { Unit = 1157, Name = "Unit_1157",	Creo = nil, CatName = CategoryName },
}

Eloni = -- << change
{
	MinUnits = 3, MaxUnits = 10, MixFightsOnly = FALSE,	Distance = 8, UnitsPerRow = 5,
	Challenger = MenschenLev2, Opponents =	{ RtsSpawnNTUnitListP2 },	-- << 2x change
}


-- ------------------------------------------  LEAFSHADE P4  ------------------------------------------------

CurrentCreo		= 139	-- human lvl 3		-- << change
CategoryName 	= "MenschenLev3"			-- << change
MenschenLev3 = 								-- << change
{
	[1] = { Unit = 543, Name = "1_Recruit",		Creo = CurrentCreo, CatName = CategoryName },
	[2] = { Unit = 544, Name = "1_Scout",		Creo = CurrentCreo, CatName = CategoryName },
	[3] = { Unit = 538, Name = "2_Cleric",		Creo = CurrentCreo, CatName = CategoryName },
	[4] = { Unit = 540, Name = "2_Marksman",	Creo = CurrentCreo, CatName = CategoryName },
	[5] = { Unit = 537, Name = "3_Armsman",		Creo = CurrentCreo, CatName = CategoryName },
	[6] = { Unit = 539, Name = "3_Enchanter",	Creo = CurrentCreo, CatName = CategoryName },
	[7] = { Unit = 542, Name = "3_Paladin",		Creo = CurrentCreo, CatName = CategoryName },
	[8] = { Unit = 541, Name = "3_Mentalist",	Creo = CurrentCreo, CatName = CategoryName },
	[9] = { Unit = 1099, Name = "4_Titan",		Creo = CurrentCreo, CatName = CategoryName },
}

CategoryName = "P4"
RtsSpawnNTUnitListP4 = {
	[1] = { Unit = 265, Name = "Unit_265",		Creo = nil, CatName = CategoryName },
	[2] = { Unit = 267, Name = "Unit_267",		Creo = nil, CatName = CategoryName },
	[3] = { Unit = 658, Name = "Unit_658",		Creo = nil, CatName = CategoryName },
	[4] = { Unit = 667, Name = "Unit_667",		Creo = nil, CatName = CategoryName },
	[5] = { Unit = 743, Name = "Unit_743",		Creo = nil, CatName = CategoryName },
	[6] = { Unit = 779, Name = "Unit_779",		Creo = nil, CatName = CategoryName },
	[7] = { Unit = 784, Name = "Unit_784",		Creo = nil, CatName = CategoryName },
	[8] = { Unit = 831, Name = "Unit_831",		Creo = nil, CatName = CategoryName },
	[9] = { Unit = 832, Name = "Unit_832",		Creo = nil, CatName = CategoryName },
	[10] = { Unit = 838, Name = "Unit_838",		Creo = nil, CatName = CategoryName },
	[11] = { Unit = 851, Name = "Unit_851",		Creo = nil, CatName = CategoryName },
	[12] = { Unit = 852, Name = "Unit_852",		Creo = nil, CatName = CategoryName },
	[13] = { Unit = 884, Name = "Unit_884",		Creo = nil, CatName = CategoryName },
	[14] = { Unit = 895, Name = "Unit_895",		Creo = nil, CatName = CategoryName },
	[15] = { Unit = 1156, Name = "Unit_1156",	Creo = nil, CatName = CategoryName },
	[16] = { Unit = 1176, Name = "Unit_1176",	Creo = nil, CatName = CategoryName },
}

Leafshade = -- << change
{
	MinUnits = 3, MaxUnits = 10, MixFightsOnly = FALSE,	Distance = 8, UnitsPerRow = 5,
	Challenger = MenschenLev3, Opponents =	{ RtsSpawnNTUnitListP3 },	-- << 2x change
}

-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------
-- ------------------------------------------  . P  ------------------------------------------------

