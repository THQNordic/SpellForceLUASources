function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


dofile("script/p78/n0_CutsceneTutIntro.lua")
dofile("script/p78/n3325_CutsceneTutExtro.lua")


-----------------------------------------------------------------
-----------------------------------------------------------------
-----------------------------------------------------------------
-- Tutorial Scripting Ablauf befindet sich in n3358.lua !!!!!!!!!
-----------------------------------------------------------------
-- Das Profibereich-Scripting befindet sich in n3333.lua !!!!!!!!
-----------------------------------------------------------------
-----------------------------------------------------------------
-----------------------------------------------------------------

-- eine ausnahme: sicherstellen das player jedes einzelne item zumindest mal gehabt hat
-- dann nur noch auf counter == 5 abfragen
OnOneTimeEvent { 	Conditions = {
					IsGlobalFlagTrue{Name = "FireElementalDead", UpdateInterval = 5},
					PlayerHasItem{ItemId = 3231, UpdateInterval = 2}},	-- Hero Rune
					Actions = {IncreaseGlobalCounter{Name = "FeuerwesenItemCounter"},
						--SetEffect{Effect = "Lightning", X = 263, Y = 351},
					},	}

OnOneTimeEvent { 	Conditions = {
					IsGlobalFlagTrue{Name = "FireElementalDead", UpdateInterval = 5},
					PlayerHasItem{ItemId = 693, UpdateInterval = 2}},	-- Bogen
					Actions = {IncreaseGlobalCounter{Name = "FeuerwesenItemCounter"},
						--SetEffect{Effect = "Lightning", X = 263, Y = 349},
					},	}

OnOneTimeEvent { 	Conditions = {
					IsGlobalFlagTrue{Name = "FireElementalDead", UpdateInterval = 5},
					PlayerHasItem{ItemId = 2325, UpdateInterval = 2}},	-- Dolch
					Actions = {IncreaseGlobalCounter{Name = "FeuerwesenItemCounter"},
						--SetEffect{Effect = "Lightning", X = 263, Y = 347},
					},	}

OnOneTimeEvent { 	Conditions = {
					IsGlobalFlagTrue{Name = "FireElementalDead", UpdateInterval = 5},
					PlayerHasItem{ItemId = 3265, UpdateInterval = 2}},	-- chest
					Actions = {IncreaseGlobalCounter{Name = "FeuerwesenItemCounter"},
						--SetEffect{Effect = "Lightning", X = 263, Y = 345},
					},	}

OnOneTimeEvent { 	Conditions = {
					IsGlobalFlagTrue{Name = "FireElementalDead", UpdateInterval = 5},
					PlayerHasItem{ItemId = 3266, UpdateInterval = 2}},	-- beinlinge
					Actions = {IncreaseGlobalCounter{Name = "FeuerwesenItemCounter"},
						--SetEffect{Effect = "Lightning", X = 263, Y = 343},
					},	}



-- ähnlicher counter für ork camp loot
OnOneTimeEvent { 	Conditions = {PlayerHasItem{ItemId = 255, UpdateInterval = 4}},	-- buildingplan tempel
					Actions = {IncreaseGlobalCounter{Name = "OrkCampItemCounter"}},	}
OnOneTimeEvent { 	Conditions = {PlayerHasItem{ItemId = 1261, UpdateInterval = 4}},	-- unitplan human cleric
					Actions = {IncreaseGlobalCounter{Name = "OrkCampItemCounter"}},	}


-- flag fürs schild loot
OnOneTimeEvent { 	Conditions = {PlayerHasItem{ItemId = 701, UpdateInterval = 4}},	-- goblin schild
					Actions = {SetGlobalFlagTrue{Name = "PlayerHasHadGoblinShield"}},	}


-- flag fürs hero casting (hero in range vom monument)
OnOneTimeEvent { 	Conditions = {PlayerUnitInRange{X = 342, Y = 315, Range = 6, FigureType = FigureHero, UpdateInterval = 4}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerHasCalledHeroToAction"}},	}


-- flag fürs avatar rune loot (orc camp 2 destroyed)
OnOneTimeEvent { 	Conditions = {PlayerHasItem{ItemId = 3240, UpdateInterval = 4}},	-- avatar rune
					Actions = {SetGlobalFlagTrue{Name = "PlayerHasHadAvatarRune"}},	}


-- flag fürs auslösen der Berserk Melee Ability
OnOneTimeEvent { 	Conditions = {CGdsIsMeleeAbilityActive:new(152)},
					Actions = {SetGlobalFlagTrue{Name = "PlayerHasHadBerserkActive"}},	}

----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ranges abfragen:
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- max. entfernung zu monument um es benutzen zu können
TutorialDefaultRange = 10

-- seelenfels in range
OnOneTimeEvent { 	Conditions = {FigureInRange{NpcId = Avatar, X = 183, Y = 442, Range = TutorialDefaultRange}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRangeBindstone"}},	}

-- 3rd person area in range
OnOneTimeEvent { 	Conditions = {FigureInRange{NpcId = Avatar, X = 205, Y = 419, Range = 10}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRange3rdPersonArea"}},	}

-- 3rd person end area in range
OnOneTimeEvent { 	Conditions = {FigureInRange{NpcId = Avatar, X = 270, Y = 423, Range = 10}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRange3rdPersonEndArea"}},	}

-- bei lev
OnOneTimeEvent { 	Conditions = {FigureInRangeNpc{NpcId = Avatar, TargetNpcId = 3326, Range = TutorialDefaultRange, UpdateInterval = 10}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRangeLev"}},	}

-- beim minotaurus
OnOneTimeEvent { 	Conditions = {FigureInRangeNpc{NpcId = Avatar, TargetNpcId = 3441, Range = 20, UpdateInterval = 20}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRangeMinotaurus"}},	}

-- beim heldenmonument
OnOneTimeEvent { 	Conditions = {FigureInRange{NpcId = Avatar, X = 342, Y = 315, Range = TutorialDefaultRange}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRangeHeroMonument"}},	}

-- bei den untoten
OnOneTimeEvent { 	Conditions = {FigureInRange{NpcId = Avatar, X = 316, Y = 282, Range = 7}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRangeUndeadCity"}},	}

-- weg zum händler
OnOneTimeEvent { 	Conditions = {FigureInRange{NpcId = Avatar, X = 230, Y = 268, Range = 8}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRangeCloseToMerchant"}},	}

-- beim händler
OnOneTimeEvent { 	Conditions = {FigureInRangeNpc{NpcId = Avatar, TargetNpcId = 3444, Range = TutorialDefaultRange, UpdateInterval = 20}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRangeMerchant"}},	}

-- beim zweiten bindstone
OnOneTimeEvent { 	Conditions = {FigureInRange{NpcId = Avatar, X = 180, Y = 217, Range = TutorialDefaultRange}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRangeSecondBindstone"}},	}

-- bei joshua the fischer
OnOneTimeEvent { 	Conditions = {FigureInRangeNpc{NpcId = Avatar, TargetNpcId = 3325, Range = TutorialDefaultRange, UpdateInterval = 20}},
					Actions = {SetGlobalFlagTrue{Name = "PlayerInRangeJoshua"}},	}



------------------------------------------------------------------------------------------------------------------
--- lev health krams
OneTimeInitAction(	SetNpcTimeStamp{Name = "SetLevBleeding"} )
--OneTimeInitAction(	SetEffect{Effect = "Poison", Length = 0, NpcId = 3326} )
--OneTimeInitAction(	SetNpcTimeStamp{Name = "BeginLevBleedingCheck"} )
--OneTimeInitAction(	CGdsFigureSetHealth:new(3326, 1) )

OnOneTimeEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "TutorialIntroCutSceneIsOver", UpdateInterval = 15},
	},
	Actions = {
		SetNpcTimeStamp{Name = "BeginLevBleedingCheck"},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "BeginLevBleedingCheck", Seconds = 15, UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "TutorialIntroCutSceneIsOver", UpdateInterval = 5},
		Negated(FigureHasHealth{Percent = 10, NpcId = 3326, UpdateInterval = 1}),
	},
	Actions = {
		SetNpcFlagTrue{Name = "StopLevBleeding"},
		SetNpcTimeStamp{Name = "SetLevBleeding"},
		--StopEffect{NpcId = 3326},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsNpcFlagTrue{Name = "StopLevBleeding", UpdateInterval = 1},
	},
	Actions = {
		SetNpcTimeStamp{Name = "SetLevBleeding"},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsNpcFlagTrue{Name = "StopLevBleeding", UpdateInterval = 1},
	},
	Actions = {
		SetNpcTimeStamp{Name = "SetLevBleeding"},
	},
}

OnEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "SetLevBleeding", Seconds = 0.5, UpdateInterval = 5},
		IsGlobalFlagTrue{Name = "TutorialIntroCutSceneIsOver", UpdateInterval = 5},
		IsNpcFlagFalse{Name = "StopLevBleeding", UpdateInterval = 1},
		FigureHasHealth{Percent = 10, NpcId = 3326, UpdateInterval = 1},
		--FigureHasHealth{Percent = 10, NpcId = 3326, UpdateInterval = 1},
		--FigureHasHealth{Percent = 10, NpcId = 3326, UpdateInterval = 1},
	},
	Actions = {
		CGdsFigureSetHealth:new(3326, 2),
		SetNpcTimeStamp{Name = "SetLevBleeding"},
	},
}


EndDefinition()
end
