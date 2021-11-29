-----------------------------------------------------------------------
--
--	Test03
--
-----------------------------------------------------------------------


CameraZwerge01 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,55,1,"script\\p77\\CameraZwerge01.lua")
   	Camera:ScriptStart()
]]

CameraZwerge02 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p77\\CameraZwerge02.lua")
   	Camera:ScriptStart()
]]

CameraZwerge03 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p77\\CameraZwerge03.lua")
   	Camera:ScriptStart()
]]

CameraZwerge04 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p77\\CameraZwerge04.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Test03", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsMonumentInUse{ X = 24, Y = 46, Range = 5},	--Dwarf 
		--FigureAlive{NpcId = 5210},
		
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		
		SetNoFightFlagTrue{NpcId = 5210},
	
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
					LookAtDirection{Direction = West, NpcId = 5210}, 
					ExecuteCameraScript{Script = CameraZwerge02},
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 164, Y = 202, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 167, Y = 213, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 173, Y = 203, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 175, Y = 210, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 224, Y = 215, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 175, Y = 204, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 176, Y = 210, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 169, Y = 204, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 172, Y = 211, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 167, Y = 212, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 163, Y = 204, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 225, Y = 216, TargetType = World },
					SetEffect{ Effect = "CastFire" , Length = 0, X = 168, Y = 213, TargetType = World },
					SetEffect{ Effect = "CastFire" , Length = 0, X = 166, Y = 202, TargetType = World },
					SetEffect{ Effect = "CastFire" , Length = 0, X = 176, Y = 210, TargetType = World },
					SetEffect{ Effect = "CastFire" , Length = 0, X = 175, Y = 204, TargetType = World },
					SetEffect{ Effect = "CastFire" , Length = 0, X = 226, Y = 216, TargetType = World },
					SetEffect{ Effect = "CastFire" , Length = 0, X = 225, Y = 214, TargetType = World },
					SetEffect{Effect = "FogForever", X = 234, Y = 216, Length = 0},
					SetEffect{Effect = "FogForever", X = 236, Y = 210, Length = 0},
					SetEffect{Effect = "FogForever", X = 138, Y = 213, Length = 0},
					SetEffect{Effect = "FogForever", X = 144, Y = 208, Length = 0},
					SetEffect{Effect = "FogForever", X = 116, Y = 240, Length = 0},
					SetEffect{Effect = "FogForever", X = 128, Y = 240, Length = 0},
					Goto{X = 139, Y = 210, NpcId = 5210, Range = 2, WalkMode = Run}, 
					                 
		},
		[35] =
		{
					
					ExecuteCameraScript{Script = CameraZwerge03},
					
					
		},
		[100] =
		{
					
					ExecuteCameraScript{Script = CameraZwerge01},
					
					
		},
		[115] =
		{
					Goto{X = 169, Y = 208, NpcId = 5210, Range = 1, WalkMode = Run},
		},
		[260] =
		{
					Goto{X = 187, Y = 208, NpcId = 5210, Range = 2, WalkMode = Run},
		},
		[325] =
		{			
					Goto{X = 220, Y = 216, NpcId = 5210, Range = 2, WalkMode = Run},
					
						
		},
		
		[475] =
		{
					Goto{X = 239, Y = 211, NpcId = 5210, Range = 2, WalkMode = Run},
				
		},
		[570] =
		{
					
					ExecuteCameraScript{Script = CameraZwerge04},
					
					
		},
		[625] =
		{
					WaitForEndOfSpeech,	 --sollte immer angegeben werden
		},
	},
}





