-----------------------------------------------------------------------
--
--	Tutorial Intro
--
-----------------------------------------------------------------------

-- nach dem kampf
CameraTaliaDuelI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p23\\n0_CameraTaliaDuelI.lua")
   	Camera:ScriptStart()
]]

-- zoom zum tor
CameraTaliaDuelII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p23\\n0_CameraTaliaDuelII.lua")
   	Camera:ScriptStart()
]]

-- schlachtfeld totale
CameraTaliaDuelIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p23\\n0_CameraTaliaDuelIII.lua")
   	Camera:ScriptStart()
]]

CameraTaliaDuelIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,31,1,"script\\p23\\n0_CameraTaliaDuelIV.lua")
   	Camera:ScriptStart()
]]

CameraTaliaDuelV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p23\\n0_CameraTaliaDuelV.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "TaliaDuel", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue{Name = "Q310TaliaStartDuel", UpdateInterval = 10},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		-- ChangeRace{Race = 152, NpcId = 3737},
		SetGlobalFlagTrue{Name = "RiftUlatherGateOpen"},
		SetGlobalFlagFalse {Name = "RiftIdleOn"},
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 3736},
		SetNoFightFlagTrue {NpcId = 3737},
		RemoveDialog {NpcId = 3736},			
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
			ExecuteCameraScript{Script = CameraTaliaDuelII},	
			RemoveDialog{NpcId = 3736},
		},
		[30] =
		{
			Goto {NpcId = 3736, X = 426, Y = 196, WalkMode = Run}, -- talia.		
		},
		[100] = 
		{ 
			LookAtFigure {NpcId = 3736, Target = 3737},
			LookAtFigure {NpcId = 3737, Target = 3736},
			CutSceneSay {Tag = "cuttaliaRift007" , NpcId = 3736, String = "Das ist dein Ende, Dämon! Sieh her! Sieh in das Antlitz des Winters und verzweifle! Ich werde Dich vernichten!"},		
		},
		[190] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTaliaDuelIII},
			Goto {NpcId = 3736, X = 439, Y = 200, WalkMode = Run}, 	-- Talia laeuft auf Ulather zu, Kampf beginnt.									
			CutSceneSay {Tag = "cutulatherRift001" , NpcId = 3737, String = "Du überschätzt Deine Kräfte, Mensch!"},				
		},
		[250] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraTaliaDuelV},			
			CastSpell {Spell = 326, NpcId = 3736, Target = 3736, TargetType = Figure, X = 0, Y = 0},	-- talia castet.
		},
		[280] =
		{
			ExecuteCameraScript{Script = CameraTaliaDuelIV},	
			CastSpell {Spell = 1557, NpcId = 3737, Target = 3736, TargetType = Figure, X = 0, Y = 0}, 	-- ulather castet.	
			SetFreezeFlagTrue {NpcId = 3736},					
		},
		[310] =
		{
			CutSceneSay {Tag = "cuttaliaRift008" , NpcId = 3736, String = "Neiiin! Aaaah!"},	-- Talia wird vom Spell getroffen.	
			CastSpell {Spell = 1557, NpcId = 3737, Target = 3736, TargetType = Figure, X = 0, Y = 0}, 	-- ulather castet.				
			-- ChangeRace {NpcId = 3736, Race = 124},
		},
		[340] =
		{
			--PlaceObject {X = 439, Y = 201, Object = 902},		
			--PlaceObject {X = 440, Y = 200, Object = 902},		
			--PlaceObject {X = 439, Y = 199, Object = 902},		
			--PlaceObject {X = 438, Y = 200, Object = 902},
			--		
			--PlaceObject {X = 438, Y = 199, Object = 902},		
			--PlaceObject {X = 440, Y = 199, Object = 902},		
			--PlaceObject {X = 438, Y = 201, Object = 902},		
			--PlaceObject {X = 440, Y = 201, Object = 902},	
			
			PlaceObject {X = 439, Y = 201, Object = 831},		
			PlaceObject {X = 440, Y = 200, Object = 2054},		
			PlaceObject {X = 439, Y = 199, Object = 2055},		
			PlaceObject {X = 438, Y = 200, Object = 832},
					
			PlaceObject {X = 438, Y = 199, Object = 2056},		
			PlaceObject {X = 440, Y = 199, Object = 2054},		
			PlaceObject {X = 438, Y = 201, Object = 833},		
			PlaceObject {X = 440, Y = 201, Object = 2052},	

			--SetEffect {TargetType = World, X = 441, Y = 200, Length = 0, Effect = "BuildingFire"},	
			SetEffect {TargetType = World, X = 438, Y = 200, Length = 0, Effect = "Campfire"},	
			SetEffect {TargetType = World, X = 439, Y = 201, Length = 0, Effect = "Campfire"},	
			SetEffect {TargetType = World, X = 439, Y = 199, Length = 0, Effect = "Campfire"},	
			SetEffect {TargetType = World, X = 440, Y = 200, Length = 0, Effect = "Campfire"},
			--SetEffect {TargetType = World, X = 439, Y = 199, Length = 0, Effect = "Campfire"},
			--SetEffect {TargetType = World, X = 438, Y = 200, Length = 0, Effect = "Campfire"},			
            --
			--SetEffect {TargetType = World, X = 438, Y = 199, Length = 0, Effect = "Campfire"},	
			--SetEffect {TargetType = World, X = 440, Y = 199, Length = 0, Effect = "Campfire"},
			--SetEffect {TargetType = World, X = 438, Y = 201, Length = 0, Effect = "Campfire"},
			--SetEffect {TargetType = World, X = 440, Y = 201, Length = 0, Effect = "Campfire"},			
			--
			--
			--SetEffect {TargetType = World, X = 439, Y = 198, Length = 0, Effect = "Campfire"},	
			--SetEffect {TargetType = World, X = 437, Y = 200, Length = 0, Effect = "Campfire"},
			--SetEffect {TargetType = World, X = 439, Y = 202, Length = 0, Effect = "Campfire"},
			--SetEffect {TargetType = World, X = 441, Y = 200, Length = 0, Effect = "Campfire"},			
            --
			--SetEffect {TargetType = World, X = 437, Y = 199, Length = 0, Effect = "Campfire"},	
			--SetEffect {TargetType = World, X = 441, Y = 201, Length = 0, Effect = "Campfire"},
			--SetEffect {TargetType = World, X = 438, Y = 202, Length = 0, Effect = "Campfire"},
			--SetEffect {TargetType = World, X = 440, Y = 198, Length = 0, Effect = "Campfire"},	
			--
			--SetEffect {TargetType = World, X = 437, Y = 201, Length = 0, Effect = "Campfire"},	
			--SetEffect {TargetType = World, X = 438, Y = 198, Length = 0, Effect = "Campfire"},
			--SetEffect {TargetType = World, X = 441, Y = 199, Length = 0, Effect = "Campfire"},
			--SetEffect {TargetType = World, X = 440, Y = 202, Length = 0, Effect = "Campfire"},
			
			SetEffect {NpcId = 3736, Length = 0, Effect = "IceShieldOld"},
			SetEffect {NpcId = 3736, Length = 0, Effect = "IceShield"},
			SetFreezeFlagTrue{NpcId = 3736},
			SetGlobalTimeStamp{Name = "TaliaImprisoned"},
		},
		[350] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraTaliaDuelI},
			--PlaceObject {X = 439, Y = 200, Object = 2054},		
		},
		[390] = 
		{
			CutSceneSay {Tag = "cutulatherRift002" , NpcId = 3737, String = "Hast Du wirklich gedacht, dass Du mich besiegen kannst, kleine Zauberin? Aus dieser Falle wirst Du nicht mehr entkommen..."},			
		},
		[470] = 
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "RiftIdleOn"},
			QuestBegin{QuestId = 497},
			RemoveDialog{NpcId = 3736},
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 3737},	
			-- SetFreezeFlagFalse {NpcId = 3736}, -- talia freeze aus.					
			-- ChangeRace{Race = 121, NpcId = 3737},
		},
	},
}

