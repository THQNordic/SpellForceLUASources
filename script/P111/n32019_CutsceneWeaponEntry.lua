-----------------------------------------------------------------------
--
--	WeaponEntry
--
-----------------------------------------------------------------------

-- totale portal
CameraWeaponEntryI =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p111\\n6991_CameraWeaponEntryI.lua")
   	Camera:ScriptStart()
]]

-- fahrt ueber das land
CameraWeaponEntryII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p111\\n6991_CameraWeaponEntryII.lua")
   	Camera:ScriptStart()
]]

-- fahrt ueber das land
CameraWeaponEntryIII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p111\\n6991_CameraWeaponEntryIII.lua")
   	Camera:ScriptStart()
]]

-- schatten bergspitze rundfahrt
CameraWeaponEntryIV =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p111\\n6991_CameraWeaponEntryIV.lua")
   	Camera:ScriptStart()
]]

-- das schwert mit bannfeuern
CameraWeaponEntryV =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p111\\n6991_CameraWeaponEntryV.lua")
   	Camera:ScriptStart()
]]

-- schattentrupp
CameraWeaponEntryVI =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p111\\n6991_CameraWeaponEntryVI.lua")
   	Camera:ScriptStart()
]]

-- lena und avatar, fluesternd
CameraWeaponEntryVII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p111\\n6991_CameraWeaponEntryVII.lua")
   	Camera:ScriptStart()
]]

-- zoom auf feuerengel
CameraWeaponEntryVIII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p111\\n6991_CameraWeaponEntryVIII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "WeaponEntry", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- startet direkt zu beginn der map.
		-- IsGlobalFlagTrue {Name = "Stopper"},	
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 6997}, -- lena
		Goto {NpcId = 6997, X = 255, Y = 304, WalkMode = Walk},
		Goto {NpcId = 0,    X = 253, Y = 304, WalkMode = Walk},
		LookAtDirection {NpcId = 6997, Direction = South},
		LookAtDirection {NpcId = 0,    Direction = South},
		SetGlobalFlagTrue {Name = "CutsceneInitWeaponEntry"},				
	},
	TimedActions =
	{
		[0] =
		{
			ExecuteCameraScript{Script = CameraWeaponEntryI},		
		},
		[30] =
		{
			LookAtDirection {NpcId = 7131, Direction = East},
		},
		[60] =
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cs12FeuerengelP110_001" , NpcId = 7131, String = "Was ist das? Sterbliche? Hier?"}, -- feuerengel			
		},
		[110] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWeaponEntryII},				
			CutSceneSay {Tag = "cs12FeuerengelP110_002" , NpcId = 7131, String = "Hat mein Herr euch geschickt? Hört er endlich auf meine Rufe?"}, -- feuerengel				
		},
		[160] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWeaponEntryIII},				
			CutSceneSay {Tag = "cs12LenaP110_001" , NpcId = 6997, String = "Diese Stimme ..."}, -- lena
		},
		[190] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs12MainCharP110_001" , NpcId = 0, String = "... als spräche er in meinem Kopf."}, -- avatar
		},
		[240] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraWeaponEntryIV},	
			CutSceneSay {Tag = "cs12FeuerengelP110_003" , NpcId = 7131, String = "Die Schatten sind frei!"}, -- feuerengel
		},
		[280] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraWeaponEntryV},	
			CutSceneSay {Tag = "cs12FeuerengelP110_004" , NpcId = 7131, String = "Der Bann, der das Schwert im Zaume hält, bricht!"}, -- feuerengel
		},
		[300] =
		{
			Goto {NpcId = 6998, X = 289, Y = 402, WalkMode = Run}, -- schatten laufen los
			Goto {NpcId = 6999, X = 289, Y = 403, WalkMode = Run},
			Goto {NpcId = 7000, X = 290, Y = 406, WalkMode = Run},
			Goto {NpcId = 7001, X = 290, Y = 404, WalkMode = Run},	
		},	
		[330] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraWeaponEntryVI},				
			CutSceneSay {Tag = "cs12FeuerengelP110_005" , NpcId = 7131, String = "Und durch die Lücken strömen sie hervor!"}, -- feuerengel		
		},
		[360] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cs12FeuerengelP110_006" , NpcId = 7131, String = "Die Bannfeuer erlöschen! Sie sind überall!"}, -- feuerengel			
		},
		[390] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraWeaponEntryVII},
			CutSceneSay {Tag = "cs12LenaP110_002" , NpcId = 6997, String = "Es sind die Schatten, die aus dem Schwert fliehen! Er verliert die Macht über sie!"}, -- lena (fluestert)
		},	
		[440] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cs12MainCharP110_002" , NpcId = 0, String = "Wir sollten das Spiel mitspielen, noch weiß er nichts vom Fall der Feuerstadt."}, -- player (fluestert)
		},	
		[490] =
		{
			WaitForEndOfSpeech,		
			Goto {NpcId = 0, X = 253, Y = 302, WalkMode = Walk},
			CutSceneSay {Tag = "cs12MainCharP110_003" , NpcId = 0, String = "Höre mich, Wächter! Der dunkle Herr sendet uns dir zu Hilfe!"}, -- player
		},	
		[530] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraWeaponEntryVIII},				
			CutSceneSay {Tag = "cs12FeuerengelP110_007" , NpcId = 7131, String = "Endlich! Rasch! Entfaltet Eure Runenmacht! Treibt sie zurück!"}, -- feuerengel
		},	
		[570] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs12FeuerengelP110_008" , NpcId = 7131, String = "Ihr müsst die Bannfeuer neu entzünden! So werden sie in das Schwert zurückgetrieben."}, -- feuerengel
		},	
		[630] =
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 6997},	
			SetGlobalFlagTrue { Name = "EndCutsceneEntryP111"},		
		},																								
	},
}





