-----------------------------------------------------------------------
--
--	Sgt Einar Einführung
--
-----------------------------------------------------------------------

CameraEinarI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,16,1,"script\\p5\\n1957_CameraEinarI.lua")
   	Camera:ScriptStart()
]]

CameraEinarII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,12,1,"script\\p5\\n1957_CameraEinarII.lua")
   	Camera:ScriptStart()
]]

CameraEinarIII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,16,1,"script\\p5\\n1957_CameraEinarIII.lua")
   	Camera:ScriptStart()
]]

CameraEinarIV = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,15,1,"script\\p5\\n1957_CameraEinarIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Einar", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		QuestState {QuestId = 87, State = StateActive, UpdateInterval = 1},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		RemoveDialog {NpcId = 1957},		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- startcutscene zu beginn der map:	
			ExecuteCameraScript{Script = CameraEinarI},			
			Goto {NpcId = 0, X = 151, Y = 420, WalkMode = Walk},			
			LookAtFigure {NpcId = 0, Target = 1957}, 
			LookAtFigure {NpcId = 1957, Target = 0}, 			
		},
		[20] = 
		{
			LookAtFigure {NpcId = 0, Target = 1957}, 
			LookAtFigure {NpcId = 1957, Target = 0}, 		
			CutSceneSay {Tag = "cuteinarShiel001", NpcId = 1957, String = "Endlich zurück in der Heimat! Aber... bei den Feuern von Barga Gor! Was ist hier geschehen?"},
		},
		[60] =
		{
			ExecuteCameraScript{Script = CameraEinarII},
			LookAtFigure {NpcId = 0, Target = 1957}, 
			LookAtFigure {NpcId = 1957, Target = 0}, 				
		},
		[100] = 
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cuteinarShiel002", NpcId = 1957, String = "Utran ist überrannt! Brannigans Truppen haben sich über ganz Shiel ausgebreitet!"},
		},
		[180] =
		{
			ExecuteCameraScript{Script = CameraEinarIII},
		},
		[190] = 
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cuteinarShiel003", NpcId = 1957, String = "Sie sind überall!"},
		},
		[220] = 
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cuteinarShiel004", NpcId = 1957, String = "Ich fürchte, ich muss Euch noch einmal um Hilfe bitten, Runenkrieger!"},
		},
		[290] =
		{
			WaitForEndOfSpeech,				
			ExecuteCameraScript{Script = CameraEinarIV},
			CutSceneSay {Tag = "cuteinarShiel005", NpcId = 1957, String = "Kommt mit! Ich kenne einen gut befestigten Außenposten! Wenn es noch Überlebende gibt, dann dort! Folgt mir!"},
		},
		[370] = 
		{
			ExecuteCameraScript{Script = CameraEinarI},					
		},
		[430] =
		{
			WaitForEndOfSpeech,		
			EnableDialog {NpcId = 1957},	
			SetGlobalFlagTrue{Name = "Q87EinarRunToUtrans"},									
		},
	},
}

