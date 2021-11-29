-----------------------------------------------------------------------
--
--	Godwall Top Mechlan and Vintus
--
-----------------------------------------------------------------------

CameraMechlanAndVintusI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p17\\n3027_CameraMechlanAndVintusI.lua")
   	Camera:ScriptStart()
]]

CameraMechlanAndVintusII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p17\\n3027_CameraMechlanAndVintusII.lua")
   	Camera:ScriptStart()
]]

CameraMechlanAndVintusIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p17\\n3027_CameraMechlanAndVintusIII.lua")
   	Camera:ScriptStart()
]]

-- hauptmann nah
CameraMechlanAndVintusIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p17\\n3027_CameraMechlanAndVintusIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "MechlanAndVintus", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- Startet direkt zu beginn der map.
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] = 
		{ 
			-- die ersten zwei sekunden ohne kamera:				
			RevealUnExplored{X = 315, Y = 405, Range = 10},
			LookAtFigure{NpcId = 3027, Target = 2619},	
			LookAtFigure{NpcId = 2619, Target = 3027},		
			LookAtFigure{NpcId = 2741, Target = 2619},	
			LookAtFigure{NpcId = 2743, Target = 2619},	
			LookAtFigure{NpcId = 2733, Target = 2619},	
			LookAtFigure{NpcId = 2620, Target = 2619},										

			ExecuteCameraScript{Script = CameraMechlanAndVintusI},			
		},		
		[10] = 
		{ 
			LookAtFigure{NpcId = 3027, Target = 2619},	
			LookAtFigure{NpcId = 2619, Target = 3027},	
			Goto{NpcId = 3027, X = 312 , Y = 406, Range = 0},
		},
		[20] = 
		{ 
			LookAtFigure{NpcId = 3027, Target = 2619},	
			LookAtFigure{NpcId = 2619, Target = 3027},	
			CutSceneSay {Tag = "cutmechlanGodw001", NpcId = 3027, String = "Nun rede endlich! Warum willst Du Dein Leiden unnötig verlängern?"},
		},
		[70] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraMechlanAndVintusII},						
			LookAtFigure{NpcId = 3027, Target = 2619},	
			LookAtFigure{NpcId = 2619, Target = 3027},	
			CutSceneSay {Tag = "cutvintusGodw001",NpcId = 2619, String = "Eure Gewalt... wird Euch nichts nützen! Von mir… erfahrt Ihr gar nichts!"},
		},
		[140] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraMechlanAndVintusIV},						
			LookAtFigure{NpcId = 3027, Target = 2619},	
			LookAtFigure{NpcId = 2619, Target = 3027},	
			CutSceneSay {Tag = "cutmechlanGodw002",NpcId = 3027, String = "Hauptmann! Lasst hier alles durchsuchen! Alles, hört Ihr!"},
		},
		[180] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraMechlanAndVintusIII},					
			LookAtFigure{NpcId = 3027, Target = 2619},	
			LookAtFigure{NpcId = 2619, Target = 3027},					
			CutSceneSay {Tag = "cutmechlanGodw003", NpcId = 3027, String = "Ich will den Splitter und wenn ich das ganze Land verwüsten muss! Foltert das Pack, wenn nötig! Sie hatten ihre Chance!"},
		},
		[260] = 
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 3027, Target = 2619},	
			LookAtFigure{NpcId = 2619, Target = 3027},					
			CutSceneSay {Tag = "cutmechlanGodw004", NpcId = 3027, String = "Bringt mir den Splitter! Oder Briar bringt mir Euren Kopf!"},
		},
		[290] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 3027, Target = 2619},	
			LookAtFigure{NpcId = 2619, Target = 3027},					
		},
		[330] = 
		{
			WaitForEndOfSpeech,	
			Vanish {NpcId = 3027},	
			SetNoFightFlagFalse {NpcId = 0},									
		},
	},
}

