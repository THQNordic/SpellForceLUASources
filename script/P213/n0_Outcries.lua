------------------------------------
--
--	Outcries für Bone Temple
--
-------------------------------------

--Hokan/Belial, Spieler betritt Endkampfareal
OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 443, Y = 209, Range = 10, UpdateInterval = 2}
	},
	Actions =
	{
		Outcry {Tag = "oca2maskedP213_001", NpcId = 11190, String = "Was? Runenkrieger, hier?", Color = ColorWhite},
		SetGlobalTimeStamp {Name = "gt_P213_OutcryBelial"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_OutcryBelial", Seconds = 8},
	},
	Actions =
	{
		Outcry {Tag = "oca2maskedP213_002", NpcId = 11190, String = "Kommt her, eure Seelen lasse ich mir als erstes munden!", Color = ColorWhite},
	}
}

--	Hokan/Belial, ca 99% Health
OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth {NpcId = 11190, Percent = 99, UpdateInterval = 2},
	},
	Actions =
	{
		Outcry {Tag = "oca2maskedP213_003", NpcId = 11190, String = "Ist das alles, was Ihr könnt?", Color = ColorWhite},
		Outcry {Tag = "oca2maskedP213_004", NpcId = 11190, String = "Kniet vor Eurem Herrn! Ich bin unbezwingbar!", Color = ColorWhite},
	}
}

-- Erste Zirklemagier stirbt
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 9923},
	},
	Actions =
	{
		Outcry {Tag = "oca2maskedP213_005", NpcId = 11190, String = "Gib mir deine Seele! Ich brauche Kraft!", Color = ColorWhite},
	}
}

--Hokan/Belial, ca. 50% Health
OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth {NpcId = 11190, Percent = 50, UpdateInterval = 2},
	},
	Actions =
	{
		Outcry {Tag = "oca2maskedP213_007", NpcId = 11190, String = "Kniet nieder! Ich bin euer Gott!", Color = ColorWhite},
		IncreaseGlobalCounter {Name = "Test"},
	}
}

--Hokan/Belial, ca. 30% Health
OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth {NpcId = 11190, Percent = 30, UpdateInterval = 2},
	},
	Actions =
	{
		Outcry {Tag = "oca2maskedP213_008", NpcId = 11190, String = "Ich werde schwächer! Unmöglich!", Color = ColorWhite},
	}
}

--Hokan/Belial, ca. 25% Health
OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth {NpcId = 11190, Percent = 25, UpdateInterval = 2},
	},
	Actions =
	{
		Outcry {Tag = "oca2maskedP213_009", NpcId = 11190, String = "Nein! Nein! All die Jahre des Wartens ... Umsonst!", Color = ColorWhite},
	}
}

--Hokan/Belial, ca. 22% Health
OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth {NpcId = 11190, Percent = 22, UpdateInterval = 2},
	},
	Actions =
	{
		Outcry {Tag = "oca2maskedP213_010", NpcId = 11190, String = "Ich will nicht zurück in die dunkle Tiefe! Nein!", Color = ColorWhite},
	}
}


--Ihr habt viel gelernt, Runenknechte! Sklaven! Vernichtet sie!	Hokan/Belial, reserviert falls wir ein Spawnevent machen wollen

	
--Hokan/Belial, aufsteigendes Pet spawnt
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_OutcryPet"}
	},
	Actions =
	{
		Outcry {Tag = "oca2maskedP213_011", NpcId = 11190, String = "Der Wandler wird mit jedem Augenblick stärker! Bald wird er Euch überlegen sein! ", Color = ColorWhite},
	}
}

------OutcryDummy Event für Scriptparser
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue{Name = "NeverTrue"}
			},
Actions = {
			Outcry {Tag = "oca2maskedP213_006", NpcId = 11190, String = "Ihr habt viel gelernt, Runenknechte! Sklaven! Vernichtet sie!", Color = ColorWhite},
			}
}