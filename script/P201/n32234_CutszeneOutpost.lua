-----------------------------------------------------------------------
--
--	P201Blackwater_CoastCutszeneOutpost
--
-----------------------------------------------------------------------


n32234_CameraOutpost1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32234_CameraOutpost1.lua")
   	Camera:ScriptStart()
]]

n32235_CameraOutpost2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32235_CameraOutpost2.lua")
   	Camera:ScriptStart()
]]

n32236_CameraOutpost3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32236_CameraOutpost3.lua")
   	Camera:ScriptStart()
]]

n32237_CameraOutpost4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32237_CameraOutpost4.lua")
   	Camera:ScriptStart()
]]

n32238_CameraOutpost5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P201\\n32238_CameraOutpost5.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P201Blackwater_CoastCutszeneOutpost", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_sP201PalisadentorOeffnen", UpdateInterval = 10},-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		PlayerUnitInRange {X = 91, Y = 77, Range = 8 , FigureType = FigureAvatar , UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
	},
	BeginActions =
	{
		SetGlobalFlagTrue {Name = "g_sP201StartCutszeneOutpost"},--actions zu beginn der cutscene:
		Goto {X = 85, Y = 77, NpcId = 8404, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
		Goto {X = 87, Y = 78, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[10] =
		{
			ExecuteCameraScript{Script = n32234_CameraOutpost1},		
			CutSceneSay {Tag = "csa202avatar_001" , NpcId = 0, String = "Es tut gut, wieder mit Euch zu kämpfen, Urias! Wie ich sehe, habt Ihr den Orden wieder aufgebaut!"},
		},	
		[80] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "csa202urias_002" , NpcId = 8404, String = "Es sind kaum mehr als eine Hand voll Ritter, die ich habe, Freund. Aber der Brief von Darius klang ernst genug, um nicht allein zu kommen."},
		},
		[180] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {Target = 0, NpcId = 8404},
			LookAtFigure {Target = 8404, NpcId = 0},
			ExecuteCameraScript{Script = n32235_CameraOutpost2},	
			CutSceneSay {Tag = "csa202avatar_003" , NpcId = 0, String = "Habt Ihr schon einen Hinweis wo Darius sein könnte?"},
		},
		[220] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa202urias_004" , NpcId = 8404, String = "Wir haben die gesamte Küste nach ihm durchkämmt, er war nirgends zu finden. Nur eine Grabstätte konnten wir nicht untersuchen."},
			LookAtDirection {Direction = South, NpcId = 10364},
		},	
		[300] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32236_CameraOutpost3},	
			CutSceneSay {Tag = "csa202urias_005" , NpcId = 8404, String = "Eine Kreatur schleicht dort herum! Der mächtigste Untote, den ich je gesehen habe!"},
			
		},
		[340] =
		{
			SetGlobalFlagTrue {Name = "g_sP201OutpostCutszeneSpawn"},
		},
		[370] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32238_CameraOutpost5},	
			CutSceneSay {Tag = "csa202urias_006" , NpcId = 8404, String = "Er verteidigt das Grab ... und schickt seine Schergen immer wieder gegen uns! Und sobald sie einen der Unseren erschlagen haben, gehört der Kreatur seine Seele!"},
			
		},
		[440] =
		{
			Kill {NpcId = 9084},			
		},
		
		[470] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32236_CameraOutpost3},	
			CutSceneSay {Tag = "csa202urias_007" , NpcId = 8404, String = "So wird jeder Erschlagene ein neuer Untoter in den Reihen des Grabwächters!"},
			SetGlobalFlagTrue {Name = "g_sP201OutpostCutszeneRespawn"},	
		},
		[490] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "g_sP201OutpostCutszeneSpawn2"},

		},
		[530] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32238_CameraOutpost5},
			CutSceneSay {Tag = "csa202urias_008" , NpcId = 8404, String = "Nur das Licht Aonirs kann die Seelen wieder befreien und in ein neues Leben zurückrufen! Wer den Ring des Gottes trägt, dessen Schwert ist gesegnet und wird den unheiligen Bann brechen!"},
			SetGlobalFlagTrue {Name = "g_sP201OutpostCutszeneSpawn3"},
		},
		[710] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa202urias_009" , NpcId = 8404, String = "Wir müssen Aonirs Ring wieder erlangen, bevor wir bis zu der Grabstätte vordringen können! Mein bester Leutnant trug ihn, aber er ist gefallen!"},
		},
		[810] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32237_CameraOutpost4},	
			SetGlobalFlagTrue {Name = "g_sP201OutpostCutszeneDespawn"},
			CutSceneSay {Tag = "csa202urias_010" , NpcId = 8404, String = "Wir müssen nach Süden, dort liegt mein armer Leutnant. Nehmt dort den Ring an Euch, dann könnt Ihr vielleicht der Flut der Gegner ein Ende setzen!"},
			SetGlobalFlagTrue {Name = "g_sP201OpenDoorSouth"},
			SetGlobalFlagTrue {Name = "g_sP201LightKingUmspawnCutszeneOutpost"},
			
			
		},
		[890] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32234_CameraOutpost1},	
			
			
			
		},
		[930] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetGlobalFlagTrue {Name = "g_sP201EndeVomAnfangCutszeneOutpost"},
			Follow {Target = 0, NpcId = 8404},
					
		},		
	},
}



