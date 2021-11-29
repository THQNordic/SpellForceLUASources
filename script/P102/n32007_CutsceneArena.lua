-----------------------------------------------------------------------
--
--	Arena
--
-----------------------------------------------------------------------

-- arena totale
CameraArenaI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,45,1,"script\\p102\\n5635_CameraArenaI.lua")
   	Camera:ScriptStart()
]]

-- dunhan und avatar halbnah
CameraArenaII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p102\\n5635_CameraArenaII.lua")
   	Camera:ScriptStart()
]]

-- gegenschuss dunhan avatar janina
CameraArenaIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p102\\n5635_CameraArenaIII.lua")
   	Camera:ScriptStart()
]]

-- kleine fahrt um die ganze gruppe
CameraArenaIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p102\\n5635_CameraArenaIV.lua")
   	Camera:ScriptStart()
]]

-- kleine fahrt um die ganze gruppe
CameraArenaV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p102\\n5635_CameraArenaV.lua")
   	Camera:ScriptStart()
]]

-- kleine fahrt um die ganze gruppe
CameraArenaVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p102\\n5635_CameraArenaVI.lua")
   	Camera:ScriptStart()
]]

-- dunhan nah
CameraArenaVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p102\\n5635_CameraArenaVII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Arena", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue { Name = "StartCutSzene03" }, --Wenn der kithar General gestorben ist
		FigureInRange { X = 194 , Y = 357 , NpcId = Avatar , Range = 10},-- avatar bei der arena
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},
		
		-- SOLLEN GRIM, LENA UND JANINA umgespawnt werden, wenn die Cutscene beginnt?	
		-- grim und lena werden ggf. umgespawnt 	
		-- janina gibts zweimal - killable/unkillable - ok
		-- setrius wird umgespawnt - ok
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			Goto {NpcId = 0, X = 182, Y = 374, WalkMode = Run},	--avatar
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraArenaI},
			SetGlobalFlagTrue { Name = "StartFinish"}, -- setrius, grim und lena werden zur arena gespawnt. janina unkillable wird despawnt, janina killable wird gespawnt
			
			SetNoFightFlagTrue {NpcId = 5635}, -- dunhan
			CutSceneSay {Tag = "cs07aDunhanP102_001" , NpcId = 5635, String = "Kommt her, tragen wir es aus!"},
			Goto {NpcId = 5462, X = 180, Y = 374, WalkMode = Run},	--setrius
			Goto {NpcId = 0,    X = 182, Y = 374, WalkMode = Run},	--avatar
			LookAtFigure {NpcId = 5635, Target = 0},
			RemoveDialog {NpcId = 5462}, -- setrius verliert ausrufezeichen
		},
		[40] =
		{
			Goto {NpcId = 6509, X = 184, Y = 371, WalkMode = Run},	--janina killable
			Goto {NpcId = 0, X = 182, Y = 374, WalkMode = Run},	--avatar
			Goto {NpcId = 5462, X = 180, Y = 374, WalkMode = Run},	--setrius	
			SetNoFightFlagTrue {NpcId = 6311},
			SetNoFightFlagTrue {NpcId = 5951},
			SetNoFightFlagTrue {NpcId = 5462}, -- setrius
			Vanish {NpcId = 5461}, -- die echte janina verschwindet.					
		},
		[120] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraArenaII},
			LookAtFigure {NpcId = 5635, Target = 5462},
			LookAtFigure {NpcId = 0, Target = 5635},
			LookAtFigure {NpcId = 6509, Target = 5635},				
		},
		[140] =
		{		
			CutSceneSay {Tag = "cs07aSetriusP102_001" ,NpcId = 5462, String = "Du hast genug Unheil angerichtet, Bruder!"},
			Goto {NpcId = 5462, X = 180, Y = 374, WalkMode = Run},		-- setrius	
			LookAtFigure {NpcId = 5635, Target = 5462},
			LookAtFigure {NpcId = 0, Target = 5635},
			LookAtFigure {NpcId = 6509, Target = 5635},
			LookAtFigure {NpcId = 5462, Target = 5635},			
			Goto {NpcId = 6311, X = 179, Y = 363, WalkMode = Run}, -- lea
			Goto {NpcId = 5951, X = 178, Y = 364, WalkMode = Run}, -- grim			
		},		
		[160] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 5462, Target = 5635},
			CutSceneSay {Tag = "cs07aDunhanP102_002" , NpcId = 5635, String = "Du? Du ... Bastard wagst dich hierher? Sehnsucht nach dem Tod, Bruderherz?"},
		},	
		[200] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraArenaIII},
			CutSceneSay {Tag = "cs07aJaninaP102_001" , NpcId = 6509, String = "Sehnsucht nach Friede, Dunhan."},
			Goto {NpcId = 6509, X = 184, Y = 377, WalkMode = Walk},	-- janina	
			LookAtFigure {NpcId = 6509, Target = 5635},
			LookAtFigure {NpcId = 5635, Target = 6509},	
			LookAtFigure {NpcId = 5462, Target = 5635},				
		},				
		[230] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraArenaII},
			LookAtFigure {NpcId = 6509, Target = 5635},
			LookAtFigure {NpcId = 5635, Target = 6509},	
			LookAtFigure {NpcId = 5462, Target = 5635},				
			CutSceneSay {Tag = "cs07aDunhanP102_003" ,NpcId = 5635, String = "Janina? Du schmähst mich und ziehst mit diesem Bastard? Ist das der Dank dafür, dass ich dich aus dem Totenreich gerettet habe?"},
		},
		[260] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraArenaIII},
			LookAtFigure {NpcId = 6509, Target = 5635},
			LookAtFigure {NpcId = 5635, Target = 6509},	
			LookAtFigure {NpcId = 5462, Target = 5635},				
			CutSceneSay {Tag = "cs07aJaninaP102_002" ,NpcId = 6509, String = "Gerettet? Das ist kein Leben, was ich führe, Dunhan! Und du bist nur noch ein erbärmlicher Schatten deiner selbst."},			
			CGdsFigureSetHealth:new(6509, 1),
		},
		[290] =
		{
			ExecuteCameraScript{Script = CameraArenaVII},
		},
		[320] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraArenaVI},
			CutSceneSay {Tag = "cs07aDunhanP102_004" , NpcId = 5635, String = "Erbärmlich? Ich werde dir zeigen, wie erbärmlich ich bin, verräterisches Weib!"},	
			CGdsFigureSetHealth:new(6509, 1),
			
		},	
		[350] =
		{
			SetNoFightFlagFalse {NpcId = 6509},
		},
		[360] = 
		{
			AttackTarget {NpcId = 5635, Target = 6509, FriendlyFire = TRUE},	-- dunhan attacks janina
			LookAtFigure {NpcId = 0, Target = 5635},
			LookAtFigure {NpcId = 5462, Target = 5635},	
		},	
		[400] =
		{
			CGdsFigureSetHealth:new(5635, 1), -- dunhan wird schwach.
			LookAtFigure {NpcId = 5462, Target = 5635},		
			LookAtFigure {NpcId = 0, Target = 5635},
		},
		[430] = 
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "janinaghost"}, -- janinas geist wird gespawnt.
			Vanish {NpcId = 6509}, -- janinas leiche verschwindet.
		},		
		[450] =
		{
			CutSceneSay {Tag = "cs07aSetriusP102_002" ,NpcId = 5462, String = "Der Geist! Er ist frei!"},		
			AttackTarget {NpcId = 6456, Target = 5635, FriendlyFire = TRUE}, -- geist attacks dunhan.
		},
		[500] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraArenaI},	
			SetEffect   {Effect = "DeMaterialize", NpcId = 6456, Length = 2500}, -- geist verschwindet		
			CutSceneSay {Tag = "cs07aSetriusP102_003" ,NpcId = 5462, String = "Es ist vorbei. Sie hat ihren Frieden, aber seine Rune wird ihn wieder erwecken. Wir sollten fliehen!"},
			LookAtFigure {NpcId = 0, Target = 5462},
			LookAtFigure {NpcId = 5462, Target = 0},				
			Goto {NpcId = 5951, X = 181, Y = 371, WalkMode = Run}, -- grim
		},	
		[520] =
		{
			Vanish {NpcId = 6456},
			Goto {NpcId = 6311, X = 179, Y = 371, WalkMode = Run},
		},
		[560] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraArenaV},					
			CutSceneSay {Tag = "cs07aGrimP102_001" , NpcId = 5951, String = "Dunhan ist wahnsinnig. Nimm seine Rune, das ist der einzige Weg!"},			
		},	
		[610] = 
		{
			WaitForEndOfSpeech,
			QuestSolve{ QuestId = 604 },
			QuestBegin{ QuestId = 567 }, 		
			SetGlobalFlagTrue {Name = "ArenaOver"},	
			SetNoFightFlagFalse {NpcId = 0},	
			SetNoFightFlagFalse {NpcId = 5462}, -- setrius	
			SetGlobalFlagTrue {Name = "GrimFollowP102"},
			SetGlobalFlagTrue {Name = "LeaFollowP102"},
			SetGlobalFlagFalse { Name = "StartFinish"}, 
			--EnableDialog {NpcId = 5462}, -- setrius bekommt ausrufezeichen zurueck
			SetNoFightFlagFalse {NpcId = 6311}, --Lena
			SetNoFightFlagFalse {NpcId = 5951}, --Grim
		},											
	},
}