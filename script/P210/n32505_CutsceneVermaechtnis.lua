-----------------------------------------------------------------------
--
--	P210 Clockwork Crypts Vermächtnis der Zerbiten
--
-----------------------------------------------------------------------


n32505_CameraVermaechtnis = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,100,1,"script\\P210\\n32505_CameraVermaechtnis.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P210_CutsceneVermaechtnis", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue{Name = "g_P210_StartCutsceneVermaechtnis"},
		IsGlobalFlagTrue{Name ="g_P210_TuomiIsSpawned"},
		
	},
	BeginActions =
	{
		SetGlobalFlagFalse{Name = "g_P210_StartCutsceneVermaechtnis"},
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32505_CameraVermaechtnis},
			Goto{X = 265, Y = 422, NpcId = 11216, Range = 0, WalkMode = Run}, -- Tuomi rennt zu Landschaftstor
		},
		
		[220] =
		{
			CutSceneSay {Tag = "csa239tuomi_001" , NpcId = 11216, String = "Ihr Geister der Zerbiten, hört mich. Ich habe alle fünf Artefakte des blutenden Auges gefunden. Öffnet mir das Tor."},
		},
		
		[270] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetGlobalFlagTrue{Name = "g_P204_VermaechtnisTorOpen"},
		},
		
		[330] =
		{
			LookAtFigure{NpcId = 11387, Target = 11216}, -- Geist schaut Tuomi an
			CutSceneSay {Tag = "csa239zerbiteghost_002" , NpcId = 11387, String = "Tatsächlich: Ihr habt Ring, Stab, Robe, Schild und Helm!"},
		},
		
		[410] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa239zerbiteghost_003" , NpcId = 11387, String = "Doch wart auch wirklich Ihr es, die die Artefakte gefunden hat? Ober habt Ihr sie von einem anderen erworben oder gestohlen?"},
		},
		
		[490] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa239tuomi_004" , NpcId = 11216, String = "Ich schwöre, dass ich sie alle durch die Kraft meines eigenen Geistes erlangt habe."},
		},
		
		[570] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa239zerbiteghost_005" , NpcId = 11387, String = "Damit seid Ihr berechtigt, unser Vermächtnis anzutreten."},
		},
		
		[650] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa239zerbiteghost_006" , NpcId = 11387, String = "So kommt denn also - hinein in das Herz der Uhrwerkhallen, die innersten Kammern unserer Festung, wo unsere wertvollsten Schätze verborgen liegen."},
		},
		
		[730] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			Goto{X = 268, Y = 459, NpcId = 11216, Range = 0, WalkMode = Walk}, -- Tuomi geht hinein
			Goto{X = 268, Y = 459, NpcId = 11387, Range = 0, WalkMode = Walk}, -- Geist geht hinein
		},
		
		
		[770] =
		{
			SetGlobalFlagTrue{Name = "g_P210_EndeCutsceneVermaechtnis"},
			SetGlobalTimeStamp{Name = "g_P210_TuomiDespawn"}, 
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
		},		
	},
}



