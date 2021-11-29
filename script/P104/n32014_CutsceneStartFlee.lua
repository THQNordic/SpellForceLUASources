-----------------------------------------------------------------------
--
--	Start Flee
--
-----------------------------------------------------------------------

-- am portal
CameraStartFleeI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p104\\n5428_CameraStartFleeI.lua")
   	Camera:ScriptStart()
]]

-- der berg
CameraStartFleeII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p104\\n5428_CameraStartFleeII.lua")
   	Camera:ScriptStart()
]]

-- grenzfeste
CameraStartFleeIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p104\\n5428_CameraStartFleeIII.lua")
   	Camera:ScriptStart()
]]

-- sumpf flach
CameraStartFleeIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p104\\n5428_CameraStartFleeIV.lua")
   	Camera:ScriptStart()
]]

-- sumpf flach
CameraStartFleeV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p104\\n5428_CameraStartFleeV.lua")
   	Camera:ScriptStart()
]]

-- sumpf flach
CameraStartFleeVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p104\\n5428_CameraStartFleeVI.lua")
   	Camera:ScriptStart()
]]

-- lea und avatar kommen an - still
CameraStartFleeVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p104\\n5428_CameraStartFleeVII.lua")
   	Camera:ScriptStart()
]]

-- strecke der fluechtlinge
CameraStartFleeVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p104\\n5428_CameraStartFleeVIII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Start Flee", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
		-- IsGlobalFlagTrue {Name = "Stopper"},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene: 
		RemoveDialog {NpcId = 5428},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:
			LookAtDirection {NpcId = 5428, Direction = NorthWest},
			Goto {NpcId = 0, X = 465, Y = 53, WalkMode = Walk},
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraStartFleeVII},
			Goto {NpcId = 0, X = 462, Y = 56, WalkMode = Walk},
			Goto {NpcId = 5428, X = 461, Y = 55, WalkMode = Walk},
		},
		[60] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraStartFleeII},
			CutSceneSay {Tag = "cs10LenaP104_001" , NpcId = 5428, String = "Frostfall! Wir sind da! Dort müssen wir hinauf!"},
		},		
		[110] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraStartFleeIII},
			CutSceneSay {Tag = "cs10LenaP104_002" , NpcId = 5428, String = "Doch zuerst müssen wir die Winterwehr erreichen, die Grenzfeste von Tirganach."},
		},	
		[160] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraStartFleeIV},			
			CutSceneSay {Tag = "cs10LenaP104_003" , NpcId = 5428, String = "Aber davor liegt der Blutsumpf mit seinen Torgtrollen und Waldschraten! Noch sind wir Urgath nicht los."},
		},	
		[220] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraStartFleeVIII},			
			CutSceneSay {Tag = "cs10LenaP104_004" , NpcId = 5428, String = "Die Flüchtlinge werden bald ankommen. Wir müssen ihnen den Weg bis zur Grenzfeste sichern, der Sumpf hier ist tödlich!"},
		},					
		[300] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraStartFleeVI},			
			CutSceneSay {Tag = "cs10LenaP104_005" , NpcId = 5428, String = "Unweit im Norden liegt das Dorf der Gultark-Orks, dort befindet sich auch ein Runenmonument."},
		},		
		[350] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs10LenaP104_006" , NpcId = 5428, String = "Seit dem Durchmarsch der Winterwacht sind die Gultarks geschwächt. Wenn wir ihr Lager in Besitz nehmen können, verliert der Sumpf für uns seinen Schrecken!"},
		},						
		[430] = 
		{
			WaitForEndOfSpeech,
			EnableDialog {NpcId = 5428},			
		},
	},
}
