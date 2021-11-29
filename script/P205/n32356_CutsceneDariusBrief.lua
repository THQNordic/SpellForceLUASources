n32356_CameraDariusBrief = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32356_CameraDariusBrief.lua")
   	Camera:ScriptStart()
]]

n32356_CameraDariusBrief1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\P205\\n32356_CameraDariusBrief1.lua")
   	Camera:ScriptStart()
]]

n32356_CameraDariusBrief2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,45,1,"script\\P205\\n32356_CameraDariusBrief2.lua")
   	Camera:ScriptStart()
]]





CreateCutScene
{
	Name = "P205_CutsceneDariusBrief", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions = 
			{
			IsGlobalFlagTrue {Name = "g_P205_CutsceneDariusBrief", UpdateInterval = 10},
			},
	
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[1] =
		{
			SetGlobalFlagTrue{Name ="PleaseRemoveDialog_9250"},		
			SetGlobalFlagTrue {Name = "g_P205_DariusLiestBrief"},
		},
	
		[20] =
		{
			ExecuteCameraScript{Script = n32356_CameraDariusBrief},		
			CutSceneSay {Tag = "csa221darius_001" , NpcId = 11833, String = "Mein alter Freund,"},
		},			
		
		[50] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "csa221darius_002" , NpcId = 11833, String = "Wenn Ihr dies lest, werde ich bereits im Schlund der Finsternis verschwunden sein."},
		},
		
		[110] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa221darius_003" , NpcId = 11833, String = "Ich habe die Spur des Maskierten verfolgt, von den fensterlosen Gemäuern der Stadt der Seelen bis an diesen Ort. "},					
		},		

		[160] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32356_CameraDariusBrief1},				
			CutSceneSay {Tag = "csa221darius_004" , NpcId = 11833, String = "Seine Handschrift ist unverkennbar. Hinter der Maske verbirgt sich der Zirkelmagier Hokan Ashir. Und dann muss es die Maske des Belial sein, die er trägt. Aonir steh uns bei."},
		},		
		
		[180] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa221darius_005" , NpcId = 11833, String = "Er hat seine Zirkelbrüder aus den Gräbern geholt und sie nach Süden geschafft. Ich muss ihm folgen!"},
		},	
						
		[200] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa221darius_006" , NpcId = 11833, String = "Wahrscheinlich wird er die Dunkelwehrberge überqueren. Ich ahne bereits, wohin seine Spur mich führen wird. "},
		},	
		
		[220] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32356_CameraDariusBrief2},			
			CutSceneSay {Tag = "csa221darius_007" , NpcId = 11833, String = "Ich habe Angst. Zum ersten Mal in meinem Leben begebe ich mich ins Ungewisse, in einen Schlund von Finsternis, die selbst der Lichtstrahl Aonirs nicht zu durchdringen vermag."},
		},
				
		[250] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa221darius_008" , NpcId = 11833, String = "Etwas Schreckliches regt sich dort im dunklen Herz des Dschungels. Ich muss handeln, aber ich weiss nicht, ob meine Kraft noch ausreicht."},
		},

		[260] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa221darius_009" , NpcId = 11833, String = "Nur eins lindert meine Furcht: Zu wissen, dass Ihr und Urias mir folgen werdet ... und Ihr mir bald im Kampf gegen das Ungewisse beisteht."},
		},
		
		[280] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa221darius_010" , NpcId = 11833, String = "Sprecht mit der Dryade der Lebenseibe. Sie ist noch ein letzter Keim der Hoffnung, der in den verdorrten Landen Xus zu finden ist. Folgt ihrem Rat. Sie wird Euch den Weg weisen."},
		},
		
		[300] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa221darius_011" , NpcId = 11833, String = "Viel Glück, Freund."},
		},
		
		[320] =
		{
			WaitForEndOfSpeech,	
			SetGlobalFlagTrue{Name ="PleaseEnableMainQuestDialog_9250"},
			SetGlobalFlagTrue {Name = "g_P205_DariusLiestBriefDespawn"},			
		},

	},
}



