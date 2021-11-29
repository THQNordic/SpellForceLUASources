-----------------------------------------------------------------------
--
--	WarzoneEntry
--
-----------------------------------------------------------------------

-- totale portal
CameraWarzoneEntryI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p109\\n6817_CameraWarzoneEntryI.lua")
   	Camera:ScriptStart()
]]

-- totale menschenmonument
CameraWarzoneEntryII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p109\\n6817_CameraWarzoneEntryII.lua")
   	Camera:ScriptStart()
]]

-- totale elfenmonument
CameraWarzoneEntryIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p109\\n6817_CameraWarzoneEntryIII.lua")
   	Camera:ScriptStart()
]]

-- totale nordportal
CameraWarzoneEntryIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p109\\n6817_CameraWarzoneEntryIV.lua")
   	Camera:ScriptStart()
]]

-- totale grosses tor
CameraWarzoneEntryV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p109\\n6817_CameraWarzoneEntryV.lua")
   	Camera:ScriptStart()
]]

-- zwergensiedlung
CameraWarzoneEntryVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p109\\n6817_CameraWarzoneEntryVI.lua")
   	Camera:ScriptStart()
]]

-- lea und avatar fahrt runter
CameraWarzoneEntryVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p109\\n6817_CameraWarzoneEntryVII.lua")
   	Camera:ScriptStart()
]]

-- lea und avatar 2
CameraWarzoneEntryVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p109\\n6817_CameraWarzoneEntryVIII.lua")
   	Camera:ScriptStart()
]]

-- grosses tor 2
CameraWarzoneEntryIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p109\\n6817_CameraWarzoneEntryIX.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "WarzoneEntry", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
		-- IsGlobalFlagTrue {Name = "Stopper"},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},		-- avatar
		SetNoFightFlagTrue {NpcId = 6817},	-- lena
	},	
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = CameraWarzoneEntryVII},
			Goto {NpcId = 0, X = 48, Y = 86, WalkMode = Walk},	
			Goto {NpcId = 6817, X = 50, Y = 84, WalkMode = Walk},				
		},
		[40] =
		{
			CutSceneSay {Tag = "cs09LenaP109_001" , NpcId = 6817, String = "Die Schattengrenze ... und ich hatte gehofft, Urgath nie wiedersehen zu müssen."}, -- lena
		},
		[90] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraWarzoneEntryIX},			
			CutSceneSay {Tag = "cs09MainCharP109_001" , NpcId = 0, String = "Was ist das für ein Wall?"},	
		},
		[130] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cs09LenaP109_002" , NpcId = 6817, String = "Finsterwehr, das alte Grenztor. Keine Armee vermochte es bisher zu nehmen."},		
		},
		[230] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraWarzoneEntryII},			
			CutSceneSay {Tag = "cs09MainCharP109_002" , NpcId = 0, String = "Es gibt genug Monumente hier für ein großes Heer."},	
		},
		[270] =
		{
			ExecuteCameraScript{Script = CameraWarzoneEntryIII},		
		},
		[310] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWarzoneEntryVIII},
			CutSceneSay {Tag = "cs09LenaP109_003" , NpcId = 6817, String = "Truppen allein werden uns nicht reichen, wir brauchen eine List, um dieses Bollwerk zu überwinden."},	
		},
		[360] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs09MainCharP109_003" , NpcId = 0, String = "Zerstörer der Zwerge wären von Nutzen."},		
		},
		[390] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWarzoneEntryVI},			
			CutSceneSay {Tag = "cs09LenaP109_004" , NpcId = 6817, String = "Hm, bevor das Feuerimperium entstand, siedelten hier Menschen und auch einige Zwerge."},		
		},	
		[460] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWarzoneEntryIV},			
			CutSceneSay {Tag = "cs09LenaP109_005" , NpcId = 6817, String = "Und den Geschichten zufolge soll es ein geheimes Portal in den Osten geben."},		
		},	
		[540] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWarzoneEntryI},			
			CutSceneSay {Tag = "cs09LenaP109_006" , NpcId = 6817, String = "Wir sollten die Gegend genauer erkunden, vielleicht finden wir einen Weg, die Finsterwehr zu überwinden."},		
		},						
		[590] = 
		{
			WaitForEndOfSpeech,
			RevealUnExplored {X = 48, Y = 114, Range = 10},
			RevealUnExplored {X = 105, Y = 390, Range = 10},
			--RevealUnExplored {X = 245, Y = 466, Range = 10},
			RevealUnExplored {X = 275, Y = 224, Range = 10},
			RevealUnExplored {X = 469, Y = 214, Range = 15},
			SetNoFightFlagFalse {NpcId = 0},		-- avatar
			SetNoFightFlagFalse {NpcId = 6817},	-- lena	
			SetGlobalFlagTrue {Name = "P109LenaFollow"},
		},
	},
}
