-->INFO: Oberstadtwache

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--- Wache wird lieb wenn Alyah Kaiserin ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_AlyahKaiserin"},
	},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}
OnIdleGoHome
{
X = 320, Y = 275, Direction = 4, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_OberstadtwacheRechts1Homepoint"},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


--- Dialog zwischen den Wachen am rechten Aufgang ---
OnOneTimeEvent
{
	Conditions =
	{
	IsGlobalTimeElapsed{Name = "c_P204_CounterNasarSagtWas", Seconds = 8, UpdateInterval = 10}, 
	PlayerUnitInRange {X = 309, Y = 269, Range = 5, FigureType = Avatar, UpdateInterval = 20},
	IsGlobalFlagFalse {Name = "g_P204_WachenDialogBetrogener"},
	IsGlobalFlagFalse{Name = "g_P204_OberstadttorRechtsOffen"},		
	},

	Actions =
	{
		Outcry { NpcId = 8845, Tag = "oca2gatekeeper_ijoloP204_001", Delay = FALSE, String = "Heda, Nasar! Was hast du denn zu grinsen? Warst du wieder bei Borons Frau?"},
		Outcry { NpcId = 8846, Tag = "oca2gatekeeper_nasarP204_001", Delay = FALSE, String = "Allerdings! Hübsch feurig die kleine Sarah!"},
		Outcry { NpcId = 8845, Tag = "oca2gatekeeper_ijoloP204_002", Delay = FALSE, String = "Sei vorsichtig, dass Boron nichts merkt! Der ist stark wie ein Ochse!"},
		Outcry { NpcId = 8846, Tag = "oca2gatekeeper_nasarP204_002", Delay = FALSE, String = "Wohl eher dumm wie ein Ochse! Er glaubt, sie wäre am nähen, der Einfaltspinsel, hä hä!"},
		SetGlobalTimeStamp{Name = "c_P204_CounterWacheRechtsSatzA"},
		SetGlobalFlagTrue {Name = "g_P204_WachenOutcryWasser"},
		SetGlobalFlagTrue {Name = "g_P204_DialogWachenLinks"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalFlagFalse{Name = "g_P204_OberstadttorRechtsOffen"},		
	   IsGlobalTimeElapsed{Name = "c_P204_CounterWacheRechtsSatzA", Seconds = 8, UpdateInterval = 10}, 
	},

	Actions =
	{
--		Outcry { NpcId = 8846, Tag = "oca2gatekeeper_nasarP204_001", String = "Allerdings! Hübsch feurig die kleine Sarah!"},
		SetGlobalTimeStamp{Name = "c_P204_CounterWacheRechtsSatzB"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalFlagFalse{Name = "g_P204_OberstadttorRechtsOffen"},
	   IsGlobalTimeElapsed{Name = "c_P204_CounterWacheRechtsSatzB", Seconds = 8, UpdateInterval = 10}, 
	},

	Actions =
	{
--		Outcry { NpcId = 8845, Tag = "oca2gatekeeper_ijoloP204_002", String = "Sei vorsichtig, dass Boron nichts merkt! Der ist stark wie ein Ochse!"},
		SetGlobalTimeStamp{Name = "c_P204_CounterWacheRechtsSatzC"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
       IsGlobalFlagFalse{Name = "g_P204_OberstadttorRechtsOffen"},	
	   IsGlobalTimeElapsed{Name = "c_P204_CounterWacheRechtsSatzC", Seconds = 8, UpdateInterval = 10}, 
	},

	Actions =
	{
--		Outcry { NpcId = 8846, Tag = "oca2gatekeeper_nasarP204_002", String = "Wohl eher dumm wie ein Ochse! Er glaubt, sie wäre am nähen, der Einfaltspinsel, hä hä!"},
		SetGlobalFlagFalse {Name = "g_P204_WachenDialogBetrogener"},
		SetGlobalFlagTrue {Name = "g_P204_WacheGehtZuIhremPosten"},
		SetGlobalFlagFalse {Name = "g_P204_WachenOutcryWasser"},
	}
}


OnIdleGoHome
{
	X = 320, Y = 275, WalkMode = Walk, Direction = South,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_WacheGehtZuIhremPosten"},
	},

	HomeActions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9667"},
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_10092"},
		SetGlobalFlagTrue {Name = "g_P204_OberstadtwacheRechts1Homepoint"},
		SetGlobalFlagFalse{Name = "g_P204_WacheGehtZuIhremPosten"},
		SetGlobalFlagTrue {Name = "g_P204_WacheDespawntImTurm"},
		QuestBegin {QuestId = 940},
	}
}

-- Wache wird agro, wenn Tor geöffnet wird und sie nicht abgelenkt wurde
OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterOberstadttorRechts", Seconds = 2, UpdateInterval = 10}, 
	   IsGlobalFlagTrue {Name = "g_P204_OberstadttorRechtsOffen"},
	   IsGlobalFlagFalse {Name = "g_P204_BetrogenerKampf"},
	   IsGlobalFlagFalse{Name = "g_P204_EmpyriaAlarmiert"},  
	},

	Actions =
	{
		Outcry { NpcId = 8846, Tag = "oca2sergeantP204_001", String = "Ein Eindringling! Alarm!" },
		SetGlobalFlagTrue {Name = "g_P204_OberstadtwacheHilfe"},
		ChangeRace{Race = 150, NpcId = self},
	}
}


--- Wache wird agro nach cutscene Alyah Dryade ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert"},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8846"},
	}
}


--- Wortwechsel mit Ehemann ---
OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterEhemannStreitA", Seconds = 6, UpdateInterval = 10}, 
	},

	Actions =
	{
		Outcry { NpcId = 8846, Tag = "oca2gatekeeper_nasarP204_003", String = "Was denn Boron? Ich weiß gar nicht wovon dur redest?"},
		SetGlobalFlagTrue{Name = "g_P204_EhemannInStellung"},
		SetGlobalFlagFalse{Name = "g_P204_OberstadttorRechtsBewacht"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterEhemannStreitB", Seconds = 6, UpdateInterval = 10}, 
	   IsGlobalFlagTrue {Name = "g_P204_WacheEhemannStreit"},	
	},

	Actions =
	{
		Outcry { NpcId = 8846, Tag = "oca2gatekeeper_nasarP204_004", String = "Was willst du mich lehren? Da bin ich ja mal gespannt!"},
		SetGlobalFlagFalse {Name = "g_P204_WacheEhemannStreit"},	
--		SetGlobalFlagFalse {Name = "g_P204_WachenOutcryWasser"},
	}
}


OnIdleGoHome
{
	X = 328, Y = 274, WalkMode = Run, Direction = East,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_WacheGehtZuEhemann"},
	},

	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_OberstadttorRechtsBewacht"},
		SetGlobalFlagFalse {Name = "g_P204_OberstadtwacheRechts1Homepoint"},
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9667"},
		SetGlobalFlagFalse{Name = "g_P204_WacheGehtZuEhemann"},
		SetGlobalFlagTrue{Name = "g_P204_KampfMitEhemann"},
		SetRewardFlagTrue { Name = "OberstadtRechtsErreicht" },
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_KampfMitEhemann"},
		FigureHasHealth{Percent = 35, NpcId = self, UpdateInterval = 10},
	},

	Actions =
	{
		SetNoFightFlagTrue{NpcId = 10092},
		ChangeRace{Race = 152, NpcId = self},
		ChangeRace{Race = 152, NpcId = 10092},
		SetGlobalFlagTrue{Name = "g_P204_KampfMitEhemannZuende"},
		SetGlobalFlagFalse{Name = "g_P204_KampfMitEhemann"},
		SetGlobalFlagTrue{Name = "g_P204_EhemannWarnung"},		
	}
}


OnIdleGoHome
{
	X = 308, Y = 276, WalkMode = Walk, Direction = North,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_KampfMitEhemannZuende"},
	},

	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_VerletzteWacheDespawnt"},
	}
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_VerletzteWacheDespawnt", UpdateInterval = 10},
	}
}

------OutcryDummy Event für Scriptparser
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue{Name = "NeverTrue"}
			},
Actions = {
		Outcry { NpcId = 8846, Tag = "oca2gatekeeper_nasarP204_005", String = "Verflixt! Wenn Yrmir das kaputte Schloss sieht, verfüttert er mich an die Kithar!"},	
		}
}
EndDefinition()

end
