-----------------------------------------------------------------------
--
--	Phoenix Delivery
--
-----------------------------------------------------------------------

CameraPhoenixDeliveryI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p19\\n2850_CameraPhoenixDeliveryI.lua")
   	Camera:ScriptStart()
]]

CameraPhoenixDeliveryII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p19\\n2850_CameraPhoenixDeliveryII.lua")
   	Camera:ScriptStart()
]]

CameraPhoenixDeliveryIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,45,1,"script\\p19\\n2850_CameraPhoenixDeliveryIII.lua")
   	Camera:ScriptStart()
]]

CameraPhoenixDeliveryIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p19\\n2850_CameraPhoenixDeliveryIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "PhoenixDelivery", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- PlayerUnitInRange {X = 265, Y = 325, Range = 5, UpdateInterval = 15},	-- debug.
		IsGlobalFlagTrue {Name = "MechlanFight", UpdateInterval = 10},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetGlobalFlagTrue {Name = "MechlanSpawns"},	
		SetGlobalFlagTrue {Name = "2850_IdleOff"},	
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 2850},	
		SetNoFightFlagTrue {NpcId = 2838},
		SetNoFightFlagTrue {NpcId = 2839},	
		SetNoFightFlagTrue {NpcId = 2840},
		SetNoFightFlagTrue {NpcId = 2841},					
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] = 
		{ 
			-- die ersten zwei sekunden ohne kamera:				
		},
		[20] = 
		{ 
			ExecuteCameraScript{Script = CameraPhoenixDeliveryII}, -- sieht komisch aus, aber der avatar muss seinen startplatz unbemerkt erreichen.
			Goto {NpcId = 0, X = 265, Y = 325, WalkMode = Run},																					
		},			
		[30] = 
		{ 
			CutSceneSay {Tag = "cutmaincharMul001", NpcId = 0, String = "Das hier ist nicht der Phönix! Dieser Stein hat keine Macht! Er ist nur Blendwerk!"},
			LookAtFigure {NpcId = 2838, Target = 0},	
			LookAtFigure {NpcId = 2839, Target = 0},		
			LookAtFigure {NpcId = 2840, Target = 0},		
			LookAtFigure {NpcId = 2841, Target = 0},		
			LookAtFigure {NpcId = 2850, Target = 0},		
			LookAtFigure {NpcId = 0, Target = 2850},				
		},
		[100] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraPhoenixDeliveryIII},					
			CutSceneSay {Tag = "cutwaechterMul001", NpcId = 2850, String = "Verflucht sei Euer Spürgeist! Dann ist es wohl unvermeidbar..."},
			LookAtFigure {NpcId = 0, Target = 2850},
			SetEffect {Effect = "SimpleInvis", NpcId = 3864, Length = 0, TargetType = Figure},	-- Mechlan Illusion
			SetEffect {Effect = "SimpleInvis", NpcId = 3865, Length = 0, TargetType = Figure},	-- Mechlan Illusion
			SetEffect {Effect = "SimpleInvis", NpcId = 3866, Length = 0, TargetType = Figure},	-- Mechlan Illusion			
		},
		[160] =
		{
			WaitForEndOfSpeech,	
			SetEffect {Effect = "DeMaterialize", NpcId = 2850, Length = 0, TargetType = Figure}, 			
		},
		[180] =
		{
			ChangeUnit {NpcId = 2850, Unit = 984},
		},
		[190] =
		{
			StopEffect	{NpcId = 2850},			
			SetEffect {Effect = "Materialize", NpcId = 2850, Length = 0, TargetType = Figure},		
		},
		[210] = 
		{
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "cutmechlanMul001", NpcId = 2850, String = "... dass ich Euch töte! Ihr hattet doch nicht im Ernst erwartet, dass ich Euch den Phönixstein geben würde?"},
		},
		[280] = 
		{
			WaitForEndOfSpeech,			
			StopEffect	{NpcId = 2850},						
			ExecuteCameraScript{Script = CameraPhoenixDeliveryI},							
			CutSceneSay {Tag = "cutmechlanMul002", NpcId = 2850, String = "Ihr habt mir gut gedient! Mein Kunstwerk ist dank Euch endlich vollendet! Jetzt sterbt wohl, närrischer Krieger!"},
		},
		[330] = 
		{
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "cutmechlanMul003", NpcId = 2850, String = "Wölfe! Herbei zu mir! Tötet diesen Runensklaven!"},
		},
		[350] =
		{
			Goto {NpcId = 2838, X = 270, Y = 322, WalkMode = Walk},
			Goto {NpcId = 2839, X = 270, Y = 324, WalkMode = Walk},
			Goto {NpcId = 2840, X = 270, Y = 326, WalkMode = Walk},
			Goto {NpcId = 2841, X = 270, Y = 328, WalkMode = Walk},	
			Goto {NpcId = 2850, X = 297, Y = 341, WalkMode = Run},	-- mechlan							
		},
		[410] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraPhoenixDeliveryIV},								
			CutSceneSay {Tag = "cutmechlanMul004", NpcId = 2850, String = "Ich rufe Euch, Illusionen! Herbei ihr Lichtspiele! Kommt her, Blendwerke! Schützt Euren Meister!"},
			LookAtFigure {NpcId = 2850, Target = 3865},	
			LookAtFigure {NpcId = 3865, Target = 2850},	
			LookAtFigure {NpcId = 3864, Target = 2850},	
			LookAtFigure {NpcId = 3866, Target = 2850},													
		},
		[470] =
		{
			LookAtFigure {NpcId = 2850, Target = 3865},					
			StopEffect	{NpcId = 3864},			
			SetEffect {Effect = "Materialize", NpcId = 3864, Length = 0, TargetType = Figure}, 				
		},
		[480] =
		{
			StopEffect	{NpcId = 3865},			
			SetEffect {Effect = "Materialize", NpcId = 3865, Length = 0, TargetType = Figure}, 			
		},
		[490] =
		{
			StopEffect	{NpcId = 3866},				
			SetEffect {Effect = "Materialize", NpcId = 3866, Length = 0, TargetType = Figure}, 
			SetGlobalFlagTrue {Name = "MechlanGateOpen"},	-- tor oeffnet sich.							
		},
		[520] =
		{
			Goto {NpcId = 2850, X = 328, Y = 354, WalkMode = Run},	-- mechlan	
		}, 
		[550] =
		{
			ExecuteCameraScript{Script = CameraPhoenixDeliveryI},
		},
		[600] = 
		{
			WaitForEndOfSpeech,	
			StopEffect	{NpcId = 3864},	
			StopEffect	{NpcId = 3865},	
			StopEffect	{NpcId = 3866},										
			ChangeRace {NpcId = 2838, Race = 159},
			ChangeRace {NpcId = 2839, Race = 159},
			ChangeRace {NpcId = 2840, Race = 159},
			ChangeRace {NpcId = 2841, Race = 159},	
			SetGlobalFlagTrue {Name = "WolvesIdleOn"},	-- wolves idle on.
			SetGlobalFlagTrue {Name = "MechlanIllusionSpawn"},
			Vanish {NpcId = 2850},		
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 2838},
			SetNoFightFlagFalse {NpcId = 2839},	
			SetNoFightFlagFalse {NpcId = 2840},
			SetNoFightFlagFalse {NpcId = 2841},				
		},
	},
}

