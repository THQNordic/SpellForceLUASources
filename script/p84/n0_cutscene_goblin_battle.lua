  ------------------------
 --------------------------
-- Avatar VS Goblin Eight --
 -------------------------
  -----------------------
  
GoblinBattle001 =		-- Kamera dreht sich leicht um Schauplatz
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p84\\goblin_battle_001.lua")
   	Camera:ScriptStart()
]]

GoblinBattle002 =		-- Kamera dreht sich Avatar und zeigt die "Vertriebenen"
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p84\\goblin_battle_002.lua")
   	Camera:ScriptStart()
]]

GoblinBattle003 =		-- Kamera fährt nach oben, und über den Avatar, mit Fokus auf den Avatar
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p84\\goblin_battle_003.lua")
   	Camera:ScriptStart()
]]
GoblinBattle004 =		-- Kamera fährt um den Avatar rum, bewegt sich langsam nach oben, und fokusiert auf den Avatar
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p84\\goblin_battle_004.lua")
   	Camera:ScriptStart()
]]
GoblinBattle005 =		-- Kamera fährt um den Avatar rum, bewegt sich langsam nach oben, und fokusiert auf den Avatar
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p84\\goblin_battle_005.lua")
   	Camera:ScriptStart()
]]
GoblinBattle666 =		-- Kamera fährt um den Avatar rum, bewegt sich langsam nach oben, und fokusiert auf den Avatar
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,50,1,"script\\p84\\goblin_battle_666.lua")
   	Camera:ScriptStart()
]]
Kill8349 =	-- Kamera auf NPC8349/Avatar
[[
	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\goblin_battle_kill_8349.lua")
   	Camera:ScriptStart()
]]
Kill8351 =	-- Kamera auf NPC8351/Avatar
[[
	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\goblin_battle_kill_8351.lua")
   	Camera:ScriptStart()
]]
Kill8353 =	-- Kamera auf NPC8353/Avatar
[[
	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\goblin_battle_kill_8353.lua")
   	Camera:ScriptStart()
]]
Kill8354 =	-- Kamera auf NPC8354/Avatar
[[
	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\goblin_battle_kill_8354.lua")
   	Camera:ScriptStart()
]]
Kill8352 =	-- Kamera auf NPC8352/Avatar
[[
	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\goblin_battle_kill_8352.lua")
   	Camera:ScriptStart()
]]
Kill8348 =	-- Kamera auf NPC8348/Avatar
[[
	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\goblin_battle_kill_8348.lua")
   	Camera:ScriptStart()
]]
Kill8350 =	-- Kamera auf NPC8350/Avatar
[[
	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\goblin_battle_kill_8350.lua")
   	Camera:ScriptStart()
]]
Kill8355 =	-- Kamera auf NPC8355/Avatar
[[
	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\goblin_battle_kill_8355.lua")
   	Camera:ScriptStart()
]]
Kill9110 =	-- Kamera auf NPC9110/Avatar
[[
	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p84\\goblin_battle_kill_9110.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "Avatar_VS_Goblin_Eight", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
		--IsGlobalFlagTrue{Name = "VernichteGoblins", UpdateInterval = 1},
		IsGlobalFlagTrue{Name = "VernichteGoblins"},
		FigureInRange{X = 116, Y = 92, NpcId = Avatar , Range = 4}
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = GoblinBattle001},
			SetGlobalFlagTrue{Name = "p84_start_goblin_battle"},
			Goto{X = 116, Y = 92, NpcId = Avatar, Range = 0, WalkMode = Walk},
		},
		[10] =
		{
			Goto{X = 116, Y = 95, NpcId = 8348, Range = 0, WalkMode = Walk},
			Goto{X = 118, Y = 94, NpcId = 8349, Range = 0, WalkMode = Walk},
			Goto{X = 119, Y = 92, NpcId = 8350, Range = 0, WalkMode = Walk},
			Goto{X = 118, Y = 90, NpcId = 8351, Range = 0, WalkMode = Walk},
			Goto{X = 116, Y = 89, NpcId = 8352, Range = 0, WalkMode = Walk},
			Goto{X = 114, Y = 90, NpcId = 8353, Range = 0, WalkMode = Walk},
			Goto{X = 113, Y = 92, NpcId = 8354, Range = 0, WalkMode = Walk},
			Goto{X = 114, Y = 94, NpcId = 8355, Range = 0, WalkMode = Walk},
		},
		[70] =
		{
			LookAtFigure{NpcId = 0, Target = 8354},
			LookAtFigure{NpcId = 8348, Target = 0},
			LookAtFigure{NpcId = 8349, Target = 0},
			LookAtFigure{NpcId = 8350, Target = 0},
			LookAtFigure{NpcId = 8351, Target = 0},
			LookAtFigure{NpcId = 8352, Target = 0},
			LookAtFigure{NpcId = 8353, Target = 0},
			LookAtFigure{NpcId = 8354, Target = 0},
			LookAtFigure{NpcId = 8355, Target = 0},
			ExecuteCameraScript{Script = GoblinBattle005},
		},
		
		[215] =
		{
			Goto{X = 117, Y = 93, NpcId = 8349, Range = 0, WalkMode = Walk},
		},
		[220] =
		{
			Goto{X = 117, Y = 91, NpcId = 8351, Range = 0, WalkMode = Walk},
		},
		[225] =
		{
			Goto{X = 115, Y = 91, NpcId = 8353, Range = 0, WalkMode = Walk},
		},
		[230] =
		{
			--Goto{X = 114, Y = 92, NpcId = 8354, Range = 0, WalkMode = Walk},
			Goto{X = 115, Y = 92, NpcId = 8354, Range = 0, WalkMode = Walk},
		},
		[235] =
		{
			--Goto{X = 116, Y = 90, NpcId = 8352, Range = 0, WalkMode = Walk},
			Goto{X = 116, Y = 91, NpcId = 8352, Range = 0, WalkMode = Walk},
		},
		[240] =
		{
			--Goto{X = 116, Y = 94, NpcId = 8348, Range = 0, WalkMode = Walk},
			Goto{X = 116, Y = 93, NpcId = 8348, Range = 0, WalkMode = Walk},
		},
		[245] =
		{
			--Goto{X = 118, Y = 92, NpcId = 8350, Range = 0, WalkMode = Walk},
			Goto{X = 117, Y = 92, NpcId = 8350, Range = 0, WalkMode = Walk},
		},
		[250] =
		{
			Goto{X = 115, Y = 93, NpcId = 8355, Range = 0, WalkMode = Walk},
		},
		[260] =
		{
			LookAtFigure{NpcId = 0, Target = 8354},
			ExecuteCameraScript{Script = GoblinBattle003},
		},
		[330] =
		{
			SetGlobalFlagTrue{Name = "p84_final_goblin_battle"},	
		},
		
--		[270] =
--		{
--			--LookAtFigure{NpcId = 0, Target = 8354},
--			--LookAtFigure{NpcId = 8348, Target = 0},
--			--LookAtFigure{NpcId = 8349, Target = 0},
--			--LookAtFigure{NpcId = 8350, Target = 0},
--			--LookAtFigure{NpcId = 8351, Target = 0},
--			--LookAtFigure{NpcId = 8352, Target = 0},
--			--LookAtFigure{NpcId = 8353, Target = 0},
--			--LookAtFigure{NpcId = 8354, Target = 0},
--			--LookAtFigure{NpcId = 8355, Target = 0},
--			ExecuteCameraScript{Script = GoblinBattle003},
--		},
		--[315] =
		--{
		--	Goto{X = 117, Y = 93, NpcId = 8349, Range = 0, WalkMode = Walk},
		--},
		--[320] =
		--{
		--	Goto{X = 117, Y = 91, NpcId = 8351, Range = 0, WalkMode = Walk},
		--},
		--[325] =
		--{
		--	Goto{X = 115, Y = 91, NpcId = 8353, Range = 0, WalkMode = Walk},
		--},
		--[330] =
		--{
		--	--Goto{X = 114, Y = 92, NpcId = 8354, Range = 0, WalkMode = Walk},
		--	Goto{X = 115, Y = 92, NpcId = 8354, Range = 0, WalkMode = Walk},
		--},
		--[335] =
		--{
		--	--Goto{X = 116, Y = 90, NpcId = 8352, Range = 0, WalkMode = Walk},
		--	Goto{X = 116, Y = 91, NpcId = 8352, Range = 0, WalkMode = Walk},
		--},
		--[340] =
		--{
		--	--Goto{X = 116, Y = 94, NpcId = 8348, Range = 0, WalkMode = Walk},
		--	Goto{X = 116, Y = 93, NpcId = 8348, Range = 0, WalkMode = Walk},
		--},
		--[345] =
		--{
		--	--Goto{X = 118, Y = 92, NpcId = 8350, Range = 0, WalkMode = Walk},
		--	Goto{X = 117, Y = 92, NpcId = 8350, Range = 0, WalkMode = Walk},
		--},
		--[350] =
		--{
		--	Goto{X = 115, Y = 93, NpcId = 8355, Range = 0, WalkMode = Walk},
		--},		
		[360] =
		{
			AttackTarget{Target = 0, NpcId = 8349, FriendlyFire = TRUE}, -- erster Goblin greift an
		},
		[365] =
		{
			LookAtFigure{NpcId = 0, Target = 8349},
			ExecuteCameraScript{Script = Kill8349},
			--ExecuteCameraScript{Script = GoblinBattle666},
		},
		[370] =
		{			
			AttackTarget{Target = 8349, NpcId = 0, FriendlyFire = TRUE}, -- Avatar pariert Angriff des ersten Goblins
			AttackTarget{Target = 0, NpcId = 8351, FriendlyFire = TRUE}, -- zweiter Goblin greift an
		},
		[375] =
		{
			PlaceObject{X = 118 ,Y = 94 ,Object = 2604}, -- Blut für 8349
		},
		[380] =
		{	
			ExecuteCameraScript{Script = Kill8351},
			AttackTarget{Target = 8351, NpcId = 0, FriendlyFire = TRUE}, -- Avatar pariert Angriff des zweiten Goblins
			AttackTarget{Target = 0, NpcId = 8353, FriendlyFire = TRUE}, -- dritter Goblin greift an
		},
		[385] =
		{
			PlaceObject{X = 118 ,Y = 90 ,Object = 2674}, -- Blut für 8351
		},
		[390] =
		{	
			ExecuteCameraScript{Script = Kill8353},
			AttackTarget{Target = 8353, NpcId = 0, FriendlyFire = TRUE}, -- Avatar pariert Angriff des dritten Goblins
			AttackTarget{Target = 0, NpcId = 8354, FriendlyFire = TRUE}, -- vierter Goblin greift an
		},
		[395] =
		{
			PlaceObject{X = 114 ,Y = 90 ,Object = 2609}, -- Blut für 8353
		},
		[400] =
		{	
			ExecuteCameraScript{Script = Kill8354},
			AttackTarget{Target = 8354, NpcId = 0, FriendlyFire = TRUE}, -- Avatar pariert Angriff des vierten Goblins
			AttackTarget{Target = 0, NpcId = 8352, FriendlyFire = TRUE}, -- fünfter Goblin greift an
		},
		[405] =
		{
			PlaceObject{X = 114 ,Y = 92 ,Object = 2675}, -- Blut für 8354
		},
		[410] =
		{	
			ExecuteCameraScript{Script = Kill8352},
			AttackTarget{Target = 8352, NpcId = 0, FriendlyFire = TRUE}, -- Avatar pariert Angriff des fünften Goblins
			AttackTarget{Target = 0, NpcId = 8348, FriendlyFire = TRUE}, -- sechster Goblin greift an			
		},
		[415] =
		{
			PlaceObject{X = 116 ,Y = 90 ,Object = 2610}, -- Blut für 8352
		},
		[420] =
		{
			ExecuteCameraScript{Script = Kill8348},
			AttackTarget{Target = 8348, NpcId = 0, FriendlyFire = TRUE}, -- Avatar pariert Angriff des sechsten Goblins
			AttackTarget{Target = 0, NpcId = 8350, FriendlyFire = TRUE}, -- siebenter Goblin greift an
		},
		[425] =
		{
			PlaceObject{X = 116 ,Y = 94 ,Object = 2676}, -- Blut für 8348
		},
		[430] =
		{
			ExecuteCameraScript{Script = Kill8350},
			AttackTarget{Target = 8350, NpcId = 0, FriendlyFire = TRUE}, -- Avatar pariert Angriff des siebenten Goblins
			AttackTarget{Target = 0, NpcId = 8355, FriendlyFire = TRUE}, -- achter Goblin greift an
			Goto{X = 118, Y = 94, NpcId = 9110, Range = 0, WalkMode = Run}, -- 9. Goblin läuft zum Avatar
		},
		[435] =
		{
			PlaceObject{X = 118 ,Y = 92 ,Object = 2609}, -- Blut für 8350
			Goto{X = 118, Y = 90, NpcId = 9112, Range = 0, WalkMode = Run}, -- 10. Goblin läuft zum Avatar
		},
		[440] =
		{
			ExecuteCameraScript{Script = Kill8355},
			AttackTarget{Target = 8355, NpcId = 0, FriendlyFire = TRUE}, -- Avatar pariert Angriff des achten Goblins
			AttackTarget{Target = 0, NpcId = 9110, FriendlyFire = TRUE}, -- 9. Goblin greift Avatar an
			Goto{X = 114, Y = 90, NpcId = 9114, Range = 0, WalkMode = Run}, -- 11. Goblin läuft zum Avatar
		},
		[445] =
		{
			PlaceObject{X = 114 ,Y = 94 ,Object = 2604}, -- Blut für 8355(8. Goblin)
			--AttackTarget{Target = 9110, NpcId = 0, FriendlyFire = TRUE}, -- Avatar greift 9. Goblin an			
		},	
		[450] =
		{
			AttackTarget{Target = 9110, NpcId = 0, FriendlyFire = TRUE}, -- Avatar greift 9. Goblin an			
			ExecuteCameraScript{Script = Kill9110},
		},
		[460] =
		{	
			PlaceObject{X = 119 ,Y = 95 ,Object = 2676}, -- Blut für 9110 (9. Goblin)
		},
		[470] =
		{
			ExecuteCameraScript{Script = GoblinBattle002},
			SetPlayerFlagTrue{Name = "p84_goblins_defeated"},
			SetPlayerFlagFalse{Name = "AuftragVernichteGoblinsErhalten"},
		},
		[500] =
		{
			Goto{X = 122, Y = 94, NpcId = Avatar, Range = 0, WalkMode = Walk},
		},
		[580] = -- 4 Sekunden nach Weggang des Avatars
		{
		},
	},
}