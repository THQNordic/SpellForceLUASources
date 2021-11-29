 -----------------
-- Alle Outcries --
 -----------------
 
-------------------------------------
-- 001 - Urias verweist auf Höhlen --
-------------------------------------

OnOneTimeEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		ODER9
		{
		FigureInRange {X = 303, Y = 413, Range = 7, NpcId = Avatar},
		FigureInRange {X = 285, Y = 385, Range = 5, NpcId = Avatar},
		FigureInRange {X = 210, Y = 370, Range = 5, NpcId = Avatar}
		},
		IsGlobalFlagFalse {Name = "1H_A"},
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 10061, String = "Diese Höhlen! Irgend etwas regt sich da drin! Wir sollten sie im Auge behalten!" , Tag = "oca2uriasP207_001" , Color = ColorWhite},
	},
}
 
---------------------------------------------
-- 002 - Urias verweist auf Siegeeinheiten --
---------------------------------------------

OnOneTimeEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		FigureInRange {X = 187, Y = 341, Range = 7, NpcId = Avatar},
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 10061, String = "Diese Festen sind stark, Freund! Wir brauchen Belagerungswaffen!" , Tag = "oca2uriasP207_002" , Color = ColorWhite},
	},
}
 
---------------------------------------------------------
-- 003 - Urias bläst zum Angriff auf die erste Festung --
---------------------------------------------------------

OnOneTimeEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_p207_Erste_Festung_Tore_Offen"},
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 10061, String = "Stürmt die Feste! Vorwärts!" , Tag = "oca2uriasP207_003" , Color = ColorWhite},
	},
}

-----------------------------------------------------
-- 004 - Befreiter Zwerg hat Lebenschuld beglichen --
-----------------------------------------------------

OnOneTimeEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "oc_P207_Zwerg_Hat_Schuld_Beglichen"},
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 10764, String = "Ich glaube ich habe meine Lebenschuld beglichen, Runenkrieger!" , Tag = "oca2jarlP207_001" , Color = ColorWhite},
		Outcry{Delay = FALSE, NpcId = 10764, String = "Ich verlasse Euch jetzt! Fastholme wartet auf mich!" , Tag = "oca2jarlP207_002" , Color = ColorWhite},
	},
}
 
-----------------------------------------
-- 005 - Urias vor der zweiten Festung --
-----------------------------------------

OnOneTimeEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		FigureInRange {X = 85, Y = 128, Range = 5, NpcId = Avatar},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue{Name = "g_p207_Urias_Outcry_Dritte_Festung"},
	},
}

OnOneTimeEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		FigureInRange {X = 159, Y = 199, Range = 5, NpcId = Avatar},
		IsGlobalFlagFalse{Name = "g_p207_Urias_Outcry_Dritte_Festung"},
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 10061, String = "Hm, wir sollten die Umgebung nach einem anderen Weg in die Feste absuchen!" , Tag = "oca2uriasP207_004" , Color = ColorWhite},
	},
}
 
----------------------------------------------------------
-- 006 - Skerg nachdem er das Schalterrätsel gelöst hat --
----------------------------------------------------------

OnOneTimeEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "oc_P207_Skerg_Hat_Schalterraetsel_Geloest"},
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 10993, String = "All Hebel richtig jetzt! Tore jetzt offen!" , Tag = "oca2skergP207_001" , Color = ColorWhite},
	},
}
----------------------------------------------
-- 007 - Alyha kehrt mit Verstärkung zurück --
----------------------------------------------

OnOneTimeEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "oc_P207_Alyha_Kehrt_Zurueck_Mit_Verstaerkung"},
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 10060, String = "Hier kommt Verstärkung, Runenkrieger!" , Tag = "oca2alyahP207_001" , Color = ColorWhite},
		Outcry{Delay = FALSE, NpcId = 10060, String = "Los, vorwärts, Kathai! Nehmen wir sie in die Zange!" , Tag = "oca2alyahP207_002" , Color = ColorWhite},
		Outcry{Delay = FALSE, NpcId = 10061, String = "Ihr habt Euch reichlich Zeit gelassen, Alyah!" , Tag = "oca2uriasP207_005" , Color = ColorWhite},
		Outcry{Delay = FALSE, NpcId = 10060, String = "Privileg einer Dame. Jetzt redet nicht, kämpft!" , Tag = "oca2alyahP207_003" , Color = ColorWhite},
	},
}

--------------------------------------
-- 008 - Riese ruft/stöhnt um Hilfe --
--------------------------------------

OnOneTimeEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		FigureInRange {X = 249, Y = 462, Range = 7, NpcId = Avatar},
	},
	Actions = 
	{ 
		Outcry {Delay = FALSE, NpcId = 10512, String = "Goblins böse! Weg von Sachen! Ooh, Mjörn braucht Hilfe!" , Tag = "oca2giantP207_001" , Color = ColorWhite},
		QuestBegin {QuestId = 1032},
		QuestBegin {QuestId = 989},
	},
}
