-----------------------------------------------------------------------
--
--	Medusa Attack
--
-----------------------------------------------------------------------

-- totale medusa
CameraMedusaAttackI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,50,1,"script\\p19\\n3782_CameraMedusaAttackI.lua")
   	Camera:ScriptStart()
]]

-- schwenk ankommender vintus
CameraMedusaAttackII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p19\\n3782_CameraMedusaAttackII.lua")
   	Camera:ScriptStart()
]]

-- gegenschuss vintus langsame fahrt abwaerts
CameraMedusaAttackIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p19\\n3782_CameraMedusaAttackIII.lua")
   	Camera:ScriptStart()
]]

-- talk auf beide
CameraMedusaAttackIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p19\\n3782_CameraMedusaAttackIV.lua")
   	Camera:ScriptStart()
]]

-- stadt totale
CameraMedusaAttackV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p19\\n3782_CameraMedusaAttackV.lua")
   	Camera:ScriptStart()
]]

-- briarwolf hinten links
CameraMedusaAttackVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p19\\n3782_CameraMedusaAttackVI.lua")
   	Camera:ScriptStart()
]]

-- gargoyles totale vogelperspektive
CameraMedusaAttackVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p19\\n3782_CameraMedusaAttackVII.lua")
   	Camera:ScriptStart()
]]

-- schwenk auf medusa
CameraMedusaAttackVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p19\\n3782_CameraMedusaAttackVIII.lua")
   	Camera:ScriptStart()
]]

-- medusa nah
CameraMedusaAttackIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p19\\n3782_CameraMedusaAttackIX.lua")
   	Camera:ScriptStart()
]]

-- kampf halbtotale
CameraMedusaAttackX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p19\\n3782_CameraMedusaAttackX.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "MedusaAttack", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 4190},		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] = 
		{ 
			-- startcutscene ohne zeitverzoegerung
			Goto {NpcId = 0, X = 221, Y = 60, WalkMode = Run},
			Goto {NpcId = 4190, X = 221, Y = 52, WalkMode = Run},				
			ExecuteCameraScript{Script = CameraMedusaAttackII}, 
		},			
		[20] = 
		{ 
			CutSceneSay {Tag = "cutvintusMul001" , NpcId = 4190, String = "Wartet! Ihr habt uns gerettet! Dafür schulden wir Euch zumindest eine Warnung!"},
		},
		[60] =
		{
			Goto {NpcId = 0, X = 221, Y = 56, WalkMode = Run},
		},
		[120] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraMedusaAttackIV}, 			
			CutSceneSay {Tag = "cutvintusMul002" , NpcId = 4190, String = "Diese Stadt ist nicht nur mit Dämonen verseucht - sie ist eine tödliche Falle!"},
		},
		[170] =
		{
			ExecuteCameraScript{Script = CameraMedusaAttackV}, 
		},
		[230] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraMedusaAttackVI}, 			
			Goto {NpcId = 4364, X = 245, Y = 229, WalkMode = Walk},	-- briarwolf geht los.	
			LookAtFigure {NpcId = 4365, Target = 4364},		
			CutSceneSay {Tag = "cutvintusMul003" , NpcId = 4190, String = "Die Gargoylen, die Ihr überall sehen könnt, scheinen harmlos! Doch das sind sie nicht!"},
		},
		[270] =
		{
			ExecuteCameraScript{Script = CameraMedusaAttackVII}, 					
		},
		[300] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraMedusaAttackVIII}, 
			Goto {NpcId = 4365, X = 255, Y = 229, WalkMode = Walk},		-- Medusa.	
			HoldPosition {NpcId = 4364},			
			CutSceneSay {Tag = "cutvintusMul004" , NpcId = 4190, String = "Sie schlafen! Sollte Euch eine der Medusen erblicken, die durch die Straßen von Mulandir streifen, dann wird sie die Gargoylen erwecken!"},
		},
		[360] =
		{
			ExecuteCameraScript{Script = CameraMedusaAttackIX}, 		
		},
		[380] =
		{
			ChangeRace {NpcId = 4364, Race = 139},
		},
		[400] = 
		{
			WaitForEndOfSpeech,				
			ExecuteCameraScript{Script = CameraMedusaAttackX}, 				
			CutSceneSay {Tag = "cutvintusMul005" , NpcId = 4190, String = "Die steinernen Bestien werden über Euch herfallen! Vor ihnen gibt es kein Entrinnen!"},
		},
		[500] = 
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraMedusaAttackIV}, 					
			CutSceneSay {Tag = "cutvintusMul006" , NpcId = 4190, String = "Viel Glück, Runenkrieger!"},
		},
		[540] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraMedusaAttackII}, 
			Goto {NpcId = 4190, X = 221, Y = 45, WalkMode = Run},
		},
		[580] =
		{
			WaitForEndOfSpeech,
			Vanish {NpcId = 4190},
			Vanish {NpcId = 4365},			
			SetGlobalFlagTrue {Name = "MedusaSpawnEnd"},	-- die normalen npcs werden gesetzt.
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 4190},
			SetGlobalFlagTrue {Name = "VintusGodwallChainRemove"},				
		},
	},
}

