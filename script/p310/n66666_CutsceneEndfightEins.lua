-----------------------------------------------------------------------
--
--	Öffnen der Blockade
--
-----------------------------------------------------------------------

-- Dummy Kamerafahrt
CameraEndfightI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p310\\n66666_CameraEndfightEinsI.lua")
   	Camera:ScriptStart()
]]


CameraEndfightII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\p310\\n66666_CameraEndfightEinsII.lua")
   	Camera:ScriptStart()
]]

CameraEndfightIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,8,1,"script\\p310\\n66666_CameraEndfightEinsIII.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "EndfightI", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		FigureInRange {NpcId = 0, X = 40, Y = 168, Range = 12, UpdateInterval = 20},
		PlayerHasItem {ItemId = 7253},
		PlayerHasItem {ItemId = 7259},
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298},
			PlayerHasItem {ItemId = 7299}
		}),
		IsGlobalFlagFalse {Name = "CoopCutsceneBlocker"},
			
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 10366},	
		SetNoFightFlagTrue {NpcId = 10048},	
		SetNoFightFlagTrue {NpcId = 0},
		EnableDialog {NpcId = 10366},
		SetGlobalFlagTrue {Name = "CoopCutsceneBlocker"},
		
	},
	TimedActions =
	{
		[10] =
		{
			SetGlobalFlagTrue {Name = "UmspawnInit"},
			ExecuteCameraScript{Script = CameraEndfightI},	
		},
		[20] =
		{
			Goto {NpcId = 10366, X = 39, Y = 167, WalkMode = Walk},
			Goto {NpcId = 10048, X = 40, Y = 168, WalkMode = Run},
		}, 
		[30] =
		{
			ExecuteCameraScript{Script = CameraEndfightIII},
			CutSceneSay {Tag = "csa250nightsong_001" , NpcId = 10048, String = "Bleibt stehen, Schlange von Dragh’Lur!"},
		},
		[70] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa250nazshar_002" , NpcId = 10366, String = "Sieh an, das Halbblut! Wollt Ihr mich aufhalten?"},
		},
		[140] =
		{
			ExecuteCameraScript{Script = CameraEndfightII},   
			CutSceneSay {Tag = "csa250nightsong_003" , NpcId = 10048, String = "Ihr habt meine Gefährten ermorden lassen! Ihr seid der Täuscher aus dem ewigen Lied! Und ich werde Euch wieder in Euer Seelengrab verbannen, so wie mein Vater es damals tat! "},
			LookAtFigure {Target = 10366, NpcId = 10048},
		},
		[180] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 10366, Target = 10048}, 
			CutSceneSay {Tag = "csa250nazshar_004" , NpcId = 10366, String = "Ihr wisst nichts, Lichtbeterhure!"},
			Goto {X = 40, Y = 166, NpcId = 0}
		},
		[220] =
		{ 
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa250nazshar_005" , NpcId = 10366, String = "Und es ist bereits vollbracht! Das Werk ist getan, die Schatten sind hier! Das Tor ist geöffnet! Selbst wenn Ihr mich tötet, die Schatten könnt Ihr nicht aufhalten!"},
		},
		[240] =
		{   
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa250nazshar_006" , NpcId = 10366, String = "Ah, Bote! Das Schicksal führt Euch her! Wählt nun Euren Weg!"},
		},
		[280] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa250nightsong_007" , NpcId = 10048, String = "Runenkrieger, helft mir, diese Schlange aufzuhalten!"},
		},
		[320] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa250nazshar_008" , NpcId = 10366, String = "Oder helft mir, diese Schande der Norcaine zu vernichten und mein Volk zu neuem Ruhm zu führen!"},
		},
		[360] =
		{	
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 10366},
			SetNoFightFlagFalse {NpcId = 10048},
			SetGlobalFlagFalse {Name = "UmspawnInit"},
			SetGlobalFlagFalse {Name = "CoopCutsceneBlocker"},
		},
	},
}
