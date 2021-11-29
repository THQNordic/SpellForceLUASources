-- P102 ... Hero-Rune 01

--DialogEndedFlags für Holger

--Nach Start Dialog
--DialogStartEnded

--Nach Janina Dialog
--DialogJaninaEnded

--Nach Hulu Dialog
--DialogHuluEnded

--Nach Setrius Dialog
--DialogSetriusEnded

--Nach WasserQuellen Dialog
--DialogWasserquelleEnded

--Nach End Dialog
--DialogEndEnded

-- Coords für eingangsportal
PortalX = 38		
PortalY = 78

--Zeit fürs Tierspawning
TierSpawning = 250

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- cutscene rename
--dofile("script/p102/n5567_CutsceneSkergs.lua")
--dofile("script/p102/n5462_CutsceneSetrius.lua")
--dofile("script/p102/n5462_CutscenePoison.lua")
--dofile("script/p102/n5635_CutsceneArena.lua")

dofile("script/p102/n32007_CutsceneArena.lua")
dofile("script/p102/n32008_CutsceneSetrius.lua")
dofile("script/p102/n32009_CutsceneSkergs.lua")
dofile("script/p102/n32010_CutscenePoison.lua")


dofile("script/p102/n0_ItemScript.lua")


-- Fürs Testing öffnet Tore
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		FigureAlive {NpcId = Avatar}, --Eine Bedingung die zu Beginn des Levels auf jedenfall gegeben ist
--	},
--	Actions =
--	{
--		SetGlobalFlagTrue { Name = "DialogHuluEnded" }, --Setzt das Flag Tor Öffnen für Setrius	
--		--SetGlobalFlagTrue { Name = "DialogWasserquelleEnded" }, --Setzt das Flag Tor Öffnen für KitharFestung
--	}
--}


-- Schaltet den Dialog bei Janina ab, wenn Avatar stirbt.

OnToggleEvent
{
NotInDialog = FALSE , UpdateInterval = 60 ,
	OnConditions = 
	{
		FigureDead { NpcId = Avatar},
		FigureDead { NpcId = 5461},
		IsGlobalFlagTrue { Name = "DialogJaninaEnded" },
	 },
	OnActions = { },
	OffConditions = 
	{
		FigureAlive { NpcId = Avatar},
		FigureAlive { NpcId = 5461},
		IsGlobalFlagTrue { Name = "DialogJaninaEnded" },
	},
	OffActions = 
	{
		RemoveDialog { NpcId = 5461} ,
		

	},
}

--Questmanagement, falls Dialog mit Aedar nicht vollständig geführt und schon auf Rune 1
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "IchWarAufRune1", UpdateInterval = 30},
		--IsGlobalFlagTrue {Name = "AedarIstImWesten", UpdateInterval = 30}
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "P101DialogWillitEnded"}, --Willit Quest solve
		QuestBegin{QuestId = 569 }, --Suche Dunhan Quest begin
		QuestSolve{QuestId = 572, ActivateNextQuest = FALSE }, --der Weg nach Rune1 Quest solve
	},
}


-- GlobalFlag setzen, wenn Map betreten wurde
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = {},
	Actions = 
	{
	SetGlobalFlagTrue {Name = "IchWarAufRune1"},
	
	},
}


-- Abschalten der Quest 572: Der Weg nach Rune1
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "IchWarAufRune1", UpdateInterval = 60},
	},
		
 	Actions = 
	{ 
		QuestSolve{QuestId = 572 , ActivateNextQuest = FALSE},
	},
}


--2 Skergs werden vom Spieler nach Cutszene übernommen
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "DialogStartEnded", UpdateInterval = 60},
	},
	
	Actions = 
	{
		ChangeFigureOwner{ NpcId = 5567},
		ChangeFigureOwner{ NpcId = 5568},
		SetRewardFlagTrue { Name = "P102Erreicht" },
	},
}



-- Übergabe der Orkgebäude, wenn die Skerg-Stadt erreicht ist 
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DialogHuluEnded"}, --Wenn Dialog mit Hulu im Skergstadt beendet ist NOCH DUMMY Aufdecken des Lagers von Setrius
	},
	Actions =
	{
		
		ChangeBuildingOwner {X = 352, Y = 106},
		ChangeBuildingOwner {X = 350, Y = 115},
		ChangeBuildingOwner {X = 360, Y = 115},
		ChangeBuildingOwner {X = 362, Y = 105},
	
		ChangeBuildingOwner {X = 364, Y = 127},
		ChangeBuildingOwner {X = 351, Y = 127},
		ChangeBuildingOwner {X = 353, Y = 143},
		RevealUnExplored { X = 306 , Y = 392 , Range = 20 },
		RevealUnExplored { X = 302 , Y = 159 , Range = 10 },
		SetRewardFlagTrue { Name = "HuluErreicht" },
		
	}
}


-- Flankenangriff, wenn BossTunnelwächter gestorben sind 
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 5945}, --BossTunnelwächter
		
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "TorFlankenangriff" }, --Setzt das Flag Tor Öffnen für Flankenangriff auf True
		SetGlobalTimeStamp{ Name = "WaitFlankenangrif" }, --Wartet ein paar Sekunden bis Tor geöffnet wurde
		
	}
}

-- Janinas Befreiung
OnOneTimeEvent
{
	Conditions =
	{
	
		--FigureDead {NpcId = 5523}, --Janinas Wächter Tot sind
		--FigureDead {NpcId = 5524},
		--FigureDead {NpcId = 5525},
		--FigureDead {NpcId = 5526},
		--FigureDead {NpcId = 5527},
		--FigureDead {NpcId = 5479},
		--FigureDead {NpcId = 5480},
		--FigureDead {NpcId = 5481},
		--FigureDead {NpcId = 5482},
		--FigureDead {NpcId = 5483},
		Negated (EnemyUnitInRange { X = 71 , Y = 124 , NpcId = 5638, Range = 40 , UnitId = 1491 , UpdateInterval = 10}),
		Negated (EnemyUnitInRange { X = 71 , Y = 124 , NpcId = 5638, Range = 40 , UnitId = 1492 , UpdateInterval = 10}),
		Negated (EnemyUnitInRange { X = 71 , Y = 124 , NpcId = 5638, Range = 40 , UnitId = 1606 , UpdateInterval = 10}),
    },
	Actions =
	{
		StopEffect { TargetType = Figure, NpcId = 5461},
		SetGlobalFlagTrue { Name = "RaceWechselJanina" }, --Wechselt die Race wieder um
		SetGlobalFlagTrue { Name = "JaninaBefreit" }, 
	
	}
}

--Aufdecken des SkergDorfs
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DialogJaninaEnded"}, --Wenn Dialog mit Janina beendet ist, wird die SkergDorf aufgedeckt

   },
	Actions =
	{
		RevealUnExplored { X = 361 , Y = 120 , Range = 30 },
		SetRewardFlagTrue { Name = "JaninaBefreit" },
	}
}

--Aufdecken der Armee von Setrius
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DialogWasserquelleEnded"}, 

   },
	Actions =
	{
		RevealUnExplored { X = 253 , Y = 218 , Range = 20 },
		SetRewardFlagTrue { Name = "QuelleVergiftet" },
	}
}

--Das Spawnen vor das Haupttor wird jetzt durch den Befehl SpawnOnlyWhen übernomen, jeweils bei den NPC`s
--OnOneTimeEvent
--{
--	Conditions =
--	{
	--	IsGlobalFlagTrue {Name = "DialogWasserquelleEnded"}, --Wenn die Wasserquelle vergiftet wurde

  --  },
--	Actions =
	--{
		--Spawn {X =  253, Y = 213 , UnitId = 1551}, --Setrius Waldläufer vor dem Tor
		--Spawn {X =  255, Y = 215 , UnitId = 1552},
		--Spawn {X =  257, Y = 217 , UnitId = 1554},
		--Spawn {X =  259, Y = 219 , UnitId = 1551},
		--Spawn {X =  261, Y = 217 , UnitId = 1553},
		--Spawn {X =  259, Y = 215 , UnitId = 1551},
		--Spawn {X =  257, Y = 213 , UnitId = 1552},
		--Spawn {X =  255, Y = 211 , UnitId = 1554}, 
		--Spawn {X =  253, Y = 209 , UnitId = 1553},
		--Spawn {X =  255, Y = 207 , UnitId = 1551},
		--Spawn {X =  257, Y = 209 , UnitId = 1553},
		--Spawn {X =  259, Y = 211 , UnitId = 1554}, 
		--Spawn {X =  261, Y = 213 , UnitId = 1552},
		--Spawn {X =  263, Y = 215 , UnitId = 1553},
		--Setrius muss ebenfalls noch hergespawned werden Steffen schreibt noch eine Funktion dazu		
	--}
--}

OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 6458}, --KitharGeneral stirbt
		IsGlobalFlagTrue { Name = "Camp1ZerstoertP102" }, 
		IsGlobalFlagTrue { Name = "Camp2ZerstoertP102" }, 
		IsGlobalFlagTrue { Name = "Camp3ZerstoertP102" }, 
	},
	Actions =
	{
		QuestSolve{ QuestId = 564 },
		QuestBegin{ QuestId = 604 },
		SetRewardFlagTrue { Name = "KitharLagerZerstoert" },
		SetGlobalFlagTrue { Name = "StartCutSzene03" }, --Setzt das Flag für die ZweikampfCutSzene - das tor geht auf.
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "DialogWasserquelleEnded" }, --Wenn die Wasserquelle vergiftet wurde
		FigureInRange{ X = 250 , Y = 223 , NpcId = Avatar , Range = 4},
		
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "TorOeffnerKitharFestung" }, --Setzt das Flag für die ZweikampfCutSzene
	}
}



--Wenn der Spieler die Rune01 besitzt
OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{Name = "PlayerHasItemRune01"}		
	},
	Actions =
	{
		QuestSolve{QuestId = 567},
		QuestBegin{QuestId = 738},
		SetRewardFlagTrue { Name = "RuneDunhanGenommen" },
	}
}

--- Q605 - WumpusTongue erbeutet und Wumpus-Quest aktiv
OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{Name = "PlayerHasItemWumpusTongue"},
		QuestState{QuestId = 606 , State = StateActive},

   },
	Actions =
	{
		QuestSolve{QuestId = 606},
		QuestBegin{QuestId = 607},
	}
}
---- Q 605 ends here

------------------------------------------------------------------------------------------------
---								 LeichenZähler Waldläufer Setrius 							----
------------------------------------------------------------------------------------------------

OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5615}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5616}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5617}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5618}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5619}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5620}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5621}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5622}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5623}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5624}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5625}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5626}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5627}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5628}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5629}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5630}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5631}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

-- LeichenZähler Waldläufer Setrius
OnPlatformOneTimeEvent
{

	Conditions =
	{
		FigureDead { NpcId = 5632}, --Waldläufer Setrius
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
   	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "LeichenZaehlerP102" },
	}
}

------------------------------------------------------------------------------------------------
---						  LeichenZähler Waldläufer Setrius Ended 							----
------------------------------------------------------------------------------------------------


-- Abfrage ob mehr als 10 Waldlaeufer getötet wurden, wenn ja werden Unterstützungstruppen auftauchen
OnPlatformOneTimeEvent
{

	Conditions =
	{
		IsGlobalCounter { Name = "LeichenZaehlerP102", Operator = IsGreaterOrEqual, Value = 10, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
		QuestState {QuestId = 564, State = StateActive},
		
		
   },
	Actions =
	{
		SetGlobalFlagTrue {Name = "UnterstuetzungstruppenP102"}, --wenn mehr als 10 Waldläufer getötet wurden
		Outcry { NpcId = 5462, String = "Die Kithar sind zäh! Ich schicke Euch Verstärkung!" , Tag = "ocSetriusP001_001" , Color = ColorWhite},

	}
}



------------------------------------------------------------------
------------------------------------------------------------------
---            SIDEQUEST: DIE DREI MAGIER
------------------------------------------------------------------
------------------------------------------------------------------

---------------------------------------------------------
--- Nach Ende der Mainquest die drei Magier freischalten
---------------------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 567 , State = StateSolved},
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "P102_Mage1CanSpeak" },
		SetGlobalFlagTrue { Name = "P102_Mage2CanSpeak" },
		SetGlobalFlagTrue { Name = "P102_Mage3CanSpeak" },
	}
}
-----------

------------- Zolowin bei Hütte kann wieder sprechen --------------
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange{X = 128, Y = 400, NpcId = 6968, Range = 4 }
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "P102_Mage1CanSpeak"},
		SetGlobalFlagTrue { Name = "P102_Mage1ArrivedHome"},
	}
}

------------- Gruolun bei Hütte kann wieder sprechen --------------
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange{X = 236, Y = 352, NpcId = 6969, Range = 4 }
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "P102_Mage2CanSpeak"},
		SetGlobalFlagTrue { Name = "P102_Mage2ArrivedHome"},
	}
}

------------- Renya bei Hütte kann wieder sprechen --------------
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange{X = 178, Y = 413, NpcId = 6970, Range = 4 }
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "P102_Mage3CanSpeak"},
		SetGlobalFlagTrue { Name = "P102_Mage3ArrivedHome"},
	}
}
----------------------------------------------------------


------------- Zolowin geht zu seiner Hütte --------------
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P102_Mage1GoHome"},
		IsGlobalFlagTrue { Name = "P102_Mage1MoveFree" },
	},
	Actions =
	{
		Goto{X = 128, Y = 400, NpcId = 6968 , Range = 3 , WalkMode = Run , GotoMode = GotoForced}
	}
}
----------------------------------------------------------
------------- Gruolun geht zu seiner Hütte --------------
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P102_Mage2GoHome"},
		IsGlobalFlagTrue { Name = "P102_Mage2MoveFree" },
	},
	Actions =
	{
		Goto{X = 236, Y = 352, NpcId = 6969 , Range = 3 , WalkMode = Run , GotoMode = GotoForced}
	}
}
----------------------------------------------------------
------------- Renya geht zu ihrer Hütte --------------
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P102_Mage3GoHome"},
		IsGlobalFlagTrue { Name = "P102_Mage3MoveFree" },
	},
	Actions =
	{
		Goto{X = 178, Y = 413, NpcId = 6970 , Range = 3 , WalkMode = Run , GotoMode = GotoForced}
	}
}
----------------------------------------------------------


------------- Wenn die drei Steine erbeutet wurden --------------
OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"},
		IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"},
		IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"},
	},
	Actions =
	{
		 QuestSolve{QuestId = 638},
	}
}
----------------------------------------------------------


------------- Wenn der Froschfetisch erbeutet wurde --------------
OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
	},
	Actions =
	{
		 QuestSolve{QuestId = 642},
		 QuestBegin{QuestId = 643},
	}
}
----------------------------------------------------------

-----------------------------------------------------------
------------- Abfrage, wer den Krieg gewinnt --------------
OnOneTimeEvent
{
	Conditions =
	{
		Negated(FigureAlive{NpcId = 6969 }),
		Negated(FigureAlive{NpcId = 6970 }),
		IsGlobalFlagTrue{Name = "P102_PlayerJoinsMage1"},
	},
	Actions =
	{
		 SetGlobalFlagTrue{Name = "P102_Mage1WonWar"},
		 SetGlobalFlagTrue{Name = "P102_Mage1CanSpeak"},
	}
}
------------------------------------------------------------
OnOneTimeEvent
{
	Conditions =
	{
		Negated(FigureAlive{NpcId = 6968 }),
		Negated(FigureAlive{NpcId = 6970 }),
		IsGlobalFlagTrue{Name = "P102_PlayerJoinsMage2"},
	},
	Actions =
	{
		 SetGlobalFlagTrue{Name = "P102_Mage2WonWar"},
		 SetGlobalFlagTrue{Name = "P102_Mage2CanSpeak"},
	}
}
------------------------------------------------------------
OnOneTimeEvent
{
	Conditions =
	{
		Negated(FigureAlive{NpcId = 6968 }),
		Negated(FigureAlive{NpcId = 6969 }),
		IsGlobalFlagTrue{Name = "P102_PlayerJoinsMage3"},
	},
	Actions =
	{
		 SetGlobalFlagTrue{Name = "P102_Mage3WonWar"},
		 SetGlobalFlagTrue{Name = "P102_Mage3CanSpeak"},
	}
}
------------------------------------------------------------
------------------------------------------------------------

------ Nach dem Joinen: Die anderen Magier greifen an
------- Joinen mit Mage 1
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P102_PlayerJoinsMage1"},
		IsGlobalFlagTrue { Name = "P102_Mage2MoveFree" },
		IsGlobalFlagTrue { Name = "P102_Mage3MoveFree" },
	},
	Actions =
	{
		 Goto{X = 127, Y = 399, NpcId = 6969 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		 Goto{X = 131, Y = 401, NpcId = 6970 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		 Outcry { NpcId = 6970, String = "Verrat! Das wirst du büßen!" , Tag = "ocRenyaP102_001" , Color = ColorWhite},
	}
}
------- Joinen mit Mage 2
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P102_PlayerJoinsMage2"},
		IsGlobalFlagTrue { Name = "P102_Mage1MoveFree" },
		IsGlobalFlagTrue { Name = "P102_Mage3MoveFree" },
	},
	Actions =
	{
		 Goto{X = 229, Y = 359, NpcId = 6968 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		 Outcry { NpcId = 6968, String = "Die Statue! Sie ist in die falschen Hände geraten!" , Tag = "ocZolowinP102_001" , Color = ColorWhite},
		 Goto{X = 234, Y = 362, NpcId = 6970 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		 Outcry { NpcId = 6970, String = "Verrat! Das wirst du büßen!" , Tag = "ocRenyaP102_001" , Color = ColorWhite},
	}
}
------- Joinen mit Mage 3
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P102_PlayerJoinsMage3"},
		IsGlobalFlagTrue { Name = "P102_Mage1MoveFree" },
		IsGlobalFlagTrue { Name = "P102_Mage2MoveFree" },
	},
	Actions =
	{
		 Goto{X = 176, Y = 406, NpcId = 6968 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		 Outcry { NpcId = 6968, String = "Die Statue! Sie ist in die falschen Hände geraten!" , Tag = "ocZolowinP102_001" , Color = ColorWhite},
		 Goto{X = 184, Y = 406, NpcId = 6969 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
	}
}
------------------------------------------------------------------

------------------------------------------------------------------
------------------------------------------------------------------
---          SIDEQUEST: DIE DREI MAGIER ends here
------------------------------------------------------------------
------------------------------------------------------------------


EndDefinition()
end
