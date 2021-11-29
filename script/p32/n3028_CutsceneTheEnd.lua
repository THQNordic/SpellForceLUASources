-----------------------------------------------------------------------
--
--	The End
--
-----------------------------------------------------------------------

-- totale
CameraTheEndI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,50,1,"script\\p32\\n3028_CameraTheEndI.lua")
   	Camera:ScriptStart()
]]

-- tor
CameraTheEndII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p32\\n3028_CameraTheEndII.lua")
   	Camera:ScriptStart()
]]

-- portal
CameraTheEndIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p32\\n3028_CameraTheEndIII.lua")
   	Camera:ScriptStart()
]]

-- raith und avatar
CameraTheEndIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p32\\n3028_CameraTheEndIV.lua")
   	Camera:ScriptStart()
]]

-- raith backwards
CameraTheEndV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p32\\n3028_CameraTheEndV.lua")
   	Camera:ScriptStart()
]]

-- raith nah
CameraTheEndVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p32\\n3028_CameraTheEndVI.lua")
   	Camera:ScriptStart()
]]

CameraTheEndVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p32\\n3029_CameraFlightBadGuysII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "The End", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- Negated (FigureAlive {NpcId = 4202}),	-- soulforger ist tot.
		IsGlobalFlagTrue {Name = "GameOver", UpdateInterval = 10},
		FigureInRange {NpcId = 0, X = 375, Y = 360, Range = 10, UpdateInterval = 10},
		Negated (FigureAlive {NpcId = 4451}),		
		Negated (FigureAlive {NpcId = 4452}),		
		Negated (FigureAlive {NpcId = 4453}),
				
		Negated (FigureAlive {NpcId = 4454}),		
		Negated (FigureAlive {NpcId = 4455}),		
		Negated (FigureAlive {NpcId = 4456}),		
		Negated (FigureAlive {NpcId = 4457}),
				
		Negated (FigureAlive {NpcId = 4458}),		
		Negated (FigureAlive {NpcId = 4459}),		
		Negated (FigureAlive {NpcId = 4460}),		
		Negated (FigureAlive {NpcId = 4461}),																						
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetGlobalFlagTrue	{Name = "RaithRespawn"},
		SetNoFightFlagTrue {NpcId = 0},			
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
			ExecuteCameraScript{Script = CameraTheEndII},
			SetGlobalFlagTrue {Name = "FinalGateOpen"},	-- das tor oeffnet sich.
			ChangeUnit {NpcId = 3028, Unit = 1437},
		},			
		[30] =
		{
			Goto {NpcId = 0, X = 386, Y = 365, WalkMode = Run},	-- avatar laeuft zu rohen.			
		},
		[120] =
		{
			Goto {NpcId = 0, X = 400, Y = 377, WalkMode = Run},	-- avatar laeuft zu rohen.
		},
		[150] =
		{
			ExecuteCameraScript{Script = CameraTheEndV},	
			LookAtDirection {NpcId = 3028, Direction = South},	
		},
		[200] =
		{
			Goto {NpcId = 0, X = 400, Y = 379, WalkMode = Walk},	-- avatar geht zu rohen.			
		},
		[210] = 
		{ 
			CutSceneSay {Tag = "cutmaincharShwdEnd001" , NpcId = 0, String = "Rohen...? Ihr...? Aber... was...? "},
			Goto {NpcId = 0, X = 400, Y = 379, WalkMode = Walk},	-- avatar geht zu rohen.			
			LookAtFigure {NpcId = 0, Target = 3028},
			LookAtFigure {NpcId = 3028, Target = 0},
		},
		[240] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTheEndVI},			
			LookAtFigure {NpcId = 0, Target = 3028},
			LookAtFigure {NpcId = 3028, Target = 0},								
			CutSceneSay {Tag = "cutdunklerShwdEnd001" , NpcId = 3028, String = "Erstaunt mich zu sehen, Runenkrieger? Mir scheint, ich habe Euch unterschätzt! Ihr seid weit gekommen - zu weit!"}
		},
		[310] = 
		{
			WaitForEndOfSpeech,	
			LookAtFigure {NpcId = 0, Target = 3028},
			LookAtFigure {NpcId = 3028, Target = 0},								
			CutSceneSay {Tag = "cutmaincharShwdEnd002" ,  NpcId = 0, String = "Das kann nicht sein...!"},
		},
		[330] = 
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraTheEndIV},			
			CutSceneSay {Tag = "cutdunklerShwdEnd002" , NpcId = 3028, String = "Wie ich sehe, habt Ihr meinen Diener vernichtet. Er hätte mir in dem Bevorstehenden als Waffe zur Seite stehen sollen!"},
		},
		[410] = 
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cutdunklerShwdEnd003" , NpcId = 3028, String = "Ich gebe zu, eine solche Wendung der Ereignisse hatte ich nicht vorhergesehen... Doch dem Lauf des Schicksals werdet Ihr dadurch nichts mehr ändern! Es ist zu spät!"},								
		},
		[500] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTheEndIII},			
			CutSceneSay {Tag = "cutdunklerShwdEnd004" , NpcId = 3028, String = "Wenn ich durch dieses Tor trete, ist die Konvokation noch nicht geschehen! Ich reise zurück in die Zeit vor dem Krieg - und diesmal werde ich ihn für mich entscheiden!"},								
		},		
		[580] = 
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cutdunklerShwdEnd005" , NpcId = 3028, String = "Dieses Buch gibt mir die Macht, die Konvokation zu verstehen! Es wird mir all ihre Geheimnisse enthüllen! Damit gebührt mir der Preis! Mir allein!"},								
		},		
		[640] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTheEndVI},
			CutSceneSay {Tag = "cutdunklerShwdEnd006" , NpcId = 3028, String = "Lebt wohl, Runenkrieger! Oder besser: sterbt wohl! In wenigen Augenblicken seid Ihr nur noch eine blasse Erinnerung an eine Zukunft, die nie existiert hat! Ihr habt mir wahrlich gut gedient!"},
		},	
		[760] =
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},						
			CGdsEndGame:new(),	-- extro rendering.
		},	
	},
}

