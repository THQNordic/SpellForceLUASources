MyFarbe =
{
	[1] = { Zeile = "g_Mastergame_Zeile1Rot", Spalte = "g_Mastergame_Spalte1Rot"},
	[2] = { Zeile = "g_Mastergame_Zeile2Rot", Spalte = "g_Mastergame_Spalte2Rot"},
	[3] = { Zeile = "g_Mastergame_Zeile3Rot", Spalte = "g_Mastergame_Spalte3Rot"},
	[4] = { Zeile = "g_Mastergame_Zeile4Rot", Spalte = "g_Mastergame_Spalte4Rot"},
	[5] = { Zeile = "g_Mastergame_Zeile5Rot", Spalte = "g_Mastergame_Spalte5Rot"},
}

MyColorCode = 3   --  1: grün
				  --  2: gelb
				  --  3: rot
				  --  4: braun
				  --  5: weiß
				  
MyRound = 5

MyFunctionInGame = 1     -- 1: Goblin
                 		 -- 2: Spielmeister

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/P208/n11440_Spielgoblins.lua")
dofile("script/P208/n11440_Dialogue.lua")


EndDefinition()
end
