-- Ball Goblin

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



--dofile("script/p101/n6973_Ork_Fuﬂball.lua")

SpawnOnlyWhen
{
	X = _X , Y = _Y , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 30}
	},
	Actions = {} 
}


--wenn Orks auf Position-los zum Spiel
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		FigureInRange{X = 224, Y = 222, NpcId = 6973, Range = 0}, --Spieler1
		FigureInRange{X = 218, Y = 222, NpcId = 6976, Range = 0}, --Spieler2
		FigureInRange{X = 218, Y = 228, NpcId = 6975, Range = 0}, --Spieler3
		FigureInRange{X = 224, Y = 228, NpcId = 6978, Range = 0}, --Spieler4
	},
	Actions = 
	{
		Goto {X = 221 , Y = 225 , NpcId = self , Range = 0 , WalkMode = Run , GotoMode = GotoForced}, 
	}
		
	
}


Respawn
{
	WaitTime = 1, UnitId = self , Clan = 0 , Target = none , X = startX , Y = startY , Chief = none, NoSpawnEffect = TRUE , 
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "P101GoblinsGewinnen", UpdateInterval = 10},
	}, 
	Actions = 
	{
		SetGlobalFlagFalse{Name = "P101SpielLaeuft"},
		--IncreaseGlobalCounter{Name = "P101GoblinBallCounter", Step = 1},
		Goto {X = 221 , Y = 225 , NpcId = self , Range = 0 , WalkMode = Run , GotoMode = GotoForced}, 
	}, 
	DeathActions = {}
}



EndDefinition()

end



