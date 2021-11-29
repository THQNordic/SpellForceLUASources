
--------------------------------
--ab 30% Health Umspawnspielchen
--------------------------------


-- Schaden mit Schattenklinge oder ohne
OnToggleEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	OnConditions =
	{
		IsGlobalFlagTrue {Name = "P113EndkampfBeginnt", UpdateInterval = 10},
		PlayerHasItemEquipped {ItemId = 3764, Amount = 1 ,UpdateInterval = 10},
		FigureInRangeNpc{TargetNpcId = 6626, NpcId = Avatar , Range = 5 , UpdateInterval = 10},
	
	},
	OnActions = 
	{
		
		
		SetPlatformTimeStamp{Name = "P113EndkampfCounter"},
		SetGlobalFlagTrue{Name = "P113SchattenklingenSchaden"},
	},
	OffConditions =
	{
		ODER
		(
		Negated(PlayerHasItemEquipped {ItemId = 3764, Amount = 1 ,UpdateInterval = 10}),
		Negated(FigureInRangeNpc{TargetNpcId = 6626, NpcId = Avatar , Range = 5 , UpdateInterval = 10})
		)
	},
	OffActions = 
	{
		ClearPlatformTimeStamp{Name = "P113EndkampfCounter"},
		SetGlobalFlagFalse{Name = "P113SchattenklingenSchaden"},
		
	},
}




--Schleife: alle 6 sekunden Schaden mit Schattenklinge
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "P113SchattenklingenSchaden", UpdateInterval = 10},
		IsPlatformTimeElapsed{Name = "P113EndkampfCounter", Seconds = 7, UpdateInterval = 10}, 
	},
	Actions = 
	{
		SetHealth{HitPoints = 150, NpcId = 6626 , Decrease = TRUE},
		
		SetPlatformTimeStamp{Name = "P113EndkampfCounter"},
		SetEffect{Effect = "Petrify", Length = 500, TargetType = Figure, NpcId = 6626}, 
	}
}


--wenn weniger als 30 health
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{ 
		BuildingInRange{X = 143, Y = 209, Range = 5, Owner = OwnerNpc, BuildingId = 0, UpdateInterval = 10},
		FigureHasHealth {Percent = 30, NpcId = 6626, UpdateInterval = 10}, --Health kleinergleich ein drittel
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "P113FialDargUmspawn"},
	}
}


OneTimeInitAction (SetNpcTimeStamp{Name = "FialDargFlickerFixer"} )
--Fial spawnt um, wenn er weniger als 30% Health hat
--füllt somit seine Health wieder auf etc. bis Spieler Gebäude zerstört hat
Umspawn
{
	 
	X =  147, Y = 209, Target = None, NoSpawnEffect = FALSE, OnlyOnce = FALSE, PlayDeathAnim = FALSE,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P113FialDargUmspawn", UpdateInterval = 10},
		IsNpcTimeElapsed{Name = "FialDargFlickerFixer", Seconds = 2, UpdateInterval = 10},
		
	} , 
	Actions = 
	{
		SetGlobalFlagFalse{Name = "P113FialDargUmspawn"},
		SetNpcTimeStamp{Name = "FialDargFlickerFixer"},
		SetGlobalFlagFalse{Name = "P113FialDargBesiegt"},
		ChangeRace{Race = 190, NpcId = 6626}, --von neutral auf dunkelelfböse
		SetEffect{Effect = "AreaHit", X = 143, Y = 209, Length = 0, TargetType = World },
		--Goto {X = 155, Y = 223, NpcId = 6626, Range = 3, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		--SetGlobalFlagTrue{Name = "P113EndkampfBeginnt"},
	},
}


--wenn Fial Darg endgültig tot
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{ 
		FigureDead {NpcId = 6626},
		IsGlobalFlagTrue {Name = "P113EndkampfBeginnt", UpdateInterval = 10}, --damit nicht schon bei CS-Umspawn
		Negated(BuildingInRange{X = 143, Y = 209, Range = 5, Owner = OwnerNpc, BuildingId = 0, UpdateInterval = 10}),
	},
	Actions = 
	{
		SetGlobalTimeStamp{Name = "P113TimeStampFialBesiegt"}, --nach 3 Sekunden Cenwen frei
		SetGlobalFlagTrue{Name = "P113FialDargBesiegt"},
		SetGlobalFlagFalse{Name = "P113EndkampfBeginnt"},
	}
}

