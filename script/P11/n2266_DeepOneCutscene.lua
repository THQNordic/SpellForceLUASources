-----------------------------------------------------------------------
--
--	Deep One Auftrag
--
-----------------------------------------------------------------------

CameraDeepOneI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p11\\n2266_CameraDeepOneI.lua")
   	Camera:ScriptStart()
]]

CameraDeepOneII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p11\\n2266_CameraDeepOneII.lua")
   	Camera:ScriptStart()
]]

CameraDeepOneIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p11\\n2266_CameraDeepOneIII.lua")
   	Camera:ScriptStart()
]]

CameraDeepOneIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p11\\n2266_CameraDeepOneIV.lua")
   	Camera:ScriptStart()
]]

CameraDeepOneV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p11\\n2266_CameraDeepOneV.lua")
   	Camera:ScriptStart()
]]

CameraDeepOneVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p11\\n2266_CameraDeepOneVI.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "DeepOneI", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue{UpdateInterval = 1, Name = "Q166CutsceneFlag"},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
--		RemoveDialog{NpcId = 2664},
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 2664},	
		RemoveDialog {NpcId = 2266},
--		RemoveDialog {NpcId = 2664},	
--		RemoveDialog {NpcId = 2680},										
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:	
		},		
		[20] = 
		{ 
			ExecuteCameraScript{Script = CameraDeepOneI},				
			CutSceneSay{Tag = "cutDeepOneStonebl001" , NpcId = 2266 , String = "Es hat begonnen! Die Wächter sind erschienen."},
		},
		[80] = 
		{
			WaitForEndOfSpeech,	
			CutSceneSay{Tag = "cutDeepOneStonebl002" , NpcId = 2266 , String = "Sie beschwören den Zorn der Felsen!"},
		},
		[120] =
		{
			ExecuteCameraScript{Script = CameraDeepOneII},			
		},
		[140] = 
		{
			WaitForEndOfSpeech,				
			CutSceneSay{Tag = "cutDeepOneStonebl003" , NpcId = 2266 , String = "Der alte Fluch erwacht!"},
		},
		[160] =
		{
			ExecuteCameraScript{Script = CameraDeepOneIII},			
		},
		[210] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraDeepOneIV},						
			CutSceneSay{Tag = "cutDeepOneStonebl004" , NpcId = 2266 , String = "Findet sie! Haltet sie auf, bevor sie das Ritual vollenden können!"},
		},
		[260] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraDeepOneV},							
			CutSceneSay{Tag = "cutDeepOneStonebl005" , NpcId = 2266 , String = "Dies ist die einzige Hilfe, die ich Euch gewähren kann! Möge Niethalf euch gnädig sein, Mensch."},
			RevealUnExplored {X = 350,Y = 231, Range = 20},
			RevealUnExplored {X = 322,Y = 323, Range = 20},
			RevealUnExplored {X = 288,Y = 411, Range = 20},
			RevealUnExplored {X = 117,Y = 363, Range = 20},
			RevealUnExplored {X = 133,Y = 294, Range = 20},
		},
		[320] =
		{
			ExecuteCameraScript{Script = CameraDeepOneVI},				
			WaitForEndOfSpeech,		
		},
		[400] =
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 2664},	
			EnableDialog {NpcId = 2266},
			SetDialogType{NpcId = 2266 , Type = SideQuest}
--			EnableDialog {NpcId = 2664},
--			EnableDialog {NpcId = 2680},																	
		},
	},
}