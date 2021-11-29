-----------------------------------------------------------------------
--
--	Sklavenlager
--
-----------------------------------------------------------------------

-- kleine tiefe totale menschen
CameraSklavenlagerI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraSklavenlagerI.lua")
   	Camera:ScriptStart()
]]

-- lager totale
CameraSklavenlagerII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p101\\n5536_CameraSklavenlagerII.lua")
   	Camera:ScriptStart()
]]

-- gruppe halbnah
CameraSklavenlagerIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraSklavenlagerIII.lua")
   	Camera:ScriptStart()
]]

-- grim nah
CameraSklavenlagerIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,40,1,"script\\p101\\n5536_CameraSklavenlagerIV.lua")
   	Camera:ScriptStart()
]]

-- lena nah
CameraSklavenlagerV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,40,1,"script\\p101\\n5536_CameraSklavenlagerV.lua")
   	Camera:ScriptStart()
]]

-- avatar ueber schulter lea
CameraSklavenlagerVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,40,1,"script\\p101\\n5536_CameraSklavenlagerVI.lua")
   	Camera:ScriptStart()
]]

-- aedar halbnah
CameraSklavenlagerVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraSklavenlagerVII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Sklavenlager", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet wenn spieler ( u.U. mit grim und lea) am ersten flüchtlingslager ankommt.
		-- FigureInRange{ X = 206, Y = 97, NpcId = 5536 , Range = 10}, --Grim auch in Range
		PlayerUnitInRange{X = 184, Y = 93, Range = 10, FigureType = FigureAvatar, UpdateInterval = 10},	
		--IsGlobalFlagTrue {Name = "Stopper"},		
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},		-- avatar
		SetNoFightFlagTrue {NpcId = 5536}, 	-- grim
		SetNoFightFlagTrue {NpcId = 5537},	-- lena
		SetNoFightFlagTrue {NpcId = 5539},	-- aedar
		SetGlobalFlagTrue {Name = "CutsceneInitSklavenlager"},	
		SetGlobalFlagTrue {Name = "CutsceneInitSklavenlagerLena"},	
		IncreaseGlobalCounter {Name = "GrimsWegpunkte"}, --IdleGoHome Grim abschalten
		RemoveDialog {NpcId = 5539},
	},	
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = CameraSklavenlagerII},			
			Goto {NpcId = 0, X = 202, Y = 95, WalkMode = Run},
			Goto {NpcId = 5536, X = 203, Y = 97, WalkMode = Run},
		},
		[10] =
		{
			SetGlobalFlagTrue {Name = "CutsceneInitSklavenlager"},	-- grim umspawn		
		},
		[20] =
		{
			Goto {NpcId = 0, X = 202, Y = 95, WalkMode = Run},
			Goto {NpcId = 5536, X = 203, Y = 97, WalkMode = Run},
		},
		[30] = 
		{
			SetNoFightFlagTrue {NpcId = 5536}, 	-- grim
			SetNoFightFlagTrue {NpcId = 5537},	-- lena		
			Goto {NpcId = 0, X = 202, Y = 95, WalkMode = Run},
			Goto {NpcId = 5536, X = 203, Y = 97, WalkMode = Run},
		},
		[60] =
		{
			CutSceneSay {Tag = "cs02GrimP101_001" , NpcId = 5536, String = "So! Hier können wir reden."},
			LookAtFigure {NpcId = 0, Target = 5536},
			LookAtFigure {NpcId = 5536, Target = 0},
			LookAtFigure {NpcId = 5537, Target = 0},
		},
		[90] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSklavenlagerIII},			
			CutSceneSay {Tag = "cs02MainCharP101_001" , NpcId = 0, String = "Also, warum bin ich hier?"},	
			LookAtFigure {NpcId = 0, Target = 5536},
			LookAtFigure {NpcId = 5536, Target = 0},
			LookAtFigure {NpcId = 5537, Target = 0},			
		},
		[120] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs02LenaP101_001" , NpcId = 5537, String = "Um diesen Leuten hier zu helfen, so wie wir."},		
		},
		[150] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraSklavenlagerIV},
			CutSceneSay {Tag = "cs02GrimP101_002" , NpcId = 5536, String = "Und jemanden zu befreien, der hier gefangen gehalten wird."},		
		},
		[180] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraSklavenlagerV},			
			CutSceneSay {Tag = "cs02LenaP101_002" , NpcId = 5537, String = "Du erinnerst dich vielleicht nicht mehr an uns, aber wir haben im Konvokationskrieg gemeinsam gekämpft. Wir waren mal Freunde ... soweit man unter der Rune Freunde haben kann."},		
		},
		[260] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraSklavenlagerIV},
			CutSceneSay {Tag = "cs02GrimP101_003" , NpcId = 5536, String = "Und da uns noch ein paar gute Streiter fehlen ... kamst du uns in den Sinn."},		
		},
		[300] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraSklavenlagerVI},
			CutSceneSay {Tag = "cs02MainCharP101_002" , NpcId = 0, String = "Wer kann schon alten Freunden etwas abschlagen. Wohin sonst sollte ich auch gehen ... also, sprecht, was ist euer Plan?"},		
		},
		[330] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraSklavenlagerIV},
			CutSceneSay {Tag = "cs02GrimP101_004" , NpcId = 5536, String = "Zuallererst brauchen wir mehr Unterstützung! Wir müssen mehr Runen sammeln, um eine schlagkräftige Truppe zu bilden!"},		
		},
		[380] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSklavenlagerI},
			CutSceneSay {Tag = "cs02LenaP101_003" , NpcId = 5537, String = "Für diese Menschen sind die Diener der Rune Helden, keine Monster! Sie folgten einst zwei berühmten Runenkriegern."},		
		},
		[440] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraSklavenlagerVII},
			CutSceneSay {Tag = "cs02GrimP101_005" , NpcId = 5536, String = "Der alte Aedar dort ist ihr Anführer. Sprich mit ihm, er will dir bestimmt eine kleine Rede halten. Wir warten solange."},		
		},																		
		[500] = 
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 5536},
			SetNoFightFlagFalse {NpcId = 5537},		
			SetNoFightFlagFalse {NpcId = 5539},							
			QuestBegin{QuestId = 573}, -- begin Quest Die Belagerung
			
			QuestBegin{QuestId = 571}, -- begin Quest Aedar
			QuestSolve {QuestId = 568, ActivateNextQuest = FALSE }, -- end Quest Der Widerstand
			QuestSolve {QuestId = 713, ActivateNextQuest = FALSE }, -- end Questfolge Grim und Lena zum Lager
			SetGlobalFlagFalse {Name = "P101GrimFollowAvatar"},
			SetGlobalFlagTrue{Name = "P101AedarDialogAn"}, --  Flag für Dialog Aedar
			Follow{Target = 0, NpcId = 5537}, --Lea folgt Avatar nach Cutscene
			Follow {Target = Avatar, NpcId = 5536}, -- Grim folgt jetzt auch
			SetGlobalFlagFalse {Name = "CutsceneInitSklavenlager"},	
			SetGlobalFlagFalse {Name = "CutsceneInitSklavenlagerLena"},	
			EnableDialog {NpcId = 5539},
		},
		
	},
}
