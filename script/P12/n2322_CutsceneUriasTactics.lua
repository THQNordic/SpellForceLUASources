-----------------------------------------------------------------------
--
--	Urias Tactics
--
-----------------------------------------------------------------------

CameraUriasI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p12\\n2322_CameraUriasTacticsI.lua")
   	Camera:ScriptStart()
]]

CameraUriasII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p12\\n2322_CameraUriasTacticsII.lua")
   	Camera:ScriptStart()
]]

CameraUriasIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p12\\n2322_CameraUriasTacticsIII.lua")
   	Camera:ScriptStart()
]]

CameraUriasIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p12\\n2322_CameraUriasTacticsIV.lua")
   	Camera:ScriptStart()
]]

CameraUriasV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p12\\n2322_CameraUriasTacticsV.lua")
   	Camera:ScriptStart()
]]

CameraUriasVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p12\\n2322_CameraUriasTacticsVI.lua")
   	Camera:ScriptStart()
]]

CameraUriasVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p12\\n2322_CameraUriasTacticsVII.lua")
   	Camera:ScriptStart()
]]

CameraUriasVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p12\\n2322_CameraUriasTacticsVIII.lua")
   	Camera:ScriptStart()
]]



CreateCutScene
{
	Name = "UriasTactics", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "Q190StarGreyduskTacticsCutscene", UpdateInterval = 10},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		-- Goto {NpcId = 0, X = 234, Y = 288, WalkMode = Run, GotoMode = GotoForced},
		SetGlobalFlagTrue {Name = "UriasSpawns"},	
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 2322},	
		RemoveDialog {NpcId = 2322},	
		SetGlobalFlagTrue {Name = "SkeletonSpawn"},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:	
		},
		[10] =
		{
			LookAtFigure {NpcId = 0, Target = 2322},
			LookAtFigure {NpcId = 2322, Target = 0},				
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraUriasVIII},	
		},
		[40] =
		{
			CutSceneSay {Tag = "cuturiasGrdskV001" , NpcId = 2322, String = "Euch erwartet ein Blutbad, das kann ich Euch versprechen! Alleine für den Ausbruch aus dieser Festung benötigt Ihr eine schlagkräftige Streitmacht!"},	
		},
		[170] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraUriasII},				
			CutSceneSay {Tag = "cuturiasGrdskV002" , NpcId = 2322, String = "Und um die Armee der Untoten zu besiegen, müsst Ihr Zihar, ihren Anführer hier im Grauschattental, schlagen!"},
		},
		[260] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraUriasIII},				
			CutSceneSay {Tag = "cuturiasGrdskV003" , NpcId = 2322, String = "Die Untoten benutzen das alte Höhlensystem unterhalb des Schlangenpasses, dem einzigen Weg nach Osten!"},
		},
		[340] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraUriasIV},
			SetGlobalFlagTrue {Name = "SkeletonIdleOff"},
			CutSceneSay {Tag = "cuturiasGrdskV004" , NpcId = 2322, String = "Wenn Ihr also durchbrechen wollt, dann müsst Ihr zuerst die vier Eingänge zum Höhlensystem sichern und halten!"},
		},
		[350] =
		{
			Goto {NpcId = 3712, X = 290, Y = 436, WalkMode = Run},	
			Goto {NpcId = 3713, X = 290, Y = 436, WalkMode = Run},	
			Goto {NpcId = 3714, X = 290, Y = 436, WalkMode = Run},								
		},
		[430] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraUriasV},	
			
			Goto {NpcId = 5283, X = 339, Y = 311, WalkMode = Run},	
			Goto {NpcId = 5284, X = 341, Y = 312, WalkMode = Run},	
			Goto {NpcId = 5285, X = 376, Y = 284, WalkMode = Run},	
			Goto {NpcId = 5286, X = 378, Y = 281, WalkMode = Run},	
			Goto {NpcId = 5287, X = 377, Y = 279, WalkMode = Run},	
									
			CutSceneSay {Tag = "cuturiasGrdskV005" , NpcId = 2322, String = "Andernfalls werdet Ihr auf Eurem Weg so viele Untote antreffen, dass selbst alle Armeen der Reiche zusammen sie nicht besiegen könnten! Besetzt die Höhleneingänge! Das ist der Schlüssel zum Sieg!"},
		},
		[500] =
		{
			Goto {NpcId = 3715, X = 352, Y = 321, WalkMode = Run},	
		},
		[510] =
		{
			Goto {NpcId = 3716, X = 351, Y = 320, WalkMode = Run},			
		},
		[520] =
		{
			Goto {NpcId = 3717, X = 349, Y = 322, WalkMode = Run},			
		},
		[580] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraUriasVI},				
			CutSceneSay {Tag = "cuturiasGrdskV006" , NpcId = 2322, String = "Und versucht nicht, ihre Lager zu zerstören! Das wäre sinnlos! Die Magie, dieser alten Ruinen ist so stark, dass sie immer neue Untote hervorbringt! Erst wenn ihr Feldherr Zihar bezwungen ist, wird der Spuk vorbei sein!"},
		},
		[600] =
		{
			Goto {NpcId = 3708, X = 360, Y = 453, WalkMode = Walk},	
			Goto {NpcId = 3709, X = 358, Y = 453, WalkMode = Walk},	
			Goto {NpcId = 3710, X = 358, Y = 451, WalkMode = Walk},		
			Goto {NpcId = 3711, X = 360, Y = 451, WalkMode = Walk},					
		},
		[770] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraUriasVII},				
			CutSceneSay {Tag = "cuturiasGrdskV007" , NpcId = 2322, String = "Wenn Ihr bereit für einen solchen Feldzug seid, dann gebt mir Bescheid! Ich werde die Tore für Euch öffnen lassen!"},
		},
		[870] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "SkeletonsDespawn"},		
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 2322},		
			EnableDialog {NpcId = 2322},							
		},		
	},
}

