-->INFO: Gladiator32
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},	
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10582"},				

-- ZUM DEBUGGEN! SCHNELL-TEST...
		--QuestBegin {QuestId = 939}, QuestBegin {QuestId = 946}, QuestBegin {QuestId = 947}, QuestBegin {QuestId = 948},QuestSolve {QuestId = 951},
		--SetGlobalFlagTrue {Name = "g_P204_StadtwachenDialog"}, TransferItem {GiveItem = 4630, Flag = Give}, QuestSolve {QuestId = 811},
		--TransferXP{XP = 250000},
			
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	 	IsGlobalFlagTrue{Name = "g_P204_GladiatorChangeUnit"},
		AvatarLevel{Level = 32,  Player = 1, UpdateInterval = 60},
		Negated(AvatarLevel{Level = 36,  Player = 1, UpdateInterval = 60}),
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_GladiatorLevel32"},
	 	SetGlobalFlagFalse{Name = "g_P204_GladiatorChangeUnit"},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	 	IsGlobalFlagTrue{Name = "g_P204_GladiatorChangeUnit"},
		AvatarLevel{Level = 36,  Player = 1, UpdateInterval = 60},
		Negated(AvatarLevel{Level = 40,  Player = 1, UpdateInterval = 60}),
	},

	Actions =
	{
		ChangeUnit {Unit = 2565, NpcId = self, ChangeLevel = TRUE},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorLevel36"},
	 	SetGlobalFlagFalse{Name = "g_P204_GladiatorChangeUnit"},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	 	IsGlobalFlagTrue{Name = "g_P204_GladiatorChangeUnit"},
		AvatarLevel{Level = 40,  Player = 1, UpdateInterval = 60},
		Negated(AvatarLevel{Level = 44,  Player = 1, UpdateInterval = 60}),
	},

	Actions =
	{
		ChangeUnit {Unit = 2575, NpcId = self, ChangeLevel = TRUE},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorLevel40"},		
	 	SetGlobalFlagFalse{Name = "g_P204_GladiatorChangeUnit"},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	 	IsGlobalFlagTrue{Name = "g_P204_GladiatorChangeUnit"},
		AvatarLevel{Level = 44,  Player = 1, UpdateInterval = 60},
		Negated(AvatarLevel{Level = 48,  Player = 1, UpdateInterval = 60}),
	},

	Actions =
	{
		ChangeUnit {Unit = 2576, NpcId = self, ChangeLevel = TRUE},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorLevel44"},		
	 	SetGlobalFlagFalse{Name = "g_P204_GladiatorChangeUnit"},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	 	IsGlobalFlagTrue{Name = "g_P204_GladiatorChangeUnit"},
		AvatarLevel{Level = 48,  Player = 1, UpdateInterval = 60},
	},

	Actions =
	{
		ChangeUnit {Unit = 2577, NpcId = self, ChangeLevel = TRUE},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorLevel48"},		
	 	SetGlobalFlagFalse{Name = "g_P204_GladiatorChangeUnit"},
	}
}


OnIdleGoHome
{
X = 317, Y = 194, Direction = West, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_GladiatorHomepointHaus", UpdateInterval = 10},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


OnIdleGoHome
{
X = 374, Y = 223, Direction = 2, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_GladiatorHomepointArena", UpdateInterval = 10},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


--- Gladiator geht zur Arena ---
OnIdleGoHome
{
	X = 374, Y = 203, WalkMode = Run, Direction = North,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_GladiatorZurArena", UpdateInterval = 10},
	},

	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_GladiatorZurArena"},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorBetrittArena"},	
		SetGlobalFlagFalse{Name = "g_P204_GladiatorHomepointHaus"},			
	}
}


Umspawn
{
	UnitId = self, X = 374, Y = 214, NoSpawnEffect = TRUE, OnlyOnce = FALSE, PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_GladiatorBetrittArena"},
	},


	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10582"},	
	 	SetGlobalFlagTrue{Name = "g_P204_GladiatorZurMitte"},
	 	SetGlobalFlagTrue{Name = "g_P204_GladiatorChangeUnit"},
	 	SetGlobalFlagFalse{Name = "g_P204_GladiatorBetrittArena"},	 	
	}
}


OnIdleGoHome
{
	X = 374, Y = 223, WalkMode = Run, Direction = South,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_GladiatorZurMitte", UpdateInterval = 10},
	},

	HomeActions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10582"},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorInArena"},
		SetGlobalFlagFalse{Name = "g_P204_GladiatorZurMitte"},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorHomepointArena"},
	}
}


OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_GladiatorKampf", UpdateInterval = 20},
		
		ODER9
		{
		PlayerUnitInRange{X = 374, Y = 214, Range = 4, FigureType = Avatar, UpdateInterval = 20},
		FigureInRangeNpc{TargetNpcId = 0, NpcId = self, Range = 5, UpdateInterval = 20},
		}
	},
	OnActions = 
	{
		AttackTarget {Target = Avatar, NpcId = self, FriendlyFire = TRUE},	
		SetGlobalFlagFalse {Name = "g_P204_GladiatorHomepointArena"},		
		ChangeRace{Race = 150, NpcId = self},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9102"},	
		--SetEffect{Effect = "Spawnboss", Length = 5000},
	},
	OffConditions = 
	{
		ODER9
		{
		IsGlobalFlagFalse{Name = "g_P204_GladiatorKampf", UpdateInterval = 20},
		PlayerUnitInRange{X = 374, Y = 202, Range = 4, FigureType = Avatar, UpdateInterval = 20},
		}
	},
	OffActions = 
	{
		ChangeRace{Race = 152, NpcId = self},	
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9102"},
		--SetEffect{Effect = "AreaHit", Length = 5000},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth{Percent = 30, NpcId = self, UpdateInterval = 10},
		IsGlobalFlagTrue{Name = "g_P204_GladiatorLevel32"},		
	},

	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_GladiatorKampf"},	
		SetNoFightFlagTrue{NpcId = 10582},
		SetGlobalFlagTrue{Name = "g_P204_Training32Bestanden"},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorGenug"},	
		SetGlobalFlagTrue {Name = "g_P204_GladiatorHomepointArena"},				
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth{Percent = 30, NpcId = self, UpdateInterval = 10},
		IsGlobalFlagTrue{Name = "g_P204_GladiatorLevel36"},			
	},

	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_GladiatorKampf"},		
		SetNoFightFlagTrue{NpcId = 10582},
		SetGlobalFlagTrue{Name = "g_P204_Training36Bestanden"},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorGenug"},	
		SetGlobalFlagTrue {Name = "g_P204_GladiatorHomepointArena"},		
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth{Percent = 30, NpcId = self, UpdateInterval = 10},
		IsGlobalFlagTrue{Name = "g_P204_GladiatorLevel40"},			
	},

	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_GladiatorKampf"},		
		SetNoFightFlagTrue{NpcId = 10582},
		SetGlobalFlagTrue{Name = "g_P204_Training40Bestanden"},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorGenug"},	
		SetGlobalFlagTrue {Name = "g_P204_GladiatorHomepointArena"},		
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth{Percent = 30, NpcId = self, UpdateInterval = 10},
		IsGlobalFlagTrue{Name = "g_P204_GladiatorLevel44"},			
	},

	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_GladiatorKampf"},	
		SetNoFightFlagTrue{NpcId = 10582},
		SetGlobalFlagTrue{Name = "g_P204_Training44Bestanden"},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorGenug"},	
		SetGlobalFlagTrue {Name = "g_P204_GladiatorHomepointArena"},				
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth{Percent = 30, NpcId = self, UpdateInterval = 10},
		IsGlobalFlagTrue{Name = "g_P204_GladiatorLevel48"},			
	},

	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_GladiatorKampf"},	
		SetNoFightFlagTrue{NpcId = 10582},
		SetGlobalFlagTrue{Name = "g_P204_Training48Bestanden"},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorGenug"},	
		SetGlobalFlagTrue {Name = "g_P204_GladiatorHomepointArena"},			
	}
}


OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_GladiatorGenug", UpdateInterval = 10},
	},
	OnActions = 
	{
		Outcry { NpcId = 10582, Tag = "oca2uzakahnP204_001", String = "Lass gut sein, Schluss für heute!"},
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10582"},
		SetGlobalFlagFalse{Name = "g_P204_GladiatorGenug"},
		SetNoFightFlagFalse{NpcId = 10582},		
	},
	OffConditions = {},
	OffActions = {}
}


OnIdleGoHome
{
	X = 374, Y = 214, WalkMode = Run, Direction = West,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_GladiatorGehtNachHause", UpdateInterval = 10},
	},

	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_GladiatorInArena"},
		SetGlobalFlagFalse{Name = "g_P204_GladiatorGehtNachHause"},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorVerlaesstArena"},
		SetGlobalFlagFalse{Name = "g_P204_GladiatorHomepointArena"},
	}
}


Umspawn
{
	UnitId = self, X = 374, Y = 204, NoSpawnEffect = TRUE, OnlyOnce = FALSE, PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_GladiatorVerlaesstArena"},
	},


	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10582"},	
	 	SetGlobalFlagTrue{Name = "g_P204_GladiatorGehtNachHause2"},
	 	SetGlobalFlagFalse{Name = "g_P204_GladiatorVerlaesstArena"},	 	
	}
}


OnIdleGoHome
{
	X = 317, Y = 197, WalkMode = Run, Direction = West,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_GladiatorGehtNachHause2", UpdateInterval = 10},
	},

	HomeActions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10582"},
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9102"},
		SetGlobalFlagFalse{Name = "g_P204_GladiatorGehtNachHause2"},
		SetGlobalFlagTrue{Name = "g_P204_GladiatorHomepointHaus"},
	}
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10582_Gladiator32.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_GladiatorInArena"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_GladiatorInArena"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Training48Bestanden"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_001", String = "Genug! Genug! Heute hättet Ihr mich beinahe gehabt! Bei der Asche meiner Ahnen, Ihr würdet mittelrweile jede Arnea Xus regieren mit Eurer Kunst!"},
			Answer{Tag = "uzakahnP204_002PC", String = "Ihr habt mich gut gelehrt.", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Training48Bestanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_003", String = "Ich bin nur ein alter Narr, der Euch ein wenig auf den rechten Weg geholfen hat. Ihr habt Euch selbst zur tödlichen Waffe geschmiedet! Ich bin stolz auf Euch!"},
			Answer{Tag = "uzakahnP204_004PC", String = "Danke für alles, Uzakahn. Lebt wohl!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_005", String = "Lebt wohl! ...Ah! Mein Rücken! Jetzt eine Massage und ein guter Branntwein ..."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "ArenaKampf42"},
			SetGlobalFlagTrue{Name = "g_P204_GladiatorGehtNachHause"},SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},
			SetGlobalFlagTrue{Name = "g_P204_Level48Trainiert"}, QuestSolve {QuestId = 1011}, QuestSolve {QuestId = 1012}, QuestSolve {QuestId = 1013}, QuestSolve {QuestId = 1014}, QuestSolve {QuestId = 1015}, QuestSolve {QuestId = 1016},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Level44Trainiert"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Level44Trainiert"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Training44Bestanden"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_006", String = "So, dass reicht! Das war ein guter Kampf! Ihr seid mittlerweile ein würdiger Gegner!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Training44Bestanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_007", String = "Nur eins! Seid nur ehrenvoll, solange es Euch nicht gefährdet! Ein Gegner wird Euch auch nicht zu Atem kommen lassen, wenn es um sein Leben geht!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_008", String = "Aber wenn Ihr zu hinterhältig und grausam seid, verliert Ihr die Gunst des Publikums und Eurer Freunde! Wägt es also gut ab!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_009", String = "So und nun verschwindet, ich muss erst einmal meine geschundenen Knochen ausruhen!"},
			Answer{Tag = "uzakahnP204_010PC", String = "Erholt Euch gut. Auf bald!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "ArenaKampf40"},
			SetGlobalFlagTrue{Name = "g_P204_GladiatorGehtNachHause"},SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},
			SetGlobalFlagTrue{Name = "g_P204_Level44Trainiert"}, QuestSolve {QuestId = 1012}, QuestSolve {QuestId = 1013}, QuestSolve {QuestId = 1014}, QuestSolve {QuestId = 1015},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Level40Trainiert"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Level40Trainiert"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Training40Bestanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{16;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Training40Bestanden"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_011", String = "Halt! Halt! Das soll reichen! Diesmal habt Ihr mich ja richtig ins Schwitzen gebracht!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_012", String = "Verteidigung und Shcnelligkeit sind fantastisch. Jetzt solltet Ihr Euch mit der Kampftaktik befassen!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_013", String = "Nutzt Eure Reichweite! Bewegt Euch um die Gegner, damit sie sich gegenseitig behindern! Und haltet immer fünf Schritt freien Raum in Eurem Rücken!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_014", String = "Jetzt brauche ich erst einmal etwas zu trinken! Ihr geht und übt noch etwas! Kommt wieder, wenn Ihr Euch bereit fühlt!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "ArenaKampf38"},
			SetGlobalFlagTrue{Name = "g_P204_GladiatorGehtNachHause"},SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},
			SetGlobalFlagTrue{Name = "g_P204_Level40Trainiert"}, QuestSolve {QuestId = 1012}, QuestSolve {QuestId = 1013}, QuestSolve {QuestId = 1014},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Level36Trainiert"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{22;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Level36Trainiert"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Training36Bestanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{24;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Training36Bestanden"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_015", String = "So genug für heute! Ihr habt gut aufgepasst! Nicht alle meien Schüler haben so schnell gelernt!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_016", String = "Deine Verteidigung ist besser geworden,a ber du bist immer noch zu langsam! Aber nur ein paar Tage Übung und du bist bereit für die nächste Lektion!"},
			Answer{Tag = "uzakahnP204_017PC", String = "Danke, Freund. Wir sehen uns wieder!", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "ArenaKampf36"},
			SetGlobalFlagTrue{Name = "g_P204_GladiatorGehtNachHause"},SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},
			SetGlobalFlagTrue{Name = "g_P204_Level36Trainiert"}, QuestSolve {QuestId = 1012}, QuestSolve {QuestId = 1013},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{28;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Level32Trainiert"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{28;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Level32Trainiert"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{30;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Training32Bestanden"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_018", String = "Das soll erst einmal genug sein! Nicht übel für den Anfang!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Training32Bestanden"}),
		},
		Actions = {
			Say{Tag = "uzakahnP204_021", String = "Die Regeln sind wie folgt: Wir kämpfen, jedes Mittel ist erlaubt! Die Lektion dauer solange, bis ich den Kampf unterbreche!"},
			Answer{Tag = "uzakahnP204_022PC", String = "Ihr wisst, dass ich ein Runenrkieger bin?", AnswerId = 34},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_019", String = "Ihr musst mehr auf Eure Flanke achten und Eure Angriffe besser abstimmen! Übt noch etwas, dann können wir eine zweite Lektion beginnen!"},
			Answer{Tag = "uzakahnP204_020PC", String = "Danke, Uzakahn!", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "ArenaKampf32"},
			SetGlobalFlagTrue{Name = "g_P204_GladiatorGehtNachHause"},SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},
			SetGlobalFlagTrue{Name = "g_P204_Level32Trainiert"}, QuestSolve {QuestId = 1012},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_023", String = "Ja! Und deswegen werde ich keine Gnade zeigen! Ganz gleich, wie oft Ihr wiederkehrt! Lasst uns Anfangen!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_024", String = "Bereit?"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uzakahnP204_025PC", String = "Ja, lass uns beginnen!", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_GladiatorKampf"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{39;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_GladiatorBesoffen"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_026", String = "Oh Göttin im Lihicht, die Todgeweihten ...Grüßen ... Dihich ...Hick"},
			Answer{Tag = "uzakahnP204_027PC", String = "Meister Uzakahn?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_GladiatorBesoffen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_028", String = "Dass ist ein guter Tropfen ... hervorragendchrrr ..."},
			Answer{Tag = "uzakahnP204_029PC", String = "Ich komme besser wieder, wenn Eure Laune etwas abgekühlt ist.", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_030", String = "Ja, macht dasss ...Hick."},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{42;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "DiesesFlagWirdNiemalsTrue"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{42;
		Conditions = {
			IsGlobalFlagTrue{Name = "DiesesFlagWirdNiemalsTrue"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7272, Flag = Take},
			SetGlobalFlagTrue{Name = "g_P204_CounterBesoffen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{46;
		Conditions = {
			PlayerHasItem{ItemId = 4631},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{46;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 4631}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_031", String = "Hm, ist das nicht Branntwein da in Eurer Tasche?"},
			Answer{Tag = "uzakahnP204_032PC", String = "Ihr habt gute Augen!", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_033", String = "Zumindest was Branntweinflaschen angeht! Wie steht's, Kamerad? Könnte ich wohl einen Schluck bekommen?"},
			OfferAnswer{Tag = "uzakahnP204_034PC", String = "Hier, bedient Euch.", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_035", String = "Ihr seid ein wahrer Kamerad! Auf Eurer Wohl!"},
			Answer{Tag = "uzakahnP204_036PC", String = "Und leer ist die Flasche! Eure Kehle steht wohl Euren Schwertarm nicht nach, alter Mann!", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			TransferXP {XP = 1000, Flag = Give},
			TransferItem {TakeItem = 4631, Flag = Take},
			SetGlobalFlagTrue{Name = "g_P204_CounterBesoffen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{53;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagBetrunkenerGladiatorKnown"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_037", String = "Der Sand war heiß, es troff Blut und Schweiß ...Hick...Oh, hoppla, ein neues Gesicht! Ihr habt nicht zufällig etwas Branntwein für einen ehemaligen Champion der Arena?"},
			Answer{Tag = "uzakahnP204_038PC", String = "Bei Eurem Atem wundert es mich nicht, dass Euch keiner besiegen konnte!", AnswerId = 54},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBetrunkenerGladiatorKnown"}),
		},
		Actions = {
			Say{Tag = "uzakahnP204_077", String = "Was gibt es sonst?"},
			Answer{Tag = "", String = "", AnswerId = 104},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_039", String = "Ach was, das mit dem Branntwein fing erst an, nachdem sie mich rausgeworfen haben! Rausgeworfen! Den große Uzakahn!"},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_040", String = "Dabei bin ich unbesiegt! Und ich habe die Hälfte ihrer Kämpfer selbst ausgeblidet! Und nun das! Eine Schande ist das! Hick!"},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBetrunkenerGladiatorKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uzakahnP204_041PC", String = "Ihr wart Ausbilder? Könnt Ihr auch mir etwas beibringen?", AnswerId = 58},
			OfferAnswer{Tag = "uzakahnP204_071PC", String = "Ezählt mir etwas über den Zirkus.", AnswerId = 99},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "g_P204_ArenawachenTot"}, IsGlobalFlagTrue{Name = "g_P204_UnterstadttorRechtsOffen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{59;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "g_P204_ArenawachenTot"}, IsGlobalFlagTrue{Name = "g_P204_UnterstadttorRechtsOffen"})),
		},
		Actions = {
			Say{Tag = "uzakahnP204_063", String = "Hm, für eine gute Lehrstunde brauchen wir eine guten Kampfplatz! Und da gibt es hier nur die Arena."},
			Answer{Tag = "uzakahnP204_064PC", String = "Dann treffen wir uns dort?", AnswerId = 93},
		}}

	OnAnswer{60;
		Conditions = {
			Negated(AvatarLevel{Level = 48,  Player = 1, UpdateInterval = 40}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{60;
		Conditions = {
			AvatarLevel{Level = 48,  Player = 1, UpdateInterval = 40},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Level48Trainiert"}),
		},
		Actions = {
			Say{Tag = "uzakahnP204_046", String = "Du bist bereit für Lektion 5, triff mich in der Arena."},
			Answer{Tag = "uzakahnP204_047PC", String = "Alles klar", AnswerId = 64},
		}}

	OnAnswer{61;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Level48Trainiert"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_042", String = "Das war meine letze Lehre für Euch. Ihr seid mittlerweile so gut wie ich. Ab jetzt wird es gefährlich!"},
			Answer{Tag = "uzakahnP204_043PC", String = "Dann wagt Ihr es also nicht mehr, gegen mich zu kämpfen?", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_044", String = "Ha! Ein guter Gladiator weiss, wann er einem aussichtslosen Kampf aus dem Weg zu gehen hat! Ihr habt alles gelernt, was ich Euch beibringen kann!"},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_045", String = "Nun geht hinaus in die Welt und findet dort Euren Meister! Lebt wohl, Hitzkopf!"},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_GladiatorZurArena"}, SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},
			QuestBegin {QuestId = 1016},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{66;
		Conditions = {
			Negated(AvatarLevel{Level = 44,  Player = 1, UpdateInterval = 40}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{66;
		Conditions = {
			AvatarLevel{Level = 44,  Player = 1, UpdateInterval = 40},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Level44Trainiert"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_048", String = "Ihr seid schon verflixt gut, so langsam muss ich mir etwas einfallen lassen um noch mit Euch fertig zu werden! Ich muss erst nachdenken, kommt später zu mir!"},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Level44Trainiert"}),
		},
		Actions = {
			Say{Tag = "uzakahnP204_049", String = "Ich bin müde ...hick ... lasst mich zufrieden!"},
			Answer{Tag = "uzakahnP204_050PC", String = "Ich denke eher Ihr zittert vor Furcht und versteckt Euch hinter dieser Branntweinflasche!", AnswerId = 70},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_051", String = "Was? Ich und Angst? Ich zeige Euch gleich, wer hier Angst hat!"},
			Answer{Tag = "uzakahnP204_052PC", String = "Dann trefft mich in der Arena!", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_GladiatorZurArena"}, SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},
			QuestBegin {QuestId = 1013},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{73;
		Conditions = {
			AvatarLevel{Level = 40,  Player = 1, UpdateInterval = 40},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{73;
		Conditions = {
			Negated(AvatarLevel{Level = 40,  Player = 1, UpdateInterval = 40}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{74;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Level40Trainiert"}),
		},
		Actions = {
			Say{Tag = "uzakahnP204_054", String = "Gute Güte, Ihr werdet ja richtig anstrengend ... "},
			Answer{Tag = "uzakahnP204_055PC", String = "Kommt schon, alter Mann, ihr habt doch auch Spass daran!", AnswerId = 77},
		}}

	OnAnswer{74;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Level40Trainiert"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_053", String = "Herrje, kann sich ein alter Mann nicht einmal ausruhen? Immer dieses hitzköpfige Jungvolk ... Kommt später wieder!"},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_056", String = "Wo Ihr recht habt, habt Ihr recht ... Also, marsch, marsch zur Arena mit Euch!"},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_GladiatorZurArena"}, SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},
			QuestBegin {QuestId = 1014},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{80;
		Conditions = {
			Negated(AvatarLevel{Level = 36,  Player = 1, UpdateInterval = 40}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{80;
		Conditions = {
			AvatarLevel{Level = 36,  Player = 1, UpdateInterval = 40},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Level36Trainiert"}),
		},
		Actions = {
			Say{Tag = "uzakahnP204_059", String = "Hmm, Ihr seht mir so aus, als wärt Ihr langsam bereit für ein zweite Lektion! Treffen wir uns in der Arena!"},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{81;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Level36Trainiert"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_057", String = "Nicht so hastig! Ihr müsst noch ein wenig an Euren Fähigkeiten feilen, bevor sich eine weitere Lektion lohnt! Kommt wieder, wenn Ihr geübter seid!"},
			Answer{Tag = "uzakahnP204_058PC", String = "Na gut.", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_GladiatorZurArena"}, SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},
			QuestBegin {QuestId = 1013},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{86;
		Conditions = {
			Negated(AvatarLevel{Level = 32,  Player = 1, UpdateInterval = 40}),
		},
		Actions = {
			Say{Tag = "uzakahnP204_062", String = "Ihr seid einfach noch zu unerfahren! Lernt noch ein wenig dazu, dann können wir darüber reden."},
			Answer{Tag = "", String = "", AnswerId = 92},
		}}

	OnAnswer{86;
		Conditions = {
			AvatarLevel{Level = 32,  Player = 1, UpdateInterval = 40},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_Level32Trainiert"}),
		},
		Actions = {
			Say{Tag = "uzakahnP204_061", String = "Hmm. Ihr seht kräftig genug aus, Tak und Kahled sind fort ... Also gut, trefft mich in der Arena! Dann könnt Ihr zeigen, was Ihr könnt!"},
			Answer{Tag = "", String = "", AnswerId = 90},
		}}

	OnAnswer{87;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_Level32Trainiert"},
		},
		Actions = {
			Say{Tag = "uzakahnP204_060", String = "Ihr solltet erst einmal über Eure letze Lektion nachdenken und etwas üben! Kommt später wieder!"},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{90;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_GladiatorZurArena"}, SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},
			QuestBegin {QuestId = 1012},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{93;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_ArenawachenTot"}),
		},
		Actions = {
			QuestBegin {QuestId = 1011},
			Say{Tag = "uzakahnP204_068", String = "Das ist nicht so einfach! Die beiden Wachen am Tor zum Zirkusbereich, Tak und Kahled, die lassen mich da nie wieder rein!"},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{93;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_ArenawachenTot"},
		},
		Actions = {
			QuestBegin {QuestId = 1011},
			Say{Tag = "uzakahnP204_065", String = "Tak und Kahled sind zwar fort, aber ich kann das Tor nicht öffnen!"},
			Answer{Tag = "uzakahnP204_066PC", String = "Vielleicht kann ich es öffnen.", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_067", String = "Dann wären wir im Geschäft! Gebt mir Nachricht, sobald das Tor offen ist!"},
			Answer{Tag = "", String = "", AnswerId = 95},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_069", String = "Ich hatte das Pech gegen die beiden betrunken auf Wache zu erwischen! Und ich Narr hab es auch noch gemeldet! Seit dem hassen sie mich!"},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_070", String = "Sie wissen, dass sie mich nicht besiegen können, aber sie machen mir das Leben schwer, wo sie können! Sie sind an meinen Rauswurf aus dem Zirkus schuld, das Pack!"},
			Answer{Tag = "", String = "", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_072", String = "Da gibt es nicht viel zu berichten Kamerad! Der Kaiser erfreut sich nicht an Schauspiel und Kampfen."},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_073", String = "Also fristen wir Zirkusleute ein armes Dasein und hoffen, dass der nächste Kaiser uns besser gesonnen ist."},
			Answer{Tag = "", String = "", AnswerId = 101},
		}}

	OnAnswer{101;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_074", String = "Der Herr des Zirkus ist Serbio. Er betreut auch die Tiere, an denen sich Kaiserin Kaira so oft erfreut hat."},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{102;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uzakahnP204_075", String = "Aber seit Kaira tot ist, besucht uns niemand mehr aus dem Palast. Höchstens noch dei Wachsoldaten und die wollen nur Blut sehen!"},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{103;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_GladiatorCircusStoryTold"},
			Say{Tag = "uzakahnP204_076", String = "Aber ich bin dennoch stolz, dabei zu sein! Zumindest war ich es, bis sie mich rausgeworfen haben! Ich und Serbios Tochter, so eine dreckige Unterstellung!"},
		}}

	OnAnswer{103;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{104;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}


	EndDefinition()
end