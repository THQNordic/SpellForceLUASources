  -----------------------------
 --------------------------------
-- Erste Cutscene nach Mapstart --
 --------------------------------
  -----------------------------
  
TownEntryDialog01 =		-- Kamera macht einen Rundflug durch die Stadt, Lookat's auf die Gebäude und Statue im Teich
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\town_entry_dialog01.lua")
   	Camera:ScriptStart()
]]
TownEntryDialog02 =		-- Kamera befindet sich rechts neben dem Avatar, Lookat auf den Stadteingangs NPC
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\town_entry_dialog02.lua")
   	Camera:ScriptStart()
]]
TownEntryDialog03 =		-- Kamera befindet sich links neben dem Stadteingangs NPC, Lookat auf den Avatar
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p84\\town_entry_dialog03.lua")
   	Camera:ScriptStart()
]]
CityFlyBy =		-- Kamera macht einen Rundflug durch die Stadt, Lookat's auf die Gebäude und Statue im Teich
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,44,1,"script\\p84\\city_fly_by.lua")
   	Camera:ScriptStart()
]]
CityFlyBy001 =		-- Kamera fliegt durch die Stadtore einen Bogen nach rechts, mit Lookat auf die Statue
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\city_fly_by_001.lua")
   	Camera:ScriptStart()
]]
CityFlyBy002 =		-- Kamera bewegt sich um die Schützenhalle, Lookat auf die Schützenhalle
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\city_fly_by_002.lua")
   	Camera:ScriptStart()
]]
CityFlyBy003 =		-- Kamera bewegt sich um das Eisenlager, Lookat auf das Eisenlager
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,8,1,"script\\p84\\city_fly_by_003.lua")
   	Camera:ScriptStart()
]]
CityFlyBy004 =		-- Kamera bewegt sich um das HQ, Lookat auf das HQ
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\city_fly_by_004.lua")
   	Camera:ScriptStart()
]]
CityFlyBy005 =		-- Kamera bewegt sich um das Holzfällerhaus, Lookat auf das Holzfällerhaus
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\city_fly_by_005.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "Town_Entry_Cutscene", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
		FigureInRange{X = 81, Y = 107, NpcId = Avatar , Range = 2}
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		-- SetEffect {Effect = "SimpleInvis", NpcId = 0, Length = 3000},	-- avatar unsichtbar zu beginn. 		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			LookAtFigure{NpcId = 0, Target = 8346},
			LookAtFigure{NpcId = 8346, Target = 0},
			ExecuteCameraScript{Script = TownEntryDialog01},
			Goto{X = 79, Y = 110, NpcId = 0, Range = 0, WalkMode = Walk},
			Goto{X = 79, Y = 111, NpcId = 8346, Range = 0, WalkMode = Walk},
		},
		[40] =
		{
			LookAtFigure{NpcId = 0, Target = 8346},
			LookAtFigure{NpcId = 8346, Target = 0},
			ExecuteCameraScript{Script = TownEntryDialog02},
			CutSceneSay {Tag = "" ,NpcId = 8346, String = "Willkommen im Elfenland! Seid gegrüßt!"},
		},
		[90] =
		{
			ExecuteCameraScript{Script = TownEntryDialog03},
			CutSceneSay {Tag = "" ,NpcId = 0, String = "Wer seid Ihr? Wo bin ich hier?"},	
		},
		
		[140] =
		{
			ExecuteCameraScript{Script = TownEntryDialog02},
			CutSceneSay {Tag = "" ,NpcId = 8346, String = "Ich bin die Torwächterin. Hinter mir seht ihr die Stadt Elfias End. Meine Heimat."},
		},
		[190] =
		{
			ExecuteCameraScript{Script = TownEntryDialog02},
			CutSceneSay {Tag = "" ,NpcId = 8346, String = "Wenn ihr es wünscht, führe ich euch ein wenig herum."},
		},
		[240] =
		{
			ExecuteCameraScript{Script = TownEntryDialog03},
			CutSceneSay {Tag = "" ,NpcId = 0, String = "Gewiss. Zeigt mir Eure Stadt!"},
		},
		[290] =
		{
			ExecuteCameraScript{Script = CityFlyBy001},
		},
		[350] = -- immer 6 Sekunden pro Haus
		{
			ExecuteCameraScript{Script = CityFlyBy002},
			CutSceneSay {Tag = "" , NpcId = 8346, String = "Hier seht ihr unsere Schützenhalle.", Color = ColorYellow},
		},
		[410] =
		{
			ExecuteCameraScript{Script = CityFlyBy003},
			CutSceneSay {Tag = "" , NpcId = 8346, String = "Dieses ist unser Eisenlager.", Color = ColorYellow},
		},		
		[470] =
		{
			ExecuteCameraScript{Script = CityFlyBy004},
			CutSceneSay {Tag = "" , NpcId = 8346, String = "Ist unser Rathaus nicht wunderschön?", Color = ColorYellow},
		},
		[520] =
		{
			CutSceneSay {Tag = "" , NpcId = 0, String = "Ja, ganz toll!"},
		},	
		[550] =
		{
			ExecuteCameraScript{Script = CityFlyBy005},
			CutSceneSay {Tag = "" , NpcId = 8346, String = "Unser Holz lagern wir hier.", Color = ColorYellow},
		},	
		--[470] =
		--{
		--	CutSceneSay {Tag = "TownEntryDialog09" , NpcId = 8346, String = "Auch wir müssen Nahrung zu uns nehmen. Unser Jagdhaus."},
		--},			
		--[530] =
		--{
		--	CutSceneSay {Tag = "TownEntryDialog10" , NpcId = 8346, String = "Das ist die Waffenkammer."},
		--},
		--[570] =
		--{
		--	CutSceneSay {Tag = "TownEntryDialog11" , NpcId = 8346, String = "Und hier, unser ganzer Stolz. Ein Wahrzeichen der Elfen."},
		--},
		--[630] =
		--{
		--	ExecuteCameraScript{Script = TownEntryDialog02},
		--	CutSceneSay {Tag = "TownEntryDialog12" , NpcId = 8346, String = "Wie gefällt dir unsere Stadt?"},
		--},
		--[680] =
		--{
		--	ExecuteCameraScript{Script = TownEntryDialog02},
		--	CutSceneSay {Tag = "TownEntryDialog13" , NpcId = 0, String = "Oh, sie ist... nett?"},
		--},
		--[730] =
		--{
		--	ExecuteCameraScript{Script = TownEntryDialog02},
		--	CutSceneSay {Tag = "TownEntryDialog14" , NpcId = 8346, String = "Es freut mich, wenn sie dir gefällt, aber schau dich ruhig selber ein wenig um."},
		--},
		--[775] =
		--{
		--	Goto{X = 81, Y = 157, NpcId = 8346, Range = 0, WalkMode = Walk},
		--},
		[610] =
		{	
		},
	},
}