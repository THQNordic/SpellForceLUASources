-----------------------------------------------------------------------
--
--	P202_CutsceneHokanEnde
--
-----------------------------------------------------------------------


n32262_CameraHokanEnde_I = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,8,1,"script\\P202\\n32262_CameraHokanEnde_I.lua")
   	Camera:ScriptStart()
]]


n32262_CameraHokanEnde_II = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P202\\n32262_CameraHokanEnde_II.lua")
   	Camera:ScriptStart()
]]

n32262_CameraHokanEnde_III = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\P202\\n32262_CameraHokanEnde_III.lua")
   	Camera:ScriptStart()
]]

n32262_CameraHokanEnde_IV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\P202\\n32262_CameraHokanEnde_IV.lua")
   	Camera:ScriptStart()
]]

n32262_CameraHokanEnde_V = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P202\\n32262_CameraHokanEnde_V.lua")
   	Camera:ScriptStart()
]]

n32262_CameraHokanEnde_VI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P202\\n32262_CameraHokanEnde_VI.lua")
   	Camera:ScriptStart()
]]

n32262_CameraHokanEnde_VII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P202\\n32262_CameraHokanEnde_VII.lua")
   	Camera:ScriptStart()
]]


n32262_CameraHokanEnde_VIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P202\\n32262_CameraHokanEnde_VIII.lua")
   	Camera:ScriptStart()
]]


--OnOneTimeEvent
--{
--	Actions = 
--	{
--		SetGlobalTimeStamp {Name = "g_tP202HokanUmspawn"},
--		SetGlobalFlagTrue {Name = "g_P202HokanAnfangSpawnInit"},
--		SetEffect{Effect = "Spawnboss", NpcId = Avatar, Length = 15000},
--	},
--}

CreateCutScene
{
	Name = "P202_CutsceneHokanEnde", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		
		PlayerHasItem {ItemId = 4633, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 20},
		FigureInRange {NpcId = 0, Range = 6, X = 397, Y = 102},
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		--SetGlobalFlagTrue{Name = "P202CSHokanEndeTestFlag"},
		LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32262_CameraHokanEnde_I},	
			Goto {X = 388, Y = 103, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},
		
		[10] =
		{
			CutSceneSay {Tag = "csa206avatar_001", NpcId = 0, String = "Eure Urne, Maskenmann!"},
		},
		
		
		[30] =
		{
			--WaitForEndOfSpeech,
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
			Goto {X = 386, Y = 103, NpcId = 9010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			TransferItem {TakeItem = 4633, GiveItem = 0, Amount = 1, Flag = Take},
			LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
				
		},
		
		
		[40] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan	
			LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
			CutSceneSay {Tag = "csa206masked_002", NpcId = 9010, String = "Sehr gut ... weicht zurück, während ich den Essenztrank darauf gieße ..."},
		},
		
		
		[60] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtDirection {Direction = West, NpcId = 9010}, --Hokan schaut in Richtung Beschwörungsstelle
			Goto {X = 393, Y = 100, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0},	--Avatar weicht zurück
			Goto {X = 388, Y = 105, NpcId = 9010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},	--Avatar weicht zurück
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan	
		},
		
		
		[70] =
		{
			LookAtDirection {NpcId = 9010, Direction = West},
			ExecuteCameraScript{Script = n32262_CameraHokanEnde_II}, --Close auf Avatar
			SetEffect {Effect = "Inflex", Length = 9000 , TargetType = Figure , NpcId = 9010},
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan	
		},
		
		[75] =
		{
			LookAtDirection {NpcId = 9010, Direction = West},
		},
		
		[80] =
		{
			LookAtDirection {NpcId = 9010, Direction = West},
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan	
			CutSceneSay {Tag = "csa206avatar_003" , NpcId = 0, String = "Was ist das?"},	
			
		},
		
		[90] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32262_CameraHokanEnde_III}, --Beschwörungs Camera (12 Sekunden lang)
			CutSceneSay {Tag = "csa206masked_004" , NpcId = 9010, String = "Das ist die Essenz des Lebens, mein Freund! Sie erweckt Tote zu wahrhaft neuem Leben!"},	
			LookAtDirection {NpcId = 9010, Direction = West},
		},
		
		[110] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CastSpell {Spell = 1556, Target = 9010, TargetType = Figure, X = 0, Y = 0, NpcId = 9010},
			CutSceneSay {Tag = "csa206masked_005", NpcId = 9010, String = "Erhebe dich, Raith Skaddar, Schwarzer Meister aus dem Kreis der Dreizehn! Erhebe dich und sei mein!"},			
		},
		
		[130] =
		{
			SetEffect {Effect = "PlasmaSmoke", Length = 3000 , TargetType = World , X = 386, Y = 106},
			SetGlobalFlagTrue {Name = "g_P202RaithErwache"},
		},
		
		
		[150] =
		{
			LookAtDirection {Direction = 1, NpcId = 9106},
		},
		
		
		[160] =
		{
			
			WaitForEndOfSpeech,	 --sollte immer angegeben werden	
			LookAtDirection {Direction = 1, NpcId = 9106},
			CutSceneSay {Tag = "csa206raith_006", NpcId = 9106, String = "Ihr habt mir Leben und Kraft wiedergegeben! Doch der Preis dafür bindet mich an Euren Willen!"},	
		},
		
		[210] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden	
			CutSceneSay {Tag = "csa206masked_007" , NpcId = 9010, String = "Das war der Plan, mein Freund."},		
		},
		
		[240] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32262_CameraHokanEnde_IV},	
			Goto {X = 390, Y = 101, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},--Avatar kommt angelaufen		
			Goto {X = 388, Y = 103, NpcId = 9010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},--Hokan geht ein paar Schritte
			CutSceneSay {Tag = "csa206avatar_008", NpcId = 0, String = "Raith Skaddar? Das ist ein Magier des Zirkels!"},
			LookAtFigure {Target = 0, NpcId = 9106}, --ZM auf Avatar	
			LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},

		[245] =
		{
			LookAtFigure {Target = 0, NpcId = 9106}, --ZM auf Avatar	
			LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[250] =
		{
			LookAtFigure {Target = 0, NpcId = 9106}, --ZM auf Avatar	
			LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[255] =
		{
			LookAtFigure {Target = 0, NpcId = 9106}, --ZM auf Avatar	
			LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[260] =
		{
			LookAtFigure {Target = 0, NpcId = 9106}, --ZM auf Avatar	
			LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[265] =
		{
			LookAtFigure {Target = 0, NpcId = 9106}, --ZM auf Avatar	
			LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		
		[270] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
			LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
			
			CutSceneSay {Tag = "csa206avatar_009", NpcId = 0, String = "Ihr erweckt den Zirkel! Und ich habe Euch ... geholfen!"},
		},
		
		[300] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
			LookAtFigure {Target = 0, NpcId = 9010}, --Hokan auf Avatar
			
			CutSceneSay {Tag = "csa206masked_010", NpcId = 9010, String = "Und das werdet Ihr auch weiterhin tun, Sklave! Ihr wollt doch etwas von Eurem Gegenmittel, oder?"},
		},
		
		[360] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			Goto {X = 389, Y = 102, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},-- Avatar noch einen Schritt näher	
			CutSceneSay {Tag = "csa206avatar_011", NpcId = 0, String = "Gebt es mir!"},		
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},

		[370] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[375] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		
		[380] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden	
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
			ExecuteCameraScript{Script = n32262_CameraHokanEnde_V},	
			CutSceneSay {Tag = "csa206masked_012", NpcId = 9010, String = "Oh nein! Zuerst müsst Ihr noch etwas für mich tun!"},		
		},
		
		[395] =
		{
			Goto {X = 385, Y = 98, NpcId = 9010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},--Hokan geht ein paar Schritte
		},
		
		[415] =
		{
			Goto {X = 388, Y = 101, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},-- Avatar noch einen Schritt näher	
		},
		[425] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[435] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[440] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[444] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		
		[445] =
		{
			
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
			LookAtDirection {NpcId = 9010, Direction = West},
			CutSceneSay {Tag = "csa206masked_013", NpcId = 9010, String = "In der Stadt Empyria, im alten Xu, gibt es jemanden, der meinen Plänen sehr gefährlich werden kann! Die Dryade der Lebenseibe!"},		
			--Goto {X = 382, Y = 98, NpcId = 9010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},--Hokan geht ein paar Schritte
		},
		
		[450] =
		{
				
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
			CutSceneSay {Tag = "csa206masked_014", NpcId = 9010, String = "Ich habe zwar den Kaiser dort fest in meiner Hand, aber er will sie nicht töten, der Narr! Ich glaube fast, er ist ihr verfallen."},		
			Goto {X = 387, Y = 100, NpcId = 9010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},--Hokan geht ein paar Schritte
		},
		
		[490] =
		{
			--ExecuteCameraScript{Script = n32262_CameraHokanEnde_IV},	
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 9010, NpcId = 0}, 
			CutSceneSay {Tag = "csa206masked_015", NpcId = 9010, String = "Also müsst Ihr es tun! Geht nach Empyria! Findet die Frau unter dem Baum ..."},	
			Goto {X = 384, Y = 97, NpcId = 9010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},--Hokan geht ein paar Schritte
		},
		
		[530] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32262_CameraHokanEnde_VIII},	
			LookAtFigure {Target = 0, NpcId = 9010}, -- Hokan auf Avatar
			CutSceneSay {Tag = "csa206masked_016", NpcId = 9010, String = "... und tötet sie! Ich habe schon andere geschickt, aber sie haben alle versagt! Meine Macht reicht nicht bis in ihren Hain!"},	
			Goto {X = 385, Y = 98, NpcId = 9010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},--Hokan geht ein paar Schritte
		},
		
		[550] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			Goto {X = 386, Y = 99, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0},	
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
			CutSceneSay {Tag = "csa206avatar_017", NpcId = 0, String = "Monstrum! Ich werde nicht ..."},	
		},
		
		[570] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32262_CameraHokanEnde_VI},	
			Goto {X = 378, Y = 101, NpcId = 9010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},	--Hokan Richtung Tor	
			CutSceneSay {Tag = "csa206masked_018", NpcId = 9010, String = "Spart Euren Atem, Ihr wisst, was ohne das Mittel mit Euch geschieht!"},	
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
				
		},
		[575] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[580] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[585] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[590] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[595] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		[600] =
		{
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
		},
		
		[610] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32262_CameraHokanEnde_VII},	
			--Goto {X = 365, Y = 111, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			--CastSpell {Spell = 1556, Target = 9010, TargetType = Figure, X = 0, Y = 0, NpcId = 9010},
			LookAtFigure {Target = 9010, NpcId = 0}, --Avatar auf Hokan
			SetEffect {Effect = "OccludeBlackBig", X = 344, Y = 121, Length = 2000, TargetType = World},
			CutSceneSay {Tag = "csa206masked_019", NpcId = 9010, String = "Durchquert dieses Portal! Es führt zu einem Ort ein wenig außerhalb von Empyria. Haltet Euch dann südwärts."},	
			Goto {X = 381, Y = 101, NpcId = 9010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},	--Hokan Richtung Tor	
		},
		
		[620] =
		{
			--WaitForEndOfSpeech,	 --sollte immer angegeben werden
			RemoveObject {X = 346, Y = 122, Object = 852},
			RemoveObject {X = 345, Y = 121, Object = 857},
			RemoveObject {X = 345, Y = 120, Object = 861},
			RemoveObject {X = 346, Y = 121, Object = 853},
			RemoveObject {X = 342, Y = 122, Object = 3239},
		},
		
		
	
		[650] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetGlobalFlagTrue{Name = "g_sP202CutsceneHokanEndeEnded"},
		},		
	},
}



