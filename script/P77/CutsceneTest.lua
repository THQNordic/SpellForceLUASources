-----------------------------------------------------------------------
--
--	Test
--
-----------------------------------------------------------------------


CameraGreif = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p77\\CameraGreif.lua")
   	Camera:ScriptStart()
]]

CameraGreif01 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p77\\CameraGreif01.lua")
   	Camera:ScriptStart()
]]

CameraGreif02 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p77\\CameraGreif02.lua")
   	Camera:ScriptStart()
]]

CameraGreif03 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\p77\\CameraGreif03.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "Test", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsMonumentInUse{ X = 8, Y = 45, Range = 5}, --Menschen
		
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 5118},
		SetNoFightFlagTrue {NpcId = 5029},
		SetNoFightFlagTrue {NpcId = 5030},
		ChangeRace{Race = 002, NpcId = 5118},
		LookAtDirection{Direction = North, NpcId = 5118},   
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
					ExecuteCameraScript{Script = CameraGreif01},
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 65, Y = 44, TargetType = World },
					SetEffect{ Effect = "CastFire" , Length = 0, X = 69, Y = 44, TargetType = World },
					SetEffect{Effect = "FogForever", X = 66, Y = 43, Length = 0},
					SetEffect{ Effect = "CastFire" , Length = 0, X = 63, Y = 43, TargetType = World },
					SetEffect{ Effect = "CastFire" , Length = 0, X = 66, Y = 44, TargetType = World },
					SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 73, Y = 43, TargetType = World},
		},
		[15] =
		{
					ExecuteCameraScript{Script = CameraGreif03},
					
		},
		[65] =
		{
					
					Goto{X = 71, Y = 122, NpcId = 5118, Range = 2, WalkMode = Run},
					
		},	
		[75] =
		{
	
					ExecuteCameraScript{Script = CameraGreif},	
					
					
		},	
		[175] =
		{
					ExecuteCameraScript{Script = CameraGreif02},	
					
					
		},	
		
		[275] =
		{
					ExecuteCameraScript{Script = CameraGreif},	
		},
		[350] =
		{
					WaitForEndOfSpeech,	 --sollte immer angegeben werden
					
					
		},		
	},
}





