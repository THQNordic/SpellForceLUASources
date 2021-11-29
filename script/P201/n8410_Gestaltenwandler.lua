-- _______________________________________
--I                                      I
--I P201_Gestaltenwandler_Zentralscript  I
--I______________________________________I

--ZustandOrdensritter
UntoterOrdensritter = 0
Ordensritter = 1


--Untote Ordensritter werden Despawned, danach spawnen sie als Ordenritter wieder.
--Da die Geister keine Todesanimation abspielen sollen, werden sie bei weniger als 15% Health despawnen und danach respawnen.

--Das OnEvent wird benötigt für die Verschwindenanimation der Untoten

OnEvent
{
		Conditions = 
		{
			IsGlobalFlagFalse{Name = "g_sP201CutszeneGrabEnded"},
			FigureHasHealth {Percent = 45, NpcId = self, UpdateInterval = 5},
			IsNpcCounter {Name = "npc_cnP201ZustandOrdensritter", Value = UntoterOrdensritter, Operator = IsEqual, UpdateInterval = 5},
			IsNpcCounter {Name = "npc_cnP201EinmalbedingungEffekt", Value = 0, Operator = IsEqual, UpdateInterval = 5},
			PlayerHasItemEquipped {ItemId = 4713, Amount = 1, UpdateInterval = 5},
		},
		Actions = 
		{
			ChangeRace {Race = 152},
			SetNoFightFlagTrue{},
			SetEffect {Effect = "DeMaterialize", Length = 1550},
			SetNpcTimeStamp {Name = "g_tnP201DespawnTimer"},
			IncreaseNpcCounter {Name = "npc_cnP201EinmalbedingungEffekt"},
			SetNpcFlagTrue {Name = "npc_sP201Zwischenwelt"},
		},
	}


Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "g_sP201CutszeneGrabEnded"},
		IsNpcTimeElapsed{Name = "g_tnP201DespawnTimer", Seconds = 1.5, UpdateInterval = 5},
		IsNpcCounter {Name = "npc_cnP201ZustandOrdensritter", Value = UntoterOrdensritter, Operator = IsEqual, UpdateInterval = 5},
		IsNpcFlagTrue {Name = "npc_sP201Zwischenwelt", UpdateInterval = 5},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "npc_sP201StartRespawnOrdensritter"},
		ResetNpcCounter {Name = "npc_cnP201EinmalbedingungEffekt"},	
		SetNpcFlagFalse { Name = "npc_sP201Zwischenwelt"},
		SetNoFightFlagFalse{},	
	}
}
		

Respawn
{
	WaitTime = 1,
	X = 81,
	Y = 68, 
	UnitId = 2058,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "g_sP201CutszeneGrabEnded"},
		IsNpcFlagTrue {Name = "npc_sP201StartRespawnOrdensritter"},
		IsNpcCounter {Name = "npc_cnP201ZustandOrdensritter", Value = UntoterOrdensritter, Operator = IsEqual, UpdateInterval = 5},
	},
	Actions = 
	{
		SetNpcFlagFalse {Name = "npc_sP201StartRespawnOrdensritter"},
		ChangeRace {Race = 1, NpcId = self},
		ChangeFigureOwner {NpcId = self},
		IncreaseNpcCounter {Name = "npc_cnP201ZustandOrdensritter"},
		DecreaseGlobalCounter {Name = "g_cnP201AnzahlUnterstützenderOrdensritter"},
		Follow {Target = 0, NpcId = self},	
		SetGlobalFlagTrue{Name = "g_sP201OrdensritterGerettet"},
	},
	DeathActions = 
	{
		DecreaseGlobalCounter {Name = "g_cnP201AnzahlUnterstützenderOrdensritter"},
	}
} 




--Skelette Respawnen als Skelette wenn der Spieler nicht den Ring trägt
Respawn
{
	WaitTime = 5,
	X = 179,
	Y = 95, 
	UnitId = 2059,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "g_sP201CutszeneGrabEnded"},
		Negated(PlayerHasItemEquipped {ItemId = 4713, Amount = 1}),
		--IsNpcCounter {Name = "npc_cnP201ZustandOrdensritter", Value = Ordensritter, Operator = IsEqual, UpdateInterval = 5},
		--IsGlobalFlagFalse {Name = "g_sP201SicherheitsabfrageGestaltenwandler"},
	},
	Actions = 
	{
		ChangeRace {Race = 114, NpcId = self},
		ResetNpcCounter {Name = "npc_cnP201ZustandOrdensritter"},
		IncreaseGlobalCounter {Name = "g_cnP201AnzahlUnterstützenderOrdensritter"},
		Goto {X = NpcX, Y = NpcY, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoContinuous},
	},
	DeathActions = 
	{
		
	}
} 


--Ordensritter werden getötet und Respawnen als Untote.
Respawn
{
	WaitTime = 10,
	X = 179,
	Y = 95, 
	UnitId = 2354,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "g_sP201CutszeneGrabEnded"},
		IsNpcCounter {Name = "npc_cnP201ZustandOrdensritter", Value = Ordensritter, Operator = IsEqual, UpdateInterval = 5},
		IsGlobalFlagFalse {Name = "g_sP201SicherheitsabfrageGestaltenwandler"},
	},
	Actions = 
	{
		ChangeRace {Race = 114, NpcId = self},
		ResetNpcCounter {Name = "npc_cnP201ZustandOrdensritter"},
		IncreaseGlobalCounter {Name = "g_cnP201AnzahlUnterstützenderOrdensritter"},
		Goto {X = NpcX, Y = NpcY, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoContinuous},
		SetGlobalFlagTrue {Name = "g_sP201OutcryUriasSeeleStart"},
	},
	DeathActions = 
	{
		
	}
} 

--Wenn der Phönixplayer die Karte zum zweiten Mal betritt und er die MainQuest erfüllt hat.
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		QuestState {QuestId = 773, State = StateSolved}, 
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions = 
	{
		
	}
}

