-----------------------------------------------------------------------
--
--	LeafshadeFinalBattle
--
-----------------------------------------------------------------------

CameraEinarI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p4\\n1362_CameraEinarFinalBattleI.lua")
   	Camera:ScriptStart()
]]

CameraEinarII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p4\\n1362_CameraEinarFinalBattleII.lua")
   	Camera:ScriptStart()
]]

CameraEinarIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p4\\n1362_CameraEinarFinalBattleIII.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "EinarFinalBattle", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		PlayerUnitInRange {X = 252, Y = 372, Range = 13, UpdateInterval = 5},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 1362},	
		RemoveDialog {NpcId = 1362},			
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
			ExecuteCameraScript{Script = CameraEinarI},
		},
		[80] =
		{
			CutSceneSay {Tag = "cuteinarLeaf003", NpcId = 1362, String = "Tiaras Flamme! Was ist das?"},		
		},
		[120] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraEinarIII},						
			CutSceneSay {Tag = "cuteinarLeaf004", NpcId = 1362, String = "Seht doch! Hinter der Brücke! Verflucht, dieses Bollwerk wird schwer zu nehmen sein! Diese Bastarde sind fleißig gewesen"},	
		},
		[220] = 
		{
			WaitForEndOfSpeech,				
			ExecuteCameraScript{Script = CameraEinarII},
		},
		[270] = 
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cuteinarLeaf005", NpcId = 1362, String = "Doch ihr Fleiß wiegt ihre Dummheit nicht auf - sie haben die Wälle nicht abgeriegelt!"},
		},								
		[320] =
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cuteinarLeaf006", NpcId = 1362, String = "Sendet Armbrustschützen auf die Wälle rechts und links, sobald wir über die Brücke sind!"},					
		},
		[370] = 
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cuteinarLeaf007", NpcId = 1362, String = "Positioniert sie über dem Durchgang... und lockt ihre Nahkämpfer heraus!"},
		},
		[410] = 
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cuteinarLeaf008", NpcId = 1362, String = "Der Bolzenhagel wird sie niederstrecken, bevor sie uns erreichen!"},				
		},
		[470] =
		{
			WaitForEndOfSpeech,	
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 1362},	
			EnableDialog {NpcId = 1362},										
		},
	},
}

