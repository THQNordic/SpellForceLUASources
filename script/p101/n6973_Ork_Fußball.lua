--Orkbewohner_Fußball
--Ball 7758
--Spieler: 6973, 6975, 6976, 6978


--wenn alle auf Position, dann Startschuß
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		FigureInRange{X = 221, Y = 225, NpcId = 7758, Range = 0}, --Ball
		FigureInRange{X = 224, Y = 222, NpcId = 6973, Range = 0}, --Spieler1
		FigureInRange{X = 218, Y = 222, NpcId = 6976, Range = 0}, --Spieler2
		FigureInRange{X = 218, Y = 228, NpcId = 6975, Range = 0}, --Spieler3
		FigureInRange{X = 224, Y = 228, NpcId = 6978, Range = 0}, --Spieler4
		IsGlobalFlagFalse {Name = "P101SpielLaeuft", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "P101GoblinsGewinnen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "P101OrksGewinnen", UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "P101SpielLaeuft"},
		
	} 
}



--Spiel beginnt/hört auf
OnToggleEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	OnConditions = 
	{
		IsGlobalFlagTrue {Name = "P101SpielLaeuft", UpdateInterval = 10},
		
		
	},
	OnActions = 
	{
		--SetEffect{Effect = "Lightning", Length = 200 , TargetType = Figure , NpcId = 7758},	--Starteffekt
		SetGlobalFlagTrue{Name = "P101GoblinLos"},
		SetGlobalFlagFalse{Name = "P101SpielLaeuft"},
	},
	OffConditions = 
	{
		ODER
		(
		IsGlobalCounter {Name = "P101CounterGoblinPunkte", Value = 4, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalCounter {Name = "P101CounterOrkPunkte", Value = 1, Operator = IsEqual, UpdateInterval = 10}
		)
	},
	OffActions = 
	{
		--SetEffect{Effect = "GroundWave", Length = 100 , X = 221, Y = 225, TargetType = World},	 --Spiel zu Ende Effekt
		SetGlobalFlagFalse {Name = "P101SpielLaeuft"},
		ResetGlobalCounter {Name = "P101CounterOrkPunkte"},
		ResetGlobalCounter {Name = "P101CounterGoblinPunkte"}, 
		Goto {X = 224, Y = 222, NpcId = 6973, Range = 0, WalkMode = Walk , GotoMode = GotoForced},  --Orks gehen auf Position
		Goto {X = 218, Y = 222, NpcId = 6976, Range = 0, WalkMode = Walk , GotoMode = GotoForced},
		Goto {X = 218, Y = 228, NpcId = 6975, Range = 0, WalkMode = Walk , GotoMode = GotoForced},
		Goto {X = 224, Y = 228, NpcId = 6978, Range = 0, WalkMode = Walk , GotoMode = GotoForced},
		Goto {X = 221, Y = 225, NpcId = 7758, Range = 0, WalkMode = Walk , GotoMode = GotoForced}, --Goblin zurück Mitte
		 
	},
}


--nach Startschuß, Goblin zu Base1
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P101GoblinLos", UpdateInterval = 10},
	},
	Actions = 
	{
		Goto {X = 216, Y = 212, NpcId = 7758 , Range = 0 , WalkMode = Run, GotoMode = GotoForced}, --Goblin zum ersten Punkt
		AttackTarget{ Target = 7758, NpcId = 6973, FriendlyFire = TRUE}, --OrksAttackTarget
		AttackTarget{ Target = 7758, NpcId = 6976, FriendlyFire = TRUE},
		AttackTarget{ Target = 7758, NpcId = 6975, FriendlyFire = TRUE},
		AttackTarget{ Target = 7758, NpcId = 6978, FriendlyFire = TRUE},	
		SetGlobalFlagFalse{Name = "P101GoblinLos"},
		SetGlobalFlagTrue{Name = "P101GoblinPunkt2Los"},
	} 
}


--Punktezählen und weiter:
--zu Base2
--wenn Ball Punkt1 erreicht, dann Counter Goblin hoch und Goblin weiter zu Punkt2
OnEvent
{
	NotInDialog = FALSE , 
	Conditions = 
	{
		FigureInRange{X = 216, Y = 212, NpcId = 7758 , Range = 0},
		IsGlobalFlagTrue{Name = "P101GoblinPunkt2Los", UpdateInterval = 10}
	},
	Actions = 
	{
		Goto {X = 225, Y = 239, NpcId = 7758 , Range = 0 , WalkMode = Run , GotoMode = GotoForced, XRand = 0 , YRand = 0}, --BasePunkt2
		SetEffect{Effect = "Lightning", Length = 200 , TargetType = World , X = 216, Y = 212},	--Punkt für Goblin-Effekt
		IncreaseGlobalCounter{Name = "P101CounterGoblinPunkte", Step = 1},
		SetGlobalFlagTrue{Name = "P101GoblinPunkt3Los"},
		SetGlobalFlagFalse{Name = "P101GoblinPunkt2Los"},
	} 
}

--zu Base3
--wenn Ball Punkt2 erreicht, dann Counter Goblin hoch
OnEvent
{
	NotInDialog = FALSE , 
	Conditions = 
	{
		FigureInRange{X = 225, Y = 239, NpcId = 7758 , Range = 0},
		IsGlobalFlagTrue{Name = "P101GoblinPunkt3Los", UpdateInterval = 10}
	},
	Actions = 
	{
		Goto {X = 207, Y = 221, NpcId = 7758 , Range = 0 , WalkMode = Run , GotoMode = GotoForced, XRand = 0 , YRand = 0},--BasePunkt3
		SetEffect{Effect = "Lightning", Length = 200 , TargetType = World , X = 225, Y = 239},	 --Punkt für Goblin-Effekt
		IncreaseGlobalCounter{ Name = "P101CounterGoblinPunkte", Step = 1},
		SetGlobalFlagTrue{Name = "P101GoblinPunkt4Los"},
		SetGlobalFlagFalse{Name = "P101GoblinPunkt3Los"},
	} 
}

--zu Base4
--wenn Ball Punkt3 erreicht, dann Counter Goblin hoch
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		FigureInRange{X = 207, Y = 221, NpcId = 7758 , Range = 0},
		IsGlobalFlagTrue{Name = "P101GoblinPunkt4Los", UpdateInterval = 10}
	},
	Actions = 
	{
		Goto {X = 235, Y = 230, NpcId = 7758 , Range = 0 , WalkMode = Run , GotoMode = GotoForced, XRand = 0 , YRand = 0}, --BasePunkt4
		SetEffect{Effect = "Lightning", Length = 200 , TargetType = World , X = 207, Y = 221},	 --Punkt für Goblin-Effekt
		IncreaseGlobalCounter{ Name = "P101CounterGoblinPunkte", Step = 1},
		SetGlobalFlagTrue{Name = "P101GoblinPunkt5Los"},
		SetGlobalFlagFalse{Name = "P101GoblinPunkt4Los"},
	} 
}

--wenn Ball Punkt4 erreicht, dann Counter Goblin hoch
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		FigureInRange{X = 235, Y = 230, NpcId = 7758 , Range = 0},
		IsGlobalFlagTrue{Name = "P101GoblinPunkt5Los", UpdateInterval = 10}
	},
	Actions = 
	{
		SetEffect{Effect = "Lightning", Length = 200 , TargetType = World , X = 235, Y = 230},	--Punkt für Goblin-Effekt 
		IncreaseGlobalCounter{ Name = "P101CounterGoblinPunkte", Step = 1},
		IncreaseGlobalCounter{Name = "P101GoblinRundenCounter", Step = 1},
		SetGlobalFlagFalse{Name = "P101GoblinPunkt5Los"},
	} 
}


--wenn Ball tot, dann Flag
OnEvent
{
	NotInDialog = FALSE , 
	Conditions = 
	{
		FigureDead{NpcId = 7758},
		IsGlobalFlagTrue{Name = "P101_DunkelElfBossKilled", UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "P101GoblinTot"},
	} 
}

--wenn Ball tot, dann Counter Orks hoch
OnEvent
{
	NotInDialog = FALSE , 
	Conditions = 
	{
		--FigureDead{NpcId = 7758},
		IsGlobalFlagTrue{Name = "P101GoblinTot", UpdateInterval = 10},
	},
	Actions = 
	{
		--SetEffect{Effect = "Lightning", Length = 200 , TargetType = World, X = 221, Y = 225}, --EffektOrkpunkt
		IncreaseGlobalCounter{ Name = "P101CounterOrkPunkte", Step = 1},
		IncreaseGlobalCounter{Name = "P101OrkRundenCounter", Step = 1},
		Goto {X = 224, Y = 222, NpcId = 6973, Range = 0, WalkMode = Walk, GotoMode = GotoForced}, --Orks gehen auf Position
		Goto {X = 218, Y = 222, NpcId = 6976, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 218, Y = 228, NpcId = 6975, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 224, Y = 228, NpcId = 6978, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 221, Y = 225, NpcId = 7758, Range = 0, WalkMode = Walk, GotoMode = GotoForced}, --Goblin zurück Mitte
		SetGlobalFlagFalse{Name = "P101SpielLaeuft"},
		SetGlobalFlagFalse{Name = "P101GoblinTot"},
	} 
}


---------------------------------------
--Orks gewinnen:
---------------------------------------
-- wenn 3 Runden für Orks
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		IsGlobalCounter{ Name = "P101OrkRundenCounter", Value = 3, Operator = IsGreaterOrEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "P101OrksGewinnen"},
		
		Goto {X = 232, Y = 234, NpcId = 6973, Range = 2, WalkMode = Run, GotoMode = GotoForced}, --Orks gehen zum Rand
		Goto {X = 232, Y = 234, NpcId = 6976, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6975, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6978, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 231, Y = 251, NpcId = 7758, Range = 0, WalkMode = Run, GotoMode = GotoForced}, --Goblin zurück in Pferch
		                                                           
		Goto {X = 232, Y = 234, NpcId = 6981, Range = 2, WalkMode = Run, GotoMode = GotoForced}, --Orks stürmen das Spielfeld
		Goto {X = 232, Y = 234, NpcId = 6974, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6979, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6982, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 231, Y = 251, NpcId = 6977, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6983, Range = 4, WalkMode = Run, GotoMode = GotoForced}, 
		Goto {X = 232, Y = 234, NpcId = 6984, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6986, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6985, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6987, Range = 4, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 233, Y = 235, NpcId = 6989, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6990, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 233, Y = 234, NpcId = 6988, Range = 4, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 235, NpcId = 6980, Range = 5, WalkMode = Run, GotoMode = GotoForced},
		--SetGlobalFlagTrue{Name = "P101TestFlag1"},
		SetGlobalTimeStamp{Name = "P101OrksGewonnen"},
		
		Goto {X = 289, Y = 175, NpcId = 6973, Range = 1, WalkMode = Walk, GotoMode = GotoForced},--zum Blutschrein
		Goto {X = 288, Y = 177, NpcId = 6976, Range = 1, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 289, Y = 176, NpcId = 6975, Range = 1, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 288, Y = 177, NpcId = 6978, Range = 1, WalkMode = Walk, GotoMode = GotoForced},
		
		
		Goto {X = 283, Y = 178, NpcId = 6981, Range = 2, WalkMode = Walk, GotoMode = GotoForced}, --zum Blutschrein
		Goto {X = 283, Y = 176, NpcId = 6974, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 282, Y = 174, NpcId = 6979, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 283, Y = 172, NpcId = 6982, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 286, Y = 170, NpcId = 6977, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 287, Y = 171, NpcId = 6983, Range = 2, WalkMode = Walk, GotoMode = GotoForced}, 
		Goto {X = 288, Y = 171, NpcId = 6984, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 288, Y = 173, NpcId = 6986, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 289, Y = 173, NpcId = 6985, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 278, Y = 174, NpcId = 6987, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 278, Y = 173, NpcId = 6989, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 281, Y = 170, NpcId = 6990, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 282, Y = 179, NpcId = 6988, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 282, Y = 178, NpcId = 6980, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		
	}
}


--Orks ziehen zum Feiern in die Stadt
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "P101OrksGewonnen", Seconds = 50, UpdateInterval = 10 },
		--FigureInRange{X = 232, Y = 234, NpcId = 6981, Range = 2},
		--FigureInRange{X = 232, Y = 234, NpcId = 6974, Range = 3},
		--FigureInRange{X = 232, Y = 234, NpcId = 6979, Range = 3},
		--FigureInRange{X = 232, Y = 234, NpcId = 6982, Range = 3},
		--FigureInRange{X = 231, Y = 251, NpcId = 6977, Range = 3},
		--FigureInRange{X = 232, Y = 234, NpcId = 6983, Range = 4},
		--FigureInRange{X = 232, Y = 234, NpcId = 6984, Range = 3},
		--FigureInRange{X = 232, Y = 234, NpcId = 6986, Range = 3},
		--FigureInRange{X = 232, Y = 234, NpcId = 6985, Range = 3},
		--FigureInRange{X = 232, Y = 234, NpcId = 6987, Range = 4},
		--FigureInRange{X = 233, Y = 235, NpcId = 6989, Range = 3},
		--FigureInRange{X = 232, Y = 234, NpcId = 6990, Range = 3},
		--FigureInRange{X = 233, Y = 234, NpcId = 6988, Range = 4},
		--FigureInRange{X = 232, Y = 235, NpcId = 6980, Range = 5},
		--
		--FigureInRange{X = 232, Y = 234, NpcId = 6973, Range = 2},
		--FigureInRange{X = 232, Y = 234, NpcId = 6976, Range = 3},
		--FigureInRange{X = 232, Y = 234, NpcId = 6975, Range = 3},
		--FigureInRange{X = 232, Y = 234, NpcId = 6978, Range = 3},
	},
	Actions = 
	{
		
		Goto {X = 289, Y = 175, NpcId = 6973, Range = 1, WalkMode = Walk, GotoMode = GotoForced},--zum Blutschrein
		Goto {X = 288, Y = 177, NpcId = 6976, Range = 1, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 289, Y = 176, NpcId = 6975, Range = 1, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 288, Y = 177, NpcId = 6978, Range = 1, WalkMode = Walk, GotoMode = GotoForced},
		
		
		Goto {X = 283, Y = 178, NpcId = 6981, Range = 2, WalkMode = Walk, GotoMode = GotoForced}, --zum Blutschrein
		Goto {X = 283, Y = 176, NpcId = 6974, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 282, Y = 174, NpcId = 6979, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 283, Y = 172, NpcId = 6982, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 286, Y = 170, NpcId = 6977, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 287, Y = 171, NpcId = 6983, Range = 2, WalkMode = Walk, GotoMode = GotoForced}, 
		Goto {X = 288, Y = 171, NpcId = 6984, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 288, Y = 173, NpcId = 6986, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 289, Y = 173, NpcId = 6985, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 278, Y = 174, NpcId = 6987, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 278, Y = 173, NpcId = 6989, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 281, Y = 170, NpcId = 6990, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 282, Y = 179, NpcId = 6988, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 282, Y = 178, NpcId = 6980, Range = 2, WalkMode = Walk, GotoMode = GotoForced},
		--SetGlobalFlagTrue{Name = "P101TestFlag2"},
	}
}

----------------------------------------------------------
--Falls Goblins gewonnen
-----------------------------------------------
--wenn 3 Runden für Goblins
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		IsGlobalCounter{ Name = "P101GoblinRundenCounter", Value = 3, Operator = IsGreaterOrEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "P101GoblinsGewinnen"},
		SetGlobalTimeStamp{Name = "P101GoblinsGewonnen"},
		Goto {X = 232, Y = 234, NpcId = 6973, Range = 4, WalkMode = Walk, GotoMode = GotoForced}, --OrkSpieler gehen zum Rand
		Goto {X = 232, Y = 234, NpcId = 6976, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6975, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 6978, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
		
		
		Goto {X = 221, Y = 229, NpcId = 7758, Range = 0, WalkMode = Run, GotoMode = GotoForced}, --Goblins stürmen das Spielfeld
		Goto {X = 222, Y = 230, NpcId = 8234, Range = 0, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 219, Y = 224, NpcId = 8235, Range = 0, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 221, Y = 222, NpcId = 8236, Range = 0, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 227, Y = 224, NpcId = 8237, Range = 0, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 232, Y = 234, NpcId = 8238, Range = 0, WalkMode = Run, GotoMode = GotoForced}, 
		
	}
}

--Goblins ab nach Hause
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		--IsGlobalFlagTrue{Name = "P101GoblinsGewinnen", UpdateInterval = 20},
		FigureInRange{X = 221, Y = 229, NpcId = 7758, Range = 2, },
		FigureInRange{X = 222, Y = 230, NpcId = 8234, Range = 2, },
		FigureInRange{X = 219, Y = 224, NpcId = 8235, Range = 2, },
		FigureInRange{X = 221, Y = 222, NpcId = 8236, Range = 2, },
		FigureInRange{X = 227, Y = 224, NpcId = 8237, Range = 2, },
		FigureInRange{X = 232, Y = 234, NpcId = 8238, Range = 2, },
		
	},
	Actions = 
	{
		Goto {X = 196, Y = 184, NpcId = 7758, Range = 2, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 196, Y = 186, NpcId = 8234, Range = 2, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 188, Y = 177, NpcId = 8235, Range = 2, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 185, Y = 176, NpcId = 8236, Range = 2, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 194, Y = 179, NpcId = 8237, Range = 2, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 193, Y = 179, NpcId = 8238, Range = 2, WalkMode = Run, GotoMode = GotoForced},
	}
}

