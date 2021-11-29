-----------------------------------------------------------------------
--
--	P211_CutsceneBegin
--
-----------------------------------------------------------------------

-- Blick übers Keep
n32530_CameraBeginI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P211\\n32530_CameraBeginI.lua")
   	Camera:ScriptStart()
]]

--Gegnerarmee Ebene
n32530_CameraBeginII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,18,1,"script\\P211\\n32530_CameraBeginII.lua")
   	Camera:ScriptStart()
]]

--Thunderblade Close Up
n32530_CameraBeginIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,13,1,"script\\P211\\n32530_CameraBeginIII.lua")
   	Camera:ScriptStart()
]]

--Fahrt über Gegnerarmee Richtung Treppe
n32530_CameraBeginIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P211\\n32530_CameraBeginIV.lua")
   	Camera:ScriptStart()
]]


--Treppe hoch
n32530_CameraBeginV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\P211\\n32530_CameraBeginV.lua")
   	Camera:ScriptStart()
]]


--besetztes Monument still
n32530_CameraBeginVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P211\\n32530_CameraBeginVI.lua")
   	Camera:ScriptStart()
]]

--Fahrt auf geschlossenes Tor, Jenquai dahinter
n32530_CameraBeginVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P211\\n32530_CameraBeginVII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P211_CutsceneBegin", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_nP211_InitCutsceneBegin"},

		--IsGlobalFlagTrue {Name = "NEVER!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"},

	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"}

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32530_CameraBeginI},	
			
		},
		
		
		[20] =
		{
		--6
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa240avatar_001", NpcId = 0, String = "Das ist also die Grenze ... hier endet die Macht der Götter ..."},--Blick übers Keep
		}, 
		
		[80] =
		{
			--4,5
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32530_CameraBeginII},	
		},
		
		[100] =
		{
			CutSceneSay {Tag = "csa240avatar_002", NpcId = 0, String = "Das sind andere Truppen als in Kathai!"}, --Gegnerarmee
		},
		
		[130] =
		{
			--5
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			--ExecuteCameraScript{Script = n32530_CameraBeginIII},	
			CutSceneSay {Tag = "csa240avatar_003", NpcId = 0, String = "Diese Eisernen habe ich noch nie gesehen!"}, --Thunderblade
		},
		
		[160] =
		{
			--6,5
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32530_CameraBeginIV},	
		}, 

		[170] =
		{
			CutSceneSay {Tag = "csa240avatar_004", NpcId = 0, String = "Rohen hatte Recht, diese Armee würde das Reich zermalmen!"},--Gegnerarmee
		}, 
		
		[190] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32530_CameraBeginV},	
		},

		[230] =
		{
			CutSceneSay {Tag = "csa240avatar_005", NpcId = 0, String = "Ich brauche ein starke Verteidigung! Und zwar schnell!"},--Treppe hinauf ins Keep
		},
		
		[250] =
		{
			--5
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32530_CameraBeginVI},	
			CutSceneSay {Tag = "csa240avatar_006", NpcId = 0, String = "Aber wie komme ich an das Monument?"}, --besetztes monument
		},
		
		[290] =
		{
			--5,5
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32530_CameraBeginVII},	
		},
	
		[350] =
		{
			CutSceneSay {Tag = "csa240jenquai_007", NpcId = 9811, String = "Freund! Öffnet uns das Tor! Wir werden Euch helfen! Rasch!"}, --jenquai, tor
		},
	
	
		[390] =
		{
			WaitForEndOfSpeech,
			RevealUnExplored {X = 236, Y = 421, Range = 5}, --Monument Zwerge Norden
			RevealUnExplored {X = 199, Y = 338, Range = 5}, --Monument Elfen Nord
			RevealUnExplored {X = 269, Y = 453, Range = 6}, --Tor nach Kathai
			QuestBegin{QuestId = 892, SubQuestActivate = FALSE}, --in den schwarzen Dschungel
			QuestBegin{QuestId = 935, SubQuestActivate = FALSE}, --öffne das Tor für die Kathai
			QuestBegin{QuestId = 936, SubQuestActivate = FALSE}, -- bekämpfe die Belagerer
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
		},
	
	
	},
}



