-----------------------------------------------------------------------
--
--	Reowys Entry
--
-----------------------------------------------------------------------

-- totale
n5641_CameraReowysEntryI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p103\\n5641_CameraReowysEntryI.lua")
   	Camera:ScriptStart()
]]

-- whorim und sein lager
n5641_CameraReowysEntryII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p103\\n5641_CameraReowysEntryII.lua")
   	Camera:ScriptStart()
]]

-- whorim zoom
n5641_CameraReowysEntryIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p103\\n5641_CameraReowysEntryIII.lua")
   	Camera:ScriptStart()
]]

-- orklager
n5641_CameraReowysEntryIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p103\\n5641_CameraReowysEntryIV.lua")
   	Camera:ScriptStart()
]]

-- reowys halbnah
n5641_CameraReowysEntryV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p103\\n5641_CameraReowysEntryV.lua")
   	Camera:ScriptStart()
]]

-- lena halbnah
n5641_CameraReowysEntryVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p103\\n5641_CameraReowysEntryVI.lua")
   	Camera:ScriptStart()
]]

-- avatar halbnah
n5641_CameraReowysEntryVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p103\\n5641_CameraReowysEntryVII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "ReowysEntry", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- IsGlobalFlagTrue {Name = "Stopper"},
		-- startet direkt zu beginn der map.
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 0},	
		SetNoFightFlagTrue {NpcId = 6756},	-- grim
		SetNoFightFlagTrue {NpcId = 6757},	-- lena
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = n5641_CameraReowysEntryI},			
			Goto {NpcId = 5641, X = 91, Y = 183, WalkMode = Run}, -- reowys
			LookAtFigure {NpcId = 0, Target = 5641},			
			LookAtFigure {NpcId = 6756, Target = 5641},	
			LookAtFigure {NpcId = 6757, Target = 5641},								
		},
		[30] = 
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs18LenaP103_001" , NpcId = 6757, String = "Reowys!"},
		},
		[70] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n5641_CameraReowysEntryV},			
			CutSceneSay {Tag = "cs18ReowysP103_001" , NpcId = 5641, String = "Lena! Bleibt fort! Geht! Schnell!"},
		},
		[100] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n5641_CameraReowysEntryVI},			
			Goto {NpcId = 6757, X = 94, Y = 180, WalkMode = Walk}, -- lena	
			CutSceneSay {Tag = "cs18LenaP103_002" , NpcId = 6757, String = "Aber wir sind Freunde..."},
		},
		[130] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n5641_CameraReowysEntryV},			
			Goto {NpcId = 5641, X = 89, Y = 181, WalkMode = Run}, -- reowys			
			CutSceneSay {Tag = "cs18ReowysP103_002" , NpcId = 5641, String = "Freunde oder nicht, Whorim, der Schwarze, hat meine Rune geraubt! Ich bin nun sein Werkzeug!"},
		},
		[190] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n5641_CameraReowysEntryVII},				
			Goto {NpcId = 0, X = 95, Y = 181, WalkMode = Walk},	-- avatar		
			CutSceneSay {Tag = "cs18LenaP103_003" , NpcId = 6757, String = "Whorim, diese Sumpfschlange! Das ist ein Zauberer, der sich mit den Orks verbündet hat!"},
		},
		[240] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n5641_CameraReowysEntryI},				
			LookAtFigure {NpcId = 6757, Target = 5641},
			LookAtFigure {NpcId = 5641, Target = 6757},			
			CutSceneSay {Tag = "cs18LenaP103_004" , NpcId = 6757, String = "Wir werden deine Rune zurückgewinnen, Reowys ... das verspreche ich."},
		},		
		[300] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n5641_CameraReowysEntryIV},
			LookAtFigure {NpcId = 5641, Target = 6757},	
			LookAtFigure {NpcId = 6757, Target = 5641},				
			CutSceneSay {Tag = "cs18ReowysP103_003" , NpcId = 5641, String = "Das wird kein leichter Kampf, Orks sichern das Tiefland!"},
		},		
		[370] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n5641_CameraReowysEntryII},		
			Goto {NpcId = 5639, X = 399, Y = 339, WalkMode = Run}, -- whorim				
			CutSceneSay {Tag = "cs18ReowysP103_004" , NpcId = 5641, String = "Whorim hat sein Lager auf dem Fels weit im Osten!"},
		},	
		[440] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n5641_CameraReowysEntryV},		
			CutSceneSay {Tag = "cs18ReowysP103_005" , NpcId = 5641, String = "Ihr müsst durch das alte Flussbett ... argh!"},
		},						
		[480] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n5641_CameraReowysEntryIII},	
			CutSceneSay {Tag = "cs18WhorimP103_001" , NpcId = 5639, String = "Was ist das? Du bist mein, Runenknecht! Wie kannst du es wagen! Töte sie! Ich gebiete es!"},
		},				
		[560] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n5641_CameraReowysEntryV},				
			CutSceneSay {Tag = "cs18ReowysP103_006" , NpcId = 5641, String = "Wie Ihr befehlt..."},
		},			
		[580] =
		{
			Goto {NpcId = 5641, X = 92, Y = 181, WalkMode = Walk}, -- reowys
		},	
		[600] = 
		{
			WaitForEndOfSpeech,
			ChangeRace{Race = 158, NpcId = 5641 },
			SetNoFightFlagFalse {NpcId = 0},	
			SetNoFightFlagFalse {NpcId = 6756},	-- grim
			SetNoFightFlagFalse {NpcId = 6757},	-- lena		
			RevealUnExplored {X = 396, Y = 339, Range = 15},
			Follow {NpcId = 6757, Target = Avatar},	
			QuestBegin {QuestId = 623},
			QuestBegin {QuestId = 590},
		},
	},
}
