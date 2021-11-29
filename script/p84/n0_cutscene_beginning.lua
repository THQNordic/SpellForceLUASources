  -----------------------------
 --------------------------------
-- Erste Cutscene nach Mapstart --
 --------------------------------
  -----------------------------
  
StartDialog01 =		-- Kamera ist etwas weiter weg, um Avatar und Startup NPC aus der Totalen zu zeigen
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p84\\start_dialog_01.lua")
   	Camera:ScriptStart()
]]
StartDialog02 =		-- Kamera etwas erhöht über dem Avatar, LookAt auf Startup NPC, dreht sich langsam nach links, um den Startup NPC
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p84\\start_dialog_02.lua")
   	Camera:ScriptStart()
]]
StartDialog03 =		-- Kamera befindet sich links neben dem Startup NPC, etwas unterhalb der Augenhöhe, LookAt auf Avatar, ohne Bewegung
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p84\\start_dialog_03.lua")
   	Camera:ScriptStart()
]]
StartDialog04 =		-- Kamera befindet sich rechts neben dem Avatar, etwas unterhalb der Augenhöhe, LookAt auf Startup NPC, ohne Bewegung
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p84\\start_dialog_04.lua")
   	Camera:ScriptStart()
]]
StartDialog05 =		-- Kamera befindet sich links neben dem Avatar, auf Kniehöhe, LookAt auf Startup NPC, langsame Linksdrehung hinter den Startup NPC
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p84\\start_dialog_05.lua")
   	Camera:ScriptStart()
]]
StartDialog06 =		-- Kamera befindet sich rechts neben dem Startup NPC, auf Hüfthöhe, LookAt auf Avatar, langsame Bewegung weg vom Avatar
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p84\\start_dialog_06.lua")
   	Camera:ScriptStart()
]]
StartDialog07 =		-- Kamera befindet sich rechts hinter dem Avatar, auf Hüfthöhe, LookAt auf Startup NPC, langsame Bewegung um den Startup NPC
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p84\\start_dialog_07.lua")
   	Camera:ScriptStart()
]]
StartDialog08 =		-- Kamera befindet sich rechts neben dem Startup NPC, auf Hüfthöhe, LookAt in Richtung Westen, langsame Bewegung rechts vorbei am Startup NPC in Richtung Westen
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p84\\start_dialog_08.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "Beginning_Cutscene", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetEffect {Effect = "SimpleInvis", NpcId = 0, Length = 2000},	-- avatar unsichtbar zu beginn. 		
		LookAtFigure{NpcId = 8342, Target = 0},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			SetEffect {Effect = "Materialize", NpcId = 0, Length = 2000},	-- avatar materialize.
			ExecuteCameraScript{Script = StartDialog01},
		},
		[30] = 
		{
			LookAtFigure{NpcId = 0, Target = 8342},
			--LookAtFigure{NpcId = 8342, Target = 0},
			Goto{X = 196, Y = 152, NpcId = 0, Range = 0, WalkMode = Walk},
		},
		[80] =
		{
			LookAtFigure{NpcId = 0, Target = 8342},
			LookAtFigure{NpcId = 8342, Target = 0},
			ExecuteCameraScript{Script = StartDialog02},
			CutSceneSay {Tag = "" ,NpcId = 8342, String = "Willkommen."},
		},	
		[110] =
		{
			ExecuteCameraScript{Script = StartDialog03},
			CutSceneSay {Tag = "" ,NpcId = 0, String = "Wo bin ich hier?"},
		},	
		[140] =
		{
			ExecuteCameraScript{Script = StartDialog04},
			CutSceneSay {Tag = "" ,NpcId = 8342, String = "Hier? Du befindest dich in den äußersten Regionen Fiara's!"},
		},	
		[180] =
		{
			ExecuteCameraScript{Script = StartDialog05},
			CutSceneSay {Tag = "" ,NpcId = 8342, String = "Mein Volk, die Elfen, hat sich hier niedergelassen, nachdem wir aus den Nordlanden vertrieben wurden."},
		},
		[230] =
		{
			ExecuteCameraScript{Script = StartDialog06},
			CutSceneSay {Tag = "" ,NpcId = 0, String = "Vertrieben?"},
		},
		[270] =
		{
			ExecuteCameraScript{Script = StartDialog07},
			CutSceneSay {Tag = "" ,NpcId = 8342, String = "Ja. Aber das spielt nun keine Rolle mehr."},
		},		
		[320] =
		{
			LookAtFigure{NpcId = 8342, Target = 8346},
			ExecuteCameraScript{Script = StartDialog08},
			CutSceneSay {Tag = "" ,NpcId = 8342, String = "Begib dich doch bitte in unsere Stadt, im Westen, und suche dort nach der Druidin. Sie kann dir sicher weiter helfen."},
		},
		[380] =
		{
			LookAtFigure{NpcId = 8342, Target = 0},
			ExecuteCameraScript{Script = StartDialog02},
			CutSceneSay {Tag = "" ,NpcId = 8342, String = "Lebe wohl."},
		},
		[420] =
		{
			SetGlobalFlagTrue{Name = "p84_startup_cutscene_zuende"}
		},
	},
}