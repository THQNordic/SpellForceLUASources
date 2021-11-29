-----------------------------------------------------------------------
--
--	P212 Entry-Cutscene The Gorge
--
-----------------------------------------------------------------------


n32560_CameraEntry01 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\P212\\n32560_CameraEntry01.lua")
   	Camera:ScriptStart()
]]

n32560_CameraEntry02 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P212\\n32560_CameraEntry02.lua")
   	Camera:ScriptStart()
]]


n32560_CameraEntry03 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P212\\n32560_CameraEntry03.lua")
   	Camera:ScriptStart()
]]


n32560_CameraEntry04 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P212\\n32560_CameraEntry04.lua")
   	Camera:ScriptStart()
]]

n32560_CameraEntry05 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P212\\n32560_CameraEntry05.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P212_CutsceneEntry", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_nP212_ShowEntryCutscene"},
		--IsGlobalFlagTrue {Name ="ThisFlagWillNeverGetTrue"},
		
	},
	BeginActions =
	{
		SetGlobalFlagFalse {Name = "g_nP212_ShowEntryCutscene"},
		
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32560_CameraEntry01},
			Goto {NpcId = 10727, X = 266, Y = 115, WalkMode = Run, GotoMode = GotoForced}, -- Miniforger läuft vor Brücke
		},
		
		[10] =
		{
			LookAtDirection{NpcId = 10722, Direction = North}, -- Uram der Rote schaut nach Norden
		},
		
		
		[55] =
		{
			Goto {NpcId = 10727, X = 263, Y = 94, WalkMode = Run, GotoMode = GotoForced}, -- Miniforger läuft Brücke
			--SetEffect{TargetType = Figure, NpcId = 10727, Length = 100, Effect = "Lightning" },
		},
		
		[140] =
		{
			Goto {NpcId = 10727, X = 263, Y = 64, WalkMode = Run, GotoMode = GotoForced}, -- Miniforger läuft zu Uram
			--SetEffect{TargetType = Figure, NpcId = 10727, Length = 100, Effect = "Lightning" },
			SetGlobalFlagTrue{Name = "P212Spawnpoint02On"},
			SetGlobalFlagTrue{Name = "P212Spawnpoint04On"},
			SetGlobalFlagTrue{Name = "P212Spawnpoint05On"},
			SetGlobalFlagTrue{Name = "P212Spawnpoint06On"},
		},
		
		[300] =
		{
			CutSceneSay { Tag = "csa246soulforger_001" , NpcId = 10727, String = "Runenkrieger kommen durch den Schlund! Was befehlt Ihr, Meister?"}, -- Miniforger
		},
		
		[380] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay { Tag = "csa246uram_002" , NpcId = 10722, String = "Es ist der Wille unsers Herrn Hokan Ashir, dass kein atmendes Wesen den Schlund durchqueren soll!"}, -- Uram
		},
	
		[460] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay { Tag = "csa246uram_003" , NpcId = 10722, String = "Erweckt die heiligen Steine bei den Tempeln der Echsengötter!"}, -- Uram
		},
	
		[540] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay { Tag = "csa246uram_004" , NpcId = 10722, String = "Dies wird die Elite der Sha herbeibeschwören! Gegen den Strom dieser Echsenwechsen werden selbst die Runenkrieger machtlos sein!"}, -- Uram
		},
		
		[620] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay { Tag = "csa246soulforger_005" , NpcId = 10727, String = "Wie Ihr befehlt!"}, -- Miniforger
			Goto {NpcId = 10727, X = 258, Y = 253, WalkMode = Run, GotoMode = GotoForced}, -- Miniforger geht
		},
	
		[700] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay { Tag = "csa246uram_006" , NpcId = 10722, String = "Ha! Die Eisernen waren mein Untergang, jetzt gehorchen sie mir wie Hunde!"}, -- Uram
		},
	
		[780] =
		{
			ExecuteCameraScript{Script = n32560_CameraEntry02},
			Goto {NpcId = 10688, X = 76, Y = 234, WalkMode = Run, GotoMode = GotoForced}, -- Miniforger läuft zu Point03
		},	
		
		[940] =
		{
			SetGlobalFlagTrue{Name = "P212Spawnpoint03On"},
		},	
		
		[1160] =
		{
			ExecuteCameraScript{Script = n32560_CameraEntry03},
			Goto {NpcId = 10687, X = 42, Y = 395, WalkMode = Run, GotoMode = GotoForced}, -- Miniforger läuft zu Point01
		},	
		
		[1300] =
		{
			SetGlobalFlagTrue{Name = "P212Spawnpoint01On"},
		},	
		
		[1450] =
		{
			ExecuteCameraScript{Script = n32560_CameraEntry04},
		},
		
		[1500] =
		{
			CutSceneSay { Tag = "csa246uram_007" , NpcId = 10722, String = "Da kommen die Sha! Los, ihr Schuppenkrieger! Bildet eine Blockade!"}, -- Uram
		},
		
		[1580] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay { Tag = "csa246uram_008" , NpcId = 10722, String = "Die Vereinigung unseres Herrn mit Belial steht bevor! Die Verteidigung muss halten!"}, -- Uram
		},
		
		[1700] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32560_CameraEntry05},
		},
		
		[1750] =
		{
			CutSceneSay { Tag = "csa246uram_009" , NpcId = 10722, String = "Und ihr untoten Knechte, greift an! Zerfleischt sie! Der Dschungel soll ihr Blut trinken!"}, -- Uram
		},
		
		
		[1820] =
		{
			AttackTarget {Target = Avatar, NpcId = 10723},
			AttackTarget {Target = Avatar, NpcId = 10724},
			AttackTarget {Target = Avatar, NpcId = 10725},
			AttackTarget {Target = Avatar, NpcId = 10726},
		},
		
		[1880] =
		{	
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			Goto {NpcId = 10722, X = 263, Y = 52, WalkMode = Walk}, -- Uram geht zu Portal
		},
		
		[1940] =
		{	
			SetEffect {Effect ="DeMaterialize", TargetType = Figure, NpcId = 10722},
		},
		
		[1960] =
		{	
			SetGlobalFlagTrue{Name = "g_P212_UramDespawn"},
		},
		
		
		[2020] =
		{
			SetGlobalFlagTrue{Name ="P212EntryCutsceneEnded"},
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
		},
	},
}



