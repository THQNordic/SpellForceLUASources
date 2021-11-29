n32320_CameraOpener1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P204\\n32320_CameraOpener1.lua")
   	Camera:ScriptStart()
]]

n32320_CameraOpener2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P204\\n32320_CameraOpener2.lua")
   	Camera:ScriptStart()
]]

n32320_CameraOpener3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\P204\\n32320_CameraOpener3.lua")
   	Camera:ScriptStart()
]]

n32320_CameraOpener4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32320_CameraOpener4.lua")
   	Camera:ScriptStart()
]]

n32320_CameraOpener5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32320_CameraOpener5.lua")
   	Camera:ScriptStart()
]]

n32320_CameraOpener6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32320_CameraOpener6.lua")
   	Camera:ScriptStart()
]]

n32320_CameraOpener7 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32320_CameraOpener7.lua")
   	Camera:ScriptStart()
]]

n32320_CameraOpener8 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32320_CameraOpener8.lua")
   	Camera:ScriptStart()
]]

n32320_CameraOpener9 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32320_CameraOpener9.lua")
   	Camera:ScriptStart()
]]

n32320_CameraOpener10 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32320_CameraOpener10.lua")
   	Camera:ScriptStart()
]]

n32320_CameraOpener11 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32320_CameraOpener11.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P204_Empyria_Opener1", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions = {},
	
	BeginActions = 	{},
	
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[10] =
		{
			ExecuteCameraScript{Script = n32320_CameraOpener1},	
			LookAtFigure{NpcId = 11191, Target = 8793},			
		},
	
		[60] =
		{
			Goto {X = 276, Y = 319, NpcId = 8794, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},		
			CutSceneSay {Tag = "csa211haran_001" , NpcId = 8794, String = "Eure Majestät, dieser Feind unterscheidet nicht zwischen Mann oder Frau, Kathai oder Empyria! Er vernichtet alles Leben! Ihr müsst handeln!"},
		},		

		[85] =
		{
			LookAtFigure{NpcId = 8794, Target = 8793},	
			LookAtFigure{NpcId = 8793, Target = 8794},				
		},	
		
		[100] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32320_CameraOpener2},	
			CutSceneSay {Tag = "csa211emperor_002" , NpcId = 8793, String = "Schnickschnack! Der Dschungel hat schon immer Unrat ausgespieen ... ein paar Untote mehr oder weniger, wen schert das schon!"},
		},		
		
		[110] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32320_CameraOpener5},				
			Goto {X = 275, Y = 319, NpcId = 8794, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},			
			CutSceneSay {Tag = "csa211haran_003" , NpcId = 8794, String = "Mein Volk, Majestät! Kathai wird zu dieser Stunde belagert! Wir brauchen das Kaiserreich! Schickt wieder Truppen nach Süden!"},
		},	
		
		[155] =
		{
			WaitForEndOfSpeech,	
			Goto {X = 274, Y = 319, NpcId = 8794, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},	
			CutSceneSay {Tag = "csa211haran_004" , NpcId = 8794, String = "Bemannt die Wacht! Erinnert Euch an den Schwur!"},							
		},	
		
		[170] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32320_CameraOpener3},				
			Goto {X = 274, Y = 318, NpcId = 8793, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
		},	
		
		[180] =
		{
			Goto {X = 275, Y = 319, NpcId = 8793, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
		},
			
		[193] =
		{
			LookAtFigure{NpcId = 8793, Target = 8794},
			CutSceneSay {Tag = "csa211emperor_005" , NpcId = 8793, String = "Ihr wollt Unterstützung? Wo ist denn der viel gerühmte Mut der Kathai?"},				
		},
			
		[240] =
		{
			WaitForEndOfSpeech,		
			Goto {X = 274, Y = 320, NpcId = 8793, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
		},
			
			
		[250] =
		{
			Goto {X = 273, Y = 319, NpcId = 8793, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
		},
		
		[262] =
		{
			LookAtFigure{NpcId = 8793, Target = 8794},	
			WaitForEndOfSpeech,		
			SetGlobalFlagTrue{Name = "g_P204_YrmirSpawnt"},			
			CutSceneSay {Tag = "csa211emperor_006" , NpcId = 8793, String = "Sind die Kinder des Windes denn so schwach geworden, dass sie sich vor ein paar klappernden Skeletten fürchten?"},
		},	
		
		[330] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32320_CameraOpener4},				
			CutSceneSay {Tag = "csa211haran_007" , NpcId = 8794, String = "Ich sehe, ich verschwende hier meine Zeit! Lebt wohl, Kaiser!"},
			Goto {X = 274, Y = 331, NpcId = 8794, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
		},	
		
		[390] =
		{
			Goto {X = 268, Y = 331, NpcId = 8794, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
			CutSceneSay {Tag = "csa211emperor_008" , NpcId = 8793, String = "Yrmir!"},				
		},	
		
		[410] =
		{
			LookAtFigure{NpcId = 9721, Target = 8793},		
		},			
		
		[420] =
		{
			ExecuteCameraScript{Script = n32320_CameraOpener6},		
			Goto {X = 274, Y = 319, NpcId = 9721, Range = 1, WalkMode = Run, GotoMode = GotoNormal},				
		},	
		
		[460] =
		{
			LookAtFigure{NpcId = 9721, Target = 8793},
			LookAtFigure{NpcId = 8793, Target = 9721},
			CutSceneSay {Tag = "csa211yrmir_009" , NpcId = 9721, String = "Mein Kaiser?"},
		},
				
		[480] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32320_CameraOpener11},				
			CutSceneSay {Tag = "csa211emperor_010" , NpcId = 8793, String = "Botschafter Haran wird die Stadt wohl bald verlassen ... sorgt dafür, dass er nicht allzu weit kommt ..."},
		},	
		
		[550] =
		{
			WaitForEndOfSpeech,		
			Goto {X = 274, Y = 318, NpcId = 8793, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},				
		},				
	
		[580] =
		{
			LookAtFigure{NpcId = 8793, Target = 9721},				
			CutSceneSay {Tag = "csa211emperor_011" , NpcId = 8793, String = "Eins noch, Yrmir! Man berichtet mir, ein Runenkrieger habe die Onyxbucht befreit ..."},
		},	
			
		[630] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32320_CameraOpener8},				
		},	
		
		[650] =
		{
			CutSceneSay {Tag = "csa211yrmir_012" , NpcId = 9721, String = "Ja, die Hazim dort wurden komplett vernichtet, Herr!"},
		},
		
		
		[710] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32320_CameraOpener9},				
			Goto {X = 271, Y = 319, NpcId = 8793, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},			
		},	
		
		[750] =
		{
			CutSceneSay {Tag = "csa211emperor_013" , NpcId = 8793, String = "Jaja ... wir können ihn nun wohl nicht direkt hinrichten, oder?"},
		},		
			
		[780] =
		{
			WaitForEndOfSpeech,	
			Goto {X = 273, Y = 319, NpcId = 8793, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},				
		},	
		
		[800] =
		{
			CutSceneSay {Tag = "csa211emperor_014" , NpcId = 8793, String = "Nun ... seht zu, dass er nicht in die Oberstadt kommt ... und gebt den hiesigen Meuchlern einen kleinen Hinweis ... je schneller er wieder verschwindet, desto mehr soll es mir wert sein!"},
		},		
			
		[820] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa211yrmir_015" , NpcId = 9721, String = "Wie Ihr befehlt, Kaiser!"},
		},	
		
		[840] =
		{
			WaitForEndOfSpeech,		
			Goto {X = 284, Y = 332, NpcId = 9721, Range = 1, WalkMode = Run, GotoMode = GotoNormal},
		},		
		
				
		[880] =
		{
			ExecuteCameraScript{Script = n32320_CameraOpener10},				
			Goto {X = 273, Y = 314, NpcId = 8793, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},			
		},	
		
		
		[920] =
		{
			WaitForEndOfSpeech,		
			Goto {X = 273, Y = 314, NpcId = 8793, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},			
			CutSceneSay {Tag = "csa211emperor_016" , NpcId = 8793, String = "Sehr gut, sehr gut ... der Maskierte wird zufrieden sein!"},
			RevealUnExplored { X = 275 , Y = 320 , Range = 15},
			RevealUnExplored { X = 275 , Y = 351 , Range = 15},
			RevealUnExplored { X = 303 , Y = 328 , Range = 25},	
			RevealUnExplored { X = 248 , Y = 328 , Range = 25},					
		},	
		
		[970] =
		{
			SetGlobalFlagTrue{Name = "g_P204_YrmirDespawn"},
		},
	},
}

