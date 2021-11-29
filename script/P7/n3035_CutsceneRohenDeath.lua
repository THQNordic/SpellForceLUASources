-----------------------------------------------------------------------
--
--	Rohen Death
--
-----------------------------------------------------------------------

-- totale
CameraRohenDeathI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,100,1,"script\\p7\\n3035_CameraRohenDeathI.lua")
   	Camera:ScriptStart()
]]

-- portal und rohen
CameraRohenDeathII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p7\\n3035_CameraRohenDeathII.lua")
   	Camera:ScriptStart()
]]

-- rohen halbnah
CameraRohenDeathIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p7\\n3035_CameraRohenDeathIII.lua")
   	Camera:ScriptStart()
]]

-- avatar halbnah
CameraRohenDeathIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p7\\n3035_CameraRohenDeathIV.lua")
   	Camera:ScriptStart()
]]

-- rohen nah
CameraRohenDeathV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p7\\n3035_CameraRohenDeathV.lua")
   	Camera:ScriptStart()
]]

-- avatar nah
CameraRohenDeathVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p7\\n3035_CameraRohenDeathVI.lua")
   	Camera:ScriptStart()
]]

-- raith zoom
CameraRohenDeathVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p7\\n3035_CameraRohenDeathVII.lua")
   	Camera:ScriptStart()
]]

-- gruppe fahrt
CameraRohenDeathVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p7\\n3035_CameraRohenDeathVIII.lua")
   	Camera:ScriptStart()
]]

--  gottstein
CameraRohenDeathIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p7\\n3035_CameraRohenDeathIX.lua")
   	Camera:ScriptStart()
]]

--  raith nah
CameraRohenDeathX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p7\\n3035_CameraRohenDeathX.lua")
   	Camera:ScriptStart()
]]

--  raith kurve zu rohen
CameraRohenDeathXI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p7\\n3035_CameraRohenDeathXI.lua")
   	Camera:ScriptStart()
]]

--  flache totale
CameraRohenDeathXII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p7\\n3035_CameraRohenDeathXII.lua")
   	Camera:ScriptStart()
]]

--  verrueckt nach hinten von raith aus
CameraRohenDeathXIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p7\\n3035_CameraRohenDeathXIII.lua")
   	Camera:ScriptStart()
]]

-- fahrt an rohen hoch
CameraRohenDeathXIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p7\\n3035_CameraRohenDeathXIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Rohen Death", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet zu beginn der map!!! Aber nicht bei Reise 4
		Negated (IsGlobalState{Name = "Plot" , State = "JourneyFour", UpdateInterval = 1}),
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetEffect {Effect = "SimpleInvis", NpcId = 4185, Length = 0, TargetType = Figure},	-- raith ist zu beginn unsichtbar.	
		SetNoFightFlagTrue {NpcId = 4185},	-- Raith	
		SetNoFightFlagTrue {NpcId = 4191},	-- Rohen			
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:	
			ExecuteCameraScript{Script = CameraRohenDeathII},
			Goto {NpcId = 0, X = 53, Y = 40, WalkMode = Run},		
			Goto {NpcId = 4191, X = 44, Y = 40, WalkMode = Walk},						
			CutSceneSay {Tag = "cutmaincharIgM001", NpcId = 0, String = "Meister Rohen! Wartet! Das ist eine Falle!"},		
		},
		[40] = 
		{
			WaitForEndOfSpeech,	
			Goto {NpcId = 4191, X = 48, Y = 40, WalkMode = Walk},				
			CutSceneSay {Tag = "cutrohenIgM001",NpcId = 4191, String = "Eine Falle? Wovon sprecht Ihr?"},
		},
		[80] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraRohenDeathIV},				
			CutSceneSay {Tag = "cutmaincharIgM002", NpcId = 0, String = "Dieser Weg hier führt direkt in einen Hinterhalt! Ein Magier des Zirkels ... er will Euch vernichten!"},
	 	},
		[140] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraRohenDeathIII},				
			CutSceneSay {Tag = "cutrohenIgM002",NpcId = 4191, String = "Ein Zirkelmagier...? So hat mich mein Schicksal am Ende also doch eingeholt..."},
		},
		[200] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraRohenDeathVI},						
			CutSceneSay {Tag = "cutmaincharIgM003",NpcId = 0, String = "Ihr kennt ihn?"},
		},
		[220] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraRohenDeathV},
			--ExecuteCameraScript{Script = CameraRohenDeathIX},										
			CutSceneSay {Tag = "cutrohenIgM003",NpcId = 4191, String = "Allerdings! Dieser... Zirkelmagier will die Gottsteine in seine Gewalt bringen. Sollte ihm das gelingen, wird alles Leben, so wie Ihr es kennt, für immer ausgelöscht!"},
		},
		[310] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraRohenDeathVI},							
			CutSceneSay {Tag = "cutmaincharIgM004", NpcId = 0, String = "Aber wozu?"},
		},
		[330] = 
		{
			--
			WaitForEndOfSpeech,	
			SetGlobalFlagTrue {Name = "RaithSpawns"},
			ExecuteCameraScript{Script = CameraRohenDeathV},							
			CutSceneSay {Tag = "cutrohenIgM004",NpcId = 4191, String = "Sein Ziel ist es, ein Portal zurück in die Zeit zu öffnen! Er glaubt, auf diese Weise den Lauf der Geschichte ändern und die Macht der Konvokation erringen zu können! Doch er irrt sich! Er kann diese Macht nicht beherrschen. Niemand kann das! Es war eine Täuschung, eine List böser Götter!!"},
		},
		[380] =
		{
			ExecuteCameraScript{Script = CameraRohenDeathVI},
			--SetEffect {Effect = "SimpleInvis", NpcId = 4185, Length = 0, TargetType = Figure},	-- raith ist zu beginn unsichtbar.	
			--SetNoFightFlagTrue {NpcId = 4185},	-- Raith							
		},
		[440] =
		{
			ExecuteCameraScript{Script = CameraRohenDeathV},			
		},		
		[510] = 
		{ 
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraRohenDeathVI},						
			CutSceneSay {Tag = "cutmaincharIgM005", NpcId = 0, String = "Hier, in dieser Schatulle befinden sich die Invasionspläne für seine Armeen! Wir haben sie erbeutet, können sie aber nicht öffnen."},
		},		
		[600] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraRohenDeathV},							
			CutSceneSay {Tag = "cutrohenIgM005", NpcId = 4191, String = "Eine Schatulle? Sollte..."},
		},
		[630] = 
		{
			ExecuteCameraScript{Script = CameraRohenDeathXII},			
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cutrohenIgM006", NpcId = 4191, String = "Hört mir zu, Runenkrieger - uns bleibt nicht viel Zeit! Findet Hokans Vermächtnis! Nur so könnt Ihr die Zerstörung der Welt verhindern!"},
		},
		[710] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraRohenDeathV},				
			CutSceneSay {Tag = "cutrohenIgM007", NpcId = 4191, String = "Sucht danach... und dem Artefakt, das mächtig genug ist, einen Zirkelmagier aufzuhalten!"},
		},
		[760] = 
		{
			WaitForEndOfSpeech,				
			ExecuteCameraScript{Script = CameraRohenDeathVI},				
			CutSceneSay {Tag = "cutmaincharIgM006", NpcId = 0, String = "Ich verstehe nicht...! Was ist mit Euch?"},
		},
		[800] = 
		{
			--
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraRohenDeathV},							
			CutSceneSay {Tag = "cutrohenIgM008", NpcId = 4191, String = "Ich habe getan, was in meiner Macht stand! Hier, nehmt dieses Buch! Es enthält die Wahrheit über die Konvokation und ihre verheerenden Folgen! Eines Tages mag es vielleicht über das Schicksal der Welt entscheiden! Und jetzt gebt mir die Schatulle..."},
			TransferItem{GiveItem = 3461 , Amount = 1 , Flag = Give},		
		},
		[840] =
		{
			ExecuteCameraScript{Script = CameraRohenDeathVI},			
		},
		[870] =
		{
			ExecuteCameraScript{Script = CameraRohenDeathV},			
		},			
		[900] = 
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraRohenDeathVIII},	
			--ExecuteCameraScript{Script = CameraRohenDeathVII},	-- neue cam				
			CutSceneSay {Tag = "cutmaincharIgM007", NpcId = 0, String = "Sie ist leer! Aber ..."},
			TransferItem{TakeItem = 3197 , Amount = 1 , Flag = Take},
			
			CGdsFigureSetHealth:new(4191, 1),				
		},
		[920] =
		{
			-- Blitz friert beide ein, Dunkler erscheint
			WaitForEndOfSpeech,
			SetEffect   {Effect = "IcePack", NpcId = 4191, Length = 50000}, 
			SetFreezeFlagTrue {NpcId = 4191},		
			SetEffect   {Effect = "IcePack", NpcId = 0, Length = 50000}, 
			SetFreezeFlagTrue {NpcId = 0},
					
			CGdsFigureSetHealth:new(4191, 1),	
			
			LookAtFigure {NpcId = 4185, Target = 4191},
					
		},
		[930] =
		{
			ExecuteCameraScript{Script = CameraRohenDeathXI},				
			StopEffect {NpcId = 4185},
			SetEffect   {Effect = "Materialize", NpcId = 4185, Length = 0}, 		
		},
		[960] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraRohenDeathXIV},					
			StopEffect {NpcId = 4185},	
			CutSceneSay {Tag = "cutdunklerIgM001", NpcId = 4185, String = "So sehen wir uns also wieder, alter Mann! Habt Ihr wirklich gedacht, Ihr könntet mich aufhalten? Nun zahlt Ihr den Preis für Eure törichten Bemühungen! Eure Reise endet hier... für Euch gibt es keine Zukunft!"},
		},
		[1020] =
		{
			ExecuteCameraScript{Script = CameraRohenDeathX},				
		},
		[1040] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraRohenDeathVIII},				
			-- Tötet Rohen	
			StopEffect {NpcId = 4191},	
			SetFreezeFlagFalse {NpcId = 4191},
			-- safe, da innerhalb cutscene
			-- AttackTarget {NpcId = 4185, Target = 4191, FriendlyFire = TRUE},	-- angriff mit schwert
			CastSpell {Spell = 1719, X = 0, Y = 0, Target = 4191, TargetType = Figure, NpcId = 4185},	
		},
		[1070] =
		{
			ExecuteCameraScript{Script = CameraRohenDeathXIII},	
			Goto {NpcId = 4185, X = 51, Y = 41, WalkMode = Walk},
			StopEffect {NpcId = 4191},				
		},
		[1100] = 
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cutdunklerIgM002", NpcId = 4185, String = "Und Ihr, Runenkrieger? Ihr habt mir trefflich gedient! Kehrt nun zu Eurem Orden zurück und sagt ihnen, dass die Zeit des Erwachens vorbei ist! Die Zeit des Krieges hat begonnen!"},
		},
		[1130] =
		{
			ExecuteCameraScript{Script = CameraRohenDeathX},			
		},
		[1200] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraRohenDeathVIII},					
			SetEffect {Effect = "DeMaterialize", NpcId = 4185, Length = 0},
			QuestBegin{QuestId = 110},
			QuestBegin{QuestId = 111},

		},  
		[1250] =
		{
			WaitForEndOfSpeech,	
			Vanish {NpcId = 4185},
			Vanish {NpcId = 4191},
			SetFreezeFlagFalse {NpcId = 0},	
			StopEffect {NpcId = 0},	
								
		},
	},
}

