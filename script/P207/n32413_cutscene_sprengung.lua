  ----------------------------
 ------------------------------
-- Sprengung der ersten Mauer --
 ------------------------------
  ----------------------------
  
Camera001 =		-- Kamera folgt dem Zwerg
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32413_cutscene_sprengung_camera_001.lua")
   	Camera:ScriptStart()
]]
Camera002 =		-- Kamera fährt auf brennendes Fass zu
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p207\\n32413_cutscene_sprengung_camera_002.lua")
   	Camera:ScriptStart()
]]
Camera003 =		-- Dummy
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32413_cutscene_sprengung_camera_003.lua")
   	Camera:ScriptStart()
]]
Camera004 =		-- Kamera auf explodierendem ersten Fass
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p207\\n32413_cutscene_sprengung_camera_004.lua")
   	Camera:ScriptStart()
]]
Camera005 =		-- Kamera auf explodierendem zweiten Fass
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p207\\n32413_cutscene_sprengung_camera_005.lua")
   	Camera:ScriptStart()
]]
Camera006 =		-- Kamera auf explodierendem dritten Fass
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p207\\n32413_cutscene_sprengung_camera_006.lua")
   	Camera:ScriptStart()
]]
Camera007 =		-- Kamera auf explodierendem vierten Fass
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p207\\n32413_cutscene_sprengung_camera_007.lua")
   	Camera:ScriptStart()
]]
Camera008 =		-- Kamera auf explodierendem fünften Fass
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p207\\n32413_cutscene_sprengung_camera_008.lua")
   	Camera:ScriptStart()
]]
Camera009 =		-- Kamera fährt von der Mauer weg
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,17,1,"script\\p207\\n32413_cutscene_sprengung_camera_009.lua")
   	Camera:ScriptStart()
]]
CreateCutScene
{
	Name = "P207_Cutscene_Sprengung", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
		IsGlobalFlagTrue {Name = "g_p207_Sprengung_Einleiten"},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetGlobalFlagTrue {Name = "g_p207_stop_follow_in_cutscenes"},	
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = Camera001},
			Goto{X = 384, Y = 301, NpcId = 10764, Range = 0, WalkMode = Run},
			Goto{X = 383, Y = 312, NpcId = 10061, Range = 2, WalkMode = Run},
			Goto{X = 381, Y = 312, NpcId = 0, Range = 2, WalkMode = Run},
		},
		-- Spawnen der Gegner
		[35] =
		{
			SetGlobalFlagTrue {Name = "g_p207_Zweite_Festung_Mauer_Gesprengt"},
		},
		[70] =
		{
			SetEffect {Effect = "Torch", X = 385, Y = 301, Length = 10000},	--Zündschnur
			SetEffect {Effect = "PlasmaSmoke", X = 385, Y = 301, Length = 10000},	--Rauch
			Goto{X = 382, Y = 313, NpcId = 10764, Range = 2, WalkMode = Run, GotoMode = GotoContinuous},
			ExecuteCameraScript{Script = Camera002},
		},
		[150] =
		{
			ExecuteCameraScript{Script = Camera004},
			SetEffect {Effect = "Explo", X = 385, Y = 301, Length = 2000},	-- 1. Fass explodiert
			PlaySound{Sound = SoundStoneExplosion},
			SetEffect {Effect = "DarkMight", X = 385, Y = 301, Length = 750},	-- 1. Fass explodiert
			SetEffect {Effect = "BuildingFire", X = 386, Y = 301, Length = 10000},	-- 1. Mauer brennt
		},
		[155] =
		{
			ExecuteCameraScript{Script = Camera005},
			RemoveObject {X = 385, Y = 301, Object = 1994},
			SetEffect {Effect = "Explo", X = 385, Y = 300, Length = 2000},	-- 2. Fass explodiert
			PlaySound{Sound = SoundStoneExplosion},
			SetEffect {Effect = "DarkMight", X = 385, Y = 300, Length = 750},	-- 2. Fass explodiert
			SetEffect {Effect = "BuildingFire", X = 386, Y = 300, Length = 9500},	-- 2. Mauer brennt
		},
		[160] =
		{
			ExecuteCameraScript{Script = Camera006},
			RemoveObject {X = 385, Y = 300, Object = 1994},
			SetEffect {Effect = "Explo", X = 385, Y = 299, Length = 2000},	-- 3. Fass explodiert
			PlaySound{Sound = SoundStoneExplosion},
			SetEffect {Effect = "DarkMight", X = 385, Y = 299, Length = 750},	-- 3. Fass explodiert
			SetEffect {Effect = "BuildingFire", X = 386, Y = 299, Length = 9000},	-- 3. Mauer brennt
		},
		[165] =
		{
			ExecuteCameraScript{Script = Camera007},
			RemoveObject {X = 385, Y = 299, Object = 1995},
			SetEffect {Effect = "Explo", X = 385, Y = 298, Length = 2000},	-- 4. Fass explodiert
			PlaySound{Sound = SoundStoneExplosion},
			SetEffect {Effect = "DarkMight", X = 385, Y = 298, Length = 750},	-- 4. Fass explodiert
			SetEffect {Effect = "BuildingFire", X = 386, Y = 298, Length = 8500},	-- 4. Mauer brennt
		},
		[170] =
		{
			ExecuteCameraScript{Script = Camera008},
			RemoveObject {X = 385, Y = 298, Object = 1995},
			SetEffect {Effect = "Explo", X = 385, Y = 297, Length = 2000},	-- 5. Fass explodiert
			PlaySound{Sound = SoundStoneExplosion},
			SetEffect {Effect = "DarkMight", X = 385, Y = 297, Length = 750},	-- 5. Fass explodiert
			SetEffect {Effect = "BuildingFire", X = 386, Y = 297, Length = 8000},	-- 5. Mauer brennt
		},
		[175] =
		{
			ExecuteCameraScript{Script = Camera009},
			RemoveObject {X = 385, Y = 297, Object = 1993},
		},
		[245] =
		{
			--ExecuteCameraScript{Script = Camera001},
			SetEffect {Effect = "Explo", X = 386, Y = 301, Length = 2000},	-- 1. Mauer explodiert
			PlaySound{Sound = SoundStoneExplosion},
			SetEffect {Effect = "DarkMight", X = 386, Y = 301, Length = 1000},	-- 1. Mauer explodiert
			SetEffect {Effect = "Explo", X = 386, Y = 300, Length = 2000},	-- 2. Mauer explodiert
			SetEffect {Effect = "DarkMight", X = 386, Y = 300, Length = 750},	-- 2. Mauer explodiert
			SetEffect {Effect = "Explo", X = 386, Y = 299, Length = 2000},	-- 3. Mauer explodiert
			SetEffect {Effect = "DarkMight", X = 386, Y = 299, Length = 750},	-- 3. Mauer explodiert
			SetEffect {Effect = "Explo", X = 386, Y = 298, Length = 2000},	-- 4. Mauer explodiert
			SetEffect {Effect = "DarkMight", X = 386, Y = 298, Length = 750},	-- 4. Mauer explodiert
			SetEffect {Effect = "Explo", X = 386, Y = 297, Length = 2000},	-- 5. Mauer explodiert
			SetEffect {Effect = "DarkMight", X = 386, Y = 297, Length = 750},	-- 5. Mauer explodiert
		},
		[250] =
		{	
			--ExecuteCameraScript{Script = Camera001},
			RemoveObject {X = 386, Y = 301, Object = 2559}, -- 1. Mauer vorn wird entfernt
			RemoveObject {X = 386, Y = 297, Object = 2559}, -- 2. Mauer vorn wird entfernt
			RemoveObject {X = 390, Y = 301, Object = 2559}, -- 1. Mauer hinten wird entfernt
			RemoveObject {X = 390, Y = 297, Object = 2559}, -- 2. Mauer hinten wird entfernt
			Goto {X = 377, Y = 312, NpcId = 10822, Range = 5, WalkMode = Run, GotoMode = GotoContinuous},
			Goto {X = 377, Y = 312, NpcId = 10843, Range = 5, WalkMode = Run, GotoMode = GotoContinuous},
		},
		[280] =
		{
			SetGlobalFlagTrue {Name = "g_p207_Zwerg_Folgt_Avatar"},
			Follow {NpcId = 10061, Target = Avatar},
			QuestSolve {QuestId = 979},
			QuestBegin {QuestId = 980},
		},
		[300] =
		{
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},	
			SetGlobalFlagFalse {Name = "g_p207_stop_follow_in_cutscenes"},		
			-- Cutscene beenden
		},
	},
}