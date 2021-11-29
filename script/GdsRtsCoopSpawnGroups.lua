-- Definition der Spawngruppen als Tabelle

-- momentaner building range ist 15, also vom spawnpunkt aus dürfen gebäude bis 15 felder entfernt sein
-- um noch zum jeweiligen spawncamp zu gehören...
-- spawncamps sollten mind. ca. 25 felder voneinander entfernt sein, da es sonst zu problemen kommen kann wenn
-- sie zu nahe zusammen liegen (gebäude werden ja entfernt wenn ein camp mal nicht aktiv ist, was u.U. alle gebäude
-- des anderen camps entfernen würde)

-- bitte keine spawnwaves machen die bei 0 minuten anfängt, das wird nicht funktionieren...

-- es können beliebig viele Gruppen angelegt werden
-- die Gruppen werden (auch im Editor) anhand ihrer ID sortiert
-- die IDs müssen zusammenhängend sein und keine lücken aufweisen (also 1, 2, 5 würde nicht gehen!)
-- die IDs dürfen sich auch nicht in der Nummerierung ändern, denn sonst würden sich die spawngruppen
-- auf bereits editierten karten ändern und damit auch das gesamte balancing...
-- aber man könnte sich dummies anlegen, um die gruppen trotzdem einigermassen geordnet zu haben,
-- z.b. die ersten 10 IDs vorsehen für gegner level 1-5, die nächsten 10 für gegner level 6-10 usw.

return
{
	[01] = {
		-- Wenn man als Gruppe Random zuweist, wird scripttechnisch per zufall eine der existierenden
		-- gruppen ausgewählt. So wie ich sehen konnte ist die "zufällige" Gruppe allerdings bei gleichen
		-- Voraussetzungen (skill level, spielerzahl) immer dieselbe.
		Name = "Random",
		LevelRange = "Random",
	},
	[02] = {
		Name = "Grim Reaper",
		LevelRange = "RIP",
		Goal = GoalCoopAggressive,
		MaxClanSize = 4, 
		Init	= {788}, 	-- die units, die zu beginn der karte gespawned sein sollen
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste = auswahl, es wird per zufall eine aus der liste gespawned
			[3]		= {Minutes = 5, Units = {788}},
		},
	},
	[03] = {
		Name = "Animal Tiny Spiders",
		LevelRange = "01",
		Goal = GoalCoopAggressive,
		MaxClanSize = 80,
		Init	= {750, 750, 750, 750}, 	-- spider
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]		= {Seconds = 15, Units = {750}},
		},
	},
	[04] = {
		Name = "Minotaur very easy",
		LevelRange = "03",
		Goal = GoalCoopAggressive,
		MaxClanSize = 40,
		Init	= {1165,1165,1165,1165}, 	-- mino
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]		= {Minutes = 0.25, Units = {1165}},
		},
	},
	[05] = {
		Name = "Animal Giant Bugs",
		LevelRange = "08",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {1002,1002,1002,1002}, 	-- bugs
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]		= {Minutes = 0.5, Units = {1002}},
		},
	},
	[06] = {
		Name = "Goblin Brown easy 1",
		LevelRange = "01",
		Goal = GoalCoopAggressive,
		MaxClanSize = 5, 
		Init	= {777, 777, 777, 779, 779}, 	-- die units, die zu beginn der karte gespawned sein sollen
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[2]	= {Minutes = 1.5, Units = {777}},
			[2]	= {Minutes = 1, Units = {779}},
		},
	},
	[07] = {
		Name = "Goblin Green easy 1",
		LevelRange = "01-03",
		Goal = GoalCoopAggressive,
		MaxClanSize = 5, 
		Init	= {262, 262, 838, 838}, 	-- die units, die zu beginn der karte gespawned sein sollen
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2, Units = {784}},
			[5]	= {Minutes = 1, Units = {783}},			
		},
	},
	[08] = {
		Name = "Goblin Green medium 1",
		LevelRange = "03",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {838, 838, 838, 838, 838, 838, 267}, 	-- die units, die zu beginn der karte gespawned sein sollen
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {838}},
			[5]	= {Minutes = 2, Units = {838}},
			[6]	= {Minutes = 1.5, Units = {265}},
			[8]	= {Minutes = 0.66, Units = {838}},
			[10] = {Minutes = 1, Units = {265}},
		},
	},
	[09] = {
		Name = "Goblin Brown medium 1",
		LevelRange = "03",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {658, 658, 658, 667, 667}, 	-- die units, die zu beginn der karte gespawned sein sollen
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {658}},
			[5]	= {Minutes = 2, Units = {667}},
			[6]	= {Minutes = 1.5, Units = {658}},
			[8]	= {Minutes = 0.66, Units = {667}},
		},
	},
	[10] = {
		Name = "Trolls medium 1",
		LevelRange = "03-05",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {1594, 1595, 1596}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1594	Troll Urok 3 Destroyer AO
		--	1595	Troll Urok 4 Devastator AO
		--	1596	Troll Urok 5 Champion AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 2.5, Units = {1594}},
			[20]	= {Minutes = 1.5, Units = {1594, 1595}},
		},
	},
	[11] = {
		Name = "Demons lesser 1",
		LevelRange = "12",
		Goal = GoalCoopAggressive,
		MaxClanSize = 5, 
		Init	= {178, 1013}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	178		Demon Lesser 12 Melee
		--	1013	Demon Lesser 12 Fireball
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[15]	= {Minutes = 5, Units = {178}},
			[30]	= {Minutes = 5, Units = {1013}},
		},
	},
	[12] = {
		Name = "Skeletons lesser 1",
		LevelRange = "05",
		Goal = GoalCoopAggressive,
		MaxClanSize = 6, 
		Init	= {1996, 1997}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1997	Skeleton Lesser 3 Bow AO
		--	1998	Skeleton Lesser 3 Lifetap AO
		--	1999	Skeleton Lesser 3 Speer AO
		--	1996 	Skeleton Lesser 3 Stachelkeule AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 2.5, Units = {1996, 1997, 1998, 1997}},
			[20]	= {Minutes = 1.5, Units = {1996, 1997, 1998, 1997}},
		},
	},
	[13] = {
		Name = "Orks medium 1",
		LevelRange = "04 +07",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {370, 370, 369, 369, 370}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	370 Orc Grarg 4 Fighter
		-- 	369 Orc Grarg 4 Firemaster
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[5]	= {Minutes = 2.5, Units = {370, 369}},
			[10]	= {Minutes = 3, Units = {369, 370}},
			[15]	= {Minutes = 1.5, Units = {370, 369}},
			[20] = {Minutes = 1, Units = {370, 369}},
		},
	},

	[14] = {
		Name = "Orks medium 2",
		LevelRange = "04",
		Goal = GoalCoopAggressive,
		MaxClanSize = 5, 
		Init	= {370, 370}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	370 	Orc Grarg 4 Fighter
		-- 	369 	Orc Grarg 4 Firemaster
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {370}},
			[6]	= {Minutes = 1.5, Units = {370, 370, 369}},			
		},
	},
	[15] = {
		Name = "Screamer medium 1",
		LevelRange = "8-9",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {1882, 1883, 1882, 1883, 1882, 1883}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1882	Screamer 8 Hypnotize AO
		-- 	1883	Screamer 8 Manadrain AO
		-- 	1881	Screamer 9 Decay AO
		--	1880	Screamer 9 Pain AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {1882, 1883}},
			[20]	= {Minutes = 3.5, Units = {1882, 1883}},
			[30]	= {Minutes = 3, Units = {1882, 1883, 1881}},
			[45] 	= {Minutes = 3, Units = {1882, 1883, 1881, 1880}},
		},
	},
	[16] = {
		Name = "Spectre medium 1",
		LevelRange = "9",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {296, 294, 295, 296, 294, 295}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	296		Spectre 9 Amok
		-- 	294		Spectre 9 Manadrain
		-- 	295		Spectre 9 Shock
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {296, 294, 295}},
			[20]	= {Minutes = 3.5, Units = {296, 294, 295}},
			[30]	= {Minutes = 3, Units = {296, 294, 295}},
			[45]	= {Minutes = 3, Units = {296, 294, 295}},
		},
	},
	[17] = {
		Name = "DarkElfe Fire medium 1",
		LevelRange = "8-9",
		Goal = GoalCoopAggressive,
		MaxClanSize = 11, 
		Init	= {1503, 1505, 1507}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1503	DarkElf Fire Assassin 8 AO
		-- 	1505	DarkElf Fire Darkblade 8 AO
		--	1507	DarkElf Fire Deathknight 9 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[5]	= {Minutes = 2, Units = {1503}},
			[12]	= {Minutes = 1.5, Units = {1505, 1507}},
			[25]	= {Minutes = 1, Units = {1507}},
			
		},
	},
	[18] = {
		Name = "Demon low 1",
		LevelRange = "12",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {178, 178, 178, 1013, 179}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	178		Demon Lesser 12 Melee
		-- 	1013	Demon Lesser 12 Fireball
		--	179		Demon Lesser 12 Wave of Fire
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[5]	= {Minutes = 2.5, Units = {178}},
			[10]	= {Minutes = 2, Units = {178}},
			[20]	= {Minutes = 1.5, Units = {1013}},
			[30] = {Minutes = 1, Units = {179}},
		},
	},
	[19] = {
		Name = "Demon high 1",
		LevelRange = "20 +25",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {1307, 1306, 186, 185, 185}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	186		Demon Greater 20 Fire Elemental
		-- 	185		Demon Greater 20 Wave of Fire
		--	1307	Demon Greater 25 Aura of Lifetap
		--	1306	Demon Greater 25 Extinct
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[5]	= {Minutes = 2.5, Units = {186}},
			[10]	= {Minutes = 2, Units = {185}},
			[20]	= {Minutes = 1.5, Units = {186}},
			[30] = {Minutes = 1, Units = {185}},
		},
	},		
	[20] = {
		Name = "Skeleton AO 1",
		LevelRange = "15-16",
		Goal = GoalCoopAggressive,
		MaxClanSize = 13, 
		Init	= {1730, 1686, 1730}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1730	Skeleton Normal 15 Naginata AO
		-- 	1686	Skeleton Normal 16 Haemator AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[5]	= {Minutes = 3, Units = {1730, 1686}},
			[10]	= {Minutes = 2, Units = {1730, 1686}},
			[20]	= {Minutes = 1.5, Units = {1730, 1686}},
			[35]	= {Minutes = 1, Units = {1730, 1686}},
		},
	},	
	[21] = {
		Name = "Werewolf high 1",
		LevelRange = "7-9",
		Goal = GoalCoopAggressive,
		MaxClanSize = 14, 
		Init	= {1639, 1640, 1662, 1639}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1639	Werewolf 7 AO
		-- 	1640	Werewolf 9 AO
		--	1662	Werewolf 9 Pain AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1639, 1640, 1662}},
			[20]	= {Minutes = 3, Units = {1639, 1640, 1662}},
			[30]	= {Minutes = 2.5, Units = {1639, 1640, 1662}},
			[45] 	= {Minutes = 2.5, Units = {1639, 1640, 1662}},
			[60] 	= {Minutes = 2, Units = {1639, 1640, 1662}},
		},
	},
	[22] = {
		Name = "Basilisk high",
		LevelRange = "23",
		Goal = GoalCoopAggressive,
		MaxClanSize = 12, 
		Init	= {1282, 1282, 1282, 1282, 1282}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1282	Basilisk 23
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[5]	= {Minutes = 3.5, Units = {1282}},
			[15]	= {Minutes = 3, Units = {1282}},
			[25]	= {Minutes = 2.5, Units = {1282}},
			[35] = {Minutes = 2, Units = {1282}},
		},
	},	
	[23] = {
		Name = "Orks medium 3",
		LevelRange = "7",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {376, 376, 376}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	376 	Orc Grarg 7 Messenger
		--	377		Orc Grarg 8 Wise One
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {376}},
			[5]	= {Minutes = 2, Units = {377}},
			[10] = {Minutes = 1, Units = {377}},
		},
	},	
	[24] = {
		Name = "Orks medium 4",
		LevelRange = "6",
		Goal = GoalCoopAggressive,
		MaxClanSize = 5, 
		Init	= {1233, 740}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1233	Orc Fist 6 Veteran
		--	740 	Orc Fist 6 Feuerteufel		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {1233}},
			[5]	= {Minutes = 2, Units = {1233}},
		},
	},
	[25] = {
		Name = "Skeletons medium 1",
		LevelRange = "15-16",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {1729, 1729, 1729, 1685, 1685, 1730, 1686}, 	-- die units, die zu beginn der karte gespawned sein sollen
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {1729}},
			[5]	= {Minutes = 2, Units = {1685}},
			[6]	= {Minutes = 1.5, Units = {1730}},
			[8]	= {Minutes = 0.66, Units = {1686}},
		},
	},	
	[26] = {
		Name = "Waldschrat Medium 1 +Blutesche",
		LevelRange = "7 +16",
		Goal = GoalCoopAggressive,
		MaxClanSize = 17, 
		Init	= {1493, 1493, 1493, 1493, 1493}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1493	Waldschrat 7 AO
		--	1915	Blutesche 16 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1493}},
			[20]	= {Minutes = 3, Units = {1493}},
			[30]	= {Minutes = 3, Units = {1493}},
			[45]	= {Minutes = 2.5, Units = {1493}},
			[60]	= {Minutes = 15, Units = {1915}},
		},
	},	
	[27] = {
		Name = "Kithar Medium 1",
		LevelRange = "7-8",
		Goal = GoalCoopAggressive,
		MaxClanSize = 17, 
		Init	= {1489, 1488, 1489, 1488, 1489}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1489	Kithar 7 AO
		--	1488	Kithar 8 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1489, 1488}},
			[20]	= {Minutes = 3, Units = {1489, 1488}},
			[30]	= {Minutes = 3, Units = {1489, 1488}},
			[45]	= {Minutes = 2.5, Units = {1489, 1488}},
		},
	},	
	[28] = {
		Name = "Succubus medium 1 many",
		LevelRange = "14",
		Goal = GoalCoopAggressive,
		MaxClanSize = 8, 
		Init	= {2044, 2045, 2044, 2045}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2044		Succubus 9 Fireball
		--	2045		Succubus 9 Shock
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2044, 2045}},
			[20]	= {Minutes = 3, Units = {2044, 2045}},
			[30]	= {Minutes = 2.5, Units = {2044, 2045}},
			[45]	= {Minutes = 2, Units = {2044, 2045}},
			
		},
	},		
	[29] = {
		Name = "Zombies medium 1 many",
		LevelRange = "10",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {226, 226}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	226		Zombie 10 Rotting Fist
		--	227		Zombie 10 Säbel
				
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {226, 227}},
			[20]	= {Minutes = 3, Units = {226, 227}},
			[30]	= {Minutes = 2.5, Units = {226, 227}},
			[45]	= {Minutes = 2, Units = {226, 227}},
		},
	},	
	[30] = {
		Name = "Wrait low 1",
		LevelRange = "9",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {280, 281, 280, 281}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	280		Wraith 9 Lifetap
		--	281		Wraith 9 Sense
				
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {280, 281}},
			[20]	= {Minutes = 3, Units = {280, 281}},
			[20]	= {Minutes = 2.5, Units = {280, 281}},
			[45]	= {Minutes = 2, Units = {280, 281}},
		},
	},			
	[31] = {
		Name = "Brannigans Orcs medium 1",
		LevelRange = "9 +12",
		Goal = GoalCoopAggressive,
		MaxClanSize = 30, 
		Init	= {673, 741, 741, 741, 741}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	673		UniqueOrc The Assassin 12
		--	741		Orc Fist 9 Klingenwirbler
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3, Units = {741}},
			[20]	= {Minutes = 2.5, Units = {741}},
			[30]	= {Minutes = 2, Units = {741}},
			[45]	= {Minutes = 1.5, Units = {741}},
		},
	},
	[32] = {
		Name = "Demon Lesser 1",
		LevelRange = "13",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {1013, 178, 179, 178}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1013	Demon Lesser 12 Fireball
		--	178		Demon Lesser 12 Melee
		--	179		Demon Lesser 12 Wave of Fire				
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {1013, 178, 179}},
			[20]	= {Minutes = 3.5, Units = {1013, 178, 179}},
			[30]	= {Minutes = 3, Units = {1013, 178, 179}},
			[45]	= {Minutes = 2.5, Units = {1013, 178, 179}},
		},
	},
	[33] = {
		Name = "Golems Ice",
		LevelRange = "10",
		Goal = GoalCoopAggressive,
		MaxClanSize = 8, 
		Init	= {117, 1485}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	117		Golem Ice 20 Freeze
		--	1485	Golem Ice 20 Iceburst
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {117,1485}},
			[20]	= {Minutes = 3.5, Units = {117,1485}},
			[30]	= {Minutes = 3, Units = {117,1485}},
			[45]	= {Minutes = 2.5, Units = {117,1485}},
			},
	},
	[34] = {
		Name = "Taods high 1",
		LevelRange = "7 +20",
		Goal = GoalCoopAggressive,
		MaxClanSize = 30, 
		Init	= {1658, 1499, 1499}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1658	Toad 20 AO
		--	1499	Toad 7 AO				
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1499}},
			[20]	= {Minutes = 3, Units = {1499}},
			[30]	= {Minutes = 2.5, Units = {1499}},
			[45]	= {Minutes = 2, Units = {1499}},
			},
	},
	[35] = {
		Name = "Northland Trolls high 1",
		LevelRange = "15",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {451, 453, 452}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	451		Troll Nordland 15 Bouncer	
		--	453		Troll Nordland 15 Destroyer
		--	452		Troll Nordland 15 Devastator
		--	447		Troll Nordland 15 Hurler
		--	448		Troll Nordland 15 Rowdy
		--	449		Troll Nordland 15 Smasher
		--	450		Troll Nordland 15 Thrower
						
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {451, 453, 452, 447, 448, 449, 450}},
			[20]	= {Minutes = 3.5, Units = {451, 453, 452, 447, 448, 449, 450}},
			[30]	= {Minutes = 3, Units = {451, 453, 452, 447, 448, 449, 450}},
			[45]	= {Minutes = 2.5, Units = {451, 453, 452, 447, 448, 449, 450}},
		},
	},
	[36] = {
		Name = "Basilisk medium 1",
		LevelRange = "15",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {1723, 1723, 1723}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1723	Basilisk 18 AO
						
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {1723}},
			[5]	= {Minutes = 2, Units = {1723}},
			[6]	= {Minutes = 1.5, Units = {1723}},
			[8]	= {Minutes = 1, Units = {1723}},
		},
	},
	[37] = {
		Name = "Human Evil medium 1",
		LevelRange = "6",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {762, 762}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	762		Human Brigant 6 Scharfschütze
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 2.5, Units = {762}},
			[20]	= {Minutes = 2, Units = {762}},
			[30]	= {Minutes = 1.5, Units = {762}},
			[45] = {Minutes = 1, Units = {762}},
		},
	},
	[38] = {
		Name = "Human Evil(Bandit) low 1",
		LevelRange = "4",
		Goal = GoalCoopAggressive,
		MaxClanSize = 5, 
		Init	= {852, 851}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	852		Human Bandit 4 Metallkeule
		--	851		Human Bandit 4 Schwert
				
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {852, 851}},
			[6]	= {Minutes = 1.5, Units = {852, 851}},
		},
	},
	[39] = {
		Name = "Human Evil(Bandit) low 2",
		LevelRange = "4",
		Goal = GoalCoopAggressive,
		MaxClanSize = 5, 
		Init	= {851, 852}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	852		Human Bandit 4 Metallkeule
		--	851		Human Bandit 4 Schwert
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {852, 851}},
			[6]	= {Minutes = 1.5, Units = {852, 851}},
		},
	},
	[40] = {
		Name = "Minotaur low 1",
		LevelRange = "3",
		Goal = GoalCoopAggressive,
		MaxClanSize = 3, 
		Init	= {1165}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1166	Minotaurus 3 Keule
		--	1165	Minotaurus 3 Fist
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {1165, 1166}},
			[6]	= {Minutes = 1.5, Units = {1165, 1166}},
		},
	},
	[41] = {
		Name = "Spider low 1",
		LevelRange = "5",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {752, 752, 752, 752, 200, 200}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	752		Spider Tiny Green 3
		--	200		Spider Giant Brown 4 Lesser
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {752}},
			[5]	= {Minutes = 2, Units = {752, 200}},
			[6]	= {Minutes = 1.5, Units = {752, 200}},
			[8]	= {Minutes = 1, Units = {200}},
		},
	},
	[42] = {
		Name = "Blade Minion 1",
		LevelRange = "13-15",
		Goal = GoalCoopAggressive,
		MaxClanSize = 22, 
		Init	= {305, 304}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	305		Blade Minion 13 Iceburst
		--	304		Blade Minion 13 Melee	
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {304, 305}},
			[20]	= {Minutes = 3, Units = {304, 305}},
			[30]	= {Minutes = 2.5, Units = {304, 305}},
			[45]	= {Minutes = 2, Units = {304, 305}},
		},
	},
	[43] = {
		Name = "Skelette medium 1",
		LevelRange = "12",
		Goal = GoalCoopAggressive,
		MaxClanSize = 12, 
		Init	= {149, 147}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	149		Skeleton Ashbone 8 Bow
		--	147		Skeleton Ashbone 8 StachelkeuleSchild
		--	143		Skeleton Ashbone 8 Pain
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 2.5, Units = {149, 147, 143}},
			[20]	= {Minutes = 2.5, Units = {149, 147, 143}},
			[30]	= {Minutes = 2, Units = {149, 147, 143}},
			[45]	= {Minutes = 2, Units = {149, 147, 143}},
		},
	},
	[44] = {
		Name = "Succubus medium 1",
		LevelRange = "14",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {338, 338, 338, 337, 337, 337}, 	-- die units, die zu beginn der karte gespawned sein sollen
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {337}},
			[5]	= {Minutes = 2, Units = {338}},
			[6]	= {Minutes = 1.5, Units = {337}},
			[8]	= {Minutes = 1, Units = {337, 338}},
		},
	},
	[45] = {
		Name = "Dunkelelfen medium 1",
		LevelRange = "6-8",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {1242, 1243, 1244, 1242, 1243, 1244}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1242	DarkElf 8 Darkblade
		--	1244	DarkElf 8 Necromancer
		--	1243	DarkElf 6 Assassin
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1242, 1243, 1244}},
			[20]	= {Minutes = 3, Units = {1242, 1243, 1244}},
			[30]	= {Minutes = 2.5, Units = {1242, 1243, 1244}},
			[45]	= {Minutes = 2, Units = {1242, 1243, 1244}},
		},
	},
	[46] = {
		Name = "Elfen Evil medium 1 more",
		LevelRange = "6",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {1562, 1563, 1562, 1563, 1563}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1562	Elf Evil WinterBogenschütze 6 AO
		--	1563	Elf Evil WinterMelee 6 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3, Units = {1562, 1563}},
			[20]	= {Minutes = 2, Units = {1562, 1563}},
			[30]	= {Minutes = 2, Units = {1562, 1563}},
			[45]	= {Minutes = 1.5, Units = {1562, 1563}},
			[60]	= {Minutes = 1, Units = {1562, 1563}},
		},
	},
	[47] = {
		Name = "Human Evil medium 1 more",
		LevelRange = "6 +10",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {870, 762, 762, 762, 762}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	870		UniqueHuman Halgard Arvig 10
		--	762		Human Brigant 6 Scharfschütze
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3, Units = {762}},
			[20]	= {Minutes = 2, Units = {762}},
			[30]	= {Minutes = 3, Units = {762}},
			[45]	= {Minutes = 1.5, Units = {762}},
			[60]	= {Minutes = 1, Units = {762}},
		},
	},
	[48] = {
		Name = "Skeletons lesser 2 slow",
		LevelRange = "05",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {605, 617}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	605		Skeleton Lesser 5 1H-Schwert
		--	617		Skeleton Lesser 5 Bow
		--	133		Skeleton Lesser 5 Dolch		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 2.5, Units = {605, 617, 133}},
			[20]	= {Minutes = 2, Units = {605, 617, 133}},
			
		},
	},
	[49] = {
		Name = "Orks medium 3",
		LevelRange = "04",
		Goal = GoalCoopAggressive,
		MaxClanSize = 12, 
		Init	= {370, 370}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	370 	Orc Grarg 4 Fighter
		-- 	369 	Orc Grarg 4 Firemaster
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {370}},
			[6]	= {Minutes = 1.5, Units = {370, 369}},			
		},
	},
	[50] = {
		Name = "Zombies low 1",
		LevelRange = "6",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {1193, 1193, 1193, 1193}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1193	Zombie 6 Schlachtbeil
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {1193}},
			[5]	= {Minutes = 2, Units = {1193}},
			[10] = {Minutes = 1, Units = {1193}},
		},
	},
	[51] = {
		Name = "Beastmen low 1",
		LevelRange = "6",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {215, 725}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	215		Beastman Normal 6 Doppelaxt
		--	725		Beastman Normal 6 Unarmed Paws
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {215, 725}},
			[5]	= {Minutes = 2, Units = {215, 725}},
			[10] = {Minutes = 1, Units = {215, 725}},
		},
	},		
	[52] = {
		Name = "Orks medium 5",
		LevelRange = "7-8",
		Goal = GoalCoopAggressive,
		MaxClanSize = 4, 
		Init	= {377, 376}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	376 	Orc Grarg 7 Messenger
		--	377		Orc Grarg 8 Wise One
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[3]	= {Minutes = 2.5, Units = {376}},
			[5]	= {Minutes = 2, Units = {376}},			
		},
	},
	[53] = {
		Name = "Beastmen low 1 more",
		LevelRange = "6",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {215, 725}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	215		Beastman Normal 6 Doppelaxt
		--	725		Beastman Normal 6 Unarmed Paws
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 2.5, Units = {215, 725}},
			[20]	= {Minutes = 2.5, Units = {215, 725}},
			[30] = {Minutes = 2, Units = {215, 725}},
			[45] = {Minutes = 2, Units = {215, 725}},
		},
	},
	[54] = {
		Name = "Orks medium 6 more",
		LevelRange = "7-8",
		Goal = GoalCoopAggressive,
		MaxClanSize = 12, 
		Init	= {377, 376}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	376 	Orc Grarg 7 Messenger
		--	377		Orc Grarg 8 Wise One
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 2.5, Units = {376, 377}},
			[20]	= {Minutes = 2, Units = {376, 377}},
			[30]	= {Minutes = 2, Units = {376, 377}},					
		},
	},
	[55] = {
		Name = "Demons lesser 1 more",
		LevelRange = "12",
		Goal = GoalCoopAggressive,
		MaxClanSize = 7, 
		Init	= {178, 178, 1013, 1013}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	178		Demon Lesser 12 Melee
		--	1013	Demon Lesser 12 Fireball
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[15]	= {Minutes = 3, Units = {178}},
			[30]	= {Minutes = 2.5, Units = {178}},
			[45]	= {Minutes = 2, Units = {1013}},
		},
	},	
	[56] = {
		Name = "Skelette medium 2",
		LevelRange = "8",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {149, 147, 149, 147}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	149		Skeleton Ashbone 8 Bow
		--	147		Skeleton Ashbone 8 StachelkeuleSchild
		--	143		Skeleton Ashbone 8 Pain
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {149, 147, 143}},
			[20]	= {Minutes = 3.5, Units = {149, 147, 143}},
			[30]	= {Minutes = 3, Units = {149, 147, 143}},
			[35]	= {Minutes = 2.5, Units = {149, 147, 143}},
			[45]	= {Minutes = 2, Units = {149, 147, 143}},
		},
	},
	[57] = {
		Name = "Zombies medium 1 many",
		LevelRange = "10",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {1193, 1193, 1193, 1193}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1193	Zombie 6 Schlachtbeil
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {1193}},
			[20]	= {Minutes = 3.5, Units = {1193}},
			[30]	= {Minutes = 3, Units = {1193}},
			[45]	= {Minutes = 2.5, Units = {1193}},
		},
	},
	[58] = {
		Name = "Waldschrat Medium 2 +Blutesche",
		LevelRange = "7 +16",
		Goal = GoalCoopAggressive,
		MaxClanSize = 14, 
		Init	= {1493, 1493, 1493, 1493}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1493	Waldschrat 7 AO
		--	1915	Blutesche 16 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {1493}},
			[20]	= {Minutes = 3.5, Units = {1493}},
			[30]	= {Minutes = 3, Units = {1493}},
			[45]	= {Minutes = 2.5, Units = {1493}},
			[75]	= {Minutes = 15, Units = {1915}},
		},
	},	
	[59] = {
		Name = "Kithar Medium 2",
		LevelRange = "7-8",
		Goal = GoalCoopAggressive,
		MaxClanSize = 14, 
		Init	= {1489, 1488, 1489, 1489}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1489	Kithar 7 AO
		--	1488	Kithar 8 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {1489, 1488}},
			[20]	= {Minutes = 3.5, Units = {1489, 1488}},
			[30]	= {Minutes = 3, Units = {1489, 1488}},
			[45]	= {Minutes = 2.5, Units = {1489, 1488}},
			[60]	= {Minutes = 2, Units = {1489, 1488}},
		},
	},	
	[60] = {
		Name = "Trolle Medium 1",
		LevelRange = "7-9",
		Goal = GoalCoopAggressive,
		MaxClanSize = 11, 
		Init	= {439, 440, 1021}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	439		Troll Urok 7 Rowdy
		--	440		Troll Urok 8 Thrower
		--	1021	Troll Urok 9 Smasher
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 2, Units = {439}},
			[20]	= {Minutes = 2.5, Units = {440, 1021}},
			[30]	= {Minutes = 1, Units = {1021}},
		},
	},
	[61] = {
		Name = "Werewolf high 2",
		LevelRange = "7-9",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {1639, 1640, 1662}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1639	Werewolf 7 AO
		-- 	1640	Werewolf 9 AO
		--	1662	Werewolf 9 Pain AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1639, 1640, 1662}},
			[20]	= {Minutes = 3, Units = {1639, 1640, 1662}},
			[30]	= {Minutes = 2, Units = {1639, 1640, 1662}},
			[45] 	= {Minutes = 2, Units = {1639, 1640, 1662}},
			[60] 	= {Minutes = 2, Units = {1639, 1640, 1662}},
		},
	},
	[62] = {
		Name = "Waldschrat Medium 2 +Blutesche",
		LevelRange = "7 +16",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {1493, 1493, 1493}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1493	Waldschrat 7 AO
		--	1915	Blutesche 16 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {1493}},
			[20]	= {Minutes = 3.5, Units = {1493}},
			[30]	= {Minutes = 2.5, Units = {1493}},
			[45]	= {Minutes = 2, Units = {1493}},
			[50]	= {Minutes = 10, Units = {1915}},
		},
	},
	[63] = {
		Name = "Medusa & Gargoyles 1",
		LevelRange = "25 +13",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {1331, 326, 326, 326, 326}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1331	UniqueMedusa 25 Head of Horrors
		--	326		Gargoyle 13 Aura of Slow Fighting
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3, Units = {326}},
			[20]	= {Minutes = 2, Units = {326}},
			[30]	= {Minutes = 1, Units = {326}},
		},
	},
	[64] = {
		Name = "Blade Principal high 1",
		LevelRange = "20",
		Goal = GoalCoopAggressive,
		MaxClanSize = 16, 
		Init	= {309, 316, 309, 316, 309, 316}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	309		Blade Principal 20 Melee
		--	316		Blade Principal 20 Remediless
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3, Units = {309, 316}},
			[20]	= {Minutes = 2, Units = {309, 316}},
			[30]	= {Minutes = 1, Units = {309, 316}},
		},
	},	
	[65] = {
		Name = "Succubus very high 1",
		LevelRange = "25 +13",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {1304, 1305, 1304}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1304	Succubus 25 Evil Charm
		--	1305	Succubus 25 Schockwave
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3, Units = {1304, 1305}},
			[20]	= {Minutes = 2, Units = {1304, 1305}},
			[30]	= {Minutes = 1, Units = {1304, 1305}},
		},
	},
	[66] = {
		Name = "Small Dragon Fire high 1",
		LevelRange = "17",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {585, 585}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	585		Small Dragon 17 Fire
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {585}},
			[20]	= {Minutes = 3, Units = {585}},
			[30]	= {Minutes = 2.5, Units = {585}},
			[45]	= {Minutes = 2, Units = {585}},
		},
	},
	[67] = {
		Name = "Small Dragon Forest high 1",
		LevelRange = "17",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {586, 586, 586}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	586		Samll Dragon 17 Forest
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {586}},
			[20]	= {Minutes = 3, Units = {586}},
			[30]	= {Minutes = 2.5, Units = {586}},
			[45]	= {Minutes = 2, Units = {586}},
		},
	},
	[68] = {
		Name = "Small Dragon Sun high 1",
		LevelRange = "19",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {587, 587}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	587		Samll Dragon 19 Sun
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {587}},
			[20]	= {Minutes = 3, Units = {587}},
			[30]	= {Minutes = 2.5, Units = {587}},
			[45]	= {Minutes = 2, Units = {587}},
		},
	},
	[69] = {
		Name = "Kithar Medium 1",
		LevelRange = "8 +12",
		Goal = GoalCoopAggressive,
		MaxClanSize = 30, 
		Init	= {1546, 1488, 1488, 1488}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1546	UniqueKithar Kithar-General 12 AO
		--	1488	Kithar 8 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {1488}},
			[20]	= {Minutes = 3.5, Units = {1488}},
			[30]	= {Minutes = 3, Units = {1488}},
			[45]	= {Minutes = 2.5, Units = {1488}},
		},
	},
	[70] = {
		Name = "Human Evil high 1",
		LevelRange = "16-17",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {1427, 1426, 1427}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1427	Human Utran 17 Renegat
		--	1426	Human Wulfgar 16 Soldier
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {1427, 1426}},
			[20]	= {Minutes = 3.5, Units = {1427, 1426}},
			[30]	= {Minutes = 3, Units = {1427, 1426}},
			[45]	= {Minutes = 2.5, Units = {1427, 1426}},
		},
	},
	[71] = {
		Name = "Toads high 1",
		LevelRange = "7 +20",
		Goal = GoalCoopAggressive,
		MaxClanSize = 30, 
		Init	= {1658, 1499, 1499, 1499}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1658	Toad 20 AO
		--	1499	Toad 7 AO				
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1499}},
			[20]	= {Minutes = 3, Units = {1499}},
			[30]	= {Minutes = 2.5, Units = {1499}},
			[45]	= {Minutes = 2, Units = {1499}},
			},
	},
	[72] = {
		Name = "Ogre high 1",
		LevelRange = "16-18",
		Goal = GoalCoopAggressive,
		MaxClanSize = 30, 
		Init	= {192, 191, 192, 191, 192, 191}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	192		Ogre Normal 18 Warrior
		--	191		Ogre Normal 16 Shaman
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {192, 191}},
			[20]	= {Minutes = 3, Units = {192, 191}},
			[30]	= {Minutes = 2.5, Units = {192, 191}},
			[45]	= {Minutes = 2, Units = {192, 191}},
			[60]	= {Minutes = 1, Units = {192, 191}},
			},
	},
	[73] = {
		Name = "Giant high 1",
		LevelRange = "18-19",
		Goal = GoalCoopAggressive,
		MaxClanSize = 30, 
		Init	= {129, 131, 129, 131}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	129		Giant Cloth1 18 Hill
		--	131		Giant Cloth2 19 Rock
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {129, 131}},
			[20]	= {Minutes = 3, Units = {129, 131}},
			[30]	= {Minutes = 2.5, Units = {129, 131}},
			[45]	= {Minutes = 2, Units = {129, 131}},
			[60]	= {Minutes = 1, Units = {129, 131}},
			},
	},
	[74] = {
		Name = "Sabretooth high 1",
		LevelRange = "17-18",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {1354, 1354, 1425, 1425}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1354	Sabretooth 17
		--	1425	Sabretooth 18
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {1354, 1425}},
			[20]	= {Minutes = 3.5, Units = {1354, 1425}},
			[30]	= {Minutes = 3, Units = {1354, 1425}},
			[45]	= {Minutes = 2.5, Units = {1354, 1425}},
		},
	},
	[75] = {
		Name = "Beastman high 1",
		LevelRange = "18-19",
		Goal = GoalCoopAggressive,
		MaxClanSize = 16, 
		Init	= {1913, 1913, 1912, 1912}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1913	Beastman 18 AO
		--	1912	Beastman 19 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 4, Units = {1912, 1913}},
			[20]	= {Minutes = 3.5, Units = {1912, 1913}},
			[30]	= {Minutes = 3, Units = {1912, 1913}},
			[45]	= {Minutes = 2.5, Units = {1912, 1913}},
		},
	},
	[76] = {
		Name = "Werewolf high 2 rpg",
		LevelRange = "7-9",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {1639, 1640, 1662}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1639	Werewolf 7 AO
		-- 	1640	Werewolf 9 AO
		--	1662	Werewolf 9 Pain AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[5]	= {Minutes = 3, Units = {1639, 1640, 1662}},
			[10]	= {Minutes = 2, Units = {1639, 1640, 1662}},
			[20]	= {Minutes = 1.5, Units = {1639, 1640, 1662}},
			[30] 	= {Minutes = 1, Units = {1639, 1640, 1662}},
			},
	},		
	[77] = {
		Name = "Oger NEU",
		LevelRange = "20-23",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {196, 1905, 1905}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	196		Oger 20 Greater Chieftain
		--	1905	Oger 22 Warrior normal AO
		--	1906	Oger 23 Warrior normal AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {1905, 1906}},
			[20]	= {Minutes = 3, 	Units = {196}},
			[30]	= {Minutes = 2.5, 	Units = {196, 1905}},
			[45]	= {Minutes = 2, 	Units = {1905, 1906}},
			[60]	= {Minutes = 1, 	Units = {1905, 1906, 196}},
		},                       
	},                           
	[78] = {                     
		Name = "Lavagolem NEU",
		LevelRange = "14",
		Goal = GoalCoopAggressive,
		MaxClanSize = 5, 
		Init	= {120, 121, 121, 120, 120}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	120		Golem Lava Firshield 14
		--	121		Golem lava Melee 14
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 2.5, 	Units = {120, 121}},
			[20]	= {Minutes = 2, 	Units = {120, 121}},
			[30]	= {Minutes = 2, 	Units = {120, 121}},
			[45]	= {Minutes = 2, 	Units = {120, 121}},
			[60]	= {Minutes = 1, 	Units = {120, 121}},
		},
	},
	[79] = {
		Name = "Feuerelement NEU",
		LevelRange = "18 - 20",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {1804, 1804, 1714, 1713}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1804		18 Elemental Fire AO
		--	1714		19 Elemental Fire AO
		--	1713		20 Elemental Fire AO
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {1804, 1714}},
			[20]	= {Minutes = 3, 	Units = {1804, 1714}},
			[30]	= {Minutes = 2.5, 	Units = {1714, 1713}},
			[45]	= {Minutes = 2, 	Units = {1804, 1713}},
			[60]	= {Minutes = 1, 	Units = {1714, 1713}},
		},
	},
	[80] = {
		Name = "Manticore NEU",
		LevelRange = "19 - 21",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {1860, 1860, 1861}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1860 	19 Manticore AO (Orc Faction)
		-- 	1861	20 Manticore AO (Orc Faction)
		-- 	1862	21 Manticore AO (Orc Faction)
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {1861, 1860}},
			[20]	= {Minutes = 3, 	Units = {1861, 1860}},
			[30]	= {Minutes = 2.5, 	Units = {1861, 1860, 1862}},
			[45]	= {Minutes = 2, 	Units = {1861, 1860, 1862}},
			[60]	= {Minutes = 1, 	Units = {1861, 1860, 1862}},
		},
	},

	[81] = {
		Name = "Eisgolem NEU",
		LevelRange = "20, 26",
		Goal = GoalCoopAggressive,
		MaxClanSize = 5, 
		Init	= {117, 1485, 1485, 117}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	117 	20	Golem Ice Freeze
		-- 	1485 	20	Golem Ice Iceburst
		--	1417	26	Golem Ice Iceburst
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {117}},
			[20]	= {Minutes = 3, 	Units = {117, 1485}},
			[30]	= {Minutes = 2.5, 	Units = {117, 1417}},
			[45]	= {Minutes = 2, 	Units = {1485, 1417}},
			[60]	= {Minutes = 1, 	Units = {1485, 1417}},	
		},
	},
	[82] = {
		Name = "Eisdrachen NEU",
		LevelRange = "20, 22, 24",
		Goal = GoalCoopAggressive,
		MaxClanSize = 17, 
		Init	= {1716, 1717, 1919}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1919	20 Dragon Small AO
		-- 	1717	22 Dragon Small AO
		-- 	1716	24 Dragon Small AO
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {1919, 1716}},
			[20]	= {Minutes = 3, 	Units = {1717, 1716}},
			[30]	= {Minutes = 2.5, 	Units = {1919, 1716}},
			[45]	= {Minutes = 2, 	Units = {1919, 1716}},
			[60]	= {Minutes = 1, 	Units = {1717, 1716}},
		},
	},
	[83] = {
		Name = "Skelette NEU",
		LevelRange = "27",
		Goal = GoalCoopAggressive,
		MaxClanSize = 17, 
		Init	= {1846, 1846, 1847, 1847}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1846	27	Skelett Bogenschütze AO
		-- 	1845	27	Skelett Lachender Tod AO
		-- 	1847	27	Schwert und Schild AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {1847}},
			[20]	= {Minutes = 3, 	Units = {1847, 1845}},
			[30]	= {Minutes = 2.5, 	Units = {1847, 1845, 1846}},
			[45]	= {Minutes = 2, 	Units = {1847, 1845, 1846}},
			[60]	= {Minutes = 1, 	Units = {1847, 1846}},
		},
	},
	[84] = {
		Name = "Untote NEU",
		LevelRange = "9-10,  ",
		Goal = GoalCoopAggressive,
		MaxClanSize = 11, 
		Init	= {153, 153, 1955, 296}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	153		10	Spectre Aura of Lifetap
		-- 	1955	10	Spectre Decay AO
		--	296		9   Spectre Amok
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {153, 296}},
			[20]	= {Minutes = 3, 	Units = {153, 296}},
			[30]	= {Minutes = 2.5, 	Units = {153, 1955}},
			[45]	= {Minutes = 2, 	Units = {1955, 153}},
			[60]	= {Minutes = 1, 	Units = {1955, 153}},
			
		},
	},
	[85] = {
		Name = "Waldschrate NEU",
		LevelRange = "16 - 18",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {1915, 1915, 1785, 1786, 1786}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1915	16 	Blutesche AO
		-- 	1785	17	Waldschrat AO	
		--	1786	18 	Waldschrat AO	
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {1786, 1785}},
			[20]	= {Minutes = 3, 	Units = {1786, 1915}},
			[30]	= {Minutes = 2.5, 	Units = {1785, 1786}},
			[45]	= {Minutes = 2, 	Units = {1785, 1915}},
			[60]	= {Minutes = 1, 	Units = {1915, 1786, 1785}},
		},
	},
	[86] = {
		Name = "Frosch NEU",
		LevelRange = "20",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {1658, 1658, 1658, 1658, 1658}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1658	20 Toad AO
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {1658}},
			[20]	= {Minutes = 3, 	Units = {1658}},
			[30]	= {Minutes = 2.5, 	Units = {1658}},
			[45]	= {Minutes = 2, 	Units = {1658}},
			[60]	= {Minutes = 1, 	Units = {1658}},
		},
	},		
	[87] = {
		Name = "Beastmen NEU",
		LevelRange = "19-20",
		Goal = GoalCoopAggressive,
		MaxClanSize = 13, 
		Init	= {1912, 1912, 1914, 1914}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 1912		19	Beastman AO
		-- 1914		20	Beastman AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {1912}},
			[20]	= {Minutes = 3, 	Units = {1912, 1914}},
			[30]	= {Minutes = 2.5, 	Units = {1912, 1914}},
			[45]	= {Minutes = 2, 	Units = {1914}},
			[60]	= {Minutes = 1, 	Units = {1914}},
		},
	},	
	[88] = {
		Name = "Spinnen NEU",
		LevelRange = "16-18",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {1728, 1731, 1750, 1728, 1728}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	1728	16	Spider Giant White Giftspinne AO
		-- 	1750	17	Spider Giant White Giftspinne AO
		--	1731	18	Spider Giant White Giftspinne AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, 	Units = {1728}},
			[20]	= {Minutes = 3, 	Units = {1728, 1750}},
			[30]	= {Minutes = 2.5, 	Units = {1750, 1731}},
			[45]	= {Minutes = 2, 	Units = {1750, 1731}},
			[60]	= {Minutes = 1, 	Units = {1731}},
		},
	},
	[89] = {
		Name = "Titanen Human",
		LevelRange = "30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2011, 2011, 2011, 2011}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	2011	Titan Human Coop-Evil 30 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2011}},
			[20]	= {Minutes = 3, Units = {2011}},
			[30]	= {Minutes = 2.5, Units = {2011}},
			[45] = {Minutes = 2, Units = {2011}},
		},
	},	
	[90] = {
		Name = "Titanen Elf",
		LevelRange = "30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2010, 2010, 2010, 2010}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2010 	Titan Elf Coop-Evil 30 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2010}},
			[20]	= {Minutes = 3, Units = {2010}},
			[30]	= {Minutes = 2.5, Units = {2010}},
			[45] = {Minutes = 2, Units = {2010}},
		},
	},	
	[91] = {
		Name = "Titanen Dwarf",
		LevelRange = "30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {1233, 740}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 	2012	Titan Dwarf Coop-Evil 30 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2012}},
			[20]	= {Minutes = 3, Units = {2012}},
			[30]	= {Minutes = 2.5, Units = {2012}},
			[45] = {Minutes = 2, Units = {2012}},
		},
	},
	[92] = {
		Name = "Titanen Orc",
		LevelRange = "30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2013, 2013, 2013, 2013}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2013	Titan Orc Coop-Evil 30 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2013}},
			[20]	= {Minutes = 3, Units = {2013}},
			[30]	= {Minutes = 2.5, Units = {2013}},
			[45] = {Minutes = 2, Units = {2013}},
		},
	},	

	[93] = {
		Name = "Titanen Troll",
		LevelRange = "30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2014, 2014, 2014, 2014}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2014	Titan Troll Coop-Evil 30 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2014}},
			[20]	= {Minutes = 3, Units = {2014}},
			[30]	= {Minutes = 2.5, Units = {2014}},
			[45] = {Minutes = 2, Units = {2014}},
		},
	},
	[94] = {
		Name = "Titanen Darkelf",
		LevelRange = "30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2015, 2015, 2015, 2015}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2015	Titan Darkelf Coop-Evil 30 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2015}},
			[20]	= {Minutes = 3, Units = {2015}},
			[30]	= {Minutes = 2.5, Units = {2015}},
			[45] = {Minutes = 2, Units = {2015}},
		},
	},
	[95] = {
		Name = "DeSync Test Gobbos",
		LevelRange = "01-03",
		Goal = GoalCoopAggressive,
		MaxClanSize = 5, 
		Init	= {262, 262, 262, 838, 838}, 	-- die units, die zu beginn der karte gespawned sein sollen
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[600]	= {Minutes = 360, Units = {784}},
		},
	},
	[96] = {
		Name = "Sabretooth high 2",
		LevelRange = "15-16",
		Goal = GoalCoopAggressive,
		MaxClanSize = 30, 
		Init	= {1425, 1424, 1425, 1424}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1425	Sabretooth 18
		--	1424	Sabretooth 19
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1424, 1425}},
			[20]	= {Minutes = 3, Units = {1424, 1425}},
			[30]	= {Minutes = 2.5, Units = {1424, 1425}},
			[45]	= {Minutes = 2, Units = {1424, 1425}},
			[60]	= {Minutes = 1, Units = {1424, 1425}},
			},
	},

-- Hier gehts los mit ****
					
	[97] = {
		Name = "***DarkElf Fire high 1(Race: MP Generic)",
		LevelRange = "15-16",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {2763, 2764, 2765, 2763, 2764, 2765}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2763	DarkElf Fire Assassin 16 AO
		--	2764	DarkElf Fire Deathknight 15 AO
		--	2765	DarkElf Fire Sorcerer 16 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2763, 2764, 2765}},
			[20]	= {Minutes = 3, Units = {2763, 2764, 2765}},
			[30]	= {Minutes = 2.5, Units = {2763, 2764, 2765}},
			[45]	= {Minutes = 2, Units = {2763, 2764, 2765}},
			[60]	= {Minutes = 1, Units = {2763, 2764, 2765}},
		},
	},
	[98] = {
		Name = "***DarkElf Fire high 2(Race: MP Generic)",
		LevelRange = "16-17",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {2770, 2771, 2772, 2770, 2771, 2772}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2770	DarkElf Fire Battlemaster 17 AO
		--	2771	DarkElf Fire Havoc 16 AO
		--	2772	DarkElf Fire Darkblade 16 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2770, 2771, 2772}},
			[20]	= {Minutes = 3, Units = {2770, 2771, 2772}},
			[30]	= {Minutes = 2.5, Units = {2770, 2771, 2772}},
			[45]	= {Minutes = 2, Units = {2770, 2771, 2772}},
			[60]	= {Minutes = 1, Units = {2770, 2771, 2772}},
		},
	},		
	[99] = {
		Name = "***Orcs Sharok high 1(Race: MP Generic)",
		LevelRange = "14",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {2773, 2774, 2776, 2773, 2774, 2776}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2773 	Orc Sharok 14 Fighter
		--	2774 	Orc Sharok 14 Spearman
		--	2775		Orc Sharok 14 Totem
		--  2776		Orc Sharok 14 Veteran
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2773, 2774, 2776, 2775}},
			[20]	= {Minutes = 3, Units = {2773, 2774, 2776, 2775}},
			[30]	= {Minutes = 2.5, Units = {2773, 2774, 2776, 2775}},
			[45]	= {Minutes = 2, Units = {2773, 2774, 2776, 2775}},
			[60]	= {Minutes = 1, Units = {2773, 2774, 2776, 2775}},
		},
	},	
	[100] = {
		Name = "***Toads high 1(Race: MP Generic)",
		LevelRange = "14",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {2777, 2777, 2777, 2777}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2777 	Toad 20 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2777}},
			[20]	= {Minutes = 3, Units = {2777}},
			[30]	= {Minutes = 2.5, Units = {2777}},
			[45]	= {Minutes = 2, Units = {2777}},
			[60]	= {Minutes = 1, Units = {2777}},
		},
	},
	[101] = {
		Name = "***Elf Wintermage high 1(Race: MP Generic)",
		LevelRange = "21",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2781, 2782, 2783, 2781, 2782, 2783}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2781	Elf Evil Wintermage 21 Freeze
		--	2782	Elf Evil Wintermage 21 Ice Elemental
		--	2783	Elf Evil Wintermage 21 Iceburst
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2781, 2782, 2783}},
			[20]	= {Minutes = 3, Units = {2781, 2782, 2783}},
			[30]	= {Minutes = 2.5, Units = {2781, 2782, 2783}},
			[45]	= {Minutes = 2, Units = {2781, 2782, 2783}},
		},
	},
	[102] = {
		Name = "***Dwarf Ghost medium 1(Race: MP Generic)",
		LevelRange = "10",
		Goal = GoalCoopAggressive,
		MaxClanSize = 40, 
		Init	= {2784, 2785, 2786, 2784, 2785, 2786}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2784	Dwarf Ghost Untoter Zwergensoldat 10 AO
		--	2785 	Dwarf Hallitian Zwergengeist 10 Elder
		--	2786		Dwarf Hallitian Zwergengeist 10 Warrior
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2784, 2785, 2786}},
			[20]	= {Minutes = 3, Units = {2784, 2785, 2786}},
			[30]	= {Minutes = 2.5, Units = {2784, 2785, 2786}},
			[45]	= {Minutes = 2, Units = {2784, 2785, 2786}},
			[60]	= {Minutes = 1.5, Units = {2784, 2785, 2786}},
		},
	},			
	[103] = {
		Name = "***DarkElf2 Fire high 1(Race: MP Generic)",
		LevelRange = "15-16",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {2787, 2788, 2789, 2787, 2788, 2789}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2787	DarkElf Fire Assassin 16 AO
		--	2788	DarkElf Fire Deathknight 15 AO
		--	2789	DarkElf Fire Sorcerer 16 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2787, 2788, 2789}},
			[20]	= {Minutes = 3, Units = {2787, 2788, 2789}},
			[30]	= {Minutes = 2.5, Units = {2787, 2788, 2789}},
			[45]	= {Minutes = 2, Units = {2787, 2788, 2789}},
			[60]	= {Minutes = 1, Units = {2787, 2788, 2789}},
		},
	},
	[104] = {
		Name = "***DarkElf2 Fire high 2(Race: MP Generic)",
		LevelRange = "16-17",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {2790, 2791, 2792, 2790, 2791, 2792}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2790	DarkElf Fire Battlemaster 17 AO
		--	2791	DarkElf Fire Havoc 16 AO
		--	2792	DarkElf Fire Darkblade 16 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2790, 2791, 2792}},
			[20]	= {Minutes = 3, Units = {2790, 2791, 2792}},
			[30]	= {Minutes = 2.5, Units = {2790, 2791, 2792}},
			[45]	= {Minutes = 2, Units = {2790, 2791, 2792}},
			[60]	= {Minutes = 1, Units = {2790, 2791, 2792}},
		},
	},		
	[105] = {
		Name = "***Orcs2 Sharok high 1(Race: MP Generic)",
		LevelRange = "14",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {2793, 2794, 2796, 2793, 2794, 2796}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2793 	Orc Sharok 14 Fighter
		--	2794 	Orc Sharok 14 Spearman
		--	2795		Orc Sharok 14 Totem
		--  2796		Orc Sharok 14 Veteran
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2793, 2794, 2796, 2795}},
			[20]	= {Minutes = 3, Units = {2793, 2794, 2796, 2795}},
			[30]	= {Minutes = 2.5, Units = {2793, 2794, 2796, 2795}},
			[45]	= {Minutes = 2, Units = {2793, 2794, 2796, 2795}},
			[60]	= {Minutes = 1, Units = {2793, 2794, 2796, 2795}},
		},
	},
	[106] = {
		Name = "***Elf2 Wintermage high 1(Race: MP Generic)",
		LevelRange = "21",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2797, 2798, 2799, 2797, 2798, 2799}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2797	Elf Evil Wintermage 21 Freeze
		--	2798	Elf Evil Wintermage 21 Ice Elemental
		--	2799	Elf Evil Wintermage 21 Iceburst
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2797, 2798, 2799}},
			[20]	= {Minutes = 3, Units = {2797, 2798, 2799}},
			[30]	= {Minutes = 2.5, Units = {2797, 2798, 2799}},
			[45]	= {Minutes = 2, Units = {2797, 2798, 2799}},
		},
	},
	[107] = {
		Name = "***Dwarf2 Ghost medium 1(Race: MP Generic)",
		LevelRange = "10",
		Goal = GoalCoopAggressive,
		MaxClanSize = 40, 
		Init	= {2800, 2801, 2802, 2800, 2801, 2802}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2800	Dwarf Ghost Untoter Zwergensoldat 10 AO
		--	2801 	Dwarf Hallitian Zwergengeist 10 Elder
		--	2802		Dwarf Hallitian Zwergengeist 10 Warrior
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2800, 2801, 2802}},
			[20]	= {Minutes = 3, Units = {2800, 2801, 2802}},
			[30]	= {Minutes = 2.5, Units = {2800, 2801, 2802}},
			[45]	= {Minutes = 2, Units = {2800, 2801, 2802}},
			[60]	= {Minutes = 1.5, Units = {2800, 2801, 2802}},
		},
	},
	[108] = {
		Name = "***Elf RPG Wintermage high 1(Race: MP Generic)",
		LevelRange = "21",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {2803, 2804, 2805}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2803	Elf Evil Wintermage 21 Freeze
		--	2804	Elf Evil Wintermage 21 Ice Elemental
		--	2805	Elf Evil Wintermage 21 Iceburst
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2803, 2804, 2805}},
			[20]	= {Minutes = 3, Units = {2803, 2804, 2805}},
			[30]	= {Minutes = 2.5, Units = {2803, 2804, 2805}},
			[45]	= {Minutes = 2, Units = {2803, 2804, 2805}},
		},
	},
	[109] = {
		Name = "***Golem RPG Ice high 1(Race: MP Generic)",
		LevelRange = "20/26",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {2806, 2807, 2806}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2806	Golem Ice 26 Iceburst
		--	2807 	Golem Ice 20 Freeze
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2806, 2807}},
			[20]	= {Minutes = 3, Units = {2806, 2807}},
			[30]	= {Minutes = 2.5, Units = {2806, 2807}},
			[45]	= {Minutes = 2, Units = {2806, 2807}},
		},
	},	
	[110] = {
		Name = "***Dragon RPG Ice high 1(Race: MP Generic)",
		LevelRange = "20/26",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {2808, 2809, 2808}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2808	Dragon Small 22 Ice AO
		--	2809 	Dragon Small 24 Ice AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2808, 2809}},
			[20]	= {Minutes = 3, Units = {2808, 2809}},
			[30]	= {Minutes = 2.5, Units = {2808, 2809}},
			[45]	= {Minutes = 2, Units = {2808, 2809}},
		},
	},
	[111] = {
		Name = "***Toads high 1(Race: MP Generic)",
		LevelRange = "20",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2810, 2810, 2810, 2810, 2810}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2810	Toad 20 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2810}},
			[20]	= {Minutes = 3, Units = {2810}},
			[30]	= {Minutes = 2.5, Units = {2810}},
			[45]	= {Minutes = 2, Units = {2810}},
		},
	},	
	[112] = {
		Name = "***Manticore high 1(Race: MP Generic)",
		LevelRange = "17",
		Goal = GoalCoopAggressive,
		MaxClanSize = 25, 
		Init	= {2811, 2811, 2811, 2811, 2811, 2811}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2811		UniqueManticore Brandstifter 17
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2811}},
			[20]	= {Minutes = 3, Units = {2811}},
			[30]	= {Minutes = 2.5, Units = {2811}},
			[45]	= {Minutes = 2, Units = {2811}},
		},
	},
	[113] = {
		Name = "***Toads2 high 1(Race: MP Generic)",
		LevelRange = "20",
		Goal = GoalCoopAggressive,
		MaxClanSize = 22, 
		Init	= {2812, 2812, 2812, 2812, 2812, 2812}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2812	Toad 20 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2812}},
			[20]	= {Minutes = 3, Units = {2812}},
			[30]	= {Minutes = 2.5, Units = {2812}},
			[45]	= {Minutes = 2, Units = {2812}},
		},
	},	
	[114] = {
		Name = "***Manticore2 high 1(Race: MP Generic)",
		LevelRange = "17",
		Goal = GoalCoopAggressive,
		MaxClanSize = 27, 
		Init	= {2813, 2813, 2813, 2813, 2813, 2813}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2813		UniqueManticore Brandstifter 17
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2813}},
			[20]	= {Minutes = 3, Units = {2813}},
			[30]	= {Minutes = 2.5, Units = {2813}},
			[45]	= {Minutes = 2, Units = {2813}},
		},
	},
	[115] = {
		Name = "***Golem RPG Ice high 2",
		LevelRange = "18/20/26",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2848, 1417, 1417}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1417	Golem Ice 26 Iceburst
		--	2848 	Golem Ice AO2 30 
		--	2922	Golem Ice 22 Freeze
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1417, 2922}},
			[20]	= {Minutes = 3, Units = {1417, 2922}},
			[30]	= {Minutes = 2.5, Units = {1417, 2922}},
			[45]	= {Minutes = 2, Units = {1417, 2848}},
		},
	},												
	[116] = {
		Name = "***Dragon RPG Ice high 2",
		LevelRange = "22/24",
		Goal = GoalCoopAggressive,
		MaxClanSize = 12, 
		Init	= {1716, 2923, 1716, 2923}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1717	Dragon Small 22 Ice AO
		--	1716 	Dragon Small 24 Ice AO
		--  2923    Dragon Small 30 AO2 Coop
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1717, 1716}},
			[20]	= {Minutes = 3, Units = {1717, 1716}},
			[30]	= {Minutes = 2.5, Units = {1716, 2923}},
			[45]	= {Minutes = 2, Units = {1716, 2923}},
		},
	},				
	[117] = {
		Name = "***Orcs4 Höhlenorks high 1",
		LevelRange = "20/24",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2924, 2233, 2924}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2232 	Orc Höhlenork 24 Fighter
		--	2233	Orc Höhlenork 24 Heiler
		--	2924	Orc Höhlenork 30 AO2 Coop
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2232, 2233}},
			[20]	= {Minutes = 3, Units = {2233, 2232}},
			[30]	= {Minutes = 2.5, Units = {2233, 2232}},
			[45]	= {Minutes = 2, Units = {2232, 2924}},
			[60]	= {Minutes = 1, Units = {2232, 2924}},
		},
	},
	[118] = {
		Name = "***Elf RPG Wintermage high 2",
		LevelRange = "20/21/24",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {2925, 1350, 2235}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1351	Elf Evil Wintermage 21 Freeze
		--	1350	Elf Evil Wintermage 21 Ice Elemental
		--	1352	Elf Evil Wintermage 21 Iceburst
		--  2925	Elf Evil Winter 	30 Melee AO2 Coop
		--	2235	Elf Evil Winter		24 Bow
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1351, 2235, 2235}},
			[20]	= {Minutes = 3, Units = {1351, 2235, 2235}},
			[30]	= {Minutes = 2.5, Units = {2235, 2235, 2925}},
			[45]	= {Minutes = 2, Units = {2925, 2235, 2235}},
		},
	},
	[119] = {
		Name = "***Human Evil 1",
		LevelRange = "20/24",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {2246, 2926, 2251}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 2246	Human Söldner Evil 24
		-- 2247	Human Spear Evil 20
		-- 2926	Human Spear Evil 30 AO2 Coop
		-- 2251 Human Heiler Evil 24
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2246, 2926, 2251}},
			[20]	= {Minutes = 3, Units = {2246, 2926, 2251}},
			[30]	= {Minutes = 2.5, Units = {2246, 2926, 2251}},
			[45]	= {Minutes = 2, Units = {2246, 2926, 2251}},
		},
	},
	[120] = {
		Name = "***Dwarf Ghost hard 1",
		LevelRange = "20/24",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {2241, 2240, 2927}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2241 Dwarf Elder 20
		--	2240 Dwarf Melee 24
		--  2927 Dwarf Elder 30 AO2 Coop
		
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2241, 2240}},
			[20]	= {Minutes = 3, Units = {2240, 2240}},
			[30]	= {Minutes = 2.5, Units = {2927, 2240}},
			[45]	= {Minutes = 2, Units = {2927, 2240}},
		},
	},
	[121] = {
		Name = "***Clan Orc 1 (Höhlenorcs)",
		LevelRange = "23/24/25",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {2928, 2233, 2924}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2232 	Orc Höhlenorcs 24 AO2
		--	2233	Orc Höhlenorcs 24 Heiler AO2
		--	2924	Orc Höhlenork 30 AO2 Coop
		--  2928    Orc Höhlenork 28 AO2 Coop
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2233, 2928}},
			[20]	= {Minutes = 3, Units = {2928, 2232}},
			[30]	= {Minutes = 2.5, Units = {2233, 2928}},
			[45]	= {Minutes = 2, Units = {2928, 2924}},
			[60]	= {Minutes = 1, Units = {2924, 2928}},
		},
	},
	[122] = {
		Name = "***Clan Trolle Urok",
		LevelRange = "24/26/28",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {2266, 2268, 2267, 2929}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2266 	Troll Urok Champion 28 AO2
		--	2268	Troll Urok Smasher 24 AO2
		--  2267    Troll Urok Thrower 26 AO2
		--	2929 	Troll Urok Champion 31 AO2 Coop
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2266, 2267}},
			[20]	= {Minutes = 3, Units = {2266, 2267}},
			[30]	= {Minutes = 2.5, Units = {2268, 2267}},
			[45]	= {Minutes = 2, Units = {2266, 2929}},
			[60]	= {Minutes = 1, Units = {2929, 2266}},
		},
	},
	[123] = {
		Name = "***Clan Goblin",
		LevelRange = "24/26/28",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {2262, 2263, 2264, 2930}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2262 	Goblin Fire 24 Fireshield AO2
		--	2263	Goblin Fire 26 Fireburst AO2
		--  2264    Goblin Fire 28 Assasine AO2
		--  2930    Goblin Fire 31 Assasine AO2 Coop
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2262, 2263, 2264}},
			[20]	= {Minutes = 3, Units = {2264, 2263}},
			[30]	= {Minutes = 2.5, Units = {2264, 2263}},
			[45]	= {Minutes = 2, Units = {2264, 2930}},
			[60]	= {Minutes = 1, Units = {2930, 2264}},
		},
	},
	[124] = {
		Name = "***Golem Earth high 1",
		LevelRange = "24/30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2269, 2269, 2270, 2270}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2269	Golem Stone 24 AO2
		--	2270	Golem Stone 30 AO2 
		
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2269, 2270}},
			[20]	= {Minutes = 3, Units = {2269, 2270}},
			[30]	= {Minutes = 2.5, Units = {2269, 2270}},
			[45]	= {Minutes = 2, Units = {2270, 2270}},
		},
	},		
	[125] = {
		Name = "***Kithar AO",
		LevelRange = "24/26/28",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2271, 2272, 2273, 2758}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2271	Kithar 24 AO2
		--	2272	Kithar 26 AO2 
		--  2273	Kithar 28 AO2
		--  2757	Kithar 30 AO2 Melee
		--  2758	Kithar 30 AO2 Heiler
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2271, 2272, 2273}},
			[20]	= {Minutes = 3, Units = {2273, 2272}},
			[30]	= {Minutes = 2.5, Units = {2757, 2272, 2758}},
			[45]	= {Minutes = 2, Units = {2271, 2757, 2758}},
		},
	},		
	[126] = {
		Name = "***Beastman",
		LevelRange = "24/26/29",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2274, 2275, 2276, 2931}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2274	Beastman 24 AO2
		--	2275	Beastman 26 AO2 
		--  2276	Beastman 29 AO2
		--  2931	Beastman 31 AO2 Coop
		
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2274, 2275, 2276}},
			[20]	= {Minutes = 3, Units = {2276, 2275}},
			[30]	= {Minutes = 2.5, Units = {2931, 2276}},
			[45]	= {Minutes = 2, Units = {2276, 2931}},
		},
	},		
	[127] = {
		Name = "***Minotaur",
		LevelRange = "24/30/32",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {1911, 2150, 2152}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1911	Minotaur 24 AO
		--	2150	Minotaur 30 AO2 
		--  2152	Minotaur 32 AO2
		
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1911, 2150}},
			[20]	= {Minutes = 3, Units = {1911, 2150}},
			[30]	= {Minutes = 2.5, Units = {2152, 2150}},
			[45]	= {Minutes = 2, Units = {1911, 2152}},
		},
	},										
	[128] = {
		Name = "***Skeleton",
		LevelRange = "28/29/30/35/36",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {2054, 2055, 2277, 2278, 2054}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2054	Skeleton Normal 30 AO2
		--	2055	Skeleton Normal Bow 29 AO2 
		--  2056	Skeleton Normal Caster 28 AO2
		--  2277 	Skeleton Greater 35 AO2
		--  2278    Skeleton Greater 36 AO2
		
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[5]	= {Minutes = 3, Units = {2054, 2055, 2277}},
			[10]	= {Minutes = 2.5, Units = {2054, 2055, 2277}},
			[20]	= {Minutes = 2, Units = {2054, 2277, 2278}},
			[30]	= {Minutes = 2, Units = {2277, 2055, 2278}},
		},
	},	
	[129] = {
		Name = "***Blades",
		LevelRange = "25/30/35",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {1375, 317, 2279, 2280, 2279}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1375	Blade Weaver 25
		--	317		Blade Principal 25 
		--	2279	Blade Weaver Melee 30 AO2
		--  2280	Blade Principal Caster 35 AO2
		
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[5]	= {Minutes = 3, Units = {1375, 317, 2279}},
			[10]	= {Minutes = 2.5, Units = {1375, 317, 2279}},
			[20]	= {Minutes = 2, Units = {2280, 2279}},
			[30]	= {Minutes = 2, Units = {2280, 2279}},
		},
	},	
	[130] = {
		Name = "***Elemental Earth Evil",
		LevelRange = "30/35/37",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2290, 2289, 2291}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2290	Elemental Earth 30 AO2
		--	2289    Elemental Earth 35 AO2 
		--	2291	Elemental Earth 37 AO2
		
		
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2290, 2289, 2291}},
			[20]	= {Minutes = 3, Units = {2290, 2289, 2291}},
			[30]	= {Minutes = 2.5, Units = {2290, 2289, 2291}},
			[45]	= {Minutes = 2, Units = {2290, 2289, 2291}},
		},
	},		
	[131] = {
		Name = "***Elemental Fire Evil",
		LevelRange = "30/35/37",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2287, 2288, 2292}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2287	Elemental Fire 30 AO2
		--	2288    Elemental Fire 35 AO2 
		--	2292	Elemental Fire 37 AO2
		
		
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2287, 2288, 2292}},
			[20]	= {Minutes = 3, Units = {2287, 2288, 2292}},
			[30]	= {Minutes = 2.5, Units = {2287, 2288, 2292}},
			[45]	= {Minutes = 2, Units = {2287, 2288, 2292}},
		},
	},			
	[132] = {
		Name = "***Animal Spider",
		LevelRange = "28/30/35",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {2176, 2177, 2145}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2176	Felsspinne Greater 28 AO2
		--	2177    Felsspinne Giant 30 AO2 
		--	2145	Giant Green 35 AO2
		--  2503    Felsspinne Giant 40 AO2
				
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2176, 2177, 2145}},
			[20]	= {Minutes = 3, Units = {2145, 2177, 2145}},
			[30]	= {Minutes = 2.5, Units = {2145, 2145, 2503}},
			[45]	= {Minutes = 2, Units = {2145, 2145, 2503}},
		},
	},		
	[133] = {
		Name = "***Basilisk",
		LevelRange = "23/28/35",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= { 2174, 2293, 2292}, 	-- die units, die zu beginn der karte gespawned sein sollen
		
		--	2174    Basilisk Desert Caster 28 AO2
		--  2292	Basilisk Desert Caster 35 AO2 
		--  2932	Basilisk Melee 38 AO2
			
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2174, 2293}},
			[20]	= {Minutes = 3, Units = {2174, 2293}},
			[30]	= {Minutes = 2.5, Units = {2932, 2174, 2293}},
			[45]	= {Minutes = 2, Units = {2932, 2174, 2293}},
		},
	},
	[134] = {
		Name = "***IceElf Coop_41(Race: MP Generic)",
		LevelRange = "20-24 ",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2814, 2815, 2816, 2817, 2818}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2814	Elf Evil WinterMelee 20 AO2
		--	2815	Elf Evil Winter Archer 24 AO2
		--  2816	Elf Evil Wintermage 21 AO2 Freeze
		--  2817	Elf Evil Wintermage 21 AO2 Ice Elemental 
		--  2818	Elf Evil Wintermage 21 AO2 Iceburst 
			
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2814, 2815, 2816, 2817, 2818}},
			[20]	= {Minutes = 3, Units = {2814, 2815, 2816, 2817, 2818}},
			[30]	= {Minutes = 2.5, Units = {2814, 2815, 2816, 2817, 2818}},
			[45]	= {Minutes = 2, Units = {2814, 2815, 2816, 2817, 2818}},
		},
	},	
	[135] = {
		Name = "***Icegolem Coop_41(Race: MP Generic)",
		LevelRange = "23/28/35",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2819, 2820, 2821}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2819	Golem Ice 26 Iceburst
		--	2820		Golem Ice 20 Freeze
		--	2821	Golem ice 20 Iceburst
					
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2820, 2821}},
			[20]	= {Minutes = 3, Units = {2820, 2821}},
			[30]	= {Minutes = 2.5, Units = {2820, 2821}},
			[45]	= {Minutes = 2, Units = {2820, 2821}},
		},
	},
	[136] = {
		Name = "***Evil Human Coop_42(Race: MP Generic)",
		LevelRange = "24 ",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2822, 2823, 2824}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2822	Human Söldner Spear Evil 24 AO2
		--	2823	Human Söldner Evil 24 AO2
		--  2824	Human Söldner Heiler Evil 24 AO2
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2822, 2823, 2824}},
			[20]	= {Minutes = 3, Units = {2822, 2823, 2824}},
			[30]	= {Minutes = 2.5, Units = {2822, 2823, 2824}},
			[45]	= {Minutes = 2, Units = {2822, 2823, 2824}},
		},
	},	
	[137] = {
		Name = "***Dwarf Ghost Coop_42(Race: MP Generic)",
		LevelRange = "20-24",
		Goal = GoalCoopAggressive,
		MaxClanSize = 20, 
		Init	= {2825, 2826, 2826}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2825	Dwarf Evil Elder 20 AO2
		--	2826	Dwarf Evil Melee 24 AO2
		--	2827	Dwarf Evil Priest 24 AO2
					
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2825, 2826}},
			[20]	= {Minutes = 3, Units = {2825, 2826}},
			[30]	= {Minutes = 2.5, Units = {2825, 2826}},
			[45]	= {Minutes = 2, Units = {2825, 2826}},
		},
	},	
	[138] = {
		Name = "***Skelette Coop_43",
		LevelRange = "28-30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2123, 2056, 2277, 2899}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 2123 Skeleton Normal 28 AO2
		-- 2056 Skeleton Normal 28 Lifetap AO2
		-- 2055 Skeleton Normal 29 Bow AO2
		-- 2054 Skeleton Normal 30 Axe & Shild AO2
		-- 2277 Skeleton Greater 35 Speer & Schild AO2
		-- 2278 Skeleton Greater 36 Schock AO2
		-- 2899 Skeleton Normal 36 Heiler AO2
		-- 2520 Skeleton Normal 36 Aura of Weakness AO2
					
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2123, 2520, 2054, 2055}},
			[20]	= {Minutes = 3, Units = {2278, 2056, 2054, 2055}},
			[30]	= {Minutes = 2.5, Units = {2277, 2899, 2054, 2055}},
			[45]	= {Minutes = 2, Units = {2899, 2278, 2277, 2520}},
		},
	},	
	[139] = {
		Name = "***Spiders Coop_43",
		LevelRange = "24, 28, 30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {2145, 2176, 2177, 2503}, 	-- die units, die zu beginn der karte gespawned sein sollen
	
		--	2176	Felsspinne Greater 28 AO2
		--	2177    Felsspinne Giant 30 AO2 
		--	2145	Giant Green 35 AO2
		--  2503    Felsspinne Giant 40 AO2
					
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2145, 2176}},
			[20]	= {Minutes = 3, Units = {2145, 2176}},
			[30]	= {Minutes = 2.5, Units = {2503, 2177, 2145}},
			[45]	= {Minutes = 2, Units = {2503, 2177, 2145}},
		},
	},	
	[140] = {
		Name = "***Animal Bug Coop_43",
		LevelRange = "25, 28, 30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {2171, 2172, 2173, 2933}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 2173 Animal Beetle Desert Giant 30 AO2
		-- 2172 Animal Beetle Desert Greater 28 AO2
		-- 2171 Animal Beetle Desert Lesser 25 AO2
		-- 2933 Animal Beetle Desert Greater 38 AO2
		
					
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2171, 2172}},
			[20]	= {Minutes = 3, Units = {2173, 2172}},
			[30]	= {Minutes = 2.5, Units = {2172, 2173, 2933}},
			[45]	= {Minutes = 2, Units = {2172, 2173, 2933}},
		},
	},		
	[141] = {
		Name = "***Clan Human Evil AO2 Coop_43",
		LevelRange = "28, 30, 38",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2497, 2496, 2934, 2496}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 2497 Kathai Heiler 34 AO2 
		-- 2496 Kathai Melee 28 AO2
		-- 2934 Kathai Melee 38 AO2 Coop
		
		
					
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2497, 2496}},
			[20]	= {Minutes = 3, Units = {2497, 2496}},
			[30]	= {Minutes = 2.5, Units = {2497, 2934, 2496}},
			[45]	= {Minutes = 2, Units = {2497, 2934}},
		},
	},
	[142] = {
		Name = "***Skelette Coop_44",
		LevelRange = "28-36",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {2123, 2054, 2899, 2520, 2520}, 	-- die units, die zu beginn der karte gespawned sein sollen
		
		
		
		-- 2123 Skeleton Normal 28 AO2
		-- 2056 Skeleton Normal 28 Lifetap AO2
		-- 2055 Skeleton Normal 29 Bow AO2
		-- 2054 Skeleton Normal 30 Axe & Shild AO2
		-- 2277 Skeleton Greater 35 Speer & Schild AO2
		-- 2278 Skeleton Greater 36 Schock AO2
		-- 2899 Skeleton Normal 36 Heiler AO2
		-- 2520 Skeleton Normal 36 Aura of Weakness AO2
		
					
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2277, 2055, 2054}},
			[20]	= {Minutes = 3, Units = {2278, 2055, 2054}},
			[30]	= {Minutes = 2.5, Units = {2278, 2520, 2899}},
			[45]	= {Minutes = 2, Units = {2277, 2278, 2899}},
		},
	},	
	[143] = {
		Name = "***Beastman Coop_44",
		LevelRange = "24-29",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2275, 2276, 2931, 2935, 2935}, 	-- die units, die zu beginn der karte gespawned sein sollen
		
		-- 2275 Beastman 26 AO2 
		-- 2276 Beastman 29 AO2
		-- 2931	Beastman 31 AO2 Coop
		-- 2935 Beastman 38 AO2 Coop
						
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2931, 2275, 2276, 2935}},
			[20]	= {Minutes = 3, Units = {2931, 2935, 2276}},
			[30]	= {Minutes = 2.5, Units = {2931, 2935, 2276}},
			[45]	= {Minutes = 2, Units = {2931, 2935, 2276}},
		},
	},	
	[144] = {
		Name = "***Minotaur Coop_44",
		LevelRange = "32-38",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {2152, 2153, 2154, 2395, 2395}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 2152 Minotaur 32 AO
		-- 2153 Minotaur 33 AO2 
		-- 2154 Minotaur 34 AO2
		-- 2395 Minotaur 38 AO2
		
						
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2152, 2153, 2154, 2395}},
			[20]	= {Minutes = 3, Units = {2154, 2395}},
			[30]	= {Minutes = 2.5, Units = {2154, 2395}},
			[45]	= {Minutes = 2, Units = {2154, 2395}},
		},
	},	
	[145] = {
		Name = "***Kithar Coop_44",
		LevelRange = "30-38",
		Goal = GoalCoopAggressive,
		MaxClanSize = 15, 
		Init	= {2936, 2758, 2757, 2937, 2937}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 2758 Kithar 30 AO2 Heiler
		-- 2757 Kithar 30 AO2 Melee 
		-- 2936 Kithar 35 AO2 Melee Coop 
		-- 2937 Kithar 40 AO2 Melee Coop 
						
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2936, 2758, 2757}},
			[20]	= {Minutes = 3, Units = {2936, 2758, 2757}},
			[30]	= {Minutes = 2.5, Units = {2936, 2937}},
			[45]	= {Minutes = 2, Units = {2936, 2937}},
		},
	},	
	[146] = {
		Name = "***Waldschrat Coop_45",
		LevelRange = "30,35,40,45",
		Goal = GoalCoopAggressive,
		MaxClanSize = 6, 
		Init	= {2499, 2500, 2501, 2939, 2938}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 2499 Waldschrat 30 AO2
		-- 2500 Waldschrat 35 AO2 
		-- 2501 Waldschrat 40 AO2
		-- 2938 Waldschrat 45 AO2
		-- 2939 Waldschrat 45 AO2 Coop
						
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2499, 2500}},
			[20]	= {Minutes = 3, Units = {2501, 2500}},
			[30]	= {Minutes = 2.5, Units = {2501, 2938, 2939}},
			[45]	= {Minutes = 2, Units = {2501, 2938, 2939}},
		},
	},	
	[147] = {
		Name = "***Spiders Coop_45",
		LevelRange = "30,35,40,45",
		Goal = GoalCoopAggressive,
		MaxClanSize = 6, 
		Init	= {2177, 2502, 2503, 2940}, 	-- die units, die zu beginn der karte gespawned sein sollen
		-- 2177 Spider Giant Felsspinne 30 AO2
		-- 2502 Spider Giant Felsspinne 35 AO2 
		-- 2503 Spider Giant Felsspinne 40 AO2
		-- 2940 Spider Giant Felsspinne 45 AO2
		
						
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2177, 2502}},
			[20]	= {Minutes = 3, Units = {2177, 2502}},
			[30]	= {Minutes = 2.5, Units = {2940, 2502, 2503}},
			[45]	= {Minutes = 2, Units = {2940, 2502, 2503}},
		},
	},
	[148] = {
		Name = "***Test_Siege***",
		LevelRange = "for testing only",
		Goal = GoalCoopAggressive,
		MaxClanSize = 10, 
		Init	= {2829, 2829, 2829}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--  2829	CoopSiegeTestUnit
		--	2763	DarkElf Fire Assassin 16 AO
		--	2764	DarkElf Fire Deathknight 15 AO
		--	2765	DarkElf Fire Sorcerer 16 AO
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[5]	= {Minutes = 1, Units = {2829}},
		},
	},
	[149] = {
		Name = "***Skeleton_37",
		LevelRange = "24/25/30",
		Goal = GoalCoopAggressive,
		MaxClanSize = 18, 
		Init	= {2133, 2584, 2557}, 	-- die units, die zu beginn der karte gespawned sein sollen
		
		--	2584	Skeleton Normal Bow 25 AO2 
		--  2133	Skeleton Normal Schild und Schwert 24 AO2
		--  2557 	Skeleton Greater 30 AO2
		
		
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2133, 2584, 2557}},
			[20]	= {Minutes = 3, Units = {2133, 2584, 2557}},
			[30]	= {Minutes = 2.5, Units = {2133, 2584, 2557}},
			[45]	= {Minutes = 2, Units = {2133, 2584, 2557}},
		},
	},																																																																																																																																												
	[150] = {
		Name = "***Skeleton_37",
		LevelRange = "24/25/30",
		Goal = GoalCoopDefensive,
		MaxClanSize = 18, 
		Init	= {2133, 2584, 2557}, 	-- die units, die zu beginn der karte gespawned sein sollen
		
		--	2584	Skeleton Normal Bow 25 AO2 
		--  2133	Skeleton Normal Schild und Schwert 24 AO2
		--  2557 	Skeleton Greater 30 AO2
		
		
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2133, 2584, 2557}},
			[20]	= {Minutes = 3, Units = {2133, 2584, 2557}},
			[30]	= {Minutes = 2.5, Units = {2133, 2584, 2557}},
			[45]	= {Minutes = 2, Units = {2133, 2584, 2557}},
		},
	},		
	-------------- Defensive Groups ----------------
	[151] = {
		Name = "***Elf RPG Wintermage high 2",
		LevelRange = "20/21/24",
		Goal = GoalCoopDefensive,
		MaxClanSize = 18, 
		Init	= {2925, 1350, 2235}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	1351	Elf Evil Wintermage 21 Freeze
		--	1350	Elf Evil Wintermage 21 Ice Elemental
		--	1352	Elf Evil Wintermage 21 Iceburst
		--  2925	Elf Evil Winter 	30 Melee AO2 Coop
		--	2235	Elf Evil Winter		24 Bow
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {1351, 2235, 2235}},
			[20]	= {Minutes = 3, Units = {1351, 2235, 2235}},
			[30]	= {Minutes = 2.5, Units = {2235, 2235, 2925}},
			[45]	= {Minutes = 2, Units = {2925, 2235, 2235}},
		},
	},
	[152] = {
		Name = "***Clan Trolle Urok",
		LevelRange = "24/26/28",
		Goal = GoalCoopDefensive,
		MaxClanSize = 18, 
		Init	= {2266, 2268, 2267, 2929}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2266 	Troll Urok Champion 28 AO2
		--	2268	Troll Urok Smasher 24 AO2
		--  2267    Troll Urok Thrower 26 AO2
		--	2929 	Troll Urok Champion 31 AO2 Coop
		
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2266, 2267}},
			[20]	= {Minutes = 3, Units = {2266, 2267}},
			[30]	= {Minutes = 2.5, Units = {2268, 2267}},
			[45]	= {Minutes = 2, Units = {2266, 2929}},
			[60]	= {Minutes = 1, Units = {2929, 2266}},
		},
	},
	[153] = {
		Name = "***Icegolem Coop_41(Race: MP Generic)",
		LevelRange = "23/28/35",
		Goal = GoalCoopDefensive,
		MaxClanSize = 20, 
		Init	= {2819, 2820, 2821}, 	-- die units, die zu beginn der karte gespawned sein sollen
		--	2819	Golem Ice 26 Iceburst
		--	2820		Golem Ice 20 Freeze
		--	2821	Golem ice 20 Iceburst
					
		SpawnData =
		{
		--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
			[10]	= {Minutes = 3.5, Units = {2820, 2821}},
			[20]	= {Minutes = 3, Units = {2820, 2821}},
			[30]	= {Minutes = 2.5, Units = {2820, 2821}},
			[45]	= {Minutes = 2, Units = {2820, 2821}},
		},
	},							

}
