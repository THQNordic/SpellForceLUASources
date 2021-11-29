-- Kreischer Wassertorwächter

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p202/n10994_BodenrankenWaechter.lua")

--SpawnOnlyWhen
--{
--	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
--	Conditions = 
--	{
--		IsGlobalFlagFalse {Name = "g_P202RankeGegossen", UpdateInterval = 20},
--		PlayerHasItem {ItemId = 7067, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10}
--	}, 
--	Actions = {}
--}
--
--Respawn
--{
--	WaitTime = 5, UnitId = self, Clan = 0, Target = none, X = startX, Y = startY, Chief = none, NoSpawnEffect = FALSE, 
--	Conditions = 
--	{
--		IsGlobalFlagFalse {Name = "g_P202RankeGegossen", UpdateInterval = 20},
--		--PlayerHasItem {ItemId = 7067, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10}
--		IsGlobalFlagTrue {Name = "g_P202SpielerHatNeuesWasser", UpdateInterval = 10}
--	},
--	Actions = 
--	{
--		SetGlobalFlagFalse {Name = "g_P202SpielerHatNeuesWasser"}
--	}, 
--	DeathActions = {} 
--
--}


EndDefinition()

end
