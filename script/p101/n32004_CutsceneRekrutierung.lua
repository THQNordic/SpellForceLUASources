-----------------------------------------------------------------------
--
--	Rekrutierung
--
-----------------------------------------------------------------------

-- totale
CameraRekrutierungI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p101\\n5536_CameraRekrutierungI.lua")
   	Camera:ScriptStart()
]]

-- auf gehts leute!
CameraRekrutierungII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraRekrutierungII.lua")
   	Camera:ScriptStart()
]]

-- aedr nah
CameraRekrutierungIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraRekrutierungIII.lua")
   	Camera:ScriptStart()
]]

-- grim nah
CameraRekrutierungIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraRekrutierungIV.lua")
   	Camera:ScriptStart()
]]

-- vogelperspektive auf grim
CameraRekrutierungV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraRekrutierungV.lua")
   	Camera:ScriptStart()
]]

-- grim und aedar
CameraRekrutierungVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraRekrutierungVI.lua")
   	Camera:ScriptStart()
]]

-- totale gegenschuss
CameraRekrutierungVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraRekrutierungVII.lua")
   	Camera:ScriptStart()
]]

-- grim geht ab
CameraRekrutierungVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraRekrutierungVIII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Rekrutierung", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet wenn spieler (u.U. mit grim und lea) am zweiten, oestlichen flüchtlingslager ankommt UND Q Heldenbeschwörung solved.
		PlayerUnitInRange{X = 300, Y = 129, Range = 8, FigureType = FigureAvatar, UpdateInterval = 15},	
		--Reowys
		IsCreoActive {CreoId = 1747},
		-- Dunhan
		IsCreoActive {CreoId = 1746},
		QuestState {QuestId = 588, State = StateActive, UpdateInterval = 60 },
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetGlobalFlagTrue {	Name = "CutsceneInitRekrutierung" }, -- umspawn grim
		SetGlobalFlagTrue {	Name = "CutsceneInitRekrutierungAedar" }, -- umspawn aedar		
		
		-- WAS IST MIT LENA --> sie folgt einfach per follow, hat keine rolle, also kein umspawn.
		
		SetNoFightFlagTrue {NpcId = 0},		
		SetNoFightFlagTrue {NpcId = 7011}, -- grim level 2
		SetNoFightFlagTrue {NpcId = 5539}, -- aedar	
		--SetGlobalFlagFalse {Name = "AedarIstImWesten"}, --aedar dialog weg
		RemoveDialog{NpcId = 5539},	-- aedar
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = CameraRekrutierungI},			
		},
		[30] = 
		{
			SetNoFightFlagTrue {NpcId = 7011},		
			SetNoFightFlagTrue {NpcId = 5539},				
			ExecuteCameraScript{Script = CameraRekrutierungII},				
			CutSceneSay {Tag = "cs04GrimP101_001", NpcId = 7011, String = "Kommt heraus aus Euren Höhlen! Die Zeit des Klagens ist vorbei! Zu den Waffen!"},
			LookAtFigure {NpcId = 0, Target = 5539},
			LookAtFigure {NpcId = 5539, Target = 7011},
			LookAtFigure {NpcId = 7011, Target = 5539},
			Goto {X = 297, Y = 125, NpcId = 7011, Range = 0, WalkMode = Walk, GotoMode = GotoNormal }, -- grim
			Goto {X = 299, Y = 130, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal }, -- avatar	
		},
		[90] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraRekrutierungVI},				
			CutSceneSay {Tag = "cs04AedarP101_001", NpcId = 5539, String = "Werden Dunhan und Reowys uns anführen?"},
			LookAtFigure {NpcId = 0, Target = 5539},
			LookAtFigure {NpcId = 5539, Target = 7011},
			LookAtFigure {NpcId = 7011, Target = 5539},			

			Goto {X = 295, Y = 120, NpcId = 5679, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 299, Y = 119, NpcId = 5680, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
			Goto {X = 298, Y = 123, NpcId = 5681, Range = 0, WalkMode = Run, GotoMode = GotoNormal },
			Goto {X = 298, Y = 121, NpcId = 5685, Range = 2, WalkMode = Walk, GotoMode = GotoNormal },
			Goto {X = 297, Y = 121, NpcId = 5686, Range = 2, WalkMode = Run, GotoMode = GotoNormal },
			Goto {X = 296, Y = 121, NpcId = 5687, Range = 2, WalkMode = Run, GotoMode = GotoNormal },
			Goto {X = 295, Y = 121, NpcId = 5688, Range = 2, WalkMode = Run, GotoMode = GotoNormal },
			
			SetNoFightFlagTrue {NpcId = 5679},	
			SetNoFightFlagTrue {NpcId = 5681},	
			SetNoFightFlagTrue {NpcId = 5682},	
			SetNoFightFlagTrue {NpcId = 5683},	
			SetNoFightFlagTrue {NpcId = 5684},	
			SetNoFightFlagTrue {NpcId = 5685},	
			SetNoFightFlagTrue {NpcId = 5686},	
			SetNoFightFlagTrue {NpcId = 5687},	
			SetNoFightFlagTrue {NpcId = 5688},	
			SetNoFightFlagTrue {NpcId = 5689},			
			SetNoFightFlagTrue {NpcId = 5690},	
			SetNoFightFlagTrue {NpcId = 5691},	
			SetNoFightFlagTrue {NpcId = 5692},	
			SetNoFightFlagTrue {NpcId = 5693},	
			SetNoFightFlagTrue {NpcId = 5772},	
			SetNoFightFlagTrue {NpcId = 5773},	
			SetNoFightFlagTrue {NpcId = 5774},	
			SetNoFightFlagTrue {NpcId = 5775},	
			SetNoFightFlagTrue {NpcId = 5776},	
			SetNoFightFlagTrue {NpcId = 5680},					
		},
		[120] = 
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraRekrutierungI},				
			CutSceneSay {Tag = "cs04GrimP101_002", NpcId = 7011, String = "Ihre Kraft dient jetzt diesem Runenkrieger. Sie werden an unserer Seite kämpfen."},
			LookAtFigure {NpcId = 0, Target = 5539},
			LookAtFigure {NpcId = 5539, Target = 7011},
			LookAtFigure {NpcId = 7011, Target = 5539},			
			Goto {X = 297, Y = 124, NpcId = 5682, Range = 2, WalkMode = Run, GotoMode = GotoNormal },
			Goto {X = 296, Y = 124, NpcId = 5683, Range = 2, WalkMode = Run, GotoMode = GotoNormal },
			Goto {X = 300, Y = 122, NpcId = 5684, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 296, Y = 123, NpcId = 5689, Range = 2, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 295, Y = 121, NpcId = 5690, Range = 2, WalkMode = Run, GotoMode = GotoNormal},
			
			Goto {X = 298, Y = 121, NpcId = 5691, Range = 2, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 296, Y = 120, NpcId = 5692, Range = 2, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 295, Y = 120, NpcId = 5693, Range = 2, WalkMode = Run, GotoMode = GotoNormal},
		},
		[160] = 
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraRekrutierungIII},				
			CutSceneSay {Tag = "cs04AedarP101_002", NpcId = 5539, String = "Gegen Elfen? Diener des Lichts? Gegen Orks und Sklaventreiber zu kämpfen, war etwas anderes!"},
			LookAtFigure {NpcId = 0, Target = 5539},
			LookAtFigure {NpcId = 5539, Target = 7011},
			LookAtFigure {NpcId = 7011, Target = 5539},					
			Goto {X = 294, Y = 117, NpcId = 5772, Range = 2, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 294, Y = 116, NpcId = 5773, Range = 2, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 294, Y = 115, NpcId = 5774, Range = 2, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 293, Y = 116, NpcId = 5775, Range = 2, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 292, Y = 118, NpcId = 5776, Range = 2, WalkMode = Run, GotoMode = GotoNormal},
		},
		[210] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraRekrutierungVIII},				
			LookAtDirection {NpcId = 7011, Direction = SouthEast},				
			CutSceneSay {Tag = "cs04GrimP101_003", NpcId = 7011, String = "Lasst Euch nicht blenden von ihrer Schönheit. Sie sind kalt und grausam wie das Eis."},
		},		
		[250] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraRekrutierungVII},	
			LookAtFigure {NpcId = 5539, Target = 7011},	
			LookAtFigure {NpcId = 7011, Target = 5539},
			Goto {X = 296, Y = 126, NpcId = 7011, Range = 0, WalkMode = Walk, GotoMode = GotoNormal}, -- grim			
			CutSceneSay {Tag = "cs04GrimP101_004", NpcId = 7011, String = "Bleibt Ihr nur bei Eurem Lagerfeuer und Euren Geschichten, alter Mann!"},
		},			
		[290] = 
		{
			WaitForEndOfSpeech,		
			Goto {X = 299, Y = 123, NpcId = 7011, Range = 0, WalkMode = Walk, GotoMode = GotoNormal}, -- grim								
			CutSceneSay {Tag = "cs04GrimP101_005", NpcId = 7011, String = "Aber jeder, der Mut hat und Dunhan und Reowys seine Ehre erweisen will, der folge mir! Auf in die Stadt!"},
			
			LookAtFigure {NpcId = 5679, Target = 7011},
			LookAtFigure {NpcId = 5681, Target = 7011},
			LookAtFigure {NpcId = 5682, Target = 7011},
			LookAtFigure {NpcId = 5683, Target = 7011},
			LookAtFigure {NpcId = 5684, Target = 7011},
			LookAtFigure {NpcId = 5685, Target = 7011},
			LookAtFigure {NpcId = 5687, Target = 7011},
			LookAtFigure {NpcId = 5688, Target = 7011},
			LookAtFigure {NpcId = 5689, Target = 7011},
			LookAtFigure {NpcId = 5690, Target = 7011},
			LookAtFigure {NpcId = 5691, Target = 7011},
			LookAtFigure {NpcId = 5692, Target = 7011},
			LookAtFigure {NpcId = 5693, Target = 7011},
			LookAtFigure {NpcId = 5772, Target = 7011},
			LookAtFigure {NpcId = 5773, Target = 7011},
			LookAtFigure {NpcId = 5774, Target = 7011},
			LookAtFigure {NpcId = 5775, Target = 7011},
			LookAtFigure {NpcId = 5776, Target = 7011},
			LookAtFigure {NpcId = 5680, Target = 7011},
		},				
		[350] = 
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "SklavenÜbergeben"},
			SetGlobalFlagTrue {Name = "SklavenRespawnen"},
			QuestSolve {QuestId = 588, ActivateNextQuest = FALSE }, -- end Quest westliches Flüchtlingslager
			
			SetNoFightFlagFalse {NpcId = 7011},
			SetNoFightFlagFalse {NpcId = 5539},
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 5679},	
			SetNoFightFlagFalse {NpcId = 5681},	
			SetNoFightFlagFalse {NpcId = 5682},	
			SetNoFightFlagFalse {NpcId = 5683},	
			SetNoFightFlagFalse {NpcId = 5684},	
			SetNoFightFlagFalse {NpcId = 5685},	
			SetNoFightFlagFalse {NpcId = 5686},	
			SetNoFightFlagFalse {NpcId = 5687},	
			SetNoFightFlagFalse {NpcId = 5688},	
			SetNoFightFlagFalse {NpcId = 5689},			
			SetNoFightFlagFalse {NpcId = 5690},	
			SetNoFightFlagFalse {NpcId = 5691},	
			SetNoFightFlagFalse {NpcId = 5692},	
			SetNoFightFlagFalse {NpcId = 5693},	
			SetNoFightFlagFalse {NpcId = 5772},	
			SetNoFightFlagFalse {NpcId = 5773},	
			SetNoFightFlagFalse {NpcId = 5774},	
			SetNoFightFlagFalse {NpcId = 5775},	
			SetNoFightFlagFalse {NpcId = 5776},	
			SetNoFightFlagFalse {NpcId = 5680},		
			SetGlobalTimeStamp{Name = "AbSpielerHatQuestarmee"}, -- Flag für Timer: Outcry Grim zum Angriff	
			Follow {Target = 0, NpcId = 7010},
			SetGlobalFlagFalse {	Name = "CutsceneInitRekrutierung" },			
			SetGlobalFlagFalse {	Name = "CutsceneInitRekrutierungAedar" },	
			EnableDialog{NpcId = 5539 , Important = FALSE}, -- Aedar
			SetDialogType {NpcId = 5539 , Type = SideQuest},
			--SetGlobalFlagTrue {Name = "AedarIstImWesten"}, --aedar dialog wieder an
									
		},
	},
}
