-----------------------------------------------------------------------
--
--	Wildland Rohen Angriff
--
-----------------------------------------------------------------------

CameraRohenI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p6\\n1984_CameraRohenIV.lua")  	
   	Camera:ScriptStart()
]]

CameraRohenII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p6\\n1984_CameraRohenII.lua")
   	Camera:ScriptStart()
]]

CameraRohenIII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,8,1,"script\\p6\\n1984_CameraRohenIII.lua")
   	Camera:ScriptStart()
]]

CameraRohenIV = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,17,1,"script\\p6\\n1984_CameraRohenI.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "RohenAngriff", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet zu beginn der map.
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		-- SetGlobalFlagTrue{Name = "CutscenRohenBladesAttack"},	-- blades werden gespawnt.
		--SetNoFightFlagTrue {NpcId = 1984},	-- rohen wird nicht angegriffen.	
		ChangeRace {NpcId = 1984, Race = 124},	-- evtl. entfernen				
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- startcutscene ohe pause.	
			ExecuteCameraScript{Script = CameraRohenI},	-- CAM : am portal
			Goto {NpcId = 0, X = 40, Y = 195, WalkMode = Walk},
			LookAtFigure {NpcId = 1984, Target = 3200},			
		},
		[50] =
		{
			ExecuteCameraScript{Script = CameraRohenII},	-- CAM : orks 1
		},
		[100] =
		{
			ExecuteCameraScript{Script = CameraRohenIII},	-- CAM : orks 2
		},
		[160] =
		{
			--SetNoFightFlagFalse{NpcId = 1984},	-- rohen wird wieder angreifbar, die blades stuermen auf ihn los.
			ChangeRace {NpcId = 1984, Race = 148},	-- evtl. entfernen
		},
		[170] = 
		{
			ExecuteCameraScript{Script = CameraRohenIV},	-- CAM : rohen und blades
			SetNoFightFlagFalse{NpcId = 1984},	-- rohen wird wieder angreifbar, die blades stuermen auf ihn los.			
		},
		[190] =
		{
			--CastSpell {Spell = 553, Target = 0, TargetType = World, X = 372, Y = 344, NpcId = 1984},
		},
		[310] = 
		{
			WaitForEndOfSpeech,			
			SetGlobalFlagTrue{Name = "CutscenRohenBladesAttackOver"},	-- blades werden geloescht.	
			SetGlobalFlagTrue {Name = "RohenWins"},	-- rohen kann despawnen.
		},
	},
}

