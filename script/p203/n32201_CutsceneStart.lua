-----------------------------------------------------------------------
--
--	Öffnen der Blockade
--
-----------------------------------------------------------------------

-- Dummy Kamerafahrt
StartI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p203\\n32201_CameraStartI.lua")
   	Camera:ScriptStart()
]]

StartII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p203\\n32201_CameraStartII.lua")
   	Camera:ScriptStart()
]]

StartIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p203\\n32201_CameraStartIII.lua")
   	Camera:ScriptStart()
]]

StartIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\p203\\n32201_CameraStartIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Start", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		IsMonumentInUse {X = 107, Y = 358, Range = 0, UpdateInterval = 10},
		--IsMonumentInUse {X = 109, Y = 358, Range = 0, UpdateInterval = 10},
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 10101},	
		SetNoFightFlagTrue {NpcId = 0},
		QuestSolve {QuestId = 945},
		LookAtDirection {NpcId = 10101, Direction = 3},
	},
	TimedActions =
	{
		[30] =
		{
			ExecuteCameraScript{Script = StartI},	
		},
		[50] =
		{
			WaitForEndOfSpeech,
			Goto {NpcId = 0, X = 123, Y = 385, WalkMode = Run},
			Follow {NpcId = 10105, Target = 0},
			CutSceneSay {Tag = "csa207avatar_001" , NpcId = 0, String = "Heda! Fischersmann! Eine Frage ..."},
		},
		[95] =
		{
			ExecuteCameraScript{Script = StartIV},
		},
		[100] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa207anuk_002" , NpcId = 10101, String = "Bitte, nehmt mir nicht alles weg! Bitte!"},
		},
		[150] =
		{	
			WaitForEndOfSpeech,
			LookAtDirection {NpcId = 0, Direction = 0},	
			CutSceneSay {Tag = "csa207avatar_003" , NpcId = 0, String = "Ich will nicht Eure Fische, guter Mann, nur Eure Ortskenntnis. Wo bin ich hier?"},
		},
		[200] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa207anuk_004" , NpcId = 10101, String = "Dies ist die Onyxbucht, nördlichste Provinz des goldenen Reiches unter seiner Herrlichkeit Kaiser Magnus Arias von Xu."},
		},
		[250] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa207avatar_005" , NpcId = 0, String = "Wie weit noch bis Empyria?"},
		},
		[300] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa207anuk_006" , NpcId = 10101, String = "Nicht weit! Ihr müsst dieses Land nach Süden durchqueren."},
		},
		[370] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = StartII},
			CutSceneSay {Tag = "csa207anuk_007" , NpcId = 10101, String = "Aber der Weg dahin wird Euch Euer Blut kosten!"},	
		},
		[420] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa207anuk_008" , NpcId = 10101, String = "Räuber halten die Handleswege versperrt und belagern unser Dorf!"},
		},
		[460] =
		{
			CutSceneSay {Tag = "csa207anuk_009" , NpcId = 10101, String = "Sie sind wie hungrige Wölfe! Allein am Pass nach Süden steht ein Haufen von ihnen, der selbst der kaiserlichen Armee Respekt beibringen würde! Allein kommt Ihr dort nicht durch!"},
		},
		[540] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = StartIII},
			CutSceneSay {Tag = "csa207avatar_010" , NpcId = 0, String = "Ich werde also ein Lager brauchen ... und genug Nahrung für ein großes Heer!"},
		},
		[540] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa207avatar_011" , NpcId = 0, String = "Guter Freund, ich fürchte ich muss doch auf Eure Fische zurückkommen ..."},
		},
		[600] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa207anuk_012" , NpcId = 10101, String = "Bedient Euch meiner bescheidenen Hütte! Solange es Euch gelingt unser Dorf zu befreien, bin ich glücklich! Sprecht dort mit Tario, dem Dorfältesten!"},
		}, 
		[660] =
		{	
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 10101},
			ChangeBuildingRace {Race = 1, X = 130, Y = 393},
			ChangeBuildingOwner {X = 130, Y = 393},
			QuestBegin {QuestId = 803},
		},
	},
}
