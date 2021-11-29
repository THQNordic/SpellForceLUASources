-----------------------------------------------------------------------
--
--	Gorins Land Show
--
-----------------------------------------------------------------------

-- NurBerg
CameraGorinI =
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,16,1,"script\\p11\\n2664_CameraGorinI.lua")
 	Camera:ScriptStart()   	
]]

-- Trolldorf
CameraGorinII =
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,10,1,"script\\p11\\n2664_CameraGorinII.lua")
 	Camera:ScriptStart()   	
]]

-- Riese
CameraGorinIII =
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,10,1,"script\\p11\\n2664_CameraGorinIII.lua")
 	Camera:ScriptStart()   	
]]

-- Ruinen
CameraGorinIV =
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,10,1,"script\\p11\\n2664_CameraGorinIV.lua")
 	Camera:ScriptStart()   	
]]

-- FeldDerSteine
CameraGorinV =
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,17,1,"script\\p11\\n2664_CameraGorinV.lua")
 	Camera:ScriptStart()   	
]]

-- DeepOne
CameraGorinVI =
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,15,1,"script\\p11\\n2664_CameraGorinVI.lua")
 	Camera:ScriptStart()   	
]]

-- Aufbau
CameraGorinVII =
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,20,1,"script\\p11\\n2664_CameraGorinVII.lua")
 	Camera:ScriptStart()   	
]]

-- Tworsnik
CameraGorinVIII =
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,12,1,"script\\p11\\n2664_CameraGorinVIII.lua")
 	Camera:ScriptStart()   	
]]


CreateCutScene
{
	Name = "GorinLandShow", CameraScript = "",	PlayOnlyOnce = FALSE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue{Name = "GorinStartLandshow" , UpdateInterval = 5},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
--		RemoveDialog{NpcId = 2664},
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 2664},		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:	
		},		
		[20] = 
		{ 
			ExecuteCameraScript{Script = CameraGorinI},		
			CutSceneSay{Tag = "cutgorinStonebl001" , NpcId = 2664 , String = "...der Schwertfels verdankt seinen Namen dem Berg, der wie eine Schwertklinge emporragt."},
		},
		[90] = 
		{
			WaitForEndOfSpeech,			
			CutSceneSay{Tag = "cutgorinStonebl002" , NpcId = 2664 , String = "Das Land hier ist alt... die Felsen wispern noch das Lied der Weltgeburt."},
		},
		[140] =
		{
			ExecuteCameraScript{Script = CameraGorinII},				
		},
		[150] = 
		{
			WaitForEndOfSpeech,			
			CutSceneSay{Tag = "cutgorinStonebl003" , NpcId = 2664 , String = "In den Tälern lauern Urwesen und Trolle..."},
		},
		[190] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraGorinIII},						
			CutSceneSay{Tag = "cutgorinStonebl004" , NpcId = 2664 , String = "Und hoch im Norden wacht ein Riese über den Schatz von Brahir. Er ist harmlos...aber kommt seiner Höhle nicht zu nahe!"},
			RevealUnExplored {X = 393,Y = 353, Range = 10},
		},
		[290] = 
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraGorinIV},				
			CutSceneSay{Tag = "cutgorinStonebl005" , NpcId = 2664 , String = "Einst schürften meine Brüder hier Adamant, aber das ist lange her."},
		},
		[350] = 
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraGorinV},				
			CutSceneSay{Tag = "cutgorinStonebl006" , NpcId = 2664 , String = "Denn die Steine erhoben sich gegen uns im Zorn! Sie erschlugen die Zwerge und verfluchten das Land und die Felsen!"},
		},
		[440] = 
		{
			WaitForEndOfSpeech,			
			CutSceneSay{Tag = "cutgorinStonebl007" , NpcId = 2664 , String = "Aber unter all diesen dunklen Kreaturen..."},
		},
		[460] = 
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraGorinVI},				
			CutSceneSay{Tag = "cutgorinStonebl008" , NpcId = 2664 , String = "...stoßt Ihr hier manchmal noch auf ein Geschöpf aus den alten Tagen... aus den unergründlichen Tiefen unserer Welt!"},
			RevealUnExplored {X = 153,Y = 112, Range = 10},
		},
		[550] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGorinVII},					
			CutSceneSay{Tag = "cutgorinStonebl009" , NpcId = 2664 , String = "Ich sehe, Ihr seid ein Diener der Rune! Deshalb noch eins..."},
		},
		[600] = 
		{
			WaitForEndOfSpeech,			
			-- ExecuteCameraScript{Script = CameraGorinVII},				
			CutSceneSay{Tag = "cutgorinStonebl010" , NpcId = 2664 , String = "...gleich hier, hinter den Felsen, findet Ihr ein fruchtbares Tal! Dort steht noch ein Runenmonument des Zirkels!"},
			RevealUnExplored {X = 298,Y = 124, Range = 20},
		},
		[700] = 
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraGorinVIII},				
			CutSceneSay{Tag = "cutgorinStonebl011" , NpcId = 2664 , String = "Und solltet Ihr Tworsnik, den Einsiedler treffen, dann fragt ihn nach einem guten Schild! Der alte Bursche fertigt hervorragende Schilde, müsst Ihr wissen!"},
		},
		[820] = 
		{
			WaitForEndOfSpeech,			
			SetGlobalFlagFalse{Name = "GorinStartLandshow"},
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 2664},					
		},
	},
}