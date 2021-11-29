-----------------------------------------------------------------------
--
--	P200Collosseum_CutszeneGoblinRennenRot
--
-----------------------------------------------------------------------


n32201_CutszeneGoblinRennenCamera1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera1.lua")
   	Camera:ScriptStart()
]]

n32201_CutszeneGoblinRennenCamera2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera2.lua")
   	Camera:ScriptStart()
]]

n32201_CutszeneGoblinRennenCamera3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera3.lua")
   	Camera:ScriptStart()
]]

n32201_CutszeneGoblinRennenCamera4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera4.lua")
   	Camera:ScriptStart()
]]

n32201_CutszeneGoblinRennenCamera5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera5.lua")
   	Camera:ScriptStart()
]]

n32201_CutszeneGoblinRennenCamera6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera6.lua")
   	Camera:ScriptStart()
]]

n32201_CutszeneGoblinRennenCamera7_4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera7_4.lua")
   	Camera:ScriptStart()
]]

n32201_CutszeneGoblinRennenCamera8 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera8.lua")
   	Camera:ScriptStart()
]]

n32201_CutszeneGoblinRennenCamera9 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera9.lua")
   	Camera:ScriptStart()
]]

n32201_CutszeneGoblinRennenCamera10 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera10.lua")
   	Camera:ScriptStart()
]]

n32201_CutszeneGoblinRennenCamera11_4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P200\\n32201_CutszeneGoblinRennenCamera11_4.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P200Collosseum_CutszeneGoblinRennenRot", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue{Name = "g_sP200RndZahlErmittelt"},
		IsGlobalFlagTrue {Name = "g_sP200GoblinRennAufstellung"},
		IsGlobalFlagTrue{Name = "g_sP200CutszeneRotStart"},
	},
	BeginActions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11416"},
		
	},
	TimedActions =
	{	
		[10] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera1},
			SetGlobalFlagTrue { Name = "g_sGoblinTorGelbOeffnen"},
			
		},
		[20] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera1},
			SetGlobalFlagTrue { Name = "g_sGoblinTorGruenOeffnen"},
		},
		[30] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera1},
			SetGlobalFlagTrue { Name = "g_sGoblinTorBraunOeffnen"},
		},
		[40] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera1},
			SetGlobalFlagTrue { Name = "g_sGoblinTorRotOeffnen"},
			Goto {X = 88, Y = 103, NpcId = 11412, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
			PlaySound{Sound = SoundAttackSignalTroops},
		    PlaySound{Sound = SoundColosseumApplause},
		},
		[50] =
		{
			Goto {X = 88, Y = 108, NpcId = 11413, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
		},
		[60] =
		{
			Goto {X = 88, Y = 113, NpcId = 11414, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
		},
		[70] =
		{
			Goto {X = 88, Y = 118, NpcId = 11415, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
			PlaySound{Sound = SoundColosseumApplause},
		},
		[100] = 
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera2},	
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa230racemaster_001" , NpcId = 11416, String = "Die Läufer kommen an die Bahn! Man kann ihre Anspannung förmlich riechen!"},
			SetGlobalFlagTrue{Name = "g_sP200CutszeneGoblinAufstellung"},
			PlaySound{Sound = SoundColosseumCheers},			
		},		
		[170] =
		{
			--ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera3},
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa230racemaster_002" , NpcId = 11416, String = "Und es beginnt! Läufer! Nehmt eure Plätze ein! Bereit! Und ... Los!"},		
			PlaySound{Sound = SoundColosseumCheers},
		},		
		[230] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera3},
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetGlobalFlagTrue {Name = "g_sP200CutszeneRennenStart"},
			PlaySound{Sound = SoundAttackSignalTroops},
			PlaySound{Sound = SoundColosseumCheers},
		},		
		[300] =
		{
			PlaySound{Sound = SoundColosseumCheers},
		},			
		[400] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera7_4},	
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa230racemaster_003" , NpcId = 11416, String = "Da laufen sie! Sehen sie nur, meine Damen und Herren, wie die kleinen Kerle alles geben!"},		
			PlaySound{Sound = SoundColosseumCheers},
		},	
		[500] =
		{
			PlaySound{Sound = SoundColosseumCheers},
		},				
		[600] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera8},
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa230racemaster_004" , NpcId = 11416, String = "Noch liegt keiner klar in Führung ... noch ist alles offen!"},										
			PlaySound{Sound = SoundColosseumCheers},
		},
		[685] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera9},
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa230racemaster_007" , NpcId = 11416, String = "Ich sehe, dass jemand in Führung geht ... ja! Es ist der Rote Reißer! Ein großer Tag für die rote Fraktion ..."},						
			PlaySound{Sound = SoundColosseumCheers},
			PlaySound{Sound = SoundColosseumApplause},
		},		
		[800] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera10},
			PlaySound{Sound = SoundColosseumCheers},						
		},		
		[850] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera11_4},
			PlaySound{Sound = SoundColosseumCheers},						
		},		
		[1050] =
		{
			ExecuteCameraScript{Script = n32201_CutszeneGoblinRennenCamera6},
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa230racemaster_008" , NpcId = 11416, String = "Und er geht durchs Ziel! Der Rote Reißer gewinnt das Rennen! Damit ist der Aufstieg der roten Fraktion gesichert! Applaus!"},		
			PlaySound{Sound = SoundColosseumApplause},
		},	
		[1150] =
		{
			PlaySound{Sound = SoundColosseumApplause},
		},			
		[1200] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetGlobalFlagTrue {Name = "g_sP209CutszeneGoblinRennenEnded"},
		},		
	},
}



