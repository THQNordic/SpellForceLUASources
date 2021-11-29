  ------------------------------------------------------------------------
 --------------------------------------------------------------------------
-- Rohen kommt durchs Portal mit seiner Armee, und zieht Richtung Spieler --
 --------------------------------------------------------------------------
  ------------------------------------------------------------------------
CameraDummy =		-- Dummy
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p207\\n32414_cutscene_rohen_arrival_cameradummy.lua")
   	Camera:ScriptStart()
]]  
Camera001 =		-- Kamera fährt auf in Richtung Portal
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,45,1,"script\\p207\\n32414_cutscene_rohen_arrival_camera01.lua")
   	Camera:ScriptStart()
]]
Camera002 =		-- Kamera dreht sich um Rohen
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32414_cutscene_rohen_arrival_camera02.lua")
   	Camera:ScriptStart()
]]
Camera003 =		-- Kamera hinter Monument, auf Truppe und Rohen
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p207\\n32414_cutscene_rohen_arrival_camera03.lua")
   	Camera:ScriptStart()
]]
CreateCutScene
{
	Name = "P207_Rohen_Arrival", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
		--IsGlobalFlagTrue {Name = "g_P207_Undead_Rohen_And_His_Army_Has_Entered_The_Building"},
		IsGlobalTimeElapsed {Name = "t_P207_Undead_Rohen_And_His_Army_Has_Entered_The_Building", Seconds = 3},
	},
	BeginActions =
	{
		SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Has_Entered_The_Building"},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetGlobalFlagTrue {Name = "g_p207_stop_follow_in_cutscenes"},	
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = Camera001},
		},
		[15] =
		{
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_01"},
		},
		[25] =
		{
			Goto {NpcId = 11132, X = 271, Y = 49, WalkMode = Run}, -- 01
		},
		[35] =
		{
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_02"},
		},
		[45] =
		{
			Goto {NpcId = 11133, X = 272, Y = 49, WalkMode = Run}, -- 02
		},
		[55] =
		{
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_03"},
		},
		[65] =
		{
			Goto {NpcId = 11134, X = 273, Y = 49, WalkMode = Run}, -- 03
		},
		[75] =
		{
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_04"},
		},
		[85] =
		{
			Goto {NpcId = 11135, X = 274, Y = 49, WalkMode = Run}, -- 04
		},
		[95] =
		{
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_05"},
		},
		[105] =
		{
			Goto {NpcId = 11136, X = 275, Y = 49, WalkMode = Run}, -- 05
		},
		[115] =
		{
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_06"},
		},
		
		[125] =
		{
			Goto {NpcId = 11137, X = 271, Y = 48, WalkMode = Run}, -- 06
		},
		[135] =
		{
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_Spawn"},
		},
		[155] =
		{
			Goto {NpcId = 11086, X = 275, Y = 41, WalkMode = Walk}, -- Rohen auf Saurier
		},
		[165] =
		{
			ExecuteCameraScript{Script = Camera002},
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_07"},
			LookAtDirection{NpcId = 11086, Direction = North},
		},
		[175] =
		{
			Goto {NpcId = 11138, X = 272, Y = 48, WalkMode = Run}, -- 07
			LookAtDirection{NpcId = 11086, Direction = North},
		},
		[185] =
		{
			LookAtDirection{NpcId = 11086, Direction = North},
			CutSceneSay {Tag = "csa227rohen_001" ,NpcId = 11086, String = "Vorwärts! Schlagt sie zurück!"},
		},
		[195] =
		{
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_08"},
		},
		[205] =
		{
			Goto {NpcId = 11139, X = 273, Y = 48, WalkMode = Run}, -- 08
		},
		[215] =
		{
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_09"},
		},
		[225] =
		{
			Goto {NpcId = 11140, X = 274, Y = 48, WalkMode = Run}, -- 09
		},
		[235] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa227rohen_002" ,NpcId = 11086, String = "Nicht so langsam!"},
		},
		[245] =
		{
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_10"},
		},
		[255] =
		{
			Goto {NpcId = 11141, X = 275, Y = 48, WalkMode = Run}, -- 10
		},
		[265] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa227rohen_003" ,NpcId = 11086, String = "Los Ihr Sklaven! Ersäuft sie in Ihrem Blut!"},
		},
		[280] =
		{
			ExecuteCameraScript{Script = Camera003},
		},
		[290] =
		{
			Goto {X = 343, Y = 103, NpcId = 11087, Range = 7, WalkMode = Run, GotoMode = GotoContinuous},
			SetGlobalFlagTrue {Name = "g_p207_Vierte_Festung_Untote_Truppe_Follow_Flag"},
			SetGlobalFlagTrue{Name = "g_P207_Rohens_Army_Formation_Group_Follow"},
		},
		[300] =
		{
			Goto {X = 275, Y = 47, NpcId = 11086, WalkMode = Walk, GotoMode = GotoContinuous},
		},
		[330] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			SetGlobalFlagFalse {Name = "g_p207_stop_follow_in_cutscenes"},
			SetGlobalFlagTrue {Name = "g_p207_Bonustruppe_go_for_gold"},
		},
	},
}