  -----------------------------
 --------------------------------
-- Erste Cutscene nach Mapstart --
 --------------------------------
  -----------------------------
  
Camera001 =		-- Kamera zeigt Portal
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera001.lua")
   	Camera:ScriptStart()
]]
Camera002 =		-- Kamera fährt hinter dem Portal, zeigt die Berge
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera002.lua")
   	Camera:ScriptStart()
]]
Camera003 =		-- Kamera fährt vor erster Festung
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera003.lua")
   	Camera:ScriptStart()
]]
Camera004 =		-- Kamera fährt vor vierter Festung
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera004.lua")
   	Camera:ScriptStart()
]]
Camera005 =		-- Kamera lookat auf NPC 11868
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera005.lua")
   	Camera:ScriptStart()
]]
Camera006 =		-- Kamera lookat auf NPC 11864
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera006.lua")
   	Camera:ScriptStart()
]]
Camera007 =		-- Kamera hält voll auf Rohens Freddy Kruger Visage
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera007.lua")
   	Camera:ScriptStart()
]]
Camera008 =		-- Kamera zeigt auf Alyah von vorn
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera008.lua")
   	Camera:ScriptStart()
]]
Camera009 =		-- Kamera hinter Rohen, zeigt in Blickrichtung der laufenden Untoten... ganz leichte Kamerabewegung nach vorn
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera009.lua")
   	Camera:ScriptStart()
]]
Camera010 =		-- Kamera hinter Alyah, zeigt auf Urias
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera010.lua")
   	Camera:ScriptStart()
]]
Camera011 =		-- Kamera hinter Urias, zeigt auf Alyah
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera011.lua")
   	Camera:ScriptStart()
]]
Camera012 =		-- Kamera hinter Avatar und Urias, zeigt zur weglaufenden Alyah
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera012.lua")
   	Camera:ScriptStart()
]]
Camera013 =		-- Kamera Urias, Alyah und Avatar
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera013.lua")
   	Camera:ScriptStart()
]]
Camera014 =		-- Kamera hinter Urias und Avatar
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera014.lua")
   	Camera:ScriptStart()
]]
Camera015 =		-- Kamera fährt auf Avatar zu, Close-Up
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32410_cutscene_beginning_camera015.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P207_Cutscene_Beginning", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
	},
	BeginActions =
	{
		SetEffect {Effect = "SimpleInvis", NpcId = 0, Length = 3000},	-- Avatar unsichtbar zu beginn
		TeleportAvatar{X = 288, Y = 481},
		SetGlobalFlagTrue {Name = "g_p207_Cutscene_Beginning_Dummies_Spawn"},
		LookAtDirection {Direction = South , NpcId = Avatar},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetGlobalFlagTrue {Name = "g_p207_stop_follow_in_cutscenes"},	
	},
	TimedActions =
	{
		[0] =
		{
			ExecuteCameraScript{Script = Camera001},
		},		
		[20] =
		{
			SetEffect {Effect = "MaterializeInMonument", NpcId = 0, Length = 2000},	-- avatar materialize.
		},
		[40] =
		{
			StopEffect {NpcId = 0}, -- Avatar Materalize Effekt aus
		},
		[50] =
		{
			Goto {NpcId = 0, X = 288, Y = 476, WalkMode = Walk}, -- Avatar
		},
		[70] =
		{
			SetGlobalFlagTrue{Name = "p207_Alyah_Beginning"},			
		},
		[90] =
		{
			Goto {NpcId = 10060, X = 290, Y = 477, WalkMode = Walk}, -- Aliyah
		},
		[100] =
		{
			SetGlobalFlagTrue{Name = "p207_Urias_Beginning"},			
		},
		[130] =
		{
			Goto {NpcId = 10061, X = 286, Y = 476, WalkMode = Walk}, -- Urias
		},
		[150] =
		{
			ExecuteCameraScript{Script = Camera002},
		},
		[160] =
		{
			CutSceneSay {Tag = "csa225alyah_001" ,NpcId = 10060, String = "Der Rabenpass! Es ist ein rauer Aufstieg, aber der schnellste Weg nach Kathai!"},
		},
		[165] =
		{
			SetEffect {Effect = "Lightning", X = 272, Y = 428, TargetType = World, Length = 1000},	-- Blitz
		},
		[175] =
		{
			SetEffect {Effect = "Lightning", X = 292, Y = 382, TargetType = World, Length = 1000},	-- Blitz
		},
		[180] =
		{
			SetEffect {Effect = "Lightning", X = 285, Y = 400, TargetType = World, Length = 1000},	-- Blitz
		},
		[190] =
		{
			ExecuteCameraScript{Script = Camera003},
		},
		[200] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa225urias_002" ,NpcId = 10061, String = "Was sind das für Festungen?"},
		},
		[210] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera004},
		},
		[225] =
		{
			CutSceneSay {Tag = "csa225alyah_003" ,NpcId = 10060, String = "Bevor die Menschen hierher kamen, waren das hier Hochburgen der Norcaine. Aber sie sind längst verlassen."},
		},
		[240] = 
		{
			Goto {NpcId = 11868, X = 210, Y = 306, WalkMode = Walk},
			Goto {NpcId = 11869, X = 211, Y = 305, WalkMode = Walk},
			Goto {NpcId = 11870, X = 209, Y = 304, WalkMode = Walk},
			Goto {NpcId = 11871, X = 210, Y = 303, WalkMode = Walk},
		},
		[260] =
		{   
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = Camera005},
			CutSceneSay {Tag = "csa225avatar_004" ,NpcId = 0, String = "Nun, wie es scheint haben sie neue Bewohner bekommen!"},
		},
		[270] =
		{
			Goto {NpcId = 11864, X = 171, Y = 319, WalkMode = Walk},
			Goto {NpcId = 11865, X = 172, Y = 321, WalkMode = Walk},
			Goto {NpcId = 11866, X = 170, Y = 320, WalkMode = Walk},
			Goto {NpcId = 11867, X = 170, Y = 318, WalkMode = Walk},
		},
		[290] =
		{
			ExecuteCameraScript{Script = Camera006},
		},
		[300] =
		{
			LookAtDirection{NpcId = 11252, Direction = North}, -- Rohen schaut nach Norden
		},
		[320] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera007},
			CutSceneSay {Tag = "csa225rohen_005" ,NpcId = 11252, String = "Vorwärts, Gesindel! Versiegelt den Pass!"},
		},
		[350] =
		{	
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera008},
			CutSceneSay {Tag = "csa225alyah_006" ,NpcId = 10060, String = "Verdammt! Das müssen die Untoten sein, von denen Haran gesprochen hat!"},
		},
		[360] =
		{
			LookAtDirection{NpcId = 11252, Direction = North}, -- Rohen schaut nach Norden
		},
		[380] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera009},
			CutSceneSay {Tag = "csa225rohen_007" ,NpcId = 11252, String = "An die Wälle! Sichert die Tore! Noch heute kostet ihr Menschenfleisch!"},
		},
		[390] =
		{			
			Goto {NpcId = 11253, X = 343, Y = 147, WalkMode = Run},
			Follow {NpcId = 11886, Target = 11253},
			Follow {NpcId = 11889, Target = 11253},
			Goto {NpcId = 11254, X = 344, Y = 146, WalkMode = Run},
			Follow {NpcId = 11887, Target = 11254},
			Follow {NpcId = 11890, Target = 11254},
			Goto {NpcId = 11255, X = 345, Y = 145, WalkMode = Run},
			Follow {NpcId = 11888, Target = 11255},
			Follow {NpcId = 11891, Target = 11255},
			Goto {NpcId = 11256, X = 347, Y = 146, WalkMode = Run},
			Follow {NpcId = 11892, Target = 11256},
			Goto {NpcId = 11257, X = 348, Y = 142, WalkMode = Run},
			Follow {NpcId = 11893, Target = 11257},
			Goto {NpcId = 11258, X = 349, Y = 149, WalkMode = Run},
			Follow {NpcId = 11894, Target = 11258},
			Follow {NpcId = 11896, Target = 11258},
			Goto {NpcId = 11259, X = 350, Y = 147, WalkMode = Run},
			Follow {NpcId = 11895, Target = 11259},
		},
		[420] =
		{
			Goto {NpcId = 11252, X = 346, Y = 114, WalkMode = Walk},
		},
		[425] =
		{
			WaitForEndOfSpeech,
		},
		[430] =
		{
			ExecuteCameraScript{Script = Camera010},
			LookAtFigure{NpcId = 10060, Target = 10061}, -- Alyah schaut Urias an
			LookAtFigure{NpcId = 0, Target = 10060}, -- Avatar schaut Alyah an
			LookAtFigure{NpcId = 10061, Target = 10060}, -- Urias schaut Alyah an
			CutSceneSay {Tag = "csa225alyah_008" ,NpcId = 10060, String = "Dreimal verflucht! Ich werde versuchen Hilfe zu holen!"},
		},
		[450] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera011},
			LookAtFigure{NpcId = 10060, Target = 10061}, -- Alyah schaut Urias an
			LookAtFigure{NpcId = 0, Target = 10061}, -- Avatar schaut Alyah an
			LookAtFigure{NpcId = 10061, Target = 10060}, -- Urias schaut Alyah an
			CutSceneSay {Tag = "csa225urias_009" ,NpcId = 10061, String = "Wie wollt ihr das anstellen, Frau?"},
		},
		[470] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera010},
			LookAtFigure{NpcId = 10060, Target = 10061}, -- Alyah schaut Urias an
			LookAtFigure{NpcId = 0, Target = 10060}, -- Avatar schaut Alyah an
			LookAtFigure{NpcId = 10061, Target = 10060}, -- Urias schaut Alyah an
			CutSceneSay {Tag = "csa225alyah_010" ,NpcId = 10060, String = "Ich kenn die Tunnel unter dem Berg! Dadurch kann ich vielleicht bis nach Kathai durchbrechen und dort Verstärkung holen!"},
		},
		[500] =
		{
			WaitForEndOfSpeech,
			Goto {NpcId = 10060, X = 286, Y = 472, WalkMode = Run},	-- Alyah läuft weg
		},
		[510] =
		{
			ExecuteCameraScript{Script = Camera012},
			LookAtDirection{NpcId = 10061, Direction = South}, -- Urias schaut nach Süden
			LookAtDirection{NpcId = 0, Direction = South}, -- Avatar schaut nach Süden
			CutSceneSay {Tag = "csa225urias_011" ,NpcId = 10061, String = "Warum nehmt ihr uns nicht mit? Wartet!"},
			LookAtFigure{NpcId = 10060, Target = 10061}, -- Alyah schaut Urias an
		},
		[520] =
		{
			LookAtFigure{NpcId = 10060, Target = 10061}, -- Alyah schaut Urias an
		},
		[530] =
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 10060, Target = 10061}, -- Alyah schaut Urias an
			Goto {NpcId = 10061, X = 285, Y = 472, WalkMode = Run},	-- Urias läuft zu Alyah
		},
		[540] =
		{
			Goto {NpcId = 0, X = 286, Y = 473, WalkMode = Run},	-- Avatar folgt Urias
		},
		[560] =
		{
			ExecuteCameraScript{Script = Camera013},
			LookAtFigure{NpcId = 10060, Target = 10061}, -- Alyah schaut Urias an
			LookAtFigure{NpcId = 0, Target = 10060}, -- Avatar schaut Alyah an
			LookAtFigure{NpcId = 10061, Target = 10060}, -- Urias schaut Alyah an
			CutSceneSay {Tag = "csa225alyah_012" ,NpcId = 10060, String = "Ihr würdet Euch in der Finsternis nur verlaufen, Tölpel! Wünscht mir Glück!"},
		},
		[590] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera014},
			Goto {NpcId = 10060, X = 267, Y = 479, WalkMode = Run}, -- Aliyah
			LookAtDirection{NpcId = 10061, Direction = SouthWest}, -- Urias schaut nach Süd-West
			LookAtDirection{NpcId = 0, Direction = SouthWest}, -- Avatar schaut nach Süd-West
			CutSceneSay {Tag = "csa225urias_013" ,NpcId = 10061, String = "Wartet! Ach, hitzköpfiges Weib!"},
		},
		[620] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera015},
			Goto {NpcId = 0, X = 286, Y = 472, WalkMode = Walk}, -- Avatar stellt sich neben Urias
			LookAtDirection{NpcId = 10061, Direction = South}, -- Urias schaut nach Süden
			CutSceneSay {Tag = "csa225avatar_014" ,NpcId = 0, String = "Lass sie, Urias. Wir schaffen den Durchbruch."},
		},
		[640] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa225avatar_015" ,NpcId = 0, String = "Aber das bedeutet Krieg!"},
		},
		[650] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "g_sP207_Urias_Follow"},
			SetGlobalFlagTrue {Name = "g_p207_Cutscene_Beginning_Dummies_Despawn"},
			SetGlobalFlagTrue {Name = "g_p207_Cutscene_Beginning_Played"},
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},	
			SetGlobalFlagFalse {Name = "g_p207_stop_follow_in_cutscenes"},	
		},		
		[680] =
		{			
		},
	},
}