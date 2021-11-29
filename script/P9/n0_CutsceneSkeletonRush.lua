-----------------------------------------------------------------------
--
--	Skeleton Rush
--
-----------------------------------------------------------------------

CameraSkeletonI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p9\\n0_CameraSkeletonRushI.lua")
   	Camera:ScriptStart()
]]



CreateCutScene
{
	Name = "SkeletonRush", CameraScript = "",
	
	BeginConditions =
	{
		-- bedingungen, die angeben wann die cutscene gestartet werden soll (erforderlich)
	},
	
	BeginActions =
	{
		-- schliesst automatisch mit ein: 
								
						
		-- optional weitere actions zu beginn der cutscene:
	},
	
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:
		[10] =
		{
			Goto {X = 243, Y = 72, NpcId = 3293, WalkMode = Run, Range = 5 },		
			Goto {X = 243, Y = 72, NpcId = 3294, WalkMode = Run, Range = 5 },	
			Goto {X = 243, Y = 72, NpcId = 3295, WalkMode = Run, Range = 5 },	
			Goto {X = 243, Y = 72, NpcId = 3296, WalkMode = Run, Range = 5 },	
			Goto {X = 243, Y = 72, NpcId = 3297, WalkMode = Run, Range = 5 },	
			Goto {X = 243, Y = 72, NpcId = 3298, WalkMode = Run, Range = 5 },	
			Goto {X = 243, Y = 72, NpcId = 3299, WalkMode = Run, Range = 5 },	
			Goto {X = 243, Y = 72, NpcId = 3300, WalkMode = Run, Range = 5 },	
					
		},
		[20] =
		{
			Goto {X = 226, Y = 45, NpcId = 3301, WalkMode = Run, Range = 5 },	
			Goto {X = 226, Y = 45, NpcId = 3302, WalkMode = Run, Range = 5 },	
			Goto {X = 226, Y = 45, NpcId = 3303, WalkMode = Run, Range = 5 },	
			Goto {X = 226, Y = 45, NpcId = 3304, WalkMode = Run, Range = 5 },

			Goto {X = 226, Y = 45, NpcId = 2093, WalkMode = Run, Range = 5 },	
			Goto {X = 226, Y = 45, NpcId = 2094, WalkMode = Run, Range = 5 },
		},
		[30] =
		{
			ExecuteCameraScript{Script = CameraSkeletonI},
		},
		[150] =
		{
			SetGlobalFlagFalse {Name = "CutsceneRunning"},		
		},		

	},
}

