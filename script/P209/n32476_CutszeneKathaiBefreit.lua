-----------------------------------------------------------------------
--
--	P209KathaiCutszeneKathaiBefreit
--
-----------------------------------------------------------------------


n32476_CameraKathaiBefreit1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32476_CameraKathaiBefreit1.lua")
   	Camera:ScriptStart()
]]

n32477_CameraKathaiBefreit2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32477_CameraKathaiBefreit2.lua")
   	Camera:ScriptStart()
]]

n32478_CameraKathaiBefreit3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32478_CameraKathaiBefreit3.lua")
   	Camera:ScriptStart()
]]

n32479_CameraKathaiBefreit4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32479_CameraKathaiBefreit4.lua")
   	Camera:ScriptStart()
]]

n32480_CameraKathaiBefreit5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32480_CameraKathaiBefreit5.lua")
   	Camera:ScriptStart()
]]

n32481_CameraKathaiBefreit6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32481_CameraKathaiBefreit6.lua")
   	Camera:ScriptStart()
]]

n32482_CameraKathaiBefreit7 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P209\\n32482_CameraKathaiBefreit7.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P209KathaiCutszeneKathaiBefreit", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue{Name = "g_sP209CutszeneKathaiBefreitStart", UpdateInterval = 10},
		
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588" },
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10085" },
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		Goto {X = 378, Y = 251, NpcId = 8588, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
		Goto {X = 376, Y = 249, NpcId = 9781, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 378, Y = 249, NpcId = 9782, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 374, Y = 249, NpcId = 9780, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 372, Y = 249, NpcId = 9779, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 372, Y = 253, NpcId = 9775, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 374, Y = 253, NpcId = 9776, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 376, Y = 253, NpcId = 9777, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 378, Y = 253, NpcId = 9778, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[10] =
		{
				ExecuteCameraScript{Script = n32476_CameraKathaiBefreit1},
				LookAtFigure {Target = 0, NpcId = 8588},	
				LookAtFigure {Target = 0, NpcId = 8587},
				--LookAtFigure {Target = 0, NpcId = 10085},
				CutSceneSay {Tag = "csa232uru_001" , NpcId = 8588, String = "Lasst uns den Rettern danken, Freunde!"},	
				Goto {X = 372, Y = 251, NpcId = 0, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},
				Goto {X = 371, Y = 250, NpcId = 8576, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},
				Goto {X = 371, Y = 252, NpcId = 8694, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},
				Goto {X = 370, Y = 251, NpcId = 8590, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},
								
		},
		[80] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				LookAtFigure {Target = 9779, NpcId = 9775},
				LookAtFigure {Target = 9780, NpcId = 9776},
				LookAtFigure {Target = 9781, NpcId = 9777},
				LookAtFigure {Target = 9782, NpcId = 9778},
				LookAtFigure {Target = 9775, NpcId = 9779},
				LookAtFigure {Target = 9776, NpcId = 9780},
				LookAtFigure {Target = 9777, NpcId = 9781},
				LookAtFigure {Target = 9778, NpcId = 9782},
				ExecuteCameraScript{Script = n32477_CameraKathaiBefreit2},
				LookAtFigure {Target = 8588, NpcId = 0},
				LookAtFigure {Target = 8588, NpcId = 8576},
				LookAtFigure {Target = 8588, NpcId = 8694},
				LookAtFigure {Target = 8588, NpcId = 8590},
				CutSceneSay {Tag = "csa232xalabar_002" , NpcId = 8587, String = "Danken? Seid Ihr von Sinnen, Weib? Fremde haben uns doch diese Untote Plage gebracht! Fremde und Nordmenschen ... wie die dort!"},	

		},		
		[150] =
		{
				Goto {X = 375, Y = 250, NpcId = 8587, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},	
		},		
		[220] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32477_CameraKathaiBefreit2},
				CutSceneSay {Tag = "csa232jenquai_003" , NpcId = 8576, String = "Rabenhaar ist bei ihnen! Ich vertraue ihr!"},			
		},		
		[270] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa232xalabar_004" , NpcId = 8587, String = "Ja, weil sie deine kleine Hure ist!"},			
		},		
		[300] =
		{
				--Goto {X = 379, Y = 250, NpcId = 8587, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},	
				Goto {X = 374, Y = 250, NpcId = 8576, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},	
					
		},	
		[320] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32479_CameraKathaiBefreit4},
				CutSceneSay {Tag = "csa232jenquai_005" , NpcId = 8576, String = "Dafür Häute ich dich, Schakal!"},				
		},		
		[370] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa232uru_006" , NpcId = 8588, String = "Torai! Alle beide! Genug Blut ist für heute vergossen!"},			
		},		
		[430] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32476_CameraKathaiBefreit1},
				LookAtFigure {Target = 8587, NpcId = 8588},
				LookAtFigure {Target = 8588, NpcId = 8587},
				CutSceneSay {Tag = "csa232uru_007" , NpcId = 8588, String = "Was willst du, Xalabar, Führer der Krieger?"},			
		},		
		[490] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32479_CameraKathaiBefreit4},
				CutSceneSay {Tag = "csa232xalabar_008" , NpcId = 8587, String = "Dass die Nordmenschen dort verschwinden und ihre Kriege und Intrigen mit sich nehmen!"},			
		},		
		[550] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32480_CameraKathaiBefreit5},
				Goto {X = 377, Y = 252, NpcId = 10085, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},	
				CutSceneSay {Tag = "csa232khal_009" , NpcId = 10085, String = "Wir schulden ihnen unser Leben!"},	
				
		},		
		[590] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa232xalabar_011" , NpcId = 8587, String = "Dann verlange ich, dass sie die Prüfung der Wahrheit ablegen! Wenn sie uns Gutes wollen, werden die Winde ihnen den Sieg schenken!"},			
				SetGlobalFlagTrue {Name = "g_sP209KhalMove"},
		},		
		[690] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa232khal_012" , NpcId = 10085, String = "Dai! Das ist sein Recht!"},			
		},		
		[740] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32476_CameraKathaiBefreit1},
				CutSceneSay {Tag = "csa232uru_013" , NpcId = 8588, String = "Dann sollen die Windgötter entscheiden!"},
				Goto {X = 379, Y = 250, NpcId = 8587, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},	
				Goto {X = 371, Y = 250, NpcId = 8576, Range = 2, WalkMode = Walk, GotoMode = GotoNormal},	
				Goto {X = 379, Y = 252, NpcId = 10085, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},				
		},		
		[790] =
		{		
				LookAtFigure {Target = 0, NpcId = 8587},
				LookAtFigure {Target = 8588, NpcId = 8576},
				LookAtFigure {Target = 0, NpcId = 10085},
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32479_CameraKathaiBefreit4},
				CutSceneSay {Tag = "csa232alyah_014" , NpcId = 8590, String = "Oh, oh."},			
		},		
		[820] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa232avatar_015" , NpcId = 0, String = "Was bedeutet das jetzt?"},			
		},		
		[850] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32479_CameraKathaiBefreit4},
				CutSceneSay {Tag = "csa232alyah_016" , NpcId = 8590, String = "Ärger."},			
		},		
		[870] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa232urias_017" , NpcId = 8694, String = "Wie es scheint, sollen wir ein Gottesurteil ausfechten... Lasst mich antreten! Dieser undankbare Wilde soll den Zorn Aonirs spüren"},			
		},		
		[940] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa232alyah_018" , NpcId = 8590, String = "Dieser undankbare Wilde hat noch nie einen Zweikampf verloren, Dummkopf!"},			
		},			
		[1010] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32476_CameraKathaiBefreit1},
				CutSceneSay {Tag = "csa232uru_019" , NpcId = 8588, String = "Runenkrieger! Als Heerführer ist es an Euch, die Prüfung der Wahrheit abzulegen!"},			
		},			
		[1080] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				RevealUnExplored {X = 351, Y = 183, Range = 20},
				ExecuteCameraScript{Script = n32482_CameraKathaiBefreit7},
				CutSceneSay {Tag = "csa232uru_020" , NpcId = 8588, String = "Ihr werdet gegen Xalabar auf dem Kampfplatz unserer Ahnen antreten! Wenn ihr ihn besiegt, muss er Euren Anspruch anerkennen!"},			
		},		
		[1150] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa232uru_021" , NpcId = 8588, String = "Doch bevor der Kampf beginnen kann, müsst ihr beide ein Gon tragen, einen heiligen Gegenstand, der die Augen der Winde auf euch richtet."},			
		},						
		[1230] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				RevealUnExplored {X = 257, Y = 142, Range = 10},
				ExecuteCameraScript{Script = n32481_CameraKathaiBefreit6},
				CutSceneSay {Tag = "csa232uru_022" , NpcId = 8588, String = "Doch die Untoten haben viele unserer Dinge verschleppt! So auch die Gons! Ihr müsst sie also erst finden!"},			
		},				
		[1310] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32476_CameraKathaiBefreit1},
				CutSceneSay {Tag = "csa232uru_023" , NpcId = 8588, String = "Sucht hier im Osten nach ihnen. Solltet Ihr ein Gon finden, könnt Ihr den Kampfplatz betreten!"},			
		},				
		[1390] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa232uru_024" , NpcId = 8588, String = "Findet Ihr mehr als ein Gon, so könnt Ihr einen weiteren Streiter auswählen, um Euch im Kampf zu unterstützen!"},			
		},				
		[1480] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				SetGlobalFlagTrue{Name = "g_sP209CutszeneKathaiBefreitEnded"},
				SetGlobalFlagTrue{Name = "g_sP209ArtefaktAuftragErhalten"},
				SetGlobalFlagTrue{Name = "g_sP209UruGeredet2"},
				SetGlobalFlagTrue {Name = "g_sP209AlyahFollow"}, 
				SetPlatformFlagTrue {Name = "g_sP209AlyahFollow"}, 
				SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
				

		},		
	},
}



