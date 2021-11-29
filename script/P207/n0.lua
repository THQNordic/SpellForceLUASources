function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p207/n0_Outcries.lua")
dofile("script/p207/n0_ItemScript.lua")
dofile("script/p207/n0_QuestXP.lua")
dofile("script/p207/n32410_cutscene_beginning.lua")
dofile("script/p207/n32411_cutscene_giant_transfer.lua")
dofile("script/p207/n32412_cutscene_giant_block_caves.lua")
dofile("script/p207/n32413_cutscene_sprengung.lua")
dofile("script/p207/n32414_cutscene_rohen_arrival.lua")
dofile("script/p207/n32415_cutscene_rohens_geist.lua")
dofile("script/Hadeko.lua")

-------------
-- Questen --
-------------
	-- Quest von Red Waste lösen
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 891, State = StateActive},
	},
	Actions =
	{			
			QuestSolve {QuestId = 891}, -- Quest 891 lösen
	},
}

	-- Quest von Red Waste lösen
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 818, State = StateActive},
	},
	Actions =
	{			
			QuestSolve {QuestId = 818}, -- Quest 891 lösen
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
	},
	Actions =
	{			
			QuestBegin {QuestId = 972}, -- Quest 972 aktivieren
			QuestBegin {QuestId = 973}, -- Quest 973 aktivieren
			QuestBegin {QuestId = 975}, -- Quest 975 aktivieren / gelöst in n10662.lua +nächste Auftrag
	},
}

--------------------------------------------------
-- Räubergolbins vernichtet, neuer RiesenDialog --
--------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			FigureDead {NpcId = 10539},
			FigureDead {NpcId = 10540},
			FigureDead {NpcId = 10541},
			FigureDead {NpcId = 10542},
			FigureDead {NpcId = 10543},
			FigureDead {NpcId = 10544},
		},
		Actions =
		{
			SetGlobalFlagTrue {Name = "p207_Goblins_Dead"},
		},
}

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalFlagTrue {Name = "p207_Goblins_Dead"},
			QuestState {QuestId = 989, State = StateSolved},
			
		},
		Actions =
		{
			QuestSolve{QuestId = 990},
			QuestBegin{QuestId = 991},
		},
}

OnOneTimeEvent
{
		Conditions =
		{
			ODER9
			{
			IsGlobalFlagTrue {Name = "p207_BelohnungErhalten"},
			IsGlobalFlagTrue {Name = "p207_Verschliesse_Hoehlen"},
			IsGlobalFlagTrue {Name = "p207_Uebergebe_Riese"}
			},
		},
		Actions =
		{			
			QuestSolve{QuestId = 991},
			QuestSolve{QuestId = 1032},
		},
}

--		OnOneTimeEvent
--		{
--				Conditions =
--				{
--					QuestState {QuestId = 990, State = StateSolved},
--					QuestState {QuestId = 991, State = StateSolved},
--					QuestState {QuestId = 989, State = StateActive},
--				},
--				Actions =
--				{			
--					QuestSolve{QuestId = 1032},
--					QuestSolve{QuestId = 989},
--				},
--		}

--------------------------------------------------------------------------------------------
-- Übergeben der Dunkelelfen-Gebäude nachdem man die Festung(DE-Monument) eingenommen hat --
--------------------------------------------------------------------------------------------

OnOneTimeEvent
{
		Conditions = 
		{
			UND
			(
				IsMonumentInUse {X = 455, Y = 254, Range = 0},
				IsGlobalFlagTrue {Name = "g_P207_Zweite_Festung_Camp_Besiegt"}
			)
		},
		Actions =
		{
			SetGlobalFlagTrue{Name = "g_P207_Zweite_Festung_Eingenommen"},
			ChangeBuildingOwner {X = 417, Y = 300},  -- Arkanum
			ChangeBuildingOwner {X = 446, Y = 248},  -- Gebäudezerstörer
			ChangeBuildingOwner {X = 419, Y = 281},  -- Großes Haupthaus
			ChangeBuildingOwner {X = 435, Y = 235},  -- Mine
			ChangeBuildingOwner {X = 450, Y = 269},  -- Mondsilbermine
			ChangeBuildingOwner {X = 450, Y = 274},  -- Mondsilberwerkstatt
			ChangeBuildingOwner {X = 421, Y = 264},  -- Nahrungslager
			ChangeBuildingOwner {X = 440, Y = 290},  -- Onyxschrein
			ChangeBuildingOwner {X = 431, Y = 292},  -- Onyxturm
			ChangeBuildingOwner {X = 409, Y = 269},  -- Pilzfarm
			ChangeBuildingOwner {X = 413, Y = 306},  -- Schattenschmiede
			ChangeBuildingOwner {X = 442, Y = 239},  -- Schmelze
			ChangeBuildingOwner {X = 422, Y = 235},  -- Schmiede
			ChangeBuildingOwner {X = 414, Y = 240},  -- Schwarm
			ChangeBuildingOwner {X = 412, Y = 316},  -- Schwarze Schule
			ChangeBuildingOwner {X = 453, Y = 280},  -- Steinbruch
			ChangeBuildingOwner {X = 452, Y = 285},  -- Steinmetz
			ChangeBuildingOwner {X = 417, Y = 261},  -- Züchter
			-- Race wieder auf RaceTrolle
			ChangeBuildingRace {X = 417, Y = 300, Race = 6},  -- Arkanum            
			ChangeBuildingRace {X = 446, Y = 248, Race = 6},  -- Gebäudezerstörer   
			ChangeBuildingRace {X = 419, Y = 281, Race = 6},  -- Großes Haupthaus   
			ChangeBuildingRace {X = 435, Y = 235, Race = 6},  -- Mine               
			ChangeBuildingRace {X = 450, Y = 269, Race = 6},  -- Mondsilbermine     
			ChangeBuildingRace {X = 450, Y = 274, Race = 6},  -- Mondsilberwerkstatt
			ChangeBuildingRace {X = 421, Y = 264, Race = 6},  -- Nahrungslager      
			ChangeBuildingRace {X = 440, Y = 290, Race = 6},  -- Onyxschrein        
			ChangeBuildingRace {X = 431, Y = 292, Race = 6},  -- Onyxturm           
			ChangeBuildingRace {X = 409, Y = 269, Race = 6},  -- Pilzfarm           
			ChangeBuildingRace {X = 413, Y = 306, Race = 6},  -- Schattenschmiede 
			ChangeBuildingRace {X = 442, Y = 239, Race = 6},  -- Schmelze  
			ChangeBuildingRace {X = 422, Y = 235, Race = 6},  -- Schmiede           
			ChangeBuildingRace {X = 414, Y = 240, Race = 6},  -- Schwarm            
			ChangeBuildingRace {X = 412, Y = 316, Race = 6},  -- Schwarze Schule    
			ChangeBuildingRace {X = 453, Y = 280, Race = 6},  -- Steinbruch         
			ChangeBuildingRace {X = 452, Y = 285, Race = 6},  -- Steinmetz          
			ChangeBuildingRace {X = 417, Y = 261, Race = 6},  -- Züchter            
			-- Questen lösen/starten
			QuestSolve {QuestId = 980},
			QuestBegin {QuestId = 992},
			-- Timer für Verteidigung
			SetGlobalTimeStamp{Name = "g_p207_defend_second_base"},
		},  
}           
	
	-----------------------------------------------------------------------------
	-- Zweiten Aufbau Racechange damit das Camp die Buildings nicht schreddert --
	-----------------------------------------------------------------------------
           
OnOneTimeEvent
{           
		Conditions = 
		{   
		},  
		Actions =
		{   
			ChangeBuildingRace {X = 417, Y = 300, Race = 152},  -- Arkanum
			ChangeBuildingRace {X = 446, Y = 248, Race = 152},  -- Gebäudezerstörer
			ChangeBuildingRace {X = 419, Y = 281, Race = 152},  -- Großes Haupthaus
			ChangeBuildingRace {X = 435, Y = 235, Race = 152},  -- Mine
			ChangeBuildingRace {X = 450, Y = 269, Race = 152},  -- Mondsilbermine
			ChangeBuildingRace {X = 450, Y = 274, Race = 152},  -- Mondsilberwerkstatt
			ChangeBuildingRace {X = 421, Y = 264, Race = 152},  -- Nahrungslager
			ChangeBuildingRace {X = 440, Y = 290, Race = 152},  -- Onyxschrein
			ChangeBuildingRace {X = 431, Y = 292, Race = 152},  -- Onyxturm
			ChangeBuildingRace {X = 409, Y = 269, Race = 152},  -- Pilzfarm
			ChangeBuildingRace {X = 413, Y = 306, Race = 152},  -- Schattenschmiede
			ChangeBuildingRace {X = 442, Y = 239, Race = 152},  -- Schmelze  
			ChangeBuildingRace {X = 422, Y = 235, Race = 152},  -- Schmiede
			ChangeBuildingRace {X = 414, Y = 240, Race = 152},  -- Schwarm
			ChangeBuildingRace {X = 412, Y = 316, Race = 152},  -- Schwarze Schule
			ChangeBuildingRace {X = 453, Y = 280, Race = 152},  -- Steinbruch
			ChangeBuildingRace {X = 452, Y = 285, Race = 152},  -- Steinmetz
			ChangeBuildingRace {X = 417, Y = 261, Race = 152},  -- Züchter
		},
}

-----------------------------------------------
-- Erste Gegnerwelle / Spawnzeit und Angriff --
-----------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		IsMonumentInUse {X = 208, Y = 468, Range = 0},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "g_p207_first_attack_wave_on_base"},
		SetGlobalTimeStamp{Name = "g_p207_start_rts_spawning"},
		SetGlobalTimeStamp{Name = "g_p207_second_rts_spawning"},
		SetGlobalTimeStamp{Name = "g_p207_third_rts_spawning"},
		SetGlobalTimeStamp{Name = "g_p207_fourth_rts_spawning"},		
	},
}

--------------------------------------------
-- Erste Festung, Angriffe aus den Seiten --
--------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 185, Y = 318, Range = 3}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_p207_Spieler_In_Erster_Festung"},
	},
}

-------------------------------------------
-- Erste Festung Erste Truppe vernichtet --
-------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			FigureDead {NpcId = 10676},
			FigureDead {NpcId = 10677},
			FigureDead {NpcId = 10678},
			FigureDead {NpcId = 10679},
			FigureDead {NpcId = 10680},
			FigureDead {NpcId = 10681},
			FigureDead {NpcId = 10682},
			FigureDead {NpcId = 10683},
			FigureDead {NpcId = 10683},
			FigureDead {NpcId = 10684},
			FigureDead {NpcId = 10685},
			FigureDead {NpcId = 10686},
			FigureDead {NpcId = 10687},
			FigureDead {NpcId = 10688},
			FigureDead {NpcId = 10689},
			FigureDead {NpcId = 10690},
			FigureDead {NpcId = 10691},
			FigureDead {NpcId = 10692},
			FigureDead {NpcId = 10693},
			FigureDead {NpcId = 10694},
			FigureDead {NpcId = 10695},
			FigureDead {NpcId = 10696},
			FigureDead {NpcId = 10697},
			FigureDead {NpcId = 10698},
			FigureDead {NpcId = 10699},
			FigureDead {NpcId = 10700},
			FigureDead {NpcId = 10701},
		},
		Actions =
		{
			SetGlobalFlagTrue {Name = "g_p207_Erste_Festung_Erste_Truppe_Dead"},
		},
}

---------------------------------------
-- Erste Festung Truppe O vernichtet --
---------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			FigureDead {NpcId = 10702},
			FigureDead {NpcId = 10703},
			FigureDead {NpcId = 10704},
			FigureDead {NpcId = 10705},
			FigureDead {NpcId = 10706},
			FigureDead {NpcId = 10707},
			FigureDead {NpcId = 10708},
			FigureDead {NpcId = 10709},
			FigureDead {NpcId = 10710},
			FigureDead {NpcId = 10711},
		},
		Actions =
		{
			SetGlobalFlagTrue {Name = "g_p207_Erste_Festung_Truppe_O_Dead"},
		},
}

---------------------------------------
-- Erste Festung Truppe O vernichtet --
---------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			FigureDead {NpcId = 10712},
			FigureDead {NpcId = 10713},
			FigureDead {NpcId = 10714},
			FigureDead {NpcId = 10715},
			FigureDead {NpcId = 10716},
			FigureDead {NpcId = 10717},
			FigureDead {NpcId = 10718},
			FigureDead {NpcId = 10719},
			FigureDead {NpcId = 10720},
			FigureDead {NpcId = 10721},
		},
		Actions =
		{
			SetGlobalFlagTrue {Name = "g_p207_Erste_Festung_Truppe_NW_Dead"},
		},
}

-----------------------------------------------------------
-- Zweite Festung Verteidigung / Erste Truppe vernichtet --
-----------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalTimeElapsed {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt", Seconds = 20},
			FigureDead {NpcId = 10907},
			FigureDead {NpcId = 10908},
			FigureDead {NpcId = 10909},
			FigureDead {NpcId = 10910},
			FigureDead {NpcId = 10911},
			FigureDead {NpcId = 10912},
			FigureDead {NpcId = 10913},
			FigureDead {NpcId = 10914},
			FigureDead {NpcId = 10915},
		},
		Actions =
		{
			SetGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe01_Dead"},
		},
}

------------------------------------------------------------
-- Zweite Festung Verteidigung / Zweite Truppe vernichtet --
------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalTimeElapsed {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt", Seconds = 20},
			FigureDead {NpcId = 10916},
			FigureDead {NpcId = 10917},
			FigureDead {NpcId = 10918},
			FigureDead {NpcId = 10919},
			FigureDead {NpcId = 10920},
			FigureDead {NpcId = 10921},
			FigureDead {NpcId = 10922},
			FigureDead {NpcId = 10923},
			FigureDead {NpcId = 10924},
		},
		Actions =
		{
			SetGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe02_Dead"},
		},
}

------------------------------------------------------------
-- Zweite Festung Verteidigung / Dritte Truppe vernichtet --
------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalTimeElapsed {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt", Seconds = 20},
			FigureDead {NpcId = 10925},
			FigureDead {NpcId = 10926},
			FigureDead {NpcId = 10927},
			FigureDead {NpcId = 10928},
			FigureDead {NpcId = 10929},
			FigureDead {NpcId = 10930},
			FigureDead {NpcId = 10931},
			FigureDead {NpcId = 10932},
			FigureDead {NpcId = 10933},
		},
		Actions =
		{
			SetGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe03_Dead"},
		},
}

------------------------------------------------------------
-- Zweite Festung Verteidigung / Vierte Truppe vernichtet --
------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalTimeElapsed {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt", Seconds = 20},
			FigureDead {NpcId = 10934},
			FigureDead {NpcId = 10935},
			FigureDead {NpcId = 10936},
			FigureDead {NpcId = 10937},
			FigureDead {NpcId = 10938},
			FigureDead {NpcId = 10939},
			FigureDead {NpcId = 10940},
			FigureDead {NpcId = 10941},
			FigureDead {NpcId = 10942},
		},
		Actions =
		{
			SetGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe04_Dead"},
		},
}

------------------------------------------------------------
-- Zweite Festung Verteidigung / Fünfte Truppe vernichtet --
------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalTimeElapsed {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt", Seconds = 20},
			FigureDead {NpcId = 10943},
			FigureDead {NpcId = 10944},
			FigureDead {NpcId = 10945},
			FigureDead {NpcId = 10946},
			FigureDead {NpcId = 10947},
			FigureDead {NpcId = 10948},
			FigureDead {NpcId = 10949},
			FigureDead {NpcId = 10950},
			FigureDead {NpcId = 10951},
		},
		Actions =
		{
			SetGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe05_Dead"},
		},
}

-------------------------------------------------------------
-- Zweite Festung Verteidigung / Sechste Truppe vernichtet --
-------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalTimeElapsed {Name = "t_P207_Zweite_Festung_Angreifer_Gespawnt", Seconds = 20},
			FigureDead {NpcId = 10952},
			FigureDead {NpcId = 10953},
			FigureDead {NpcId = 10954},
			FigureDead {NpcId = 10955},
			FigureDead {NpcId = 10956},
			FigureDead {NpcId = 10957},
			FigureDead {NpcId = 10958},
			FigureDead {NpcId = 10959},
			FigureDead {NpcId = 10960},
		},
		Actions =
		{
			SetGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe06_Dead"},
		},
}

---------------------------------------------------------------------
-- Zweite Festung Questen lösen / Dritte Festung Questen verteilen --
---------------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe01_Dead"},
			IsGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe02_Dead"},
			IsGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe03_Dead"},
			IsGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe04_Dead"},
			IsGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe05_Dead"},
			IsGlobalFlagTrue {Name = "g_p207_Defend_Second_Base_Truppe06_Dead"},
		},
		Actions =
		{
			QuestSolve {QuestId = 992},
			QuestSolve {QuestId = 978},
			QuestBegin {QuestId = 981},
			QuestBegin {QuestId = 982},	
		},
}

----------------------------------------------------------------
-- Dritte Festung Questen lösen / SchalterätselQuest vergeben --
----------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			FigureInRange {X = 85, Y = 128, NpcId = Avatar},
		},
		Actions =
		{
			QuestBegin {QuestId = 983},			
		},
}

------------------------------------------------------------------
-- Dritte Festung Questen lösen / Gelange in die Festung gelöst --
------------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Zwei_Umgelegt"},
			IsGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Vier_Umgelegt"},
		},
		Actions =
		{
			QuestSolve {QuestId = 982},
			QuestBegin {QuestId = 985},
		},
}

---------------------------------------------------------
-- Dritte Festung Questen lösen / Schalterätsel gelöst --
---------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Eins_Umgelegt"},
			IsGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Zwei_Umgelegt"},
			IsGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Drei_Umgelegt"},
			IsGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Vier_Umgelegt"},
			IsGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Fuenf_Umgelegt"},
		},
		Actions =
		{
			SetGlobalFlagTrue{Name = "g_p207_Quest_983_Labyrinth_geloest"},
			QuestSolve {QuestId = 983},
			SetGlobalFlagTrue {Name = "oc_P207_Skerg_Hat_Schalterraetsel_Geloest"},
		},
}

-------------------------------------------------------------------------
-- Dritte Festung Questen lösen / Camp vernichtet, Festung eingenommen --
-------------------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalFlagTrue {Name = "g_P207_Dritte_Festung_Camp_Besiegt"},
		},
		Actions =
		{			
			QuestSolve {QuestId = 981},
			QuestSolve {QuestId = 985},
			QuestBegin {QuestId = 986},		
			QuestBegin {QuestId = 987},	
		},
}

------------------------------------------------------------
-- Vierte Festung Questen lösen / In Festung eingedrungen --
------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			PlayerUnitInRange {X = 302, Y = 135, Range = 5, UpdateInterval = 35},
		},
		Actions =
		{			
			QuestSolve {QuestId = 987},
		},
}

-------------------------------------------------------------------------------
-- Vierte Festung Questen Vergeben / Vernichte Untoten Rohen und seine Armee --
-------------------------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalFlagTrue {Name = "g_P207_Saurian_Has_Spawned"},
			FigureDead {NpcId = 11084},
			FigureDead {NpcId = 11085},
		},
		Actions =
		{			
			QuestBegin {QuestId = 988},
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohens_Army_Formation_Group"},
			SetGlobalTimeStamp {Name = "t_P207_Undead_Rohen_And_His_Army_Has_Entered_The_Building"},
		},
}

----------------------------------------------------------------------------
-- Vierte Festung Questen Lösen / Vernichte Untoten Rohen und seine Armee --
----------------------------------------------------------------------------

OnOneTimeEvent
{
		Conditions =
		{
			IsGlobalFlagTrue {Name = "g_p207_Rohen_Has_Left_The_Building"},
		},
		Actions =
		{			
			QuestSolve {QuestId = 988},
			QuestSolve {QuestId = 986},
			QuestBegin {QuestId = 1098},
		},
}

----------------------------------------------------------------------
-- Urias(alyah) Flag damit er nicht mit in die dritte Festung teleportiert --
----------------------------------------------------------------------

OnToggleEvent
{
	OnConditions =
	{
		FigureInRange {X = 158, Y = 237, Range = 5, NpcId = Avatar, UpdateInterval = 5},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_p207_urias_wait_for_me"},
		SetGlobalFlagTrue {Name = "g_p207_alyah_wait_for_me"},
	},
	OffConditions =
	{
		Negated(FigureInRange {X = 158, Y = 237, Range = 5, NpcId = Avatar, UpdateInterval = 5}),
		Negated(FigureInRange {X = 85, Y = 128, Range = 5, NpcId = Avatar, UpdateInterval = 5}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_p207_urias_wait_for_me"},
		SetGlobalFlagFalse {Name = "g_p207_alyah_wait_for_me"},
	},
}

---------------------------------------------------------------------------------------------
-- Wachen in der dritten Festung Spawnen / ChangeRace auf 152 in n10977.lua bis n10982.lua --
---------------------------------------------------------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 158, Y = 237, Range = 5, NpcId = Avatar},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_p207_Dritte_Festung_Wachen_Spawn"},		
	},
}

------------------------------
-- Dritte Festung Labyrinth --
------------------------------

OnToggleEvent
{
	OnConditions =
	{
		FigureInRange {X = 85, Y = 128, Range = 2, NpcId = Avatar},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_p207_Avatar_Im_Labyrinth"},
	},
	OffConditions =
	{
		ODER
		(
			FigureInRange {X = 158, Y = 237, Range = 2, NpcId = Avatar},
			IsGlobalFlagFalse {Name = "g_p207_Avatar_Im_Labyrinth"}
		),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_p207_Avatar_Im_Labyrinth"},
	},
}

OnEvent
{
	Conditions =
	{
		FigureDead {NpcId = Avatar},
		IsGlobalFlagTrue {Name = "g_p207_Avatar_Im_Labyrinth"},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "g_p207_Avatar_Im_Labyrinth"},
		IncreaseGlobalCounter {Name = "g_p207_Avatar_Tot"},
	},
}

-------------------
-- Rohen ist tot --
-------------------

OnOneTimeEvent
{
	Conditions = 
	{
		FigureDead {NpcId = 11086},
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohen_Has_Spawned"},
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Rohen_Has_Left_The_Building"},
	},
}

-- _______________________________________
--I                                      I
--I        NQ_Der letzte Dracon          I
--I______________________________________I

OnOneTimeEvent
{
	Conditions = 
	{
		
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_11071"},
	},
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_sP207StartDraconNebenQuest"},	
	},  
	Actions = 
	{
		QuestBegin {QuestId = 1061},
		QuestBegin {QuestId = 1063},
		TransferItem {GiveItem = 7368, Flag = Give},
		
	},
}

-------------------------------
-- FigureInRange für Truppen --
-------------------------------

--	n11026_Dritte_Festung_Weg_Zur_Vierten_Festung_Truppe01
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 163, Y = 160, Range = 6},	
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Dritte_Festung_Weg_Zur_Vierten_Festung_Truppe01"},
	},
}

--	n11037_Dritte_Festung_Weg_Zur_Vierten_Festung_Truppe02
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 192, Y = 159, Range = 5},	
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Dritte_Festung_Weg_Zur_Vierten_Festung_Truppe02"},
	},
}

--	n11048_Dritte_Festung_Weg_Zur_Vierten_Festung_Truppe03
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 206, Y = 141, Range = 5},	
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Dritte_Festung_Weg_Zur_Vierten_Festung_Truppe03"},
	},
}

--	n11614_Weg_Zur_Vierten_Festung_Truppe01
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 263, Y = 327, Range = 4},
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Weg_Zur_Vierten_Festung_Truppe01"},
	},
}

--	n11620_Weg_Zur_Zweiten_Festung_Truppe02
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 296, Y = 295, Range = 4},
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Weg_Zur_Zweiten_Festung_Truppe02"},
	},
}

--	n11626_Weg_Zur_Zweiten_Festung_Truppe03
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 351, Y = 309, Range = 3},
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Weg_Zur_Zweiten_Festung_Truppe03"},
	},
}

--	n11632_Weg_Zur_Dritten_Festung_Truppe01
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 361, Y = 240, Range = 4},
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Weg_Zur_Dritten_Festung_Truppe01"},
	},
}

--	n11637_Weg_Zur_Dritten_Festung_Truppe02
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 312, Y = 233, Range = 5},
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Weg_Zur_Dritten_Festung_Truppe02"},
	},
}

--	n11643_Weg_Zur_Dritten_Festung_Truppe02
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 238, Y = 223, Range = 5},
	},  
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Weg_Zur_Dritten_Festung_Truppe03"},
	},
}

------------------------------------------------------------------
-- Avatar läuft weg vom Portal solange Rohen noch nicht tot ist --
------------------------------------------------------------------

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalFlagTrue {Name = "g_P207_Undead_Rohen_Has_Spawned"},
		FigureAlive {NpcId = 11086}, -- Rohen
		FigureInRange {X = 275, Y = 65, Range = 5, NpcId = Avatar, UpdateInterval = 5},
	},
	OnActions =
	{
		Goto {X = 285, Y = 65, NpcId = self, WalkMode = Run, GotoMode = GotoContinuous},		
	},
	OffConditions =
	{		
	},
	OffActions =
	{
	},
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
		SetGlobalTimeStamp{Name = "g_SchatzbriefCounter"},
	}
}

EndDefinition()
end