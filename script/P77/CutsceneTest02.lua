-----------------------------------------------------------------------
--
--	Test02
--
-----------------------------------------------------------------------


CameraGoblin01 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p77\\CameraGoblin01.lua")
   	Camera:ScriptStart()
]]


CameraGoblin02 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,40,1,"script\\p77\\CameraGoblin02.lua")
   	Camera:ScriptStart()
]]


CameraGoblin03 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p77\\CameraGoblin03.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "Test02", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsMonumentInUse{ X = 44, Y = 16, Range = 5}, --DarkElves
	
		
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetNoFightFlagTrue{NpcId = 5195},
		SetNoFightFlagTrue{NpcId = 5185},
		SetNoFightFlagTrue{NpcId = 5186},
		SetNoFightFlagTrue{NpcId = 5187},
		SetNoFightFlagTrue{NpcId = 5188},
		SetNoFightFlagTrue{NpcId = 5189},
		SetNoFightFlagTrue{NpcId = 5190},
		SetNoFightFlagTrue{NpcId = 5191},
		SetNoFightFlagTrue{NpcId = 5192},
		SetNoFightFlagTrue{NpcId = 5193},
		SetNoFightFlagTrue{NpcId = 5194},
	
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
					LookAtDirection{Direction = West, NpcId = 5195},  	
					ExecuteCameraScript{Script = CameraGoblin02},
					--SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 65, Y = 44, TargetType = World },
					--SetEffect{ Effect = "CastFire" , Length = 0, X = 226, Y = 136, TargetType = World },
					--SetEffect{ Effect = "CastFire" , Length = 0, X = 223, Y = 139, TargetType = World },
					--SetEffect{Effect = "FogForever", X = 161, Y = 139, Length = 0},
					SetEffect{Effect = "FogForever", X = 170, Y = 141, Length = 0},
					--SetEffect{Effect = "FogForever", X = 165, Y = 123, Length = 0},
					SetEffect{Effect = "FogForever", X = 202, Y = 134, Length = 0},
					--SetEffect{Effect = "FogForever", X = 198, Y = 129, Length = 0},
					--SetEffect{Effect = "FogForever", X = 198, Y = 124, Length = 0},
					--SetEffect{Effect = "FogForever", X = 214, Y = 139, Length = 0},
					--SetEffect{Effect = "FogForever", X = 220, Y = 130, Length = 0},
												
					--SetEffect{ Effect = "CastFire" , Length = 0, X = 63, Y = 43, TargetType = World },
					--SetEffect{ Effect = "CastFire" , Length = 0, X = 66, Y = 44, TargetType = World },
					--SetEffect{ Effect = "PlasmaSmoke" , Length = 0, X = 73, Y = 43, TargetType = World},
					--ChangeRace(Race = 002, NpcId = 5184),
					TalkAnimPlay{NpcId = 5195},
					CutSceneSay {Tag = "Elfe" , NpcId = 5195, String = "Endlich...Dass Land meiner Ahnen"},	
					                 
		},
		[35] =
		{
					TalkAnimStop{NpcId = 5195},
					LookAtDirection{Direction = North, NpcId = 5195},   
					Goto{X = 191, Y = 132, NpcId = 5195, Range = 2, WalkMode = Walk},
		},
		[65] =
		{
					ExecuteCameraScript{Script = CameraGoblin03},
		},
		[135] =
		{
					ExecuteCameraScript{Script = CameraGoblin01},
		},
		[175] =
		{			
		
					Goto{X = 191, Y = 132, NpcId = 5194, Range = 2, WalkMode = Run},
					Goto{X = 191, Y = 132, NpcId = 5191, Range = 2, WalkMode = Run},
					
		},
		[185] =
		{			
					Goto{X = 191, Y = 132, NpcId = 5192, Range = 2, WalkMode = Run},
					Goto{X = 191, Y = 132, NpcId = 5193, Range = 2, WalkMode = Run},		
		},
		[195] =
		{			
					Goto{X = 195, Y = 132, NpcId = 5195, Range = 2, WalkMode = Run},
					
						
		},
		
		[225] =
		{
					Goto{X = 191, Y = 132, NpcId = 5185, Range = 2, WalkMode = Run},
					Goto{X = 191, Y = 132, NpcId = 5186, Range = 2, WalkMode = Run},
					Goto{X = 191, Y = 132, NpcId = 5187, Range = 2, WalkMode = Run},
					Goto{X = 191, Y = 132, NpcId = 5188, Range = 2, WalkMode = Run},
					Goto{X = 191, Y = 132, NpcId = 5189, Range = 2, WalkMode = Run},
					Goto{X = 191, Y = 132, NpcId = 5190, Range = 2, WalkMode = Run},
		},
		[290] =
		{
					LookAtDirection{Direction = West, NpcId = 5195},   
					
		},
		[330] =
		{
					
					LookAtDirection{Direction = East, NpcId = 5185},
					LookAtDirection{Direction = East, NpcId = 5186},
					LookAtDirection{Direction = East, NpcId = 5187},
					LookAtDirection{Direction = East, NpcId = 5188},
					LookAtDirection{Direction = East, NpcId = 5189},
					LookAtDirection{Direction = East, NpcId = 5190},
					LookAtDirection{Direction = East, NpcId = 5191},
					LookAtDirection{Direction = East, NpcId = 5192},
					LookAtDirection{Direction = East, NpcId = 5193},
					LookAtDirection{Direction = East, NpcId = 5194},
		},
		[375] =
		{
					WaitForEndOfSpeech,	 --sollte immer angegeben werden
		},
	},
}





