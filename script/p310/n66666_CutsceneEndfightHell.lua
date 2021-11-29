-----------------------------------------------------------------------
--
--	Derr aller letzte CoopDialog alles ind tot, ausser Nightsong
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
	Name = "EndfightHell", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		PlayerHasItem {ItemId = 7292},
		Negated 
		(
			ODER9
			{
				PlayerHasItem {ItemId = 7298},
				PlayerHasItem {ItemId = 7299}
			}
		)
		--Negated(PlayerHasItem {ItemId = 7300}),
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 10048},	
		SetNoFightFlagTrue {NpcId = 0},
		Goto {NpcId = 0, X = 38, Y = 169, WalkMode = Walk},
		Goto {NpcId = 10048, X = 39, Y = 170, WalkMode = Run},
	},
	TimedActions =
	{
		[10] =
		{
			ExecuteCameraScript{Script = CameraEndfightDark},	
		}, 
		[20] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa250nightsong_009" , NpcId = 10048, String = "Ihr habt gut gewählt, Freund! Der Täuscher ist tot ... aber das Tor zur Schattenwelt ist aufgestoßen! Sie werden kommen! Und einer der Wächter wird die anderen verraten! Die Prophezeiung nimmt ihren Lauf! "},
			LookAtFigure {Target = 10048, NpcId = 0},
			LookAtFigure {NpcId = 10048, Target = 0}, 
		},
		[70] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa250nightsong_010" , NpcId = 10048, String = "Ich muss meinen Vater finden, er muss das Siegel der Norcaine erhalten! Vielleicht kann er unser Volk noch wachrütteln! Lebt wohl, Bote, nehmt diesen Ring, er soll Euch schützen in der Zeit, die kommt. Wünscht uns Glück!"},
		},
		[110] =
		{	
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 10048},
			--TransferItem {GiveItem = 7291, Flag = Give},
			TransferItem {GiveItem = 7299, Flag = Give},
		},
	},
}
