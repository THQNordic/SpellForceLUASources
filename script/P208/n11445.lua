MyFarbe =
{
	[1] = { Zeile = "g_Mastergame_Zeile1Gruen", Spalte = "g_Mastergame_Spalte1Gruen"},
	[2] = { Zeile = "g_Mastergame_Zeile2Gruen", Spalte = "g_Mastergame_Spalte2Gruen"},
	[3] = { Zeile = "g_Mastergame_Zeile3Gruen", Spalte = "g_Mastergame_Spalte3Gruen"},
	[4] = { Zeile = "g_Mastergame_Zeile4Gruen", Spalte = "g_Mastergame_Spalte4Gruen"},
	[5] = { Zeile = "g_Mastergame_Zeile5Gruen", Spalte = "g_Mastergame_Spalte5Gruen"},
}

MyColorCode = 1   --  1: grün
				  --  2: gelb
				  --  3: rot
				  --  4: braun
				  --  5: weiß
				  
MyRound = 3

MyFunctionInGame = 1     -- 1: Goblin
                 		 -- 2: Spielmeister

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/P208/n11440_Spielgoblins.lua")
dofile("script/P208/n11440_Dialogue.lua")


EndDefinition()
end
