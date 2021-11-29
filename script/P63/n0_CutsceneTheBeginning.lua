-----------------------------------------------------------------------
--
--	The Beginning
--
-----------------------------------------------------------------------

CameraTheBeginningI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,34,1,"script\\p63\\n0_CameraTheBeginningI.lua")
   	Camera:ScriptStart()
]]

CameraTheBeginningII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,31,1,"script\\p63\\n0_CameraTheBeginningIII.lua")  	
   	Camera:ScriptStart()
]]

CameraTheBeginningIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,31,1,"script\\p63\\n0_CameraTheBeginningII.lua")  	
   	Camera:ScriptStart()
]]

CameraTheBeginningIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,46,1,"script\\p63\\n0_CameraTheBeginningIV.lua")  	
   	Camera:ScriptStart()
]]

CameraTheBeginningV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p63\\n0_CameraTheBeginningV.lua")  	
   	Camera:ScriptStart()
]]

CameraTheBeginningVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p63\\n0_CameraTheBeginningVI.lua")  	
   	Camera:ScriptStart()
]]

-- rohen halbnah
CameraTheBeginningVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p63\\n0_CameraTheBeginningVII.lua")  	
   	Camera:ScriptStart()
]]

-- bote und avatar
CameraTheBeginningVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p63\\n0_CameraTheBeginningVIII.lua")  	
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "The Beginning", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetEffect {Effect = "SimpleInvis", NpcId = 0, Length = 3000},	-- avatar unsichtbar zu beginn. 		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraTheBeginningI},
			SetEffect {Effect = "HeroMonumentActive", NpcId = 4439, Length = 5000},	-- heronmonument effect.			
		},
		[25] = 
		{
			SetEffect {Effect = "MaterializeInMonument", NpcId = 0, Length = 5000},	-- avatar materialize.
			Goto {X = 69 , Y = 265, NpcId = 0, Range = 0, WalkMode = Walk},	-- rohen.
			LookAtFigure{NpcId = 0, Target = 3107}, -- avatar.	
			LookAtFigure{NpcId = 3107, Target = 0}, -- rohen.
		},
		[30] = 
		{
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 3107, Target = 0},
			Goto{X = 69, Y = 259, NpcId = 3107, Range = 0, WalkMode = Walk},
		},
		[40] = 
		{ 
			StopEffect {NpcId = 4439},	-- effect on monument off.
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 3107, Target = 0},
			CutSceneSay {Tag = "cutrohenGrf001" , NpcId = 3107, String = "Willkommen zurück, mein Freund..."},
		},
		[90] = 
		{
			WaitForEndOfSpeech,
			StopEffect {NpcId = 0},		-- effect on avatar off.				
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 3107, Target = 0},
			CutSceneSay {Tag = "cutrohenGrf002" ,NpcId = 3107, String = "Ich weiß, Deine Erinnerung ist verblasst... acht Jahre sind eine lange Zeit..."},			
		},
		[130] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 3107, Target = 0},
			CutSceneSay {Tag = "cutrohenGrf003" ,NpcId = 3107, String = "Viel ist geschehen! Der Krieg ist vorbei. Doch seine Folgen waren verheerend... die Konvokation hat das Antlitz unserer Welt zerschmettert!"},
		},
		[200] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 3107, Target = 0},
			LookAtFigure{NpcId = 3107, Target = 0},
			CutSceneSay {Tag = "cutrohenGrf004" ,NpcId = 3107, String = "Ich habe seither versucht, zu erhalten, was von dieser Welt noch übrig ist..."},
		},
		[250] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraTheBeginningII},				
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 3107, Target = 0},
			CutSceneSay {Tag = "cutrohenGrf005" ,NpcId = 3107, String = "Aber jetzt spüre ich, wie die Zeit naht! Der Kreis schließt sich... und diese Lande brauchen einen Beschützer!"},
		},
		[350] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 3107, Target = 0},
			SetGlobalFlagTrue {Name =  "BotenSpawnFlag"},	-- messenger spawns.
			CutSceneSay {Tag = "cutrohenGrf006" ,NpcId = 3107, String = "Mit Dir soll die Macht der Rune noch einmal erwachen! Doch diesmal sollst Du nicht der Sklave des Willens eines anderen sein..."},
		},
		[420] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 3107, Target = 0},
			Goto {X = 69 , Y = 262, NpcId = 3107, Range = 0, WalkMode = Walk},	-- rohen goes to avatar.
			CutSceneSay {Tag = "cutrohenGrf007" ,NpcId = 3107, String = "Diese Rune ist die Geißel, an die Deine Seele geschmiedet wurde. Trage sie nun selbst und sei Herr Deiner Entscheidungen!"},
		},
		[510] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraTheBeginningV},
			Goto {X = 67 , Y = 257, NpcId = 3107, Range = 0, WalkMode = Walk}, -- rohen.
			Goto {X = 68 , Y = 256, NpcId = 2916, Range = 0, WalkMode = Run},  -- bote.
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 3107, Target = 0},			
			CutSceneSay {Tag = "cutmaincharGrf001" ,NpcId = 0, String = "Ich... ich bin frei!"},
		},
		[550] = 
		{
			ExecuteCameraScript{Script = CameraTheBeginningIII},			
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 2916},
			LookAtFigure{NpcId = 3107, Target = 2916},
			LookAtFigure{NpcId = 2916, Target = 3107},
			CutSceneSay {Tag = "cutboteGrf001" ,NpcId = 2916, String = "Meister Rohen! Der Orden schickt mich mit wichtiger Botschaft!"},
		},
		[590] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 2916},
			CutSceneSay {Tag = "cutboteGrf002" , NpcId = 2916, String = "Etwas geschieht am Wildland Pass! Kreaturen aus schwarzem Stahl! Sie brechen in die Nordlande ein!"},
		},
		[670] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 3107},
			-- LookAtFigure{NpcId = 3107, Target = 0},
			CutSceneSay {Tag = "cutrohenGrf008" ,NpcId = 3107, String = "Die Eisernen sind gekommen! So hat es also begonnen..."},
		},
		[700] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 2916, Target = 0},			
			CutSceneSay {Tag = "cutboteGrf003" , NpcId = 2916, String = "Ihr müsst sofort aufbrechen!"},
			--Goto {X = 68 , Y = 260, NpcId = 3107, Range = 0, WalkMode = Walk}, -- rohen.				
		},
		[720] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 2916, Target = 0},						
			CutSceneSay {Tag = "cutrohenGrf009" ,NpcId = 3107, String = "In der Tat! Ich werde Darius aufsuchen! Du, mein Freund, solltest zuerst Deine Kräfte sammeln und Dich ausrüsten."},
		},
		[740] =
		{
			ExecuteCameraScript{Script = CameraTheBeginningIV},			
			Goto {X = 68 , Y = 260, NpcId = 3107, Range = 0, WalkMode = Walk}, -- rohen.	
		},		
		[780] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraTheBeginningVII},	
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 3107, Target = 0},
			LookAtFigure{NpcId = 2916, Target = 0},						
			CutSceneSay {Tag = "cutrohenGrf010" ,NpcId = 3107, String = "Folge dem Boten in die Stadt Graufurt! Sprich dort mit meinem Freund Sartarius! Er wird Dich einweisen! Er gehört zum Orden des Erwachens!"},
		},
		[850] = 
		{
			WaitForEndOfSpeech,
			--Goto {X = 70 , Y = 258, NpcId = 3107, Range = 0, WalkMode = Walk}, -- rohen geht nicht so weit weg.			
			LookAtFigure{NpcId = 0, Target = 3107},
			LookAtFigure{NpcId = 3107, Target = 0},
			LookAtFigure{NpcId = 2916, Target = 0},						
			CutSceneSay {Tag = "cutrohenGrf011" ,NpcId = 3107, String = "Viel Glück! Wir sehen uns, wenn ich zurückkehre, Freund!"},
		},
		[890] =
		{
			SetEffect {Effect = "DeMaterialize", NpcId = 3107, Length = 5000},	-- rohen disappears.		
		},
		[910] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraTheBeginningVIII},				
			Vanish {NpcId = 3107},	-- rohen vanishes.
			LookAtFigure{NpcId = 0, Target = 2916},
			LookAtFigure{NpcId = 2916, Target = 0},
			CutSceneSay {Tag = "cutboteGrf004" ,NpcId = 2916, String = "Bei den Göttern! Er hat tatsächlich einen Runenkrieger gerufen!"},
		},
		[940] = 
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "RohenDespawn"},
			LookAtFigure{NpcId = 0, Target = 2916},
			LookAtFigure{NpcId = 2916, Target = 0},
			CutSceneSay {Tag = "cutmaincharGrf002" ,NpcId = 0, String = "Ich... ich erinnere mich kaum... Wie gelange ich in diese Stadt... Graufurt?"},
		},
		[1000] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraTheBeginningVI},				
			LookAtFigure{NpcId = 0, Target = 2916},
			LookAtFigure{NpcId = 2916, Target = 0},
			CutSceneSay {Tag = "cutboteGrf005" ,NpcId = 2916, String = "Folgt dem Weg durch die Felsen! Ich werde Euch begleiten!"},
		},
		[1040] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 2916},
			LookAtFigure{NpcId = 2916, Target = 0},
			CutSceneSay {Tag = "cutboteGrf006" ,NpcId = 2916, String = "Aber lasst uns vorsichtig sein! Die Berggoblins sind in Aufruhr!"},
		},
		[1090] = 
		{
			WaitForEndOfSpeech,
			RevealUnExplored {X = 417, Y = 281, Range = 5},	-- sartarius in greyfell.
			SetGlobalFlagTrue {Name = "FollowSummoner"},	-- messenger follows avatar.		
		},
	},
}
