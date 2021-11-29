-----------------------------------------------------------------------
--
--	P201Blackwater_CoastCutszeneGrab
--
-----------------------------------------------------------------------


n32240_CameraGrab1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32240_CameraGrab1.lua")
   	Camera:ScriptStart()
]]

n32241_CameraGrab2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32241_CameraGrab2.lua")
   	Camera:ScriptStart()
]]

n32242_CameraGrab3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32242_CameraGrab3.lua")
   	Camera:ScriptStart()
]]

n32243_CameraGrab4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32243_CameraGrab4.lua")
   	Camera:ScriptStart()
]]

n32244_CameraGrab5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P201\\n32244_CameraGrab5.lua")
   	Camera:ScriptStart()
]]

n32245_CameraGrab6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32245_CameraGrab6.lua")
   	Camera:ScriptStart()
]]

n32245_CameraGrab7 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32245_CameraGrab7.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P201Blackwater_CoastCutszeneGrab", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_sP201CutszeneGrabStart", UpdateInterval = 10},
	},
	BeginActions =
	{
		SetGlobalFlagTrue {Name = "g_sP201PalisadentorSkeletteOeffnen"},
		Goto{ X = 193, Y = 126, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoForced},
		Goto{ X = 191, Y = 125, NpcId = 8404, Range = 0, WalkMode = Run, GotoMode = GotoForced},
		ChangeObject {X = 191, Y = 127, Object = 2172},  
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[10] =
		{
			ExecuteCameraScript{Script = n32240_CameraGrab1},
			SetNoFightFlagTrue {NpcId = 0}, --Avatar
			SetNoFightFlagTrue {NpcId = 8404}, --Urias
		},
		[25] =
		{
			Goto{ X = 188, Y = 34, NpcId = 8676, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		},
		[90] =
		{
			ExecuteCameraScript{Script = n32241_CameraGrab2},
			SetGlobalFlagTrue {Name = "g_sP201LightKingUmspawnCutszeneGrab"},
		},
		[120] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "g_sP201LightKingUmspawnCutszeneGrab"},
			CutSceneSay {Tag = "csa203avatar_001" , NpcId = 0, String = "Da! Der Anführer flieht!"},
		},
		[150] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32242_CameraGrab3},
			CutSceneSay {Tag = "oca2lichkingP201_002" , NpcId = 8676, String = "Haltet sie auf! Ihr Fleisch soll Euch gehören!"},		
		},
		[190] =
		{
			WaitForEndOfSpeech,
			Goto{ X = 188, Y = 34, NpcId = 8676, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		},
		[225] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32245_CameraGrab6},
			CutSceneSay {Tag = "csa203avatar_003" , NpcId = 0, String = "Den hole ich mir ..."},
		},
		[260] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa203urias_004" , NpcId = 8404 , String = "Wartet!"},
		},
		[285] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32245_CameraGrab7},
			CutSceneSay {Tag = "csa203urias_005" , NpcId = 8404 , String = "Hier, dieser Untote trägt ein Buch bei sich! Ich erkenne den Einband, es ist eines von Darius' Büchern!"},
		},
		[365] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa203avatar_006" , NpcId = 0 , String = "Aber dieser Tote ..."},
		},
		[390] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32241_CameraGrab2},		
			CutSceneSay {Tag = "csa203urias_007" , NpcId = 8404 , String = "... ist nicht Darius, richtig! Die Kreatur muss das Buch irgendwo gefunden haben ... die Seiten sind voller Blut, man kann kaum noch etwas lesen ..."},
		},
		[470] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa203urias_008" , NpcId = 8404 , String = "Hier ... da kann man etwas entziffern ..."},
		},
		[520] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32245_CameraGrab6},
			CutSceneSay {Tag = "csa203darius_009" , NpcId = 11825 , String = "Vierter Tag des Herbstfalls ... ich habe das Grab gefunden ... es ist so, wie ich vermutet habe ..."},
		},
		[600] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa203darius_010" , NpcId = 11825 , String = "Jemand hat die Überreste der Zirkelmagierin Ianna freigelegt und fortgeschleppt ... wie bei den anderen zwei Gräbern ... und wieder hat er einen Wächter zurückgelassen ..."},
			SetEffect {Effect = "Torch", X = 207, Y = 223, Length = 0, TargetType = World},
			SetEffect {Effect = "Torch", X = 210, Y = 224, Length = 0, TargetType = World},
			SetEffect {Effect = "Torch", X = 213, Y = 225, Length = 0, TargetType = World},
			SetEffect {Effect = "Torch", X = 205, Y = 229, Length = 0, TargetType = World},
			SetEffect {Effect = "Torch", X = 208, Y = 230, Length = 0, TargetType = World},
			SetEffect {Effect = "Torch", X = 211, Y = 231, Length = 0, TargetType = World},
		
		
		
		},
		[720] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32243_CameraGrab4},
			CutSceneSay {Tag = "csa203darius_011" , NpcId = 11825 , String = "Sechster Herbstfall ... Es muss wieder der Maskierte gewesen sein, seine Handschrift ist unverkennbar!"},
		},
		[820] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32245_CameraGrab6},
			CutSceneSay {Tag = "csa203darius_012" , NpcId = 11825 , String = "Siebter Herbstfall ... hier erfahre ich nichts mehr ... ich habe nach Urias geschickt und sogar unserem alten Freund eine Nachricht gesendet ... aber ich kann nicht länger hier ausharren!"},
			StopEffect {X = 207, Y = 223, TargetType = World},
			StopEffect {X = 210, Y = 224, TargetType = World},
			StopEffect {X = 213, Y = 225, TargetType = World},
			StopEffect {X = 205, Y = 229, TargetType = World},
			StopEffect {X = 208, Y = 230, TargetType = World},
			StopEffect {X = 211, Y = 231, TargetType = World},
		
		},
		[940] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32241_CameraGrab2},
			CutSceneSay {Tag = "csa203darius_013" , NpcId = 11825 , String = "Ich werde nach Empyria weiterziehen. Die Frau unter dem Baum muss mir helfen! Ihre Vögel werden den Maskierten für mich finden!"},
		},
		[1020] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa203darius_014" , NpcId = 11825 , String = "Ich werde dieses Buch einem braven Fischer geben, er soll meinen Freunden berichten, was sich zugetragen hat. Freunde, ich hoffe, euch erreicht diese Schrift ... Folgt mir nach Empyria! Sucht nach der Frau unter dem Baum!"},
		},
		[1160] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32245_CameraGrab7},
			CutSceneSay {Tag = "csa203avatar_015" , NpcId = 0 , String = "Empyria ..."},
		},
		[1180] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32244_CameraGrab5},
			CutSceneSay {Tag = "csa203urias_016" , NpcId = 8404 , String = "Die goldene Stadt, einst die Hauptstadt des alten Imperiums auf Xu. Wir müssen weiter nach Süden, durch das Portal!"},
		},
		[1270] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa203avatar_017" , NpcId = 0 , String = "Gut! Folgen wir der Kreatur!"},
		},
		[1310] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32245_CameraGrab7},
		},
		[1340] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetNoFightFlagFalse {NpcId = 0}, --Avatar
			SetNoFightFlagFalse {NpcId = 8404}, --Urias
			SetGlobalFlagTrue{Name = "g_sP201CutszeneGrabEnded"},
			Follow {Target = 0, NpcId = 8404},
			SetGlobalFlagTrue{Name = "g_StoryQuestPhoenixGotoEmpyria"},
		},				
	},
}



