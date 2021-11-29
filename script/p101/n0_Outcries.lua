-- Outcries gesammelt




-----------------------------------------------------------
-- Outcrywechsel Lena und Grim nach Gespräch mit Willit
----------------------------------------------------------
--lena fängt an
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{
		IsGlobalTimeElapsed{Name = "P101OcNachWillit", Seconds = 20, UpdateInterval = 30},
		
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 5537, String = "Nach Norden also!" , Tag = "ocLenaP101_001" , Color = ColorWhite},
		Outcry{Delay = FALSE, NpcId = 5537, String = "Wieder ein Marsch durch diesen Morast!" , Tag = "ocLenaP101_005" , Color = ColorWhite},
		Outcry{Delay = FALSE, NpcId = 5536, String = "Soll ich dich tragen?" , Tag = "ocGrimP101_001" , Color = ColorWhite},
		Outcry{Delay = FALSE, NpcId = 5537, String = "Du trägst gleich eine Narbe, wenn du nicht auf dein Mundwerk aufpasst!" , Tag = "ocLenaP101_006" , Color = ColorWhite},
		

	}
}


--Lena zweifelt,Grim beruhigt
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{
		IsGlobalTimeElapsed{Name = "P101OcNachWillit", Seconds = 110, UpdateInterval = 20},
		
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 5537, String = "Ich frage mich nur, ob wir das richtige tun, Grim." , Tag = "ocLenaP101_007" , Color = ColorWhite},
		Outcry{Delay = FALSE, NpcId = 5536, String = "Wir tun etwas, das ist wichtig!" , Tag = "ocGrimP101_006" , Color = ColorWhite},
	}
}



-----------------------------------------------------------------
-- Outcry Grim: aufmerksam machen auf Portal nach Rune1
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		--FigureInRange{X = 60, Y = 440, NpcId = 5536 , Range = 4},
		FigureInRange{X = 60, Y = 440, NpcId = 0 , Range = 4},
		
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 5536, String = "Da, das Portal in die Sturmfelsen! Dort müssen wir durch!" , Tag = "ocGrimP101_002" , Color = ColorWhite},
		SetGlobalTimeStamp{Name = "P101BeiPortalRune1"},
	}
}

-- Outcry lena: Aufforderung durch Portal Rune1 voranzuzonen, wenn Kitar tot
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		FigureInRange {X = 36, Y = 421, NpcId = 0 , Range = 4},
		--Negated(EnemyUnitInRange {X = 53, Y = 417, NpcId = Avatar, Range = 10 , UnitId = 0 , UpdateInterval = 30}),
		--Negated(BuildingInRange {X = 53, Y = 417, Range = 10 , Owner = OwnerAll , BuildingId = 0 , UpdateInterval = 30})
		
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 5537, String = "Geh hindurch, wir folgen dir!" , Tag = "ocLenaP101_002" , Color = ColorWhite},
		
	}
}


--------------------------------------------

-- Outcrywechsel nach Rune1
--------------------------------------------


-- Lena: Überlegung zu Held2
-- Grim schickt nach Rune2
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		IsGlobalTimeElapsed{Name = "AbRückkehrVonRune1", Seconds = 30, UpdateInterval = 10},
		--IsItemFlagTrue {Name = "PlayerHasItemRune01", UpdateInterval = 10}, 
		
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 7010, String = "Wenn Dunhan nach Norden gegangen ist, wird Reowys nach Süden gegangen sein." , Tag = "ocLenaP101_003" , Color = ColorWhite},
		Outcry{Delay = FALSE, NpcId = 7011, String = "Die Echosümpfe wären ein gutes Versteck! Das Portal liegt im Südosten, wir müssen um die Stadt herum!" , Tag = "ocGrimP101_003" , Color = ColorWhite},
		RevealUnExplored{X = 344 , Y = 71, Range = 10},
		SetGlobalTimeStamp{Name = "P101FollowNachRune1"},
		QuestBegin {QuestId = 570, SubQuestActivate = FALSE},
		QuestBegin {QuestId = 601, SubQuestActivate = FALSE},
		--SetGlobalFlagTrue {Name = "P101GrimAntwort"},
	}
}



----Grim schickt nach Rune2
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 10 ,
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "P101GrimAntwort", UpdateInterval = 10}, 
--		--IsItemFlagTrue {Name = "PlayerHasItemRune01", UpdateInterval = 10}, 
--		
--	},
--	Actions = 
--	{ 
--		
--		Outcry{Delay = FALSE, NpcId = 7011, String = "Die Echosümpfe wären ein gutes Versteck! Das Portal liegt im Südosten, wir müssen um die Stadt herum!" , Tag = "ocGrimP101_003" , Color = ColorWhite},
--		RevealUnExplored{X = 344 , Y = 71, Range = 10},
--		SetGlobalTimeStamp{Name = "P101FollowNachRune1"},
--		QuestBegin {QuestId = 570, SubQuestActivate = FALSE},
--		QuestBegin {QuestId = 601, SubQuestActivate = FALSE},
--	}
--}


-------------------------------
--Eiselfen, wenn Spieler in Sicht
-------------------------------
--Elfenpatrouille1
OnOneTimeEvent
{
NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{ 
		FigureInRangeNpc {TargetNpcId = 0, NpcId = 5920 , Range = 10 , UpdateInterval = 10}, 
		FigureHasAggro {NpcId = 5920 , UpdateInterval = 10},
	},
	Actions =
	{ 
		Outcry{Delay = FALSE, NpcId = 5920, String = "Feuerdiener! Vernichtet sie!" , Tag = "OcSnowelfP101_002" , Color = ColorWhite},

	},
}


--Elfenpatrouille2
OnOneTimeEvent
{
NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{ 
		FigureInRangeNpc {TargetNpcId = 0, NpcId = 5932 , Range = 10 , UpdateInterval = 10}, 
		FigureHasAggro {NpcId = 5932 , UpdateInterval = 10},
	},
	Actions =
	{ 
		Outcry{Delay = FALSE, NpcId = 5932, String = "Feuerdiener! Vernichtet sie!" , Tag = "OcSnowelfP101_002" , Color = ColorWhite},

	},
}

--Elfenpatrouille3
OnOneTimeEvent
{
NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{ 
		FigureInRangeNpc {TargetNpcId = 0, NpcId = 5930 , Range = 10 , UpdateInterval = 10}, 
		FigureHasAggro {NpcId = 5930 , UpdateInterval = 10},
	},
	Actions =
	{ 
		Outcry{Delay = FALSE, NpcId = 5930, String = "Feuerdiener! Vernichtet sie!" , Tag = "OcSnowelfP101_002" , Color = ColorWhite},

	},
}


--Eiselfen der CutsceneElfDiscovered
OnOneTimeEvent
{
NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{ 
		FigureInRangeNpc {TargetNpcId = 0, NpcId = 6743 , Range = 10 , UpdateInterval = 10}, 
		FigureHasAggro {NpcId = 6743 , UpdateInterval = 10},
	},
	Actions =
	{ 
		Outcry{Delay = FALSE, NpcId = 6743, String = "Diener des Feuers! Haltet sie auf, Schwestern!" , Tag = "OcSnowelfP101_001" , Color = ColorWhite},

	},
}


--Nach Discovered Cs Warnung vor Patrouillen
--OnOneTimeEvent
--{
--NotInDialog = FALSE , UpdateInterval = 10 ,
--	Conditions = 
--	{ 
--		IsGlobalTimeElapsed{ Name = "P101TimerPatrolWarnung", Seconds = 5, UpdateInterval = 20 },
--	},
--	Actions =
--	{ 
--		Outcry{NpcId = 7011, String = "Vorsicht! Wir sollten den Patrouillen der Elfen aus dem Weg gehen!" , Tag = "" , Color = ColorWhite},
--
--	},
--}

---------------------
--Nach Rune2
---------------------
-- Outcry Grim: Aufforderung, Helden zu beschwören
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalTimeElapsed{Name = "AbRückkehrVonRune2", Seconds = 10, UpdateInterval = 30},
		  
	},
	
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 7011, String = "Es ist soweit! Rufe die beiden Runenkrieger herbei, dann können wir den Angriff auf die Stadt beginnen!" , Tag = "ocGrimP101_004" , Color = ColorWhite},
		QuestBegin {QuestId = 587, SubQuestActivate = FALSE},
	},
}


-- Outcry Grim: Aufforderung, zur Höhle der Sklaven2 zu gehen 
-- Grim und Lena gehen zum Sklavenlager ost
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		--IsItemFlagTrue {Name = "PlayerHasItemRune02", UpdateInterval = 60},  
		
		--Reowys
		IsCreoActive {CreoId = 1747},
		-- Dunhan
		IsCreoActive {CreoId = 1746},
		--IsMonumentInUse{X = 356 , Y = 190, Range = 5 , UpdateInterval = 30},
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 7011, String = "Komm zum östlichen Lager, sobald die Krieger beschworen sind." , Tag = "ocGrimP101_007" , Color = ColorWhite},
		Follow{ Target = Avatar, NpcId = 7011},
		Follow{ Target = Avatar, NpcId = 7010},
		QuestBegin {QuestId = 588, SubQuestActivate = FALSE}, --begin Quest Das östliche Flüchtlingslager
		QuestSolve {QuestId = 587, ActivateNextQuest = FALSE }, -- end Quest Die Helden
		SetRewardFlagTrue { Name = "HeldenErschaffen" },
		
		

 	},
}	

----------------------------
--Nach Cutscene Rekrutierung
------------------------------
-- Outcry Grim: Aufforderung zum Angriff des Elfenhauptqartiers
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{ 
		IsGlobalTimeElapsed{Name = "AbSpielerHatQuestarmee", Seconds = 8, UpdateInterval = 20},
		
	},
	Actions = 
	{ 
		Outcry{Delay = FALSE, NpcId = 7011, String = "Unsere Spione werden die Tore öffnen! Kommt!" , Tag = "ocGrimP101_005" , Color = ColorWhite},
		QuestBegin {QuestId = 586, SubQuestActivate = FALSE},
		SetGlobalFlagTrue {Name = "TorZurStadtAuf"}
	},
}


---------------------------------------                   
--Nach Cutscene Gefängnis, vor Elfentor im NO                               
----------------------------------------
  
--Elune fordert Schwestern auf zu helfen
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 30 ,
	Conditions = 
	{
		FigureInRange{X = 370, Y = 422, NpcId = 5937 , Range = 5},
		FigureInRange{X = 370, Y = 422, NpcId = Avatar , Range = 10},
	},
	Actions = 
	{ 
		Outcry {Delay = FALSE, NpcId = 5937, String = "Schwestern! Öffnet das Tor! Das rote Imperium ist hier! Diese Menschen müssen fort von hier!" , Tag = "OcEluneP101_001" , Color = ColorWhite},
		SetGlobalFlagTrue{Name = "P101EluneÖffnetEiselfentor"},
		Goto {X = 352, Y = 410, NpcId = 5937 , Range = 7 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
	},
}


	
--Elune fordert auf, durch Portal nach Flee to Ice zu zonen
--Lea dankt für die Rettung
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 30 ,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "P101EiselfentorOffen", Seconds = 10, UpdateInterval = 20},
	},
	Actions = 
	{ 
		Outcry {Delay = FALSE, NpcId = 5937, String = "Geht durch das Portal und sichert den Weg durch die Frostfallberge. Wir werden Eure Leute solange schützen." , Tag = "OcEluneP101_002" , Color = ColorWhite},
		Goto {X = 406, Y = 468, NpcId = 5937 , Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Outcry {Delay = FALSE, NpcId = 7010, String = "Danke! Das werde ich Euch nie vergessen, Elune! Passt auf Euch auf!" , Tag = "ocLenaP101_011" , Color = ColorWhite},
		
	},
}


----Lea dankt für die Rettung
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 30 ,
--	Conditions = 
--	{
--		IsGlobalTimeElapsed {Name = "P101EiselfentorOffen", Seconds = 22, UpdateInterval = 20},
--	},
--	Actions = 
--	{ 
--		Outcry {NpcId = 7010, String = "Danke! Das werde ich Euch nie vergessen, Elune! Passt auf Euch auf!" , Tag = "ocLenaP101_011" , Color = ColorWhite},
--	},
--}


--Lea fordert Spieler auf, jetzt mit nach Flee to Ice zu kommen
--goto zum VanishInit
--Lea fordert auf, sich am Bindstone zu binden

OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 30 ,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "P101EiselfentorOffen", Seconds = 32, UpdateInterval = 20},
	},
	Actions = 
	{ 
		Goto {X = 461, Y = 465, NpcId = 7010 , Range = 0 , WalkMode = Walk , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Outcry {Delay = FALSE, NpcId = 7010, String = "Komm Freund! Lass uns nach Frostfall aufbrechen, das ist der einzige Weg in die Sicherheit von Tirganach." , Tag = "ocLenaP101_004" , Color = ColorWhite},
		SetGlobalFlagTrue{Name = "P101LeaNachFleeToIce"},
		Outcry {Delay = FALSE, NpcId = 7010, String = "Aber binde dich besser vorher an den Seelenfels hier oben. Es wird ein gefährlicher Marsch." , Tag = "ocLenaP101_008" , Color = ColorWhite},
		RevealUnExplored{X = 455 , Y = 450, Range = 10}, 
		QuestSolve{QuestId = 644, ActivateNextQuest = FALSE},
		QuestSolve{QuestId = 717, ActivateNextQuest = FALSE},
		QuestBegin {QuestId = 645, SubQuestActivate = FALSE}, --"Frostwallberge"
		QuestBegin {QuestId = 716, SubQuestActivate = FALSE}, --Subquest zu "Frostwallberge"
	},
} 
   
                                         
----Lea fordert auf, sich am Bindstone zu binden
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 30 ,
--	Conditions = 
--	{
--		IsGlobalTimeElapsed {Name = "P101EiselfentorOffen", Seconds = 47, UpdateInterval = 20},
--
--	},
--	Actions = 
--	{ 
--		SetGlobalFlagTrue{Name = "P101LeaNachFleeToIce"},
--		Outcry {NpcId = 7010, String = "Aber binde dich besser vorher an den Seelenfels hier oben. Es wird ein gefährlicher Marsch." , Tag = "ocLenaP101_008" , Color = ColorWhite},
--		QuestBegin {QuestId = 645, SubQuestActivate = FALSE},
--	},
--}



--Lea gibt Infos zum Feuertor
--Lea gibt Infos zum Schlüssel
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 30 ,
	Conditions = 
	{
		FigureInRange{X = 330, Y = 249, NpcId = 7010 , Range = 10},
		FigureInRange{X = 330, Y = 249, NpcId = Avatar , Range = 10},

	},
	Actions = 
	{ 
		SetGlobalTimeStamp{Name = "P101OcFeuertorTimer"},
		Outcry {Delay = FALSE, NpcId = 7010, String = "Das Tor zum roten Imperium. Die Orks haben es stets verschlossen gehalten, selbst sie fürchten die Imperialen." , Tag = "ocLenaP101_009" , Color = ColorWhite},
		Outcry {Delay = FALSE, NpcId = 7010, String = "Wir glauben, dass die weiße Priesterin nun den Schlüssel für das Tor besitzt." , Tag = "ocLenaP101_010" , Color = ColorWhite},
	},
}

----Lea gibt Infos zum Schlüssel
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 30 ,
--	Conditions = 
--	{
--		IsGlobalTimeElapsed {Name = "P101OcFeuertorTimer", Seconds = 15, UpdateInterval = 20},
--
--	},
--	Actions = 
--	{ 
--		Outcry {NpcId = 7010, String = "Wir glauben, dass die weiße Priesterin nun den Schlüssel für das Tor besitzt." , Tag = "ocLenaP101_010" , Color = ColorWhite},
--	},
--}
