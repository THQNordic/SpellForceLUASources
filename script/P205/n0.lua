function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--- Cuscenes Init ---
dofile("script/p205/n32350_CutsceneSpinnenkoenigAvatar.lua")
dofile("script/p205/n32350_CutsceneSpinnenkoenigAvatarDunkel.lua")
dofile("script/p205/n32351_CutsceneDryadeKaiser.lua")
dofile("script/p205/n32352_CutsceneSpinnenkoenigKaiser.lua")
dofile("script/p205/n32353_CutsceneDryadeAvatar.lua")
dofile("script/p205/n32355_CutsceneTor.lua")
dofile("script/p205/n32356_CutsceneDariusBrief.lua")			
dofile("script/p205/n32353_CutsceneDryadeAvatarDunkel.lua")	
dofile("script/p205/n32354_CutsceneGartenEntgiftet.lua")	

dofile("script/Hadeko.lua")	

		

--- Quest lösen: Mainquest Empyria ---
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 810, State = StateActive, UpdateInterval = 10}, 
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		SetRewardFlagTrue { Name = "P205KarteErreicht"},
		QuestSolve {QuestId = 810},
	}
}
		
		
--- Cutscene mit Spinnenkönig und Phoenix starten ---
OnOneTimeEvent
{
	Conditions = 
	{
	   	PlayerUnitInRange {X = 131, Y = 301, Range = 8, FigureType = All , UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},	   	
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P205_CutsceneSpinnenkoenigPhoenixStart"},
	}
}


--- Cutscene mit Spinnenkönig und Schatten starten ---
OnOneTimeEvent
{
	Conditions = 
	{
	   	PlayerUnitInRange {X = 131, Y = 301, Range = 8, FigureType = All , UpdateInterval = 10},
	   	IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},	
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P205_CutsceneSpinnenkoenigSchattenStart"},
	}
}


--- Cutscene mit Dryade und Phoenix starten ---
OnOneTimeEvent
{
	Conditions = 
	{
	   	IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
	   	PlayerUnitInRange {X = 252, Y = 282, Range = 7, FigureType = All, UpdateInterval = 10},
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P205_CutsceneDryadePhoenixStart"},
	}
}


--- Cutscene mit Dryade und Schatten starten ---
OnOneTimeEvent
{
	Conditions = 
	{
	   	IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
	   	PlayerUnitInRange {X = 252, Y = 282, Range = 7, FigureType = All, UpdateInterval = 10},
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P205_CutsceneDryadeSchattenStart"},
	}
}


--- Cutscene mit Spinnenkönig und Kaiser starten ---
OnOneTimeEvent
{
	Conditions = 
	{
	   	PlayerUnitInRange {X = 240, Y = 371, Range = 3, FigureType = All , UpdateInterval = 10},
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P205_CutsceneSpinnenkoenigKaiserStart"},
	}
}

--- Quest lösen: Suche die Nymphen ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P205_NymphenFreiA"},
		IsGlobalFlagTrue{Name = "g_P205_NymphenFreiB"},
		IsGlobalFlagTrue{Name = "g_P205_NymphenFreiC"},		  	
	},
	
	Actions =
	{
		QuestSolve {QuestId = 865}
	}
}


--- Quest lösen: Zerstöre das Spinnennest ---
OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 133, Y = 322, Range = 20 , Owner = OwnerAll , BuildingId = 0 , UpdateInterval = 20}),
	},
	Actions =
	{
		QuestSolve{QuestId = 871},
		QuestBegin{QuestId = 867},
		SetRewardFlagTrue { Name = "SpinnencampZerstoert"},
	}
}


--- Outcry der Dryade ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed{Name = "c_P205_DryadeOutcry", Seconds = 3, UpdateInterval = 10}, 
	},
	Actions =
	{
	   Outcry { NpcId = 9250, Tag = "oca2dryadP205_001", String = "Das Wasser ist wieder rein! Der Hain ist gerettet!" },
	}
}


--- Quest lösen: Töte den Spinnenkönig und nimm ihm das Gegengift ab ---
--- Quest beginnen: Entgifte den Garten ---
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerHasItem{ItemId = 7069},
	},
	Actions =
	{
		QuestSolve{QuestId = 868},
		QuestBegin{QuestId = 869},
	}
}


--- Quest unlösbar machen wenn aktiv: Finde die Nymphen wenn Dyradengarten gelöst ---
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 865, State = StateActive, UpdateInterval = 10}, 
		IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"},
	},
	
	Actions =
	{
		SetGlobalFlagTrue { Name = "g_P204_NympenquestVerspielt"},	
		QuestChangeState {QuestId = 865, State = StateUnsolvable},
	}
}


--- Spawning der Hunde aufheben wenn das jeweilige Gebäude zerstört wurde ---
OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 367, Y = 251, Range = 5, Owner = OwnerAll , BuildingId = 0 , UpdateInterval = 10}),
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P205_Hunde1StopSpawn"},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 380, Y = 242, Range = 5, Owner = OwnerAll , BuildingId = 0 , UpdateInterval = 10}),
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P205_Hunde2StopSpawn"},
	}
}


----------------------------------------------------------------------------
--- Empyiria-Questen unlösbar machen falls aktiv wenn alle Tore auf sind ---
----------------------------------------------------------------------------

--- Tempeltorwache ablenken ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		QuestState{QuestId = 943, State = StateActive},
	},

	Actions =
	{
		QuestChangeState {QuestId = 943, State = StateUnsolvable},
	}
}


--- Basartor Ost ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		QuestState{QuestId = 948, State = StateActive},
	},

	Actions =
	{
		QuestChangeState {QuestId = 948, State = StateUnsolvable},
	}
}


--- Basartor Ost Schuldschein ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		QuestState{QuestId = 881, State = StateActive},
	},

	Actions =
	{
		QuestChangeState {QuestId = 881, State = StateUnsolvable},
		SetGlobalFlagTrue {Name = "g_P204_UrkundeSchonGegeben"},		
		TransferItem {TakeItem = 7217, Flag = Take},			
	}
}


--- Basartor Süd ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		QuestState{QuestId = 947, State = StateActive},
	},

	Actions =
	{
		QuestChangeState {QuestId = 947, State = StateUnsolvable},
	}
}


--- Basartor Süd Unterquest Brosche ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		QuestState{QuestId = 970, State = StateActive},
	},

	Actions =
	{
		QuestChangeState {QuestId = 970, State = StateUnsolvable},
		TransferItem {TakeItem = 7303, Flag = Take},	
	}
}


--- Basartor Süd Unterquest Ehefrau ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		QuestState{QuestId = 876, State = StateActive},
	},

	Actions =
	{
		QuestChangeState {QuestId = 876, State = StateUnsolvable},
		TransferItem {TakeItem = 7219, Flag = Take},			
	}
}


--- Basartor oben links ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		QuestState{QuestId = 949, State = StateActive},
	},

	Actions =
	{
		QuestChangeState {QuestId = 949, State = StateUnsolvable},
	}
}


--- Basartor oben links unzufriedene Wachen ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		QuestState{QuestId = 877, State = StateActive},
	},

	Actions =
	{
		QuestChangeState {QuestId = 877, State = StateUnsolvable},
	}
}


--- Basartor oben rechts ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		QuestState{QuestId = 950, State = StateActive},
	},

	Actions =
	{
		QuestChangeState {QuestId = 950, State = StateUnsolvable},
	}
}


--- Basartor oben rechts Ehemann ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_QuestenUnsolvable"},	
		QuestState{QuestId = 940, State = StateActive},
	},

	Actions =
	{
		QuestChangeState {QuestId = 940, State = StateUnsolvable},
	}
}



-------------------------------------------------------------------
--Heilige Stätten Quest
-------------------------------------------------------------------
-------------------------------------------------------------------

--Rewards der Dryade

--Ring:
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtRing"},
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 4653, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056}
	}
}

----------------------------
--weiße Magie:
-----------------------------
--Leben
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Leben, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtWeisseMagieSpell", UpdateInterval = 40},
		IsGlobalFlagFalse {Name = "g_P205SpielerWeisseMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6306, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerWeisseMagieSpellBekommen"}
	}
}

--Natur
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Natur, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtWeisseMagieSpell", UpdateInterval = 40},
		IsGlobalFlagFalse {Name = "g_P205SpielerWeisseMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5858, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerWeisseMagieSpellBekommen"}
	}
}

--Segnung
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Segnung, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtWeisseMagieSpell", UpdateInterval = 40},
		IsGlobalFlagFalse {Name = "g_P205SpielerWeisseMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6018, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerWeisseMagieSpellBekommen"}
	}
}
-------------------------------
--wenn keinen Level 16
OnOneTimeEvent
{
	Conditions = 
	{
		Negated(AvatarSkill {Skill = Leben, Level = 16, UpdateInterval = 40}),
		Negated(AvatarSkill {Skill = Segnung, Level = 16, UpdateInterval = 40}),
		Negated(AvatarSkill {Skill = Natur, Level = 16, UpdateInterval = 40}),
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtWeisseMagieSpell", UpdateInterval = 40},
		IsGlobalFlagFalse {Name = "g_P205SpielerWeisseMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		RandomizeGlobalCounter {Name = "gc_P205RandomWeisseMagie", MaxValue = 2},
		IncreaseGlobalCounter {Name = "gc_P205RandomWeisseMagie", Step = 1}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomWeisseMagie", Value = 1, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtWeisseMagieSpell", UpdateInterval = 40}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6306, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerWeisseMagieSpellBekommen"}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomWeisseMagie", Value = 2, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtWeisseMagieSpell", UpdateInterval = 40}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5858, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerWeisseMagieSpellBekommen"}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomWeisseMagie", Value = 3, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtWeisseMagieSpell", UpdateInterval = 40}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6018, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerWeisseMagieSpellBekommen"}
	}
}


------------------------------
--Elementarmagie:
-----------------------------
--Feuer
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Feuer, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtElementarMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P205SpielerElementarmagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5666, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerElementarmagieSpellBekommen"}
	}
}

--Eis
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Eis, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtElementarMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P205SpielerElementarmagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5618, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerElementarmagieSpellBekommen"}
	}
}

--Erde
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Erde, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtElementarMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P205SpielerElementarmagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5570, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerElementarmagieSpellBekommen"}
	}
}
------------------------------
--wenn keinen Level 16
OnOneTimeEvent
{
	Conditions = 
	{
		Negated(AvatarSkill {Skill = Erde, Level = 16, UpdateInterval = 40}),
		Negated(AvatarSkill {Skill = Eis, Level = 16, UpdateInterval = 40}),
		Negated(AvatarSkill {Skill = Feuer, Level = 16, UpdateInterval = 40}),
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtElementarMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P205SpielerElementarmagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		RandomizeGlobalCounter {Name = "gc_P205RandomElementarMagie", MaxValue = 2},
		IncreaseGlobalCounter {Name = "gc_P205RandomElementarMagie", Step = 1}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomElementarMagie", Value = 1, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtElementarMagieSpell", UpdateInterval = 30}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5666, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerElementarmagieSpellBekommen"}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomElementarMagie", Value = 2, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtElementarMagieSpell", UpdateInterval = 30}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5618, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerElementarmagieSpellBekommen"}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomElementarMagie", Value = 3, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtElementarMagieSpell", UpdateInterval = 30}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5570, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerElementarmagieSpellBekommen"}
	}
}


----------------------------
--schwarze Magie:
---------------------------
--Nekromantie
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Nekromantie, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtSchwarzeMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P205SpielerSchwarzeMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6274, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerSchwarzeMagieSpellBekommen"}
	}
}

--Tod
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Tod, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtSchwarzeMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P205SpielerSchwarzeMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5442, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerSchwarzeMagieSpellBekommen"}
	}
}

--Flüche
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Fluch, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtSchwarzeMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P205SpielerSchwarzeMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5922, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerSchwarzeMagieSpellBekommen"}
	}
}

-------------------------
--wenn keinen Level 16
OnOneTimeEvent
{
	Conditions = 
	{
		Negated(AvatarSkill {Skill = Fluch, Level = 16, UpdateInterval = 40}),
		Negated(AvatarSkill {Skill = Nekromantie, Level = 16, UpdateInterval = 40}),
		Negated(AvatarSkill {Skill = Tod, Level = 16, UpdateInterval = 40}),
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtSchwarzeMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P205SpielerSchwarzeMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		RandomizeGlobalCounter {Name = "gc_P205RandomSchwarzeMagie", MaxValue = 2},
			IncreaseGlobalCounter {Name = "gc_P205RandomSchwarzeMagie", Step = 1}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomSchwarzeMagie", Value = 1, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtSchwarzeMagieSpell", UpdateInterval = 30}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5442, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerSchwarzeMagieSpellBekommen"}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomSchwarzeMagie", Value = 2, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtSchwarzeMagieSpell", UpdateInterval = 30}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6274, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerSchwarzeMagieSpellBekommen"}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomSchwarzeMagie", Value = 3, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtSchwarzeMagieSpell", UpdateInterval = 30}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 5922, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerSchwarzeMagieSpellBekommen"}
	}
}
-----------------------------
--Mentalmagie:
----------------------------
--Verzauberung
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Verzauberung, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtMentalMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P205SpielerMentalMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6418, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerMentalMagieSpellBekommen"}
	}
}

--offensiv
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Offensiv, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtMentalMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P205SpielerMentalMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6450, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerMentalMagieSpellBekommen"}
	}
}

--Defensiv
OnOneTimeEvent
{
	Conditions = 
	{
		AvatarSkill {Skill = Defensiv, Level = 16, UpdateInterval = 40},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtMentalMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P205SpielerMentalMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6162, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerMentalMagieSpellBekommen"}
	}
}

----------------
--wenn keinen Level 16
OnOneTimeEvent
{
	Conditions = 
	{
		Negated(AvatarSkill {Skill = Fluch, Level = 16, UpdateInterval = 40}),
		Negated(AvatarSkill {Skill = Nekromantie, Level = 16, UpdateInterval = 40}),
		Negated(AvatarSkill {Skill = Tod, Level = 16, UpdateInterval = 40}),
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtMentalMagieSpell", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P205SpielerMentalMagieSpellBekommen", UpdateInterval = 5}
	},
	Actions =
	{
		RandomizeGlobalCounter {Name = "gc_P205RandomMentalmagie", MaxValue = 2},
		IncreaseGlobalCounter {Name = "gc_P205RandomMentalmagie", Step = 1}
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomMentalmagie", Value = 1, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtMentalMagieSpell", UpdateInterval = 30}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6162, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerMentalMagieSpellBekommen"}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomMentalmagie", Value = 2, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtMentalMagieSpell", UpdateInterval = 30}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6450, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerMentalMagieSpellBekommen"}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "gc_P205RandomMentalmagie", Value = 3, Operator = IsEqual, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "g_P205DryadeGibtMentalMagieSpell", UpdateInterval = 30}
	},
	Actions =
	{
		TransferItem {TakeItem = 0, GiveItem = 6418, Amount = 1, Flag = Give},
		QuestSolve {QuestId = 843},
		QuestSolve {QuestId = 1056},
		SetGlobalFlagTrue {Name = "g_P205SpielerMentalMagieSpellBekommen"}
	}
}



----I---------------------------------------I
----I                                       I
----I           Bank von Empyria            I
----I           Schatzbrief-Zähler          I
----I         (muß auf alle Karten!)        I
----I                                       I
----I---------------------------------------I



OnEvent
{
	Conditions =
	{
		PlayerHasItem{ItemId = 7357},
		IsGlobalTimeElapsed{Name = "g_SchatzbriefTimer", Seconds = 7000}
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "g_P204_SchatzbriefZins"},
		SetGlobalTimeStamp{Name = "g_SchatzbriefTimer"},
	}
}

----------------------------------------------------------
--				Storyquest Part.
----------------------------------------------------------


--- Shadow Dryad Kill unsolvable nach Cutscene
OnOneTimeEvent
{
	Conditions = 
	{
	QuestState{QuestId = 1087, State = StateActive}, 
	QuestState{QuestId = 1091, State = StateActive}, 
	IsGlobalFlagTrue{Name = "g_StoryQuestShadowCantKillDryad"},
	},
	Actions = 
	{ 
	QuestChangeState{QuestId = 1091, State = StateUnsolvable},
	}
}

---Weiter zur Uru Shadow
OnOneTimeEvent
{
	Conditions = 
	{
	QuestState{QuestId = 1087, State = StateActive}, 
	QuestState{QuestId = 1091, State = StateUnsolvable}, 
	IsGlobalFlagTrue{Name = "g_StoryQuestRescueUru"},
	},
	Actions = 
	{ 
	QuestBegin {QuestId = 1092},
	}
}

---Weiter zur Uru Phoenix
OnOneTimeEvent
{
	Conditions = 
	{
	QuestState{QuestId = 1087, State = StateActive}, 
	QuestState{QuestId = 1089, State = StateActive}, 
	IsGlobalFlagTrue{Name = "g_StoryQuestRescueUru"},
	},
	Actions = 
	{ 
	QuestSolve {QuestId = 1089},
	QuestBegin {QuestId = 1092},
	}
}
EndDefinition()
end
