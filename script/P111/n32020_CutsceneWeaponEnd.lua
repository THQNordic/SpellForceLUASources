-----------------------------------------------------------------------
--
--	WeaponEnd
--
-----------------------------------------------------------------------

-- schwert uber avatar
CameraWeaponEndI =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,40,1,"script\\p111\\n6991_CameraWeaponEndI.lua")
   	Camera:ScriptStart()
]]

-- schwert ueber schulter daemon
CameraWeaponEndII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,40,1,"script\\p111\\n6991_CameraWeaponEndII.lua")
   	Camera:ScriptStart()
]]

-- daemon halbnah
CameraWeaponEndIII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,40,1,"script\\p111\\n6991_CameraWeaponEndIII.lua")
   	Camera:ScriptStart()
]]

-- avatar halbnah
CameraWeaponEndIV =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,40,1,"script\\p111\\n6991_CameraWeaponEndIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "WeaponEnd", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- startet sobald der spieler sich dem schwert naehert.
		IsGlobalFlagTrue {Name = "SpawnCampsZerstoertP111", UpdateInterval = 10}, 
		FigureInRange {NpcId = 0, X = 289, Y = 49, Range = 15, UpdateInterval = 10},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},
	},
	TimedActions =
	{
		[0] =
		{
			Goto {NpcId = 0, X = 290, Y = 49, WalkMode = Walk},
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraWeaponEndI},	
			LookAtDirection {NpcId = 6991, Direction = East},			
		},	
		[60] =
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cs13FeuerengelP110_001" , NpcId = 6991, String = "Es ist vollbracht! Das Schwert ist wieder im Zaum, die Schatten sind gebannt!"}, -- nachtengel			
		},
		[110] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWeaponEndII},				
			CutSceneSay {Tag = "cs13MainCharP110_001" , NpcId = 0, String = "Dennoch ist das Schwert hier nicht sicher. Ich werde es zu unserem Herrn bringen."}, -- player				
		},
		[160] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWeaponEndIII},				
			CutSceneSay {Tag = "cs13FeuerengelP110_002" , NpcId = 6991, String = "Was? Niemals! Nie würde der Herr mir das Schwert entreißen! Unmöglich!"}, -- nachtengel
		},
		[210] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWeaponEndIV},				
			CutSceneSay {Tag = "cs13MainCharP110_002" , NpcId = 0, String = "Sei es drum, ich nehme es!"}, -- player
		},
		[240] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWeaponEndIII},				
			CutSceneSay {Tag = "cs13FeuerengelP110_003" , NpcId = 6991, String = "Ihr habt mich getäuscht! Nicht Diener, Feinde meines Herrn seid ihr!"}, -- nachtengel
		},
		[280] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraWeaponEndII},				
			CutSceneSay {Tag = "cs13FeuerengelP110_004" , NpcId = 6991, String = "Und ich gab Euch das Wissen! Nun, dann nehmt es mit ins Grab, Betrüger."}, -- nachtengel
		},
		[350] =
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetGlobalFlagTrue { Name = "EndCutSceneEndP111"},
		},																								
	},
}





