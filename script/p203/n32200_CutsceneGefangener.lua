-----------------------------------------------------------------------
--
--	Öffnen der Blockade
--
-----------------------------------------------------------------------

-- Dummy Kamerafahrt
CameraGefangenerI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p203\\n32200_CameraGefangenerI.lua")
   	Camera:ScriptStart()
]]


CameraGefangenerII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p203\\n32200_CameraGefangenerII.lua")
   	Camera:ScriptStart()
]]

CameraGefangenerIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,8,1,"script\\p203\\n32200_CameraGefangenerIII.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "GeheimGang", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		--FigureInRange {NpcId = 8486, X = 426, Y = 235, Range = 12, UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_n_P203_TorOeffnen"}
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 8486},	
		SetNoFightFlagTrue {NpcId = 0},
		SetGlobalFlagTrue {Name = "g_n_P203_UramII"}
	},
	TimedActions =
	{
		[0] =
		{
			Goto {NpcId = 11885, WalkMode = Run, X = 387, Y = 219},
			Goto {NpcId = 8486, X = 387, Y = 219, WalkMode = Run},	
		},
		[15] =
		{
			CutSceneSay {Tag = "csa208uram_001" , NpcId = 8486, String = "Ich mache mich gleich auf den Weg, den geheimen Durchgang für Euch zu öffnen!"},
		}, 
		[30] =
		{
			WaitForEndOfSpeech,
			--ExecuteCameraScript{Script = CameraGefangenerII},
			Goto {NpcId = 11885, X = 387, Y = 219, WalkMode = Run},	
		},
		[100] =
		{
			ExecuteCameraScript{Script = CameraGefangenerI},
			SetGlobalFlagTrue {Name = "g_P203SteineWeg"},
			CutSceneSay {Tag = "csa208uram_002" , NpcId = 11885, String = "Sobald ich die Steine weggeschafft habe, können Eure Truppen dort dem Gegner in den Rücken fallen!"},
		},
		[140] =
		{
			--SetEffect {Effect = "OccludeBlackBig", Length = 2500, TargetType = World, X = 384, Y = 218},
			SetEffect {Effect = "DarkMight", Length = 2500, TargetType = World, X = 385, Y = 218},
			SetEffect {Effect = "Explo", Length = 2500, TargetType = World, X = 385, Y = 218},
			RemoveObject {X = 384,Y = 218, Object = 845},
			RemoveObject {X = 385,Y = 218, Object = 844},
			RemoveObject {X = 386,Y = 218, Object = 846},
			RemoveObject {X = 385,Y = 217, Object = 843},
		},
		[200] =
		{	
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 8486},
			SetNoFightFlagFalse {NpcId = 11885},
			SetGlobalFlagTrue {Name = "g_n_P203_UramNachHauseII"},
		},
	},
}
