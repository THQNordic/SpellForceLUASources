-- Untoten variablen:
-- Attack Positionen in den versch. Camps und so
AttackVorpostenX = 150
AttackVorpostenY = 215
AttackZwergendorfX = 112
AttackZwergendorfY = 332
AttackZwergendorf2X = 171
AttackZwergendorf2Y = 334

-- Kreuzungen, damit die Untoten nicht immer gleich ankommen
JunctionRampe1X = 124
JunctionRampe1Y = 232
JunctionRampe2X = 126
JunctionRampe2Y = 305



-- Zeiten für die Angriffswellen

AngriffswelleEinsP108 = 240
AngriffswelleZweiP108 = 480
AngriffswelleDreiP108 = 540
AngriffswelleVierP108 = 780

-- Positionen für die Angriffswellen
VorpostenX = 150
VorpostenY = 217

HauptstadtP108X = 126
HauptstadtP108Y = 335

-- Rangeangabe bei NebenQuest
Meter = 12
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- cutscene rename
--dofile("script/p108/n6048_CutsceneHerstellungEntry.lua")
	
dofile("script/p108/n32015_CutsceneHerstellungEntry.lua")

dofile("script/p108/n0_ItemScript.lua")
dofile("script/FahrendeHaendler.lua")


PlatformInitAction (SetGlobalTimeStamp {Name = "KarteBetretenP108"})
OneTimeInitAction  (SetRewardFlagTrue {Name = "P108KarteErreicht"})

OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 608, State = StateUnknown},
	},
	Actions =
	{
		QuestBegin {QuestId = 608},
		
		
	}
}

OnOneTimeEvent 
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = 3},
	},
	Actions =
	{
		QuestSolve {QuestId = 597},
	}
}
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneHerstellungEntryOver"},
	},
	Actions =
	{
		QuestBegin {QuestId = 609},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = 10}
	},
	Actions =
	{
	
		
		ChangeBuildingOwner {X = 132, Y = 325},
		ChangeBuildingOwner {X = 142, Y = 325},
		ChangeBuildingOwner {X = 169, Y = 324},
		ChangeBuildingOwner {X = 173, Y = 338},
		ChangeBuildingOwner {X = 153, Y = 340},
		ChangeBuildingOwner {X = 144, Y = 334},
		ChangeBuildingOwner {X = 150, Y = 345},
		ChangeBuildingOwner {X = 135, Y = 335},
		ChangeBuildingOwner {X = 121, Y = 341},
		ChangeBuildingOwner {X = 108, Y = 339},
		ChangeBuildingOwner {X = 106, Y = 326},
		ChangeBuildingOwner {X = 110, Y = 349},
		ChangeBuildingOwner {X = 105, Y = 346},
		ChangeBuildingOwner {X =  99, Y = 346},
		ChangeBuildingOwner {X = 141, Y = 203},
		ChangeBuildingOwner {X = 154, Y = 211},
		ChangeBuildingOwner {X = 157, Y = 215},
		ChangeBuildingOwner {X = 145, Y = 219},
		ChangeBuildingOwner {X = 158, Y = 227},
		ChangeBuildingOwner {X = 148, Y = 231},
		ChangeBuildingOwner {X = 100, Y = 188},
		ChangeBuildingOwner {X = 147, Y = 206},
		
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleEinsP108+20} 
	},
	Actions =
	{
		Outcry{Tag = "ocRodeP008_001", NpcId = 6758, String = "Sie kommen! Zu den Wällen!  Zu den Wällen!", Color = ColorWhite},
	}
	
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 6098},
		FigureDead {NpcId = 6099},
		FigureDead {NpcId = 6100},
		FigureDead {NpcId = 6101},
		FigureDead {NpcId = 6102},
		FigureDead {NpcId = 6103},
		FigureDead {NpcId = 6104},
		FigureDead {NpcId = 6105},
		FigureDead {NpcId = 6106},
		FigureDead {NpcId = 6107},
		FigureDead {NpcId = 6109},
		FigureDead {NpcId = 6110},
		FigureDead {NpcId = 6111},
		FigureDead {NpcId = 6112},
	},
	Actions =
	{
		Outcry{Tag = "ocRodeP008_002", NpcId = 6758, String = "Der Preis wird hoch sein, mein König!", Color = ColorWhite},
		SetGlobalTimeStamp {Name = "AngriffZwei"}
	}
	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "AngriffZwei", Seconds = 8} 
	},
	Actions =
	{
		Outcry{Tag = "ocRagnarP008_001", NpcId = 6048, String = "Zehn der ihren für einen von uns!", Color = ColorWhite},
	}
	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108+100} 
	},
	Actions =
	{
		Outcry{Tag = "ocRodeP008_003", NpcId = 6758, String = "Niethalf sei mit uns! Das ist das Ende!", Color = ColorWhite},
	}
	
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108+110} 
	},
	Actions =
	{
		Outcry{Tag = "ocRagnarP008_002", NpcId = 6048, String = "So gehen wir ein in Niethalfs Reich ...", Color = ColorWhite},
	}
	
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108+116} 
	},
	Actions =
	{
		Outcry{Tag = "ocRagnarP008_003", NpcId = 6048, String = "dort treffen wir unsere Ahnen und Waffenbrüder...", Color = ColorWhite},
	}
	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108+122} 
	},
	Actions =
	{
		Outcry{Tag = "ocRagnarP008_004", NpcId = 6048, String = "Und rasten bis Niethalf erneut unsere Seelen schmiedet...", Color = ColorWhite},
	}
	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108+168} 
	},
	Actions =
	{
		Outcry{Tag = "ocRagnarP008_005", NpcId = 6048, String = "für ein neues Leben in Ehre und Stärke!", Color = ColorWhite},
	}
	
}


OnOneTimeEvent
{	
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "AngriffeAbgewehrt", Seconds = 40},	
		IsGlobalFlagFalse {Name = "SpawnUramP108"},
	},
	Actions =
	{
		Outcry{Tag = "ocRagnarP008_006", NpcId = 6048, String = "Kommt her, Mensch! Wir müssen reden!", Color = ColorWhite},		
		QuestBegin {QuestId = 772},
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 6182},
		FigureDead {NpcId = 6183},
		FigureDead {NpcId = 6184},
		FigureDead {NpcId = 6185},
		FigureDead {NpcId = 6186},
		FigureDead {NpcId = 6187},
		FigureDead {NpcId = 6188},
		FigureDead {NpcId = 6189},
		FigureDead {NpcId = 6190},
		FigureDead {NpcId = 6191},
		FigureDead {NpcId = 6192},
		FigureDead {NpcId = 6193},
		FigureDead {NpcId = 6194},
		FigureDead {NpcId = 6195},
		FigureDead {NpcId = 6196},
		FigureDead {NpcId = 6197},
	},
	Actions =
	{
		QuestSolve {QuestId = 609},
		SetGlobalTimeStamp {Name = "AngriffeAbgewehrt"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SpawnUramP108"},
	},
	Actions =
	{
		QuestBegin {QuestId = 610},
		QuestSolve {QuestId = 772},
	}
}

-- Uram tot
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "P108_UramTot"},
		QuestState {QuestId = 610, State = StateActive},
	},
	Actions =
	{
		QuestChangeState {State = StateUnsolvable, QuestId = 610},
		QuestBegin {QuestId = 611},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "Windjalf", Seconds = 10},
	},
	Actions =
	{
		Outcry{Tag = "ocRagnarP008_007", NpcId = 6048, String = "Windjalf! Bei Eisen und Licht, ich hätte nie gedacht Euch wiederzusehen", Color = ColorWhite},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "Windjalf", Seconds = 18},
	},
	Actions =
	{
		Outcry{Tag = "ocWindjalfP008_002", NpcId = 6304, String = "Niethalfs Gnade wurde uns zuteil mein König. Wenn auch auf seltsame Art und Weise.", Color = ColorWhite},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SilberPanzer"},
	},
	Actions =
	{
		TransferItem {GiveItem = 4145, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WindjalfBefreitP108"},
	},
	Actions =
	{
		SetRewardFlagTrue {Name = "WindjalfBefreit"},
	}
}
------------------------------------------------
------------DER WEG NACH TIONDRIA---------------

------------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue {Name = "PlayerHasItemFarnhardtsTreasure"},
	},
	Actions =
	{
		QuestSolve {QuestId = 712},
		SetRewardFlagTrue { Name = "SQTiondriaSchatzGefunden" },
		QuestBegin {QuestId = 714}, 

	}
}







EndDefinition()
end


