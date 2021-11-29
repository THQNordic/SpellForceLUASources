--> INFO CENWEN

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	Conditions =
	{
				
	},
	Actions =
	{
		ChangeRace {Race = 185, NpcId = self},	
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "OutcryCenwenTimerP115" , Seconds = 10},
		
	},
	Actions =
	{
		SetRewardFlagTrue { Name = "P115KarteErreicht" },
		SetEffect {Effect = "DeMaterialize", NpcId = 7206, Length = 5000},	-- Cenwen disappears
		SetNpcTimeStamp { Name = "CenwenTeleportP115"},
	}
}






Umspawn
{
	UnitId = self ,
 	Clan = 0 ,
 	X = 31 , 
 	Y = 221 , 
 	Target = none , 
 	NoSpawnEffect = FALSE ,
 	OnlyOnce = TRUE ,
 	
	Conditions = 
	{
		IsNpcTimeElapsed {Name = "CenwenTeleportP115" , Seconds = 5, UpdateInterval = 1},
		
	} ,
	Actions = 
	{
		
		SetNpcFlagTrue { Name = "CenwenUmspawnP115" },	
		
	}
}




--Outcries Cenwen

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagFalse{Name = "ArbeiterStartP115"},
	},
	Actions =
	{
		Outcry { NpcId = 7206 , String = "Sprecht mit den Zwergen, sie werden Euch helfen! Ich werde hier warten und mein Lied für den Drachen vorbereiten." , Tag = "osCenwen_P115_001" },
		SetGlobalFlagTrue { Name = "MurimAufdeckenP115"},
		SetNpcTimeStamp {Name = "OutcryCenwenTimerP115"},
	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue { Name = "CenwenUmspawnP115" },	
		IsGlobalFlagTrue{Name = "ArynTorOeffnenP115"},	
		PlayerUnitInRange{ X = 64, Y = 196, Range = 10 , FigureType = FigureAll , UpdateInterval = 60},
	},
	Actions =
	{
		LookAtFigure { Target = 6629, NpcId = self},
		Outcry { NpcId = 7206 , String = "Aryn ist erreicht! Schwächt ihn, ringt ihn nieder!" , Tag = "osCenwen_P115_002" },
	}
}


OnEvent
{
	Conditions =
	{
		FigureHasHealth { Percent = 30 , NpcId = 6629 , UpdateInterval = 10},
		IsNpcFlagTrue { Name = "CenwenUmspawnP115" },	
		IsNpcCounter { Name = "CenwenWalkP115", Operator = IsEqual, Value = 0, UpdateInterval = 10},	
	},
	Actions =
	{
		Goto { X = 44, Y = 212, NpcId = self , Range = 5 , WalkMode = Walk , GotoMode = GotoNormal},
		Outcry { NpcId = 7206 , String = "Es ist fast vollbracht! Der Bann wird schwächer!" , Tag = "osCenwen_P115_003" },
		IncreaseNpcCounter { Name = "CenwenWalkP115" },
	}
}

OnEvent
{
	Conditions =
	{
		Negated(FigureHasHealth { Percent = 50 , NpcId = 6629 , UpdateInterval = 10}),
		IsNpcFlagTrue { Name = "CenwenUmspawnP115" },
		IsNpcCounter { Name = "CenwenWalkP115", Operator = IsEqual, Value = 1, UpdateInterval = 10},	
	},
	Actions =
	{
		Goto { X = 31, Y = 221, NpcId = self , Range = 5 , WalkMode = Walk , GotoMode = GotoNormal},
		ResetNpcCounter { Name = "CenwenWalkP115" },
	}
}





EndDefinition()

end
