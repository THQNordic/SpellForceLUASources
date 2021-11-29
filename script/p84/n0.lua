function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p84/n0_cutscene_beginning2.lua")
--dofile("script/p84/n0_cutscene_town_entry.lua")
dofile("script/p84/n0_cutscene_goblin_battle.lua")

--		OnOneTimeEvent
--		{
--		Conditions = {},
--		Actions = 
--			{ 
--				SetEffect {Effect = "FogForever", X = 174, Y = 161, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 189, Y = 165, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 169, Y = 179, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 128, Y = 188, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 181, Y = 135, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 198, Y = 138, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 147, Y = 94, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 131, Y = 89, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 102, Y = 84, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 73, Y = 96, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 73, Y = 183, Length = 0, TargetType = World},
--				SetEffect {Effect = "FogForever", X = 80, Y = 138, Length = 0, TargetType = World},
--			}
--		}
		
EndDefinition()
end



