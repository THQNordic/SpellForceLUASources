-----------------------------------------------------------------------
--
--	P210 Clockwork Crypts Room 1 Xalaban-Cutscene (Hebel-Tutorial)
--
-----------------------------------------------------------------------


n32504_CameraEndkampf = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,100,1,"script\\P210\\n32504_CameraEndkampf.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P210_CutsceneEndkampf", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue{Name = "g_P210_StartEndFightXalabarCutscene"},
		
	},
	BeginActions =
	{
		SetGlobalFlagFalse{Name = "g_P210_StartEndFightXalabarCutscene"},
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32504_CameraEndkampf},
		},
		
		[10] =
		{
			LookAtFigure{NpcId = 9083, Target = 0}, -- Xalabans schaut Avatar an
			CutSceneSay {Tag = "csa238avatar_001" , NpcId = 0, String = "Ihr habe Euer Szepter! Nun macht den Weg frei!"},
		},
		
		[70] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa238xalabar_002" , NpcId = 9083, String = "Damit Ihr den Krieg zu meinem Volk tragen könnt? Niemals! Männer, erschlagt den Runenknecht!"},
		},
		
		[130] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure{NpcId = 9684, Target = 9083}, -- Kathai schaut Xalabar an
			CutSceneSay {Tag = "csa238kahtaiwarrior_003" , NpcId = 9684, String = "Xalabar, du gabst ihm dein Wort! Willst du den Zorn der Winde über uns bringen?"},
		},
		
		[190] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure{NpcId = 9083, Target = 9684}, -- Xalabar schaut Kathai an
			CutSceneSay {Tag = "csa238xalabar_004" , NpcId = 9083, String = "Es ist zum Wohle unseres Volkes! Was zählt da schon ein Wort! Greift an!"},
		},
		
		[250] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa238kahtaiwarrior_005" , NpcId = 9684, String = "Der Hass hat dein Herz verschlungen! Du bist von Sinnen, Xalabar!"},
		},
		
		[310] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa238xalabar_006" , NpcId = 9083, String = "Du verleugnest mir die Treue eines Kriegers?"},
		},
		
		[350] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa238kahtaiwarrior_007" , NpcId = 9684, String = "Ich kämpfe nicht für einen Lügner!"},
		},
		
		[380] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa238xalabar_008" , NpcId = 9083, String = "Dann stirb als Feigling!"},
		},
		
		[440] =
		{
			ChangeRace{Race = 139, NpcId = 9684 }, -- Anti-Xalaban-Kathai wird gut
			ChangeRace{Race = 139, NpcId = 9695 }, -- Anti-Xalaban-Kathai wird gut
			ChangeRace{Race = 139, NpcId = 9703 }, -- Anti-Xalaban-Kathai wird gut
			ChangeRace{Race = 139, NpcId = 9698 }, -- Anti-Xalaban-Kathai wird gut
			ChangeRace{Race = 139, NpcId = 9708 }, -- Anti-Xalaban-Kathai wird gut
			ChangeRace{Race = 139, NpcId = 9690 }, -- Anti-Xalaban-Kathai wird gut
			ChangeRace{Race = 139, NpcId = 9696 }, -- Anti-Xalaban-Kathai wird gut
			ChangeRace{Race = 139, NpcId = 9689 }, -- Anti-Xalaban-Kathai wird gut
			ChangeRace{Race = 139, NpcId = 9688 }, -- Anti-Xalaban-Kathai wird gut
			ChangeRace{Race = 139, NpcId = 9702 }, -- Anti-Xalaban-Kathai wird gut
			ChangeRace{ Race = 105 , NpcId = 9083 }, -- Xalaban wird böse
			ChangeRace{ Race = 105 , NpcId = 9685 }, -- Pro-Xalaban-Kathai wird böse
			ChangeRace{ Race = 105 , NpcId = 9686 }, -- Pro-Xalaban-Kathai wird böse
			ChangeRace{ Race = 105 , NpcId = 9687 }, -- Pro-Xalaban-Kathai wird böse
			ChangeRace{ Race = 105 , NpcId = 9693 }, -- Pro-Xalaban-Kathai wird böse
			ChangeRace{ Race = 105 , NpcId = 9694 }, -- Pro-Xalaban-Kathai wird böse
			ChangeRace{ Race = 105 , NpcId = 9697 }, -- Pro-Xalaban-Kathai wird böse
			ChangeRace{ Race = 105 , NpcId = 9699 }, -- Pro-Xalaban-Kathai wird böse
			ChangeRace{ Race = 105 , NpcId = 9704 }, -- Pro-Xalaban-Kathai wird böse
			ChangeRace{ Race = 105 , NpcId = 9705 }, -- Pro-Xalaban-Kathai wird böse
			ChangeRace{ Race = 105 , NpcId = 9706 }, -- Pro-Xalaban-Kathai wird böse
			ChangeRace{ Race = 105 , NpcId = 9707 }, -- Pro-Xalaban-Kathai wird böse
			QuestBegin{QuestId = 912}, -- Unterquest "Töte Xalabar"
		},
		
		[600] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
		},		
	},
}



