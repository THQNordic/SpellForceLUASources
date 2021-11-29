-----------------------------------------------------------------------
--
--	P202_CutsceneHokanStart
--
-----------------------------------------------------------------------


--Anfangsfahrt zu Spawnpunkt Avatar und Hokan
n32260_CameraHokanStart_I = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\P202\\n32260_CameraHokanStart_I.lua")
 		Camera:ScriptStart()
]]


--Fahrt auf Fial Darg
n32260_CameraHokanStart_II = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\P202\\n32260_CameraHokanStart_II.lua")
 		Camera:ScriptStart()
]]
	

--
n32260_CameraHokanStart_III = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P202\\n32260_CameraHokanStart_III.lua")
 		Camera:ScriptStart()
]]

--Totale auf Beide
n32260_CameraHokanStart_IV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P202\\n32260_CameraHokanStart_IV.lua")
 		Camera:ScriptStart()
]]


--Wegfahren rückwärts
n32260_CameraHokanStart_V = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P202\\n32260_CameraHokanStart_V.lua")
 		Camera:ScriptStart()
]]


n32260_CameraHokanStart_VI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P202\\n32260_CameraHokanStart_VI.lua")
 		Camera:ScriptStart()
]]

n32260_CameraHokanStart_VII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P202\\n32260_CameraHokanStart_VII.lua")
 		Camera:ScriptStart()
]]

n32260_CameraHokanStart_VIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P202\\n32260_CameraHokanStart_VIII.lua")
 		Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P202_CutsceneHokanStart", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler", UpdateInterval = 10},
		--IsGlobalFlagTrue {Name = "NEVERTRUE", UpdateInterval = 10},
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetGlobalFlagTrue {Name = "g_P202HokanAnfangSpawnInit"},
		TeleportAvatar{X = 346, Y = 420},
		SetEffect {Effect = "SimpleInvis", NpcId = 0, Length = 1550},	-- avatar unsichtbar zu beginn.
		
	},
	
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32260_CameraHokanStart_I},		
		},
		
		[15] =
		{
			--StopEffect {NpcId = 0},	-- avatar unsichtbar zu beginn.
			SetEffect {Effect = "Materialize", NpcId = 0, Length = 4000},	-- avatar materialize.
			SetEffect {Effect = "Materialize", NpcId = 9010, Length = 4000},	-- hokan materialize.
			
		
		},
		
		[25] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- Hokan auf Avatar	
			LookAtFigure {Target = 9010, NpcId = 0}, -- Avatar auf Hokan
			
		},
		
		[30] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- Hokan auf Avatar	
			LookAtFigure {Target = 9010, NpcId = 0}, -- Avatar auf Hokan
			CutSceneSay {Tag = "csa204masked_001" , NpcId = 9010, String = "Willkommen in der Stadt der Seelen, Runenkrieger!"},	
			
		},
		
		
		[70] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 9010}, 
			LookAtFigure {Target = 9010, NpcId = 0}, 
			CutSceneSay {Tag = "csa204avatar_002" , NpcId = 0, String = "Warum bringt Ihr mich hierher?"},	
				
		},	
		
		[90] =
		{
			--WaitForEndOfSpeech,	 --sollte immer angegeben werden
			--LookAtFigure {Target = 0, NpcId = 9010}, --
			Goto {X = 352, Y = 420, NpcId = 9010, Range = 0}, --Hokan geht ein paar Schritte vor
				
		},	
		
		
		[100] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa204masked_003" , NpcId = 9010, String = "Ich habe ein besondere Aufgabe ... genau richtig für Euch!"},	
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	

		[120] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[125] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[130] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[135] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[140] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[145] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[150] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[155] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		
		[160] =
		{
			
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32260_CameraHokanStart_II},
			LookAtFigure {Target = 9010, NpcId = 0}, --
			CutSceneSay {Tag = "csa204masked_004" , NpcId = 9010, String = "Ihr müsst in die Stadt eindringen und dort etwas für mich erbeuten ... eine Urne."},	
		},	
		
		[200] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 9010}, --
			Goto {X = 350, Y = 421, NpcId = 0, Range = 0}, --Avatar geht los
			CutSceneSay {Tag = "csa204avatar_005" , NpcId = 0, String = "Habt Ihr nicht genug Knechte in Shal’Dun, die Eure schmutzigen Pläne ausführen können?"},	
		},	
		
		[250] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa204masked_006" , NpcId = 9010, String = "Ja, aber Ihr führt die Schattenklinge, Freund!"},	
		},	
		
		[300] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa204masked_007" , NpcId = 9010, String = "Die Urne wird von einem Fial Darg bewacht! Nur Eure Klinge kann ihn bezwingen!"},	
		},	
		
		[370] =
		{
			
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32260_CameraHokanStart_III},
			LookAtFigure {Target = 0, NpcId = 9010}, --
			CutSceneSay {Tag = "csa204avatar_008" , NpcId = 0, String = "Schlagt es Euch aus dem Kopf! Ich ... diene nicht Eurem ... Wahnsinn!"},	
			Goto {X = 357, Y = 421, NpcId = 0, Range = 0}, --Avatar geht los
		},	

		[375] =	
		{
			LookAtFigure {Target = 0, NpcId = 9010}, --
		},
		[380] =	
		{
			LookAtFigure {Target = 0, NpcId = 9010}, --
			SetEffect{Effect = "Pestilence", Length = 2200, NpcId = Avatar},
		},
		[385] =	
		{
			LookAtFigure {Target = 0, NpcId = 9010}, --
		},
		[390] =	
		{
			SetEffect{Effect = "Pestilence", Length = 2600, NpcId = Avatar},
			LookAtFigure {Target = 0, NpcId = 9010}, --
		},
		[395] =	
		{
			LookAtFigure {Target = 0, NpcId = 9010}, --
		},
		[400] =	
		{
			LookAtFigure {Target = 0, NpcId = 9010}, --
			SetEffect{Effect = "Pestilence", Length = 2800, NpcId = Avatar},
		},
		[405] =	
		{
			LookAtFigure {Target = 0, NpcId = 9010}, --
		},
		[410] =	
		{
			LookAtFigure {Target = 0, NpcId = 9010}, --
			SetEffect{Effect = "Pestilence", Length = 2000, NpcId = Avatar},
		},
		[415] =	
		{
			LookAtFigure {Target = 0, NpcId = 9010}, --
		},
		[420] =	
		{
			LookAtFigure {Target = 0, NpcId = 9010}, --
			SetEffect{Effect = "Pestilence", Length = 3200, NpcId = Avatar},
		},
		
		[425] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32260_CameraHokanStart_VIII},
			Goto {X = 357, Y = 421, NpcId = 9010, Range = 2}, --Hokan zu Avatar
			--LookAtFigure {Target = 9010, NpcId = 0}, --Avatar dreht sich um
			--LookAtFigure {Target = 0, NpcId = 9010}, --
			CutSceneSay {Tag = "csa204masked_009" , NpcId = 9010, String = "Ja, es tut weh, nicht wahr? Die Schattenklinge frisst an Eurer Seele! Nicht mehr lange und Ihr werdet selbst zum Schatten ..."},	
			SetEffect{Effect = "Pestilence", Length = 3000, NpcId = Avatar},
		},	

		[450] =	
		{
			SetEffect{Effect = "Pestilence", Length = 2400, NpcId = Avatar},
		},
		[465] =	
		{
			SetEffect{Effect = "Pestilence", Length = 2200, NpcId = Avatar},
		},
		[480] =	
		{
			SetEffect{Effect = "Pestilence", Length = 2200, NpcId = Avatar},
		},
		[500] =	
		{
			SetEffect{Effect = "Pestilence", Length = 2600, NpcId = Avatar},
		},
		[518] =	
		{
			SetEffect{Effect = "Pestilence", Length = 3200, NpcId = Avatar},
		},

		[520] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			Goto {X = 368, Y = 412, NpcId = 9010, Range = 0}, --Hokan geht weiter
			CutSceneSay {Tag = "csa204masked_010" , NpcId = 9010, String = "Denkt daran, ich habe ein Mittel! Gegen Eure Schmerzen ... und gegen die Klinge!"},	
			SetEffect{Effect = "Pestilence", Length = 2800, NpcId = Avatar},
		},	
		
		[525] =	
		{
			SetEffect{Effect = "Pestilence", Length = 2200, NpcId = Avatar},
		},
		[540] =	
		{
			SetEffect{Effect = "Pestilence", Length = 2200, NpcId = Avatar},
		},
		
		[550] =
		{
			Goto {X = 368, Y = 415, NpcId = 0, Range = 3, WalkMode = Walk}, --Avatar folgt
		},

		[555] =	
		{
			SetEffect{Effect = "Pestilence", Length = 2400, NpcId = Avatar},
		},
		[575] =	
		{
			SetEffect{Effect = "Pestilence", Length = 2600, NpcId = Avatar},
		},
		
		[580] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetEffect{Effect = "Pestilence", Length = 2000, NpcId = Avatar},
			ExecuteCameraScript{Script = n32260_CameraHokanStart_IV},
			LookAtFigure {Target = 9010, NpcId = 0}, -- 
			Goto {X = 368, Y = 415, NpcId = 0, Range = 3, WalkMode = Run}, --Avatar folgt
			CutSceneSay {Tag = "csa204avatar_011" , NpcId = 0, String = "Es lässt nach! Ich brauche ... mehr ... davon!"},	
		},	
		
		[600] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- 
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[605] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- 
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[610] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- 
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[615] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- 
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[620] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- 
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[625] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- 
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		
		[630] =
		{
			
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 9010}, -- 
			LookAtFigure {Target = 9010, NpcId = 0}, --
			CutSceneSay {Tag = "csa204masked_012", NpcId = 9010, String = "Na, na, nicht so eilig! Zuerst werdet Ihr die Urne für mich aus der Stadt holen."},	
		},	

		[635] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- 
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[640] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- 
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		[645] =
		{
			LookAtFigure {Target = 0, NpcId = 9010}, -- 
			LookAtFigure {Target = 9010, NpcId = 0}, --
		},	
		
		[690] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 9010}, -- Hokan zu Avatar
			CutSceneSay {Tag = "csa204masked_013" , NpcId = 9010, String = "Kommt, lasst uns den Plan besprechen!"},	
		},	
	
		[700] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			QuestBegin {QuestId = 826, SubQuestActivate = FALSE}, --Q Hokans Auftrag
			QuestBegin {QuestId = 829, SubQuestActivate = FALSE}, --Q  Das Geheimnis des Tempels
			QuestBegin {QuestId = 830, SubQuestActivate = FALSE}, --Q  Hokans Plan
			
			SetGlobalFlagTrue{Name = "g_sP202CutsceneHokanStartEnded"},
			SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9010"}, --Hokan Dialog an
			--SetGlobalFlagFalse{Name = "g_nP202_InitCutsceneHokan1"},
			
			RevealUnExplored {X = 376, Y = 259, Range = 9}, --Grabmal aufdecken
			--SetGlobalFlagTrue {Name = "g_P202AvatarUmspawnBegin"},
		},		
	},
}
