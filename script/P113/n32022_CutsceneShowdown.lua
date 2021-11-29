-----------------------------------------------------------------------
--
--	Showdown Fial Darg
--
-----------------------------------------------------------------------

-- totale
CameraShowdownI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p113\\n6626_CameraShowdownI.lua")
   	Camera:ScriptStart()
]]

-- lena halbnah, kommt zu cenwen
CameraShowdownII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p113\\n6626_CameraShowdownII.lua")
   	Camera:ScriptStart()
]]

-- fial subjektive kamera
CameraShowdownIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p113\\n6626_CameraShowdownIII.lua")
   	Camera:ScriptStart()
]]

-- fial subjektive kamera 2
CameraShowdownIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p113\\n6626_CameraShowdownIV.lua")
   	Camera:ScriptStart()
]]

-- cenwen nah
CameraShowdownV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p113\\n6626_CameraShowdownV.lua")
   	Camera:ScriptStart()
]]

-- fial greift an - schneller schwenk um lena
CameraShowdownVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p113\\n6626_CameraShowdownVI.lua")
   	Camera:ScriptStart()
]]

-- avatar kommt angerannt
CameraShowdownVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p113\\n6626_CameraShowdownVII.lua")
   	Camera:ScriptStart()
]]

-- avatar erste cam
CameraShowdownVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p113\\n6626_CameraShowdownVIII.lua")
   	Camera:ScriptStart()
]]

-- fial nah
CameraShowdownIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p113\\n6626_CameraShowdownIX.lua")
   	Camera:ScriptStart()
]]

-- totale ende
CameraShowdownX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p113\\n6626_CameraShowdownX.lua")
   	Camera:ScriptStart()
]]

-- subjektive kamera fial zusammen
CameraShowdownXI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p113\\n6626_CameraShowdownXI.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Showdown", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- IsGlobalFlagTrue {Name = "Stopper"},
		FigureInRange{X = 170, Y = 205, NpcId = 0 , Range = 5},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetGlobalFlagFalse{Name = "P113LeaFolgtAvatar"}, --Lena folgt nicht mehr dem Avatar
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 6673},	-- cenwen
		SetGlobalFlagTrue {Name = "CutsceneInitShowdown"}, -- lena despawn, killable lena spawn usw.
		SetGlobalFlagTrue {Name = "CutAnfangGelaufen"},	
		RemoveDialog {NpcId = 6673},			
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:
			ExecuteCameraScript{Script = CameraShowdownVIII},		
		},
		[10] = 
		{
			SetEffect{Effect = "CastFireSilent", X = 143, Y = 233, Length = 0 , TargetType = World }, --feuerwände um cenwen
			SetEffect{Effect = "CastFireSilent", X = 143, Y = 235, Length = 0 , TargetType = World },
			SetEffect{Effect = "CastFireSilent", X = 145, Y = 235, Length = 0 , TargetType = World },
			SetEffect{Effect = "CastFireSilent", X = 145, Y = 233, Length = 0 , TargetType = World },
		},
		[50] = 
		{
			SetNoFightFlagTrue {NpcId = 7211}, -- killable lena
			ExecuteCameraScript{Script = CameraShowdownII},	
			Goto{X = 147, Y = 231, NpcId = 7211, Range = 0, WalkMode = Run}, --lena auf cenwen zu
			LookAtFigure {NpcId = 6673, Target = 7211},		
		},
		[80] =
		{
			ExecuteCameraScript{Script = CameraShowdownXI},		
			SetGlobalFlagTrue {Name = "FialRespawn"},				
			Goto{X = 148, Y = 217, NpcId = 0, Range = 0, WalkMode = Run}, --spieler auf seine startposition				
			CutSceneSay {Tag = "cs15LenaP113_001" , NpcId = 7211, String = "Cenwen! Herrin!"}, -- lena
		},
		--[120] =
		--{
			--WaitForEndOfSpeech,
			--ExecuteCameraScript{Script = CameraShowdownV},	
			--SetGlobalFlagTrue {Name = "FialRespawn"},	
			--CutSceneSay {Tag = "cs15CenwenP113_001" , NpcId = 6673, String = "Bleibt zurück! Der Dunkle ist hier!"}, -- cenwen
		--},	
		[150] =
		{
			WaitForEndOfSpeech,
			--ExecuteCameraScript{Script = CameraShowdownIV},	
			SetNoFightFlagTrue {NpcId = 6626},	-- fial			
			CutSceneSay {Tag = "cs15LenaP113_002" , NpcId = 7211, String = "Schnell, Ihr müsst mit uns kommen!"},
		},			
		[180] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraShowdownVI},				
			CutSceneSay {Tag = "cs15MaincharP113_001" , NpcId = 0, String = "Lena!"},
			Goto {NpcId = 6626, X = 148, Y = 230, WalkMode = Walk},
		},	
		[230] =
		{
			CGdsFigureSetHealth:new(7211, 1), -- lena wird schwach
			AttackTarget {NpcId = 6626, Target = 7211, FriendlyFire = TRUE}, -- fial greift lena an
			LookAtFigure {NpcId = 7211, Target = 6626},
			LookAtFigure {NpcId = 0, Target = 6626},			
		},		
		[290] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraShowdownIX},		
			Goto {NpcId = 6626, X = 148, Y = 224, WalkMode = Walk},	-- fial darg	
			CutSceneSay {Tag = "cs15FialDargP113_001" , NpcId = 6626, String = "Ha! Wenn du willst, dass etwas getan wird, dann tu es selbst!"},
		},			
		[320] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraShowdownVII},					
			CutSceneSay {Tag = "cs15MainCharP113_002" , NpcId = 0, String = "Dafür wirst du zahlen, Monstrum!"},
		},			
		[360] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraShowdownIX},				
			CutSceneSay {Tag = "cs15FialDargP113_002" , NpcId = 6626, String = "Du solltest mir dankbar sein, dass du durch meine Hand sterben darfst, Mensch! Wenn meine Herren erst wieder diese Welt regieren, bekommt Leid eine ganz neue Bedeutung!"},
		},											
		[430] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraShowdownX},				
			CutSceneSay {Tag = "cs15FialDargP113_003" , NpcId = 6626, String = "Ich hätte mir ja mehr Zeit für dich genommen, aber du verstehst ... ich bin in Eile, was soll ich machen?"},
		},			
		[480] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs15MaincharP113_003" , NpcId = 0, String = "Sterben!"},
		},			
		[530] = 
		{ 
			SetGlobalFlagTrue {Name = "P113EndkampfBeginnt"}, --Endkampf beginnt
			SetGlobalFlagTrue {Name = "P113LenaIstTot"}, --Globales Flag zur ABfrage ob Lena Tot ist
			--SetGlobalFlagTrue {Name = "P113DialogCenwenAn"}, --Cenwen bekommt Dialog
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 6626},	
			SetNoFightFlagFalse {NpcId = 6673},	
			--EnableDialog {NpcId = 6673},
			ChangeRace{Race = 190, NpcId = 6626}, -- Fial Darg wird Feuerarmee-Darkelf-böse								
		},
	},
}
