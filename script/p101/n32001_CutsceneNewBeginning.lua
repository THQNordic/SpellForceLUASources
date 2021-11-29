-----------------------------------------------------------------------
--
--	The New Beginning
--
-----------------------------------------------------------------------

-- anfangstotale
CameraNewBeginningI = [[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p101\\n5537_CameraNewBeginningI.lua")
   	Camera:ScriptStart()
]]

-- gruppe halbnah
CameraNewBeginningII = [[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,110,1,"script\\p101\\n5537_CameraNewBeginningII.lua")
   	Camera:ScriptStart()
]]

-- anfangstotale 2
CameraNewBeginningIII = [[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p101\\n5537_CameraNewBeginningIII.lua")
   	Camera:ScriptStart()
]]

-- grim halbnah von hinten
CameraNewBeginningIV = [[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5537_CameraNewBeginningIV.lua")
   	Camera:ScriptStart()
]]

-- grim und lena aus sueden
CameraNewBeginningV = [[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5537_CameraNewBeginningV.lua")
   	Camera:ScriptStart()
]]

-- avatar nah
CameraNewBeginningVI = [[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5537_CameraNewBeginningVI.lua")
   	Camera:ScriptStart()
]]

-- grim nah
CameraNewBeginningVII = [[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5537_CameraNewBeginningVII.lua")
   	Camera:ScriptStart()
]]

-- monument nah
CameraNewBeginningVIII = [[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5537_CameraNewBeginningVIII.lua")
   	Camera:ScriptStart()
]]

-- zwischenfahrt grim und lena kommen an
CameraNewBeginningIX = [[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5537_CameraNewBeginningIX.lua")
   	Camera:ScriptStart()
]]

-- grim gegenschuss
CameraNewBeginningX = [[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5537_CameraNewBeginningX.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "TheNewBeginning", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- IsGlobalFlagTrue {Name = "Stopper"},
		-- startet direkt zu beginn der map.
		Negated (IsItemFlagTrue {Name = "PlayerHasItemRune01", UpdateInterval = 20}), -- nur wichtig fuer testphase, stoert aber auch nicht
		Negated (IsItemFlagTrue {Name = "PlayerHasItemRune02", UpdateInterval = 20}), -- nur wichtig fuer testphase, stoert aber auch nicht	
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetEffect {Effect = "SimpleInvis", NpcId = 0, Length = 3000},	-- avatar unsichtbar zu beginn.
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = CameraNewBeginningIII},		
		},
		[20] =
		{
			SetEffect {Effect = "HeroMonumentActive", NpcId = 5535, Length = 10000}, -- heronmonument effect.			
		},
		[50] =
		{
			ExecuteCameraScript{Script = CameraNewBeginningVIII},
		},
		[80] = 
		{
			ExecuteCameraScript{Script = CameraNewBeginningI},			
			SetEffect {Effect = "MaterializeInMonument", NpcId = 0, Length = 5000},	-- avatar materialize.
			Goto{X = 38, Y = 62, NpcId = 5536, Range = 0, WalkMode = Walk}, --grim
			Goto{X = 36, Y = 62, NpcId = 5537, Range = 0, WalkMode = Walk}, --lena			
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5536, Target = 0}, -- grim.
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
		},
		[110] = 
		{
			ExecuteCameraScript{Script = CameraNewBeginningIX},				
			StopEffect {NpcId = 5535}, -- effect on monument off.
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5536, Target = 0}, -- grim.
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
		},
		[190] = 
		{ 
			ExecuteCameraScript{Script = CameraNewBeginningVII},						
			StopEffect {NpcId = 0},	-- effect on avatar off.
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5536, Target = 0}, -- grim.
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
			CutSceneSay {Tag = "cs01GrimP101_001" , NpcId = 5536, String = "Endlich!"},
		},
		[210] = 
		{
			ExecuteCameraScript{Script = CameraNewBeginningIV},					
			WaitForEndOfSpeech,	
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5536, Target = 0}, -- grim.
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
			CutSceneSay {Tag = "cs01MaincharP101_001" ,NpcId = 0, String = "Was ist geschehen? Wo bin ich hier?"},			
		},
		[250] = 
		{
			WaitForEndOfSpeech,			
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
			CutSceneSay {Tag = "cs01GrimP101_002" ,NpcId = 5536, String = "Willkommen in Mirraw Thur ... ein gottverlassener Sumpf irgendwo im schwarzen Herzen von Urgath. Wahrlich kein schöner Ort ... aber Du wirst bald Gelegenheit haben, das zu ändern!"},			
		},
		[290] =
		{
			LookAtDirection{NpcId = 5536, Direction = East}, -- grim.		
		},
		[310] = 
		{
			WaitForEndOfSpeech,	
			Goto {X = 37 , Y = 59, NpcId = 0, Range = 0, WalkMode = Walk},	-- avatar geht auf sie zu.						
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
			CutSceneSay {Tag = "cs01MaincharP101_002" ,NpcId = 0, String = "Was wünscht Ihr?"},			
		},	
		[320] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraNewBeginningVII},				
			LookAtFigure{NpcId = 5536, Target = 0}, -- grim.			
			CutSceneSay {Tag = "cs01GrimP101_003" ,NpcId = 5536, String = "Das wirst du bald erfahren ... aber nicht hier! Zu viel dunkles Volk in der Nähe."},			
		},				
		[340] =
		{
			Goto {NpcId = 5536, X = 39, Y = 62, WalkMode = Walk}, -- Grim		
		},	
		[370] = 
		{
			LookAtDirection{NpcId = 5536, Direction = East}, -- grim.
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
		},
		[390] = 
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraNewBeginningVI},	
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
			CutSceneSay {Tag = "cs01MainCharP101_003" ,NpcId = 0, String = "Die Rune unterwirft mich Eurem Willen. Befehlt und ich gehorche!"},			
		},		
		[430] = 
		{
			WaitForEndOfSpeech,				
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtDirection{NpcId = 5536, Direction = East}, -- grim.
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
			CutSceneSay {Tag = "cs01GrimP101_004" ,NpcId = 5536, String = "Hm, verlockend ..."},			
		},			
		[460] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraNewBeginningV},						
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5537, Target = 5536}, -- lena.
			Goto {NpcId = 5537, X = 37, Y = 62, WalkMode = Walk}, -- lena
			CutSceneSay {Tag = "cs01LenaP101_001" ,NpcId = 5537, String = "Grim, gib die Rune heraus! So war die Abmachung!"},			
		},		
		[490] = 
		{
			WaitForEndOfSpeech,				
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5537, Target = 5536}, -- lena.
			CutSceneSay {Tag = "cs01GrimP101_005" ,NpcId = 5536, String = "Aber ein gehorsamer Kämpfer dient unserer Sache mehr!"},			
		},
		[520] = 
		{
			WaitForEndOfSpeech,				
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5537, Target = 5536}, -- lena.
			CutSceneSay {Tag = "cs01LenaP101_002" ,NpcId = 5537, String = "Gib sie heraus!"},			
		},	
		[540] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraNewBeginningVII},					
			LookAtFigure{NpcId = 0, Target = 5536}, -- avatar.	
			LookAtFigure{NpcId = 5536, Target = 0}, -- grim.
			LookAtFigure{NpcId = 5537, Target = 5536}, -- lena.
			CutSceneSay {Tag = "cs01GrimP101_006" ,NpcId = 5536, String = "Also gut... hier, Du bist frei!"},			
		},		
		[570] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraNewBeginningIV},								
			LookAtFigure{NpcId = 0, Target = 5537}, -- avatar.	
			LookAtFigure{NpcId = 5536, Target = 0}, -- grim.
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
			CutSceneSay {Tag = "cs01LenaP101_003" ,NpcId = 5537, String = "Willkommen, Freund. Ich bin Lena, das ist Grim."},			
		},	
		[610] = 
		{
			WaitForEndOfSpeech,				
			LookAtFigure{NpcId = 0, Target = 5537}, -- avatar.	
			LookAtFigure{NpcId = 5536, Target = 0}, -- grim.
			LookAtFigure{NpcId = 5537, Target = 0}, -- lena.
			CutSceneSay {Tag = "cs01GrimP101_007" ,NpcId = 5536, String = "Genug jetzt! Folge uns, im Lager der Flüchtlinge können wir reden."},			
		},		
		[660] = 
		{
			WaitForEndOfSpeech,
			--SetGlobalFlagTrue {Name = "P101GrimFollowAvatar"},
			SetGlobalFlagTrue {Name = "P101GrimLäuftVoraus"},
			SetGlobalFlagTrue {Name = "P101LeaFolgtAvatar"},
			QuestBegin {QuestId = 568, SubQuestActivate = FALSE}, --Q Der Widerstand
			QuestBegin {QuestId = 713, SubQuestActivate = FALSE}, --SubQ Folge Grim und Lena zu den Flüchtlingen
			SetGlobalFlagTrue{Name = "P101RebirthFollowLea1An"},
			SetGlobalFlagTrue{Name = "P101RebirthFollowGrimAn"},
		},
	},
}
