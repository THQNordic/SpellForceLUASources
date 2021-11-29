-----------------------------------------------------------------------
--
--	P201Blackwater_CoastCutszeneStart
--
-----------------------------------------------------------------------


n32230_CameraStart1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,40,1,"script\\P201\\n32230_CameraStart1.lua")
   	Camera:ScriptStart()
]]

n32231_CameraStart2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32231_CameraStart2.lua")
   	Camera:ScriptStart()
]]

n32231_CameraStart3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32231_CameraStart3.lua")
   	Camera:ScriptStart()
]]

n32233_CameraStart4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32233_CameraStart4.lua")
   	Camera:ScriptStart()
]]

n32233_CameraStart5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32233_CameraStart5.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P201Blackwater_CoastCutszeneStart", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[10] =
		{
			ExecuteCameraScript{Script = n32230_CameraStart1},
			CutSceneSay {Tag = "csa201darius_001" , NpcId = 11825, String = "Mein alter Freund. Ich hoffe, dieser Brief erreicht Euch, in welchen fernen Landen Ihr auch immer seid."},		
		},
		[90] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa201darius_002" , NpcId = 11825, String = "Ich weiß, Ihr hattet gute Gründe, nicht mehr nach Nortander zurückzukehren."},
		},
		[150] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa201darius_003" , NpcId = 11825, String = "Und es war richtig, dass Ihr den Phönixstein mit Euch genommen habt, die Völker hätten sich nur wegen ihm zerstritten."},
		},
		[230] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa201darius_004" , NpcId = 11825, String = "Ich weiß auch, dass Ihr endlich Euren Frieden haben wollt."},
			
		},
		[300] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa201darius_005" , NpcId = 11825, String = "Aber dennoch muss ich Euch jetzt zurückhalten. Eure Aufgabe ist noch nicht vollendet. Gewissermaßen hat sie gerade erst begonnen."},
			
		},	
		[410] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32231_CameraStart2},
			CutSceneSay {Tag = "csa201darius_006" , NpcId = 11825, String = "Trefft mich an der Schwarzen küste. Dort beginnt es. Eilt Euch."},
			
		},	
		[470] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32231_CameraStart3},	
			CutSceneSay {Tag = "csa201avatar_007" , NpcId = 0, String = "Die Schwarze Küste ... hier bin ich nun, alter Freund. Aber wo seid Ihr?"},
			SetGlobalFlagTrue {Name = "g_sP201SpawnStartOrdensritter2"},
		},	
		[550] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa201avatar_008" , NpcId = 0, String = "Kampfeslärm?"},
			LookAtDirection {Direction = West, NpcId = 0},
			
		},
		[580] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32233_CameraStart4},	
			CutSceneSay {Tag = "csa201avatar_009" , NpcId = 0, String = "Ein Ritter vom Orden des Erwachens!"},
			
			
		},		
		[605] =
		{
			
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa201avatar_010" , NpcId = 0, String = "Ob sie mit Darius hier sind? Ich muss dem Ritter helfen!"},
			AttackTarget{Target = 8393, NpcId = 0, FriendlyFire = FALSE},
		},		
		[685] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32233_CameraStart5},	
			
		},		
		[770] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetGlobalFlagTrue{Name = "g_sP201CutszeneStartEnded"},
		},		
	},
}



