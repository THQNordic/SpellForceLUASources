-----------------------------------------------------------------------
--
--	Meet Setrius
--
-----------------------------------------------------------------------

-- fahrt totale ins dorf
CameraSetriusI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p102\\n5462_CameraSetriusI.lua")
   	Camera:ScriptStart()
]]

-- janina halbnah
CameraSetriusII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p102\\n5462_CameraSetriusII.lua")
   	Camera:ScriptStart()
]]

-- setrius halbnah
CameraSetriusIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p102\\n5462_CameraSetriusIII.lua")
   	Camera:ScriptStart()
]]

-- fahrt 2 mit avatar
CameraSetriusIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p102\\n5462_CameraSetriusIV.lua")
   	Camera:ScriptStart()
]]

-- monument 1 totale
CameraSetriusV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p102\\n5462_CameraSetriusV.lua")
   	Camera:ScriptStart()
]]

-- monument 2 totale
CameraSetriusVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p102\\n5462_CameraSetriusVI.lua")
   	Camera:ScriptStart()
]]

-- skergdorf totale
CameraSetriusVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p102\\n5462_CameraSetriusVII.lua")
   	Camera:ScriptStart()
]]

-- dunhan tor
CameraSetriusVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p102\\n5462_CameraSetriusVIII.lua")
   	Camera:ScriptStart()
]]

-- skerdorf totale 2
CameraSetriusIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p102\\n5462_CameraSetriusIX.lua")
   	Camera:ScriptStart()
]]

-- lea halbnah fahrt zurueck
CameraSetriusX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p102\\n5462_CameraSetriusX.lua")
   	Camera:ScriptStart()
]]

-- janina und setrius
CameraSetriusXI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p102\\n5462_CameraSetriusXI.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Meet Setrius", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- IsGlobalFlagTrue {Name = "Stopper"},
		
		FigureInRange {NpcId = 0, X = 311, Y = 391, Range = 15},    -- avatar
		FigureInRange {NpcId = 5461, X = 311, Y = 391, Range = 20},	-- janina
		FigureInRange {NpcId = 5462, X = 311, Y = 391, Range = 20},	-- setrius	
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene: 
		
		-- janina (5461) hat einen follow auf den avatar und muss mit ihm setrius erreichen
		-- grim und lena koennten weg sein, deswegen umspawn

		Goto{NpcId = 5461, X = 307, Y = 394, Range = 0, WalkMode = Run}, -- janina
		Goto{NpcId = 5462, X = 305, Y = 394, Range = 0, WalkMode = Run}, -- setrius	
		SetGlobalFlagTrue {Name = "CutsceneInitSetriusGrim"}, 			
		SetGlobalFlagTrue {Name = "CutsceneInitSetriusLena"}, 		
		RemoveDialog {NpcId = 5462},		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:
			ExecuteCameraScript{Script = CameraSetriusI}, -- kommt sofort
			Goto{NpcId = 5461, X = 307, Y = 394, Range = 0, WalkMode = Run}, -- janina
			Goto{NpcId = 5462, X = 305, Y = 394, Range = 0, WalkMode = Run}, -- setrius	
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},		
		},
		[10] =
		{
			Goto{NpcId = 5461, X = 307, Y = 394, Range = 0, WalkMode = Run}, -- janina
			Goto{NpcId = 5462, X = 305, Y = 394, Range = 0, WalkMode = Run}, -- setrius	
			Goto{NpcId = 6311, X = 312, Y = 392, Range = 0, WalkMode = Run}, -- lea				
		},
		[20] =
		{
			Goto{NpcId = 0, X = 309, Y = 393, Range = 0, WalkMode = Walk}, -- avatar
			Goto{NpcId = 5461, X = 307, Y = 394, Range = 0, WalkMode = Run}, -- janina
			Goto{NpcId = 5462, X = 305, Y = 394, Range = 0, WalkMode = Run}, -- setrius	
			Goto{NpcId = 6311, X = 312, Y = 392, Range = 0, WalkMode = Run}, -- lena							
		},
		[80] =
		{
			CutSceneSay {Tag = "cs05aSetriusP102_001" , NpcId = 5462, String = "Janina!"},
			Goto{NpcId = 0, X = 309, Y = 393, Range = 0, WalkMode = Walk}, -- avatar
			Goto{NpcId = 5461, X = 307, Y = 394, Range = 0, WalkMode = Run}, -- janina
			Goto{NpcId = 5462, X = 305, Y = 394, Range = 0, WalkMode = Run}, -- setrius	
			Goto{NpcId = 6311, X = 312, Y = 392, Range = 0, WalkMode = Run}, -- lena					
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},
		},
		[100] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},	
			CutSceneSay {Tag = "cs05aSetriusP102_002" , NpcId = 5462, String = "Du lebst, welch ein Glück!"},
		},		
		[130] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusII},			
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},	
			CutSceneSay {Tag = "cs05aJaninaP102_001" , NpcId = 5461, String = "Sei gegrüßt, Setrius."},
		},	
		[160] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusIII},				
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},		
			CutSceneSay {Tag = "cs05aSetriusP102_003" , NpcId = 5462, String = "Ich sehe keine Freude in deinen Augen."},
		},				
		[190] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusII},
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},		
			CutSceneSay {Tag = "cs05aJaninaP102_002" , NpcId = 5461, String = "Ich komme zurück aus dem Reich des Todes. Dunhans Zorn hat mich getötet, doch seine Begierde holte mich wieder zurück."},
		},
		[230] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusIII},				
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			
			CutSceneSay {Tag = "cs05aSetriusP102_004" , NpcId = 5462, String = "Er liebt dich, so wie ich es tat."}, 
		},	
		[260] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusXI},				
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			
			CutSceneSay {Tag = "cs05aJaninaP102_003" , NpcId = 5461, String = "Pah, Liebe! Er hat ein Monstrum aus mir gemacht! Er hat mich aus dem ewigen Schlaf gezerrt ... Aber etwas ist mit mir zurückgekehrt, ein Monstrum, das nun in meiner Seele wohnt!"}, 
		},		
		[320] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusIII},				
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			
			CutSceneSay {Tag = "cs05aSetriusP102_005" , NpcId = 5462, String = "Dann bist du nicht hier, um einen neuen Anfang zu machen ..."}, 
		},								
		[350] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusII},	
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			
			CutSceneSay {Tag = "cs05aJaninaP102_004" , NpcId = 5461, String = "Ich bin hier, um es zu Ende zu bringen."}, 
		},		
		[380] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusIII},				
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			
			CutSceneSay {Tag = "cs05aSetriusP102_006" , NpcId = 5462, String = "Dann müssen wir dich zu Dunhan bringen!"}, 

------------------------------------------------------------------------------------------------------------------------------------------

		},	
		[430] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusVIII},				
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			
			CutSceneSay {Tag = "cs05aSetriusP102_007" , NpcId = 5462, String = "Es gäbe einen Weg, wenn die Runenkrieger, die Euch begleiten, uns zur Hand gehen."}, 
		},
		[460] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusIII},	
			
			-- Angriff der Kithar auf die Monumente nach dem Auffinden von Setrius			
			Spawn {X =  352, Y = 108 , UnitId = 1487}, --Spawn Kithar im Skerg-Dorf
			Spawn {X =  356, Y = 111 , UnitId = 1488},
			Spawn {X =  358, Y = 106 , UnitId = 1488},
			Spawn {X =  364, Y = 111 , UnitId = 1487},
			Spawn {X =  366, Y = 109 , UnitId = 1492},
			Spawn {X =  370, Y = 111 , UnitId = 1488},
			Spawn {X =  373, Y = 108 , UnitId = 1492},
					
			Spawn {X =  297, Y = 157 , UnitId = 1487}, --Spawn Kithar beim Ork-Monument
			Spawn {X =  300, Y = 156 , UnitId = 1492},
			Spawn {X =  299, Y = 152 , UnitId = 1487},
			Spawn {X =  306, Y = 155 , UnitId = 1488},
			
			Spawn {X =  87, Y = 56 , UnitId = 1487}, --Spawn Kithar beim Menschen-Monument
			Spawn {X =  89, Y = 55 , UnitId = 1488},
			Spawn {X =  87, Y = 51 , UnitId = 1492},
			Spawn {X =  98, Y = 57 , UnitId = 1488},
			Spawn {X =  96, Y = 68 , UnitId = 1487},
			Spawn {X =  94, Y = 70 , UnitId = 1492},
			Spawn {X =  90, Y = 67 , UnitId = 1488},
			Spawn {X =  87, Y = 65 , UnitId = 1487},
			Spawn {X =  83, Y = 67 , UnitId = 1487},
			Spawn {X =  83, Y = 63 , UnitId = 1488},				
					
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			 
		},									
		[500] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusX},
			LookAtDirection {NpcId = 6311, Direction = South},
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			
			CutSceneSay {Tag = "cs05aSetriusP102_008" , NpcId = 5462, String = "Was ist das für ein Lärm?"},  -- (lena) setrius	
		},
		[530] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusV},				
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			
			CutSceneSay {Tag = "cs05aLenaP102_001" , NpcId = 6311, String = "Die Kithar greifen Euer Lager an!"}, 			
		},		
		[550] =
		{
			ExecuteCameraScript{Script = CameraSetriusVI},
		},
		[580] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusIX},			
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			
			CutSceneSay {Tag = "cs05aSetriusP102_009" , NpcId = 5462, String = "Das sind ihre Elitekrieger! Die Skergs sind verloren! Und Eure Leute ebenfalls!"}, 			
		},	
		[640] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSetriusIV},			
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 5461},
			LookAtFigure {NpcId = 5461, Target = 5462},			
			CutSceneSay {Tag = "cs05aSetriusP102_010" , NpcId = 5462, String = "Wie es scheint, seid Ihr nun auf Euch allein gestellt, Runenkrieger. Ihr seht, dass wir Eure Hilfe brauchen können."}, 			
		},	
		[700] = 
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue { Name = "LeaFollowP102" },
			SetGlobalFlagTrue { Name = "GrimFollowP102" },			
			SetGlobalFlagTrue { Name = "SetriusDialogEndedP102" },
			SetGlobalFlagFalse {Name = "CutsceneInitSetriusGrim"}, 			
			SetGlobalFlagFalse {Name = "CutsceneInitSetriusLena"}, 	
			EnableDialog {NpcId = 5462},	
			SetNoFightFlagFalse {NpcId = 5951},
			SetNoFightFlagFalse {NpcId = 6311},		
			SetRewardFlagTrue { Name = "SetriusErreicht" },	
			SetPlatformFlagFalse { Name = "JaninaFollow" },									
		},								
	},
}
