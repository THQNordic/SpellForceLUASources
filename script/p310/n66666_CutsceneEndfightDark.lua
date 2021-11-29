-----------------------------------------------------------------------
--
--	Derr aller letzte CoopDialog alles ind tot, ausser Nazach
--
-----------------------------------------------------------------------

-- Dummy Kamerafahrt
CameraEndfightDark = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p310\\n66666_CameraEndfightDarkI.lua")
   	Camera:ScriptStart()
]]




CreateCutScene
{
	Name = "EndfightDark", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		PlayerHasItem {ItemId = 7291},
		Negated 
		(
			ODER9
			{
				PlayerHasItem {ItemId = 7298},
				PlayerHasItem {ItemId = 7299}
			}
		)
		
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 10366},	
		SetNoFightFlagTrue {NpcId = 0},
		Goto {NpcId = 0, X = 38, Y = 169, WalkMode = Walk},
		Goto {NpcId = 10366, X = 39, Y = 170, WalkMode = Run},
	},
	TimedActions =
	{
		[10] =
		{
			SetGlobalFlagTrue {Name = "UmspawnInit"},
			ExecuteCameraScript{Script = CameraEndfightDark},	
		}, 
		[20] =
		{
			CutSceneSay {Tag = "csa250nazshar_011" , NpcId = 10366, String = "Ihr habt gut gewählt, Bote! Mit Hilfe der Schatten werden wir die Welt verändern! Ich werde es sein, der Nor auf unsere Welt zurückholt ... und er wird mich fürstlich belohnen! "},
			LookAtFigure {Target = 10366, NpcId = 0},
			LookAtFigure {NpcId = 10366, Target = 0}, 
		},
		[70] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa250nazshar_012" , NpcId = 10366, String = "Das Volk der Norcaine wird zu neuer Blüte aufsteigen! Wir brauchen die Barbaren Zarachs nicht mehr! Nor wird der alleinige Gott sein und wir werden Eo zu seinem Wohlgefallen vorbereiten!"},
		},
		[110] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa250nazshar_013" , NpcId = 10366, String = "Aber noch ist nicht die Zeit! Noch gibt es viel zu tun! Nehmt diesen Ring als unser Zeichen! Ich werde Euch rufen, wenn die Zeit gekommen ist!"},
			
		},
		[180] =
		{	
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 10366},
			TransferItem {GiveItem = 7298, Flag = Give},
			--TransferItem {GiveItem = 7292, Flag = Give},
		},
	},
}
