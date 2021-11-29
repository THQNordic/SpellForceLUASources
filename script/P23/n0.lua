function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


dofile("script/p23/n0_CutsceneTaliaDuel.lua")
dofile("script/p23/n3736_CutsceneTaliaEntry.lua")

daemonenI_SpawnX = 192
daemonenI_SpawnY = 179

daemonenII_SpawnX = 136
daemonenII_SpawnY = 178 

basilisk_SpawnX = 207
basilisk_SpawnY = 317

succubus_SpawnX = 291
succubus_SpawnY = 330

OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 178, Y = 261})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 168, Y = 253})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 203, Y = 231})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 237, Y = 218})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 281, Y = 221})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 272, Y = 183})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 316, Y = 184})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 366, Y = 221})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 399, Y = 223})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 339, Y = 292})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 346, Y = 306})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 212, Y = 332})


---- SIDEQUEST Q395 BLUT begins here
---- Q 395, Q 396 ---

---- Prüfen, ob der Spieler das Blut des Dämons hat --

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 2540 },
		QuestState {QuestId = 399, State = StateActive},
	},
	Actions =
	{
		QuestSolve{QuestId = 399} ,
	}
}

---- Prüfen, ob der Spieler das Blut aller drei Monster hat (Blut-Quest) ---

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 2540 },
		PlayerHasItem {ItemId = 3165 },
		PlayerHasItem {ItemId = 3166 },
	},
	Actions =
	{
		SetPlayerFlagTrue {Name = "Q395AllBlood"},
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 406 , State = StateSolved},
		QuestState{QuestId = 399 , State = StateSolved},
		QuestState{QuestId = 400 , State = StateSolved},
	},
	Actions =
	{
		SetPlayerFlagTrue {Name = "Q395AllBlood"},
	}
}

------- SIDEQUEST Q395 BLUT ends here
-- Patroullien Anhalteskripte
PlatformInitAction(		SetNpcTimeStamp {Name = "ToggleCounter"} )

OnToggleEvent
{
	OnConditions =
	{
		IsNpcTimeElapsed {Name = "ToggleCounter", Seconds = 15},
		FigureInRange {NpcId = 2851, Range = 6, X = 370, Y = 199 }, 
		FigureInRange {NpcId = 2852, Range = 6, X = 370, Y = 199 }, 
		FigureInRange {NpcId = 2853, Range = 6, X = 370, Y = 199 }, 
		FigureInRange {NpcId = 2854, Range = 6, X = 370, Y = 199 }, 
		FigureInRange {NpcId = 2855, Range = 6, X = 370, Y = 199 }, 
		FigureInRange {NpcId = 2856, Range = 6, X = 370, Y = 199 }, 
		FigureInRange {NpcId = 2857, Range = 6, X = 370, Y = 199 },
	},
	OnActions =
	{
		SetNpcTimeStamp {Name = "ToggleCounter"},
		SetGlobalFlagTrue {Name = "AlleZuHause"},
	},
	OffConditions =
	{
		IsNpcTimeElapsed {Name = "ToggleCounter", Seconds = 15},
		Negated (FigureInRange {NpcId = 2851, Range = 6, X = 370, Y = 199}), 
		Negated (FigureInRange {NpcId = 2852, Range = 6, X = 370, Y = 199}), 
		Negated (FigureInRange {NpcId = 2853, Range = 6, X = 370, Y = 199}), 
		Negated (FigureInRange {NpcId = 2854, Range = 6, X = 370, Y = 199}), 
		Negated (FigureInRange {NpcId = 2855, Range = 6, X = 370, Y = 199}), 
		Negated (FigureInRange {NpcId = 2856, Range = 6, X = 370, Y = 199}), 
		Negated (FigureInRange {NpcId = 2857, Range = 6, X = 370, Y = 199}),
	},
	OffActions =
	{
		SetNpcTimeStamp {Name = "ToggleCounter"},
		SetGlobalFlagFalse {Name = "AlleZuHause"},
	},
}


PlatformInitAction(		SetNpcTimeStamp {Name = "ToggleSuccubiCounter"} )
OnToggleEvent
{
	OnConditions =
	{
		IsNpcTimeElapsed {Name = "ToggleSuccubiCounter", Seconds = 15},
		FigureInRange {NpcId = 3675, Range = 6, X = 285, Y = 334 }, 
		FigureInRange {NpcId = 3676, Range = 6, X = 285, Y = 334 }, 
		FigureInRange {NpcId = 3677, Range = 6, X = 285, Y = 334 }, 
		FigureInRange {NpcId = 3678, Range = 6, X = 285, Y = 334 }, 
		FigureInRange {NpcId = 3679, Range = 6, X = 285, Y = 334 }, 
		FigureInRange {NpcId = 3680, Range = 6, X = 285, Y = 334 }, 
	},
	OnActions =
	{
		SetNpcTimeStamp {Name = "ToggleSuccubiCounter"},
		SetGlobalFlagTrue {Name = "AlleSuccubiZuHause"},
	},
	OffConditions =
	{
		IsNpcTimeElapsed {Name = "ToggleSuccubiCounter", Seconds = 15},
		Negated (FigureInRange {NpcId = 3675, Range = 6, X = 285, Y = 334 }), 
		Negated (FigureInRange {NpcId = 3676, Range = 6, X = 285, Y = 334 }), 
		Negated (FigureInRange {NpcId = 3677, Range = 6, X = 285, Y = 334 }), 
		Negated (FigureInRange {NpcId = 3678, Range = 6, X = 285, Y = 334 }), 
		Negated (FigureInRange {NpcId = 3679, Range = 6, X = 285, Y = 334 }), 
		Negated (FigureInRange {NpcId = 3680, Range = 6, X = 285, Y = 334 }), 
	},
	OffActions =
	{
		SetNpcTimeStamp {Name = "ToggleSuccubiCounter"},
		SetGlobalFlagFalse {Name = "AlleSuccubiZuHause"},
	},
}


PlatformInitAction(		SetNpcTimeStamp {Name = "ToggleBasiliskCounter"} )
OnToggleEvent
{
	OnConditions =
	{
		IsNpcTimeElapsed {Name = "ToggleBasiliskCounter", Seconds = 15},
		FigureInRange {NpcId = 3681, Range = 6, X = 206, Y = 306}, 
		FigureInRange {NpcId = 3682, Range = 6, X = 206, Y = 306}, 
		FigureInRange {NpcId = 3683, Range = 6, X = 206, Y = 306}, 
		FigureInRange {NpcId = 3684, Range = 6, X = 206, Y = 306}, 
		FigureInRange {NpcId = 3685, Range = 6, X = 206, Y = 306}, 
	},
	OnActions =
	{
		SetNpcTimeStamp {Name = "ToggleBasiliskCounter"},
		SetGlobalFlagTrue {Name = "AlleBasiliskZuHause"},
	},
	OffConditions =
	{
		IsNpcTimeElapsed {Name = "ToggleBasiliskCounter", Seconds = 15},
		Negated (FigureInRange {NpcId = 3681, Range = 6, X = 206, Y = 306}), 
		Negated (FigureInRange {NpcId = 3682, Range = 6, X = 206, Y = 306}), 
		Negated (FigureInRange {NpcId = 3683, Range = 6, X = 206, Y = 306}), 
		Negated (FigureInRange {NpcId = 3684, Range = 6, X = 206, Y = 306}), 
		Negated (FigureInRange {NpcId = 3685, Range = 6, X = 206, Y = 306}), 
	},
	OffActions =
	{
		SetNpcTimeStamp {Name = "ToggleBasiliskCounter"},
		SetGlobalFlagFalse {Name = "AlleBasiliskZuHause"},
	},
}


PlatformInitAction(		SetNpcTimeStamp {Name = "ToggleDaemonIICounter"} )
OnToggleEvent
{
	OnConditions =
	{
		IsNpcTimeElapsed {Name = "ToggleDaemonIICounter", Seconds = 15},
		FigureInRange {NpcId = 3686, Range = 6, X = 135, Y = 177}, 
		FigureInRange {NpcId = 3687, Range = 6, X = 135, Y = 177}, 
		FigureInRange {NpcId = 3688, Range = 6, X = 135, Y = 177}, 
		FigureInRange {NpcId = 3689, Range = 6, X = 135, Y = 177}, 
		FigureInRange {NpcId = 3690, Range = 6, X = 135, Y = 177}, 
		FigureInRange {NpcId = 3691, Range = 6, X = 135, Y = 177}, 
	},
	OnActions =
	{
		SetNpcTimeStamp {Name = "ToggleDaemonIICounter"},
		SetGlobalFlagTrue {Name = "AlleDaemonIIZuHause"},
	},
	OffConditions =
	{
		IsNpcTimeElapsed {Name = "ToggleDaemonIICounter", Seconds = 15},
		Negated (FigureInRange {NpcId = 3686, Range = 6, X = 135, Y = 177}), 
		Negated (FigureInRange {NpcId = 3687, Range = 6, X = 135, Y = 177}), 
		Negated (FigureInRange {NpcId = 3688, Range = 6, X = 135, Y = 177}), 
		Negated (FigureInRange {NpcId = 3689, Range = 6, X = 135, Y = 177}), 
		Negated (FigureInRange {NpcId = 3690, Range = 6, X = 135, Y = 177}), 
		Negated (FigureInRange {NpcId = 3691, Range = 6, X = 135, Y = 177}), 
	},
	OffActions =
	{
		SetNpcTimeStamp {Name = "ToggleDaemonIICounter"},
		SetGlobalFlagFalse {Name = "AlleDaemonIIZuHause"},
	},
}
--------------------MAINQUEST Q310 Durch den Spalt starts here--------------
--Shard hohlen
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 303 , State = StateActive},
	},
	Actions =
	{
		QuestSolve{QuestId = 303},
		QuestBegin{QuestId = 304}
	}
}
--Am Monument gebunden?
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 496 , State = StateActive, UpdateInterval = 5},
--		FigureInRange{X = 423 , Y = 193 , NpcId = 3736 , Range = 5},
--		FigureInRange{X = 423 , Y = 193 , NpcId = Avatar , Range = 5},
		IsMonumentInUse{X = 399, Y = 184, Range = 0, UpdateInterval = 5},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "Q310TaliaStartDuel"},
		QuestSolve{QuestId = 496},
	}
}

--Spalt druchquert?
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 498 , State = StateActive},
		FigureInRange{X = 97 , Y = 245 , NpcId = 3736 , Range = 10, UpdateInterval = 10},
--		FigureInRange{X = 423 , Y = 193 , NpcId = Avatar , Range = 5},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "Q310TaliaStartDuel"},
		QuestSolve{QuestId = 498},
		QuestBegin{QuestId = 499},
	}
}
--Angriffwelle schicken und Feuer aus
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead{NpcId = 3737},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "RiftBackGateOpen"},
		SetGlobalFlagTrue{Name = "Q310StartRevengeAttack"},

		RemoveObject {X = 439, Y = 201, Object = 831},	 		
		RemoveObject {X = 440, Y = 200, Object = 2054},	 		
		RemoveObject {X = 439, Y = 199, Object = 2055},	 		
		RemoveObject {X = 438, Y = 200, Object = 832},   
		                                                 
		RemoveObject {X = 438, Y = 199, Object = 2056},	 		
		RemoveObject {X = 440, Y = 199, Object = 2054},	 		
		RemoveObject {X = 438, Y = 201, Object = 833},	 		
		RemoveObject {X = 440, Y = 201, Object = 2052},	 	

		SetEffect {X = 439, Y = 201, Effect = "Explo", Length = random(700,1200)},		
		SetEffect {X = 440, Y = 200, Effect = "Explo", Length = random(700,1200)},		
		SetEffect {X = 439, Y = 199, Effect = "Explo", Length = random(700,1200)},		
		SetEffect {X = 438, Y = 200, Effect = "Explo", Length = random(700,1200)},

		SetEffect {X = 438, Y = 199, Effect = "Explo", Length = random(700,1200)},		
		SetEffect {X = 440, Y = 199, Effect = "Explo", Length = random(700,1200)},		
		SetEffect {X = 438, Y = 201, Effect = "Explo", Length = random(700,1200)},		
		SetEffect {X = 440, Y = 201, Effect = "Explo", Length = random(700,1200)},	
		
		--StopEffect { X = 439, Y = 201 },	
		--StopEffect { X = 440, Y = 200 },
		--StopEffect { X = 439, Y = 199 },
		--StopEffect { X = 438, Y = 200 },			
        --                                 
		--StopEffect { X = 438, Y = 199 },	
		--StopEffect { X = 440, Y = 199 },
		--StopEffect { X = 438, Y = 201 },
		--StopEffect { X = 440, Y = 201 },			
		--                                                 
		--                                                 
		--StopEffect { X = 439, Y = 198 },	
		--StopEffect { X = 437, Y = 200 },
		--StopEffect { X = 439, Y = 202 },
		--StopEffect { X = 441, Y = 200 },			
        --                                 
		--StopEffect { X = 437, Y = 199 },	
		--StopEffect { X = 441, Y = 201 },
		--StopEffect { X = 438, Y = 202 },
		--StopEffect { X = 440, Y = 198 },	
		--                              
		--StopEffect { X = 437, Y = 201 },	
		--StopEffect { X = 438, Y = 198 },
		--StopEffect { X = 441, Y = 199 },
		--StopEffect { X = 440, Y = 202 },
		
		StopEffect { X = 438, Y = 200 },		
		StopEffect { X = 439, Y = 201 },
		StopEffect { X = 439, Y = 199 },
		StopEffect { X = 440, Y = 200 },		

		SetFreezeFlagFalse{NpcId = 3736},
		StopEffect {NpcId = 3736},
		ClearGlobalTimeStamp{Name = "TaliaImprisoned"},
		EnableDialog{NpcId = 3736},
		SetNoFightFlagFalse {NpcId = 3736},
		
		--RemoveObject {X = 439, Y = 200, Object = 2054},	
	}
}

OnEvent
{
	Conditions = {
		FigureAlive{NpcId = 3737},
		IsGlobalTimeElapsed{Name = "TaliaImprisoned", Seconds = 1},
	},
	Actions = {
		CGdsFigureSetHealth:new(3736, 10),
		SetGlobalTimeStamp{Name = "TaliaImprisoned"},
	},
}

------------------- EARTHBLADE SOLVER BEGIN
--Steine des ewigen Feuers
OnEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2200 , Amount = 2},
				QuestState{QuestId = 173 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 173},
				}
}
--Dämonenblut
OnEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2540},
				QuestState{QuestId = 174 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 174},
				}
}
--Alles
OnEvent
{
Conditions = 	{
				QuestState{QuestId = 172 , State = StateSolved},
				QuestState{QuestId = 173 , State = StateSolved},
				QuestState{QuestId = 174 , State = StateSolved},
				QuestState{QuestId = 175 , State = StateSolved},
				QuestState{QuestId = 176 , State = StateUnknown},
				},
Actions =		{
				QuestBegin{QuestId = 176},
				}
}
------------------- EARTHBLADE SOLVER END

-- Fake Spawning
-- Fake für das RTS Spawning, da die Einheiten Einzelne Homepoints haben und deshalb nicht über RTS-SPawning klappen
-- Nordwesten

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 207, Y = 310, Range = 0},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "ShielFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 207, Y = 317},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 207, Y = 310, Range = 0}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "ShielFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 207, Y = 317, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 207, Y = 317, Length = 3000},
		StopEffect {TargetType = World, X = 207, Y = 317},
	}
}

-- Nordosten

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 283, Y = 334, Range = 0},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "ShielFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 291, Y = 330},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 283, Y = 334, Range = 0}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "ShielFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 291, Y = 330, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 291, Y = 330, Length = 3000},
		StopEffect {TargetType = World, X = 291, Y = 330},
	}
}

-- Suedwesten

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 133, Y = 182, Range = 0},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "ShielFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 136, Y = 178},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 133, Y = 182, Range = 0}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "ShielFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 136, Y = 178, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 136, Y = 178, Length = 3000},
		StopEffect {TargetType = World, X = 136, Y = 178},
	}
}

-- Baemonentor vor dem Lavasee

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 197, Y = 176, Range = 0},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "ShielFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 192, Y = 179},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 197, Y = 176, Range = 0}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "ShielFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 192, Y = 179, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 192, Y = 179, Length = 3000},
		StopEffect {TargetType = World, X = 192, Y = 179},
	}
}

EndDefinition()
end
