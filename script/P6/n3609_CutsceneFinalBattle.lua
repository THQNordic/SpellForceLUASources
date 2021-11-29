-----------------------------------------------------------------------
--
--	Wildland Final Battle
--
-----------------------------------------------------------------------

CameraFinalBattleI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p6\\n3609_CameraFinalBattleI.lua")
   	Camera:ScriptStart()
]]

CameraFinalBattleII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p6\\n3609_CameraFinalBattleII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "WildlandFinalBattle", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		PlayerUnitInRange {X = 337, Y = 203, Range = 12, UpdateInterval = 10},		
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 3609},		
		SetGlobalFlagTrue {Name = "BladeIdleOff"},	
		LookAtDirection {NpcId = 3609, Direction = South},
		LookAtDirection {NpcId = 3610, Direction = South},
		LookAtDirection {NpcId = 3611, Direction = South},					
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll: 410 273
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:	
			--LookAtFigure {NpcId = 3611, Target = 3609}, 	--	blade				
			--LookAtFigure {NpcId = 3610, Target = 3609}, 	-- 	blade						
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraFinalBattleI},	-- orks und brannigan			
		},
		[40] =
		{
			CutSceneSay {Tag = "cutbranniganWLP001", NpcId = 3609, String = "Unfähiges Pack! Mehr Leute auf die Wälle! Lasst Feuer regnen, Ihr Bastarde! Euch werd' ich Beine machen!"},	
			
			Goto {NpcId = 3560, X = 414, Y = 228, WalkMode = Run}, -- Ork rennt.	
			Goto {NpcId = 3561, X = 416, Y = 227, WalkMode = Run}, -- Ork rennt.	
			Goto {NpcId = 3562, X = 418, Y = 227, WalkMode = Run}, -- Ork rennt.	
			
			Goto {NpcId = 3557, X = 420, Y = 227, WalkMode = Run}, -- Ork rennt.	
			Goto {NpcId = 3558, X = 419, Y = 224, WalkMode = Run}, -- Ork rennt.	
			Goto {NpcId = 3559, X = 417, Y = 224, WalkMode = Run}, -- Ork rennt.																			
		},
		[70] =
		{
			Goto {NpcId = 3554, X = 413, Y = 224, WalkMode = Run}, -- Ork rennt.	
			Goto {NpcId = 3555, X = 421, Y = 224, WalkMode = Run}, -- Ork rennt.	
			Goto {NpcId = 3556, X = 417, Y = 230, WalkMode = Run}, -- Ork rennt.
			SetGlobalFlagTrue {Name = "OrcFeuerBarriere"},	
		},
		[160] = 
		{
			WaitForEndOfSpeech,					
			ExecuteCameraScript{Script = CameraFinalBattleII},	-- blades und brannigan				
			CutSceneSay {Tag = "cutbranniganWLP002", NpcId = 3609, String = "Bei den Schlünden von Barga Gor! Dieser verfluchte Zauberer hat nichts von einem Runenkrieger gesagt! Aber damit wird ein Brannigan schon fertig..."},	
		},
		[270] = 
		{ 
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cutbranniganWLP003", NpcId = 3609, String = "Immerhin habe ich ja noch Euch, meine kleinen Schätzchen..."},	
			Goto {NpcId = 3610, X = 405, Y = 288, WalkMode = Walk}, -- blade geht.	
			Goto {NpcId = 3611, X = 409, Y = 288, WalkMode = Walk}, -- blade geht.				
		},
		[320] = 
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cutbranniganWLP004", NpcId = 3609, String = "Was steht Ihr da noch rum? Los, tötet den Runenknecht! Tötet sie alle!"},	
		},
		[390] = 
		{
			Goto {NpcId = 3611, X = 410, Y = 270, WalkMode = Run}, -- blade rennt.	
			Goto {NpcId = 3610, X = 411, Y = 271, WalkMode = Run}, -- blade rennt.				
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cutbranniganWLP005", NpcId = 3609, String = "Das wird Dein letzter Feldzug, Runensklave!"},	
		},
		[440] = 
		{
			WaitForEndOfSpeech,		
			-- safe, da innerhalb einer cutscene
			AttackTarget {NpcId = 3611, Target = 0},	-- blades greifen avatar an
			AttackTarget {NpcId = 3610, Target = 0},	-- blades greifen avatar an
			SetGlobalFlagTrue {Name = "3609_IdleOn"}, 	-- brannigan geht zu seinem stammplatz
		},
		[450] =
		{
			WaitForEndOfSpeech,	
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 3609},								
		},	
	},
}

