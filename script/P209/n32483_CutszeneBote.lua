-----------------------------------------------------------------------
--
--	P209KathaiCutszeneBote
--
-----------------------------------------------------------------------


n32483_CameraBote1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote1.lua")
   	Camera:ScriptStart()
]]

n32484_CameraBote2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32484_CameraBote2.lua")
   	Camera:ScriptStart()
]]

n32485_CameraBote3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32485_CameraBote3.lua")
   	Camera:ScriptStart()
]]

n32486_CameraBote4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32486_CameraBote4.lua")
   	Camera:ScriptStart()
]]

n32487_CameraBote5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32487_CameraBote5.lua")
   	Camera:ScriptStart()
]]

n32488_CameraBote6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32488_CameraBote6.lua")
   	Camera:ScriptStart()
]]

n32489_CameraBote7 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32489_CameraBote7.lua")
   	Camera:ScriptStart()
]]

n32490_CameraBote8 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32490_CameraBote8.lua")
   	Camera:ScriptStart()
]]

n32491_CameraBote9 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32491_CameraBote9.lua")
   	Camera:ScriptStart()
]]

n32492_CameraBote10 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32492_CameraBote10.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote11 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote11.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote12 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote12.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote13 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote13.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote14 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote14.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote15 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote15.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote16 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote16.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote17 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote17.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote18 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote18.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote19 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote19.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote20 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote20.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote21 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote21.lua")
   	Camera:ScriptStart()
]]

n32483_CameraBote22 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32483_CameraBote22.lua")
   	Camera:ScriptStart()
]]

n32486_CameraBote23 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32486_CameraBote23.lua")
   	Camera:ScriptStart()
]]

n32486_CameraBote24 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32486_CameraBote24.lua")
   	Camera:ScriptStart()
]]

n32486_CameraBote25 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32486_CameraBote25.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P209KathaiCutszeneBote", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBote", UpdateInterval = 10},
	
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetGlobalFlagTrue {Name = "g_sP209CutszeneBoteStart"},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588" },
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10085" },
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		
		[10] =
		{
			
			ExecuteCameraScript{Script = n32483_CameraBote1}, --12
			SetGlobalFlagTrue {Name = "g_sP209BoteSpawn"},
			Goto {X = 286, Y = 266, NpcId = 10085, Range = 3, WalkMode = Run, GotoMode = GotoNormal},
			SetGlobalFlagTrue{Name = "g_sP209UmspawnCutszeneBote1"},
			TeleportAvatar {X = 293, Y = 265},
		},
		[30] =
		{
			
			ExecuteCameraScript{Script = n32483_CameraBote1},  --16
			CutSceneSay {Tag = "csa233khal_001" , NpcId = 10085, String = "Krieger! Sammelt euch! Jäger! Zu den Toren!"},						
			SetGlobalFlagTrue {Name = "g_sP209KhalRuft"},
		},
		[65] =
		{
			ExecuteCameraScript{Script = n32483_CameraBote1},
		},
		[140] =
		{
			SetNoFightFlagTrue {NpcId = 9802}, --Bote
			SetNoFightFlagTrue {NpcId = 0}, --Avatar
			SetNoFightFlagTrue {NpcId = 8694}, --Urias
			SetNoFightFlagTrue {NpcId = 10085}, --Khal
			SetNoFightFlagTrue {NpcId = 8587}, --Xalabar
			SetNoFightFlagTrue {NpcId = 8588}, --Uru
			SetNoFightFlagTrue {NpcId = 8576}, --Jenquai
			SetNoFightFlagTrue {NpcId = 8590}, --Aliah
			ExecuteCameraScript{Script = n32486_CameraBote4},
			CutSceneSay {Tag = "csa233khal_002" , NpcId = 10085, String = "Die Armee des Kaisers! Sie kommt vom Rabenpass her!"},		
		},
		[190] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			
			LookAtDirection {Direction = West, NpcId = 10085},
			LookAtDirection {Direction = West, NpcId = 0},
			LookAtDirection {Direction = West, NpcId = 8576},
			LookAtDirection {Direction = West, NpcId = 8588},
			LookAtDirection {Direction = West, NpcId = 10085},
			LookAtDirection {Direction = West, NpcId = 8587},
			LookAtDirection {Direction = West, NpcId = 8694},
			ExecuteCameraScript{Script = n32485_CameraBote3},
			CutSceneSay {Tag = "csa233jenquai_003" , NpcId = 8576, String = "Die goldene Garde! Sie greift Euer Monument an!"},	
						
		},
		[245] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32486_CameraBote23},
			CutSceneSay {Tag = "csa233khal_004" , NpcId = 10085, String = "Da, der Bronzegigant! Dann ist der Kaiser selbst bei ihnen!"},	
		},
		[290] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa233alyah_005" , NpcId = 8590, String = "Oh, oh."},
			Goto {X = 282, Y = 265, NpcId = 9802, Range = 3, WalkMode = Run, GotoMode = GotoNormal},	
		},
		[310] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote12},
			LookAtFigure {Target = 9802, NpcId = 10085},
			CutSceneSay {Tag = "csa233messenger_006" , NpcId = 9802, String = "Ich bringe Nachricht von einer Göttlichkeit, Magnus Arias, Imperator des Südens, Herr über die goldene Stadt!"},	
		},
		[380] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote15},
			CutSceneSay {Tag = "csa233messenger_007" , NpcId = 9802, String = "Der Kaiser verlangt die Anwesenheit eurer Führer!"},	
		},
		[450] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote15},
			CutSceneSay {Tag = "csa233messenger_008" , NpcId = 9802, String = "Ebenso die des Runenkriegers und seiner Tochter!"},
		},
		[480] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote13},
			Goto {X = 290, Y = 266, NpcId = 8590, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},	
			CutSceneSay {Tag = "csa233alyah_009" , NpcId = 8590, String = "Lieber sterbe ich!"},
			LookAtFigure {Target = 8590, NpcId = 10085},
		},
		[510] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote15},
			CutSceneSay {Tag = "csa233messenger_010" , NpcId = 9802, String = "Solltet Ihr Euch weigern, wird die kaiserliche Armee diese Stadt dem Erdboden gleichmachen!"},	
		},
		[600] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote14},
			CutSceneSay {Tag = "csa233uru_011" , NpcId = 8588, String = "Wir sind zu schwach... Wir müssen auf den Handel eingehen!"},	
		},
		[650] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote16},
			CutSceneSay {Tag = "csa233khal_012" , NpcId = 10085, String = "So sei es! Xalabar, du hälst die Stadt und wächst über die Uru!"},	
		},
		[700] =
		{
			ExecuteCameraScript{Script = n32483_CameraBote13},
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa233khal_013" , NpcId = 10085, String = "Rabenhaar, Runenmensch! Ihr kommt mit mir! Jenquai, du auch!"},	
			Goto {X = 410, Y = 259, NpcId = 8588, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},	
			Goto {X = 411, Y = 261, NpcId = 8587, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},	
			SetGlobalFlagTrue {Name = "g_sP209SpawnKaiserGarde"},
			SetGlobalFlagTrue {Name = "g_sP209KillBronzerieseDuplikat"},		
		},
		[750] =
		{
			ExecuteCameraScript{Script = n32483_CameraBote17},
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			Goto {X = 255, Y = 270, NpcId = 9802, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
			Goto {X = 255, Y = 270, NpcId = 10085, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},	
			Goto {X = 255, Y = 270, NpcId = 8576, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
			Goto {X = 255, Y = 270, NpcId = 0, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},	
			CutSceneSay {Tag = "csa233urias_014" , NpcId = 8694, String = "Wartet, ich begleite Euch, Runenkrieger!"},	
			Goto {X = 255, Y = 270, NpcId = 8590, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
			SetGlobalFlagTrue {Name = "g_sP209KillableUriasSpawn"},
			
		},
		[775] =
		{
			ExecuteCameraScript{Script = n32483_CameraBote17},
			Goto {X = 255, Y = 268, NpcId = 8694, Range = 3, WalkMode = Run, GotoMode = GotoNormal},
		},
		[800] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa233alyah_015" , NpcId = 8590, String = "Natürlich ..."},	
			SetNoFightFlagTrue {NpcId = 10085}, --Khal
			SetNoFightFlagTrue {NpcId = 10137}, --Urias
			
		},
		[850] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32492_CameraBote10},
			TeleportAvatar {X = 235, Y = 318},	
			SetGlobalFlagTrue {Name = "g_sP209UmspawnHelden"},
			SetNoFightFlagTrue {NpcId = 8661}, --Kaiser
			SetNoFightFlagTrue {NpcId = 8662}, --Bronzeriese
			SetNoFightFlagTrue {NpcId = 8660}, --Wachen
			SetNoFightFlagTrue {NpcId = 8663}, --Wachen
			SetNoFightFlagTrue {NpcId = 9880}, --Wachen
			SetNoFightFlagTrue {NpcId = 9879}, --Wachen
			SetNoFightFlagTrue {NpcId = 11680}, --Wachen
			SetNoFightFlagTrue {NpcId = 11681}, --Wachen
			LookAtDirection {Direction = North, NpcId = 8660},
			LookAtDirection {Direction = South, NpcId = 8663},
			LookAtDirection {Direction = South, NpcId = 9880},
			LookAtDirection {Direction = North, NpcId = 9879},
			LookAtDirection {Direction = East, NpcId = 8662},
			LookAtDirection {Direction = East, NpcId = 8661},
			LookAtDirection {Direction = North, NpcId = 11680},
			LookAtDirection {Direction = South, NpcId = 11681},
		},
		[1000] =
		{
			SetNoFightFlagTrue {NpcId = 9802}, --Bote
			SetNoFightFlagTrue {NpcId = 0}, --Avatar
			SetNoFightFlagTrue {NpcId = 8576}, --Jenquai
			SetNoFightFlagTrue {NpcId = 8590}, --Aliah
			SetNoFightFlagTrue {NpcId = 10085}, --Khal
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32488_CameraBote6},
			Goto {X = 214, Y = 321, NpcId = 8576, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},		
			Goto {X = 214, Y = 317, NpcId = 8590, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
			Goto {X = 216, Y = 318, NpcId = 10137, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
			Goto {X = 212, Y = 319, NpcId = 10085, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},		
			Goto {X = 210, Y = 321, NpcId = 9802, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},	
			Goto {X = 217, Y = 320, NpcId = 0, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},	
			LookAtDirection {Direction = East, NpcId = 8662},
			
		},
		[1150] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32489_CameraBote7},
			CutSceneSay {Tag = "csa233khal_016" , NpcId = 10085, String = "Still! Der Kaiser!"},	
			LookAtDirection {Direction = West, NpcId = 10085},
			LookAtDirection {Direction = West, NpcId = 0},
			LookAtDirection {Direction = East, NpcId = 8662},
			LookAtDirection {Direction = West, NpcId = 10137},
			LookAtDirection {Direction = East, NpcId = 9802},
			
		},
		[1200] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote19},
			CutSceneSay {Tag = "csa233emperor_017" , NpcId = 8661, String = "Sei gegrüßt ... Tochter."},	
		},
		[1230] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote18},
			LookAtDirection {Direction = West, NpcId = 8590},
			LookAtDirection {Direction = West, NpcId = 8576},
			CutSceneSay {Tag = "csa233alyah_018" , NpcId = 8590, String = "Vater."},	
		},
		[1250] =
		{
			LookAtDirection {Direction = East, NpcId = 8662},
			LookAtDirection {Direction = East, NpcId = 9802},
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote19},
			CutSceneSay {Tag = "csa233emperor_019" , NpcId = 8661, String = "Ich will es kurz machen! Khal, liefert mir den Runenkrieger und meine störrische Tochter aus und ich verschone dieses stinkende Loch, das ihr Stadt nennt!"},	
		},
		[1300] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32489_CameraBote7},
			CutSceneSay {Tag = "csa233khal_020" , NpcId = 10085, String = "Sie leben hier unter dem Schutz des Gastrechts! Wenn sie gehen, dann nur aus freiem Willen, Kaiser!"},	
		},
		[1350] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote19},
			CutSceneSay {Tag = "csa233emperor_021" , NpcId = 8661, String = "Du wagst es mir zu widersprechen, Barbar? Was kümmert mich, den Göttlichen, Euer Gastrecht!"},	
		},
		[1400] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa233emperor_022" , NpcId = 8661, String = "Garde! Brennt alles nieder! Tötet diese stinkenden Barbaren! Löscht sie aus!"},	
		},
		[1450] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote18},
			CutSceneSay {Tag = "csa233alyah_023" , NpcId = 8590, String = "Vater! Nein!"},	
		},
		[1470] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote19},
			CutSceneSay {Tag = "csa233emperor_024" , NpcId = 8661, String = "Und tötet diese Frau! Ich habe keine Verwendung mehr für sie!"},	
		},
		[1520] =
		{
			LookAtDirection {Direction = West, NpcId = 8661},
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32489_CameraBote7},
			CutSceneSay {Tag = "csa233messenger_025" , NpcId = 9802, String = "Wie ihr befehlt, Göttlicher!"},	
			SetGlobalFlagTrue {Name = "g_sP209BoteAngriff"},
						
		},
		[1550] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote21},
			
			Goto {X = 213, Y = 317, NpcId = 8660, Range = 1, WalkMode = Walk, GotoMode = GotoForced},
			Goto {X = 214, Y = 316, NpcId = 9879, Range = 1, WalkMode = Walk, GotoMode = GotoForced},
			Goto {X = 216, Y = 317, NpcId = 11680, Range = 1, WalkMode = Walk, GotoMode = GotoForced},
			SetNoFightFlagFalse {NpcId = 8590}, --Aliah
			AttackTarget {Target = 8660, NpcId = 8590, FriendlyFire = FALSE},
			SetNoFightFlagFalse {NpcId = 10137}, --Urias
			AttackTarget {Target = 11680, NpcId = 10137, FriendlyFire = FALSE},		
			CutSceneSay {Tag = "csa233urias_026" , NpcId = 10137, String = "Alyah! Vorsicht!"},	
			
			SetNoFightFlagFalse {NpcId = 10085}, --Khal
			SetNoFightFlagFalse {NpcId = 8576}, --Jenquai
			SetNoFightFlagFalse {NpcId = 9802}, --Bote
			SetNoFightFlagFalse {NpcId = 11681}, --Wache1
			SetNoFightFlagFalse {NpcId = 9880}, --Wache2
			SetNoFightFlagFalse {NpcId = 8663}, --Wache3
			SetNoFightFlagFalse {NpcId = 11680}, --Wache4
			SetNoFightFlagFalse {NpcId = 8660}, --Wache5
			SetNoFightFlagFalse {NpcId = 9879}, --Wache6
			SetNoFightFlagFalse {NpcId = 0}, --Avatar
			
			AttackTarget {Target = 10085, NpcId = 9802, FriendlyFire = FALSE},
			AttackTarget {Target = 10085, NpcId = 11681, FriendlyFire = FALSE},
			AttackTarget {Target = 8576, NpcId = 9880, FriendlyFire = FALSE},
			AttackTarget {Target = 0, NpcId = 8663, FriendlyFire = FALSE},
			AttackTarget {Target = 8590, NpcId = 8660, FriendlyFire = FALSE},
			AttackTarget {Target = 8590, NpcId = 9879, FriendlyFire = FALSE},
			AttackTarget {Target = 10137, NpcId = 11680, FriendlyFire = FALSE},
			AttackTarget {Target = 8663, NpcId = 0, FriendlyFire = FALSE},
		},
		[1560] =
		{
			ExecuteCameraScript{Script = n32483_CameraBote21},
			SetGlobalFlagTrue{Name = "g_sP209Helebardier"},
		},
		[1600] =
		{
			SetGlobalFlagTrue{Name = "g_sP209Helebardier"},
			ExecuteCameraScript{Script = n32483_CameraBote18},
			SetNoFightFlagTrue {NpcId = 10137}, --Urias
			Goto {X = 213, Y = 317, NpcId = 8662, Range = 1, WalkMode = Walk, GotoMode = GotoForced},
			Kill {NpcId = 8660},
			Kill {NpcId = 11680},
		},
		[1650] =
		{
			
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote20},
			Kill {NpcId = 9879},
			CutSceneSay {Tag = "csa233alyah_027" , NpcId = 8590, String = "Oh, verflixt! Hilfe!"},
			Goto {X = 217, Y = 319, NpcId = 8590, Range = 1, WalkMode = Run, GotoMode = GotoForced},
			Goto {X = 213, Y = 318, NpcId = 10137, Range = 1, WalkMode = Run, GotoMode = GotoForced},
			Kill {NpcId = 9880},
			Kill {NpcId = 9802},
		},
		[1700] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote21},
			CutSceneSay {Tag = "csa233urias_028" , NpcId = 10137, String = "Komm her, du Monstrum! Versuch es mal mit mir!"},
			SetNoFightFlagFalse {NpcId = 8662}, --Bronzeriese
			SetNoFightFlagFalse {NpcId = 10137}, --Urias
			AttackTarget {Target = 10137, NpcId = 8662, FriendlyFire = FALSE},
			Kill {NpcId = 11681},
			
						
		},
		[1750] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32486_CameraBote24},
			AttackTarget {Target = 8662, NpcId = 8576, FriendlyFire = FALSE},
			AttackTarget {Target = 8662, NpcId = 10085, FriendlyFire = FALSE},
			
			
		},
		[1800] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32486_CameraBote24},
			SetGlobalFlagTrue {Name = "g_sP209UriasKill"},
		},
		[1850] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32489_CameraBote7},
			CutSceneSay {Tag = "csa233alyah_029" , NpcId = 8590, String = "Urias ...! Ach verdammt! Kommt Runenkrieger, wir müssen zur Stadt fliehen!"},
			SetNoFightFlagTrue {NpcId = 8590}, --Aliah
			SetNoFightFlagTrue {NpcId = 10085}, --Khal
			--SetNoFightFlagTrue {NpcId = 8576}, --Jenquai
			SetNoFightFlagTrue {NpcId = 0}, --Avatar
			Kill {NpcId = 8663},
			Kill {NpcId = 9880},
			Kill {NpcId = 9802},
			Goto {X = 217, Y = 321, NpcId = 10085, Range = 1, WalkMode = Run, GotoMode = GotoForced},
			Goto {X = 219, Y = 321, NpcId = 8590, Range = 1, WalkMode = Run, GotoMode = GotoForced},
		},
		[1900] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote21},
			CutSceneSay {Tag = "csa233avatar_030" , NpcId = 0, String = "Ja, hier können wir nichts mehr tun. Zurück zur Stadt!"},
			SetNoFightFlagTrue {NpcId = 8576}, --Jenquai
			Goto {X = 410, Y = 255, NpcId = 10085, Range = 3, WalkMode = Run, GotoMode = GotoForced},	
			Goto {X = 410, Y = 255, NpcId = 8576, Range = 3, WalkMode = Run, GotoMode = GotoForced},		
			Goto {X = 410, Y = 255, NpcId = 8590, Range = 3, WalkMode = Run, GotoMode = GotoForced},
			Goto {X = 410, Y = 255, NpcId = 0, Range = 3, WalkMode = Run, GotoMode = GotoForced},
				
		},
		[1950] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32483_CameraBote21},
			SetGlobalFlagTrue{Name = "g_sP209UmspawnCutszeneBote2"},
			TeleportAvatar {X = 380, Y = 254},	
			Goto {X = 219, Y = 321, NpcId = 8662, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
		},
		[2000] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32486_CameraBote25},
			SetNoFightFlagFalse {NpcId = 0}, --Avatar
			SetNoFightFlagFalse {NpcId = 8590}, --Aliah
			SetNoFightFlagFalse {NpcId = 10085}, --Khal
			SetNoFightFlagFalse {NpcId = 8576}, --Jenquai
			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10085" },
			Goto {X = 410, Y = 255, NpcId = 0, Range = 3, WalkMode = Run, GotoMode = GotoForced},
			
		},
		[2100] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetGlobalFlagTrue {Name = "g_sP209CutszeneBoteEnded"},
			
				
		},		
	},
}



