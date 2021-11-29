-- _______________________________________
--I                                      I
--I       P201_Blackwater_Coast          I
--I______________________________________I

--Zeit fürs Tierspawning
--TierSpawning = 250

GolemSpawnPosX = 84
GolemSpawnPosY = 204

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


dofile("script/P201/n0_ItemScript.lua")
dofile("script/P201/n32230_CutszeneStart.lua") 
dofile("script/P201/n32234_CutszeneOutpost.lua") 
dofile("script/P201/n32240_CutszeneGrab.lua")
dofile("script/Hadeko.lua") 

--Remove Dialog für NQ Gurim und Drachensteine.
OnOneTimeEvent
{
	Conditions = 
	{ 
		
	},
	Actions = 
	{ 
		LookAtDirection {Direction = SouthWest, NpcId = 0},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9201"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9202"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9233"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9234"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9235"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9236"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8398"},
	}
}

--Remove Dialog für Urias, und Ordensritter.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201Ordensritter1Gespawned"},
		IsGlobalFlagTrue {Name = "g_sP201Ordensritter2Gespawned"},
		IsGlobalFlagTrue {Name = "g_sP201Ordensritter3Gespawned"},
		IsGlobalFlagTrue {Name = "g_sP201UriasGespawned"},		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8404"},
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8397"},
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8399"},
		
		
	}
}
--Ordensritter2 Dialog wird nach der CutszeneStart enabled.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201CutszeneStartEnded"},
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8398"},
		
	}
}



--Je nach Stufe des Avatars werden Loot-Kisten zur Verfügung gestellt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_sP201KistenNichtVerschwinden"},
		AvatarLevel {Level = 28, Player = self , UpdateInterval = 60},
	},
	Actions = 
	{ 
		RemoveObject {X = 172, Y = 163, Object = 3043},
		RemoveObject {X = 151, Y = 192, Object = 3042},
		RemoveObject {X = 85, Y = 201, Object = 3041},
		SetGlobalFlagTrue {Name = "g_sP201KistenVerschwunden"},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		Negated(AvatarLevel {Level = 28, Player = self , UpdateInterval = 60}),
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP201KistenNichtVerschwinden"},
	}
}




--Es wird ein Flag gesetzt wenn der Avatar durch den Canyon zieht.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 134, Y = 146, NpcId = 0, Range = 5},
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP201CanyonDurchwandert"},
	}
}




--Schatzleiche mit Ring verschwindet falls der Schattenklingenspieler die Karte betritt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
	},
	Actions = 
	{ 
		RemoveObject {X = 43, Y = 52, Object = 3044},
		--Schatzkisten verschwinden ebenso.
		RemoveObject {X = 172, Y = 163, Object = 3043},
		RemoveObject {X = 151, Y = 192, Object = 3042},
		RemoveObject {X = 85, Y = 201, Object = 3041},
		
	}
}


--Ordensritter1 wird zu einer Spielerfigur, wenn das jeweilige Skelett getötet wurde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201CutszeneStartEnded"},
		FigureAlive {NpcId = 8397}, 
		FigureInRange {X = 123, Y = 155, NpcId = 8397, Range = 5},
		IsGlobalFlagTrue {Name = "g_sP201DialogOrdenskrieger1Ein"},
	},
	Actions = 
	{ 
		
		IncreaseGlobalCounter { Name = "g_cnP201OrdensritterStart1"},
	}
}

--Nach Dialog mit Ordensritter1
OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201Ordensritter1Verpflichtung", UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions = 
	{ 
		
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8397" },
		ChangeUnit {Unit = 2058, NpcId = 8397, ChangeLevel = TRUE},
		ChangeFigureOwner {NpcId = 8397},
		--Jeder Ordensritter der gerettet wurde wird später als Unterstützungseinheit neu Respawned
		IncreaseGlobalCounter { Name = "g_cnP201Mitstreiter"},
		SetRewardFlagTrue { Name = "Ordensritter1Befreit" },
		
	}
}
--Ordensritter2 wird zu einer Spielerfigur, wenn das jeweilige Skelett getötet wurde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201CutszeneStartEnded"},
		FigureAlive {NpcId = 8398}, 
		FigureInRange {X = 149, Y = 220, NpcId = 8398, Range = 5},
		IsGlobalFlagTrue {Name = "g_sP201DialogOrdenskrieger2Ein"},
	},
	Actions = 
	{ 
		--SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8398"},
		IncreaseGlobalCounter { Name = "g_cnP201OrdensritterStart2"},
		
	}
}

--Nach Dialog mit Ordensritter2
OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201Ordensritter2Verpflichtung", UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8398" },
		ChangeUnit {Unit = 2058, NpcId = 8398, ChangeLevel = TRUE},
		ChangeFigureOwner {NpcId = 8398},
		IncreaseGlobalCounter { Name = "g_cnP201Mitstreiter"},
		SetRewardFlagTrue { Name = "Ordensritter2Befreit" },
	}
}

--Ordensritter3 wird zu einer Spielerfigur, wenn das jeweilige Skelett getötet wurde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201CutszeneStartEnded"},
		FigureAlive {NpcId = 8399}, 
		FigureInRange {X = 96, Y = 121, NpcId = 8399, Range = 5},
		IsGlobalFlagTrue {Name = "g_sP201DialogOrdenskrieger3Ein"},
	},
	Actions = 
	{ 
		--SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8399"},
		IncreaseGlobalCounter { Name = "g_cnP201OrdensritterStart3"},
	}
}

--Nach Dialog mit Ordensritter3
OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201Ordensritter3Verpflichtung", UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8399" },
		ChangeUnit {Unit = 2058, NpcId = 8399, ChangeLevel = TRUE},
		ChangeFigureOwner {NpcId = 8399},
		IncreaseGlobalCounter { Name = "g_cnP201Mitstreiter"},
		SetRewardFlagTrue { Name = "Ordensritter3Befreit" },
	}
}

--Urias gilt als befreit, wenn:
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue {Name = "g_sP201SkelettCampUriasDestroyed"},
		 
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP201UriasBefreit"},
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8404"},
		StopEffect {TargetType = Figure, NpcId = 8404},
	}
}


--Trigger für das Spawnen der UntotenOrdensritter
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201EndeVomAnfangCutszeneOutpost"},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp {Name = "g_tnP201StartSpawnUntote"},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 	
		IsGlobalTimeElapsed {Name = "g_tnP201StartSpawnUntote", Seconds = 1, UpdateInterval = 10},  
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP201EndeCutszeneOutpost"},
	}
}

--Abfrage für das Triggern der 3 Cutszene.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
	},
	Actions = 
	{ 
		IncreaseGlobalCounter {Name = "g_cnP201AnzahlUnterstützenderOrdensritter", Step = 28},
	}
}

--Abfrage für das Triggern der 3 Cutszene.
OnOneTimeEvent
{
	Conditions = 
	{ 
		Negated(EnemyUnitInRange {X = 179, Y = 95, NpcId = Avatar, Range = 15, UnitId = 0, UpdateInterval = 60}),
		Negated(EnemyUnitInRange {X = 160, Y = 77, NpcId = Avatar, Range = 15, UnitId = 0, UpdateInterval = 60}),
		Negated(BuildingInRange {X = 185, Y = 105, Range = 3, Owner = OwnerNpc, BuildingId = 0}),
		Negated(BuildingInRange {X = 177, Y = 82, Range = 3, Owner = OwnerNpc, BuildingId = 0}),
		Negated(BuildingInRange {X = 154, Y = 61, Range = 3, Owner = OwnerNpc, BuildingId = 0}),
		Negated(BuildingInRange {X = 151, Y = 53, Range = 3, Owner = OwnerNpc, BuildingId = 0}), 
		IsGlobalFlagTrue {Name = "g_sP201SkelettCamp1Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP201SkelettCamp2Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP201SkelettCamp3Destroyed"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP201CutszeneGrabStart"},
	}
}

--Setzt den Follow Mode von Urias wieder auf True.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201CutszeneGrabEnded"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP201UriasFollow"},
	}
}



-- _______________________________________
--I                                      I
--I            P201_Main Quest           I
--I______________________________________I

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP201CutszeneStartEnded"},
	},
	Actions = 
	{ 
		QuestBegin { QuestId = 773},
		QuestBegin { QuestId = 774},
	}
}

--Nachdem man mit der Torwache der Ordensritter gesprochen hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP201OrdensritterSpawn"},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 774},
		QuestBegin { QuestId = 775},
	}
}

--Nachdem man Urias befreit hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP201UriasBefreitVorOrt"},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 775},
		SetRewardFlagTrue { Name = "UriasBefreit" },
		QuestBegin { QuestId = 776},
	}
}

--Wenn man Urias sofort Rettet ohne vorher mit der Torwache geredet zu haben.
OnOneTimeEvent
{
	Conditions = 
	{ 
		QuestState {QuestId = 774, State = StateActive},
		IsGlobalFlagTrue{Name = "g_sP201PalisadentorOeffnen"},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 774},
		
	}
}


--Nach der CutszeneOutpost.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP201EndeVomAnfangCutszeneOutpost"},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 776},
		SetRewardFlagTrue { Name = "InsCampGekommen" },
		QuestBegin { QuestId = 893},
		--SetPlatformFlagTrue {Name = "g_sP201UriasFollow"},
		SetGlobalFlagTrue {Name = "g_sP201LightKingStartPosition"},
	}
}

--Nach der CutszeneGrab.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP201CutszeneGrabEnded"},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 777},
		SetRewardFlagTrue { Name = "CampsZerstoert" },
		QuestBegin { QuestId = 778},
		SetGlobalFlagTrue {Name = "g_sP201UriasFollow"},
		SetPlatformFlagTrue {Name = "g_sP201UriasFollow"},
	}
}

--Belohnung für den Ring.
OnOneTimeEvent
{
	Conditions = 
	{ 
		ODER(IsItemFlagTrue{Name = "PlayerHasItemRingOfHealthGhost"}, PlayerHasItemEquipped {ItemId = 4713, Amount = 1, UpdateInterval = 10}),
	},
	Actions = 
	{ 
		SetRewardFlagTrue { Name = "RingGefunden" },
		QuestSolve { QuestId = 893},
		Outcry {NpcId = 8404, String = "Ihr müsst den Ring an Eurem Finger tragen, damit er wirken kann!" , Tag = "oca2uriasP201_008" , Delay = TRUE , Color = ColorWhite},
		QuestBegin { QuestId = 777},
		SetGlobalFlagTrue {Name = "g_sP201RingGefunden"},
	}
}
-- _______________________________________
--I                                      I
--I       P201_SQ Die Geisterdrachen	 I
--I______________________________________I


--SideQuest wird aktiv sobald der Schattenkrieger oder der Phönixkrieger (bei gesolvter MainQuest 777) Blackwater betritt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
			UND9
			{
				QuestState {QuestId = 777, State = StateSolved}, 
				IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"},
				IsGlobalFlagTrue{Name = "g_P204_UriasNebenquestAktiv"},
			},
		},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_9202"},
		SetGlobalTimeStamp {Name = "g_tsP201SQOutrcriesGurimStart"},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "g_tsP201SQOutrcriesGurimStart", Seconds = 2}
	},
	Actions = 
	{ 
		Outcry {NpcId = 9201, String = "Bruder! Warum musste das geschehen?" , Tag = "oca2gurimP201_001" , Delay = TRUE , Color = ColorWhite},	
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "g_tsP201SQOutrcriesGurimStart", Seconds = 7}
	},
	Actions = 
	{ 
		
		Outcry {NpcId = 9201, String = "Ich habe versagt!" , Tag = "oca2gurimP201_002" , Delay = TRUE , Color = ColorWhite},	
		
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "g_tsP201SQOutrcriesGurimStart", Seconds = 10}
	},
	Actions = 
	{ 
		
		Outcry {NpcId = 9201, String = "Niethalf, wirf meine Seele in die Esse!" , Tag = "oca2gurimP201_003" , Delay = TRUE , Color = ColorWhite},	
		
	}
}


--Nachdem man mit dem Leutnant gesprochen hat startet die SideQuest.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201QuestStartGurim"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_9201"},
		QuestSolve { QuestId = 895},
		QuestSolve { QuestId = 894},
		SetRewardFlagTrue { Name = "LeutnantGesprochen" },
		QuestBegin { QuestId = 833},
		QuestBegin { QuestId = 834},
		
		Outcry {NpcId = 9201, String = "Isgrimm, ich verfluche dich!" , Tag = "oca2gurimP201_004" , Delay = TRUE , Color = ColorWhite},	

	}
}


OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201SheehaAmLeben"},
		IsGlobalFlagTrue {Name = "g_sP201AndarAmLeben"},
		FigureDead {NpcId = 9207},
		FigureDead {NpcId = 9208},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP201Auftrag1Erfuellt"},
		SetRewardFlagTrue { Name = "ZweitenDrachenGetoetet" },
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201ZandarhAmLeben"},
		IsGlobalFlagTrue {Name = "g_sP201IridonAmLeben"},
		IsGlobalFlagTrue {Name= "g_sP201GolemAmLeben"},
		FigureDead {NpcId = 9212},
		FigureDead {NpcId = 9213},
		FigureDead {NpcId = 9216},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP201Auftrag2Erfuellt"},
	}
}

--Remove Dialog Leutnant.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201QuestStartGurim"},
			

	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9202" },
		QuestSolve {QuestId = 895},	
		QuestSolve {QuestId = 894},	
		
	}
}


--Remove Dialog Gurim.
--Nachdem man mit Gurim gesprochen hat wird die SideQuest aktualisiert.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201Auftrag1Erhalten"},
			

	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9201" },
		QuestSolve {QuestId = 834},
		QuestBegin {QuestId = 835},
		QuestBegin {QuestId = 836},
		QuestBegin {QuestId = 837},
		
	}
}
--Ist Sheeha tot wird die Quest aktualisiert.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201SheehaAmLeben"}, 
		FigureDead {NpcId = 9207},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 836},	
		SetRewardFlagTrue { Name = "ErstenDrachenGetoetet" },	
	}
}


--Enable Dialog Gurim und Quest wird aktualisiert.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201Auftrag1Erfuellt"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_9201"},
		QuestSolve {QuestId = 835},
		QuestSolve {QuestId = 837},
		QuestBegin {QuestId = 838},
	}
}

--Remove Dialog Gurim und Quest wird aktualisiert.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201Auftrag2Erhalten"},
			

	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9201" },
		QuestSolve {QuestId = 838},
		QuestBegin {QuestId = 839},
		QuestBegin {QuestId = 840},
		QuestBegin {QuestId = 841},
		QuestBegin {QuestId = 842},
	}
}

--Ist Zandarh tot wird die Quest aktualisiert.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201ZandarhAmLeben"}, 
		FigureDead {NpcId = 9212},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 840},	
		SetRewardFlagTrue { Name = "DrittenDrachenGetoetet" },		
	}
}

--Ist Zandarh und Iridon tot wird die Quest aktualisiert.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201Auftrag2Erfuellt"},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 841},	
		SetRewardFlagTrue { Name = "ViertenDrachenGetoetet" },	
	}
}

--Ist Laurin tot wird die Quest aktualisiert.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201LaurinAmLeben"}, 
		FigureDead {NpcId = 9214},
		--Laurins Doppelgänger
		
		FigureDead {NpcId = 9242},
		
		FigureDead {NpcId = 9245},
		
		FigureDead {NpcId = 9248},
		
		FigureDead {NpcId = 11926},
	
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP201LaurinTot"},
		Outcry {NpcId = 9201, String = "Laurin ist erschlagen! Nehmt Glamrigs Rune!" , Tag = "oca2gurimP201_012" , Delay = TRUE , Color = ColorWhite},
		QuestSolve {QuestId = 842},	
		QuestSolve {QuestId = 839},		
		QuestSolve {QuestId = 833},					
	}
}

--Ist Laurin Tot aber Gurim lebt, dann gibt es extra Belohnung. 
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201LaurinTot"},
		FigureAlive {NpcId = 9201}, 
	},
	Actions = 
	{ 
		SetRewardFlagTrue { Name = "GurimLebt" },	
	}
}




-----------------------------------------------------
--		Zandarh Feuerelementare und Lebenspunkte.
-----------------------------------------------------


OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201ZandarhFeueerelementar1", UpdateInterval = 10},		
		FigureDead {NpcId = 9223},
		FigureAlive {NpcId = 9212}, 
	},
	Actions = 
	{ 
		SetHealth {HitPoints = 398, NpcId = 9212, Decrease = TRUE},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201ZandarhFeueerelementar2", UpdateInterval = 10},		
		FigureDead {NpcId = 9224},
		FigureAlive {NpcId = 9212}, 
	},
	Actions = 
	{ 
		SetHealth {HitPoints = 398, NpcId = 9212, Decrease = TRUE},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201ZandarhFeueerelementar3", UpdateInterval = 10},		
		FigureDead {NpcId = 9225},
		FigureAlive {NpcId = 9212}, 
	},
	Actions = 
	{ 
		SetHealth {HitPoints = 398, NpcId = 9212, Decrease = TRUE},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201ZandarhFeueerelementar4", UpdateInterval = 10},		
		FigureDead {NpcId = 9226},
		FigureAlive {NpcId = 9212}, 
	},
	Actions = 
	{ 
		SetHealth {HitPoints = 398, NpcId = 9212, Decrease = TRUE},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201ZandarhFeueerelementar5", UpdateInterval = 10},	
		FigureDead {NpcId = 9227},
		FigureAlive {NpcId = 9212}, 
	},
	Actions = 
	{ 
		SetHealth {HitPoints = 398, NpcId = 9212, Decrease = TRUE},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201ZandarhFeueerelementar6", UpdateInterval = 10},	
		FigureDead {NpcId = 9228},
		FigureAlive {NpcId = 9212}, 
	},
	Actions = 
	{ 
		SetHealth {HitPoints = 398, NpcId = 9212, Decrease = TRUE},
	}
}
----------------------------------------------------------
--				Laurins Doppelgänger
----------------------------------------------------------


OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201LaurinAmLeben", UpdateInterval = 10},
		FigureHasHealth {Percent = 80, NpcId = 9214, UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP201LaurinTot"},		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP201DoppelgaengerLaurinStart"},
		SetGlobalTimeStamp {Name = "g_tnP201ZeitDoppelgaengerStart1"},
		ChangeObject {X = 171, Y = 206, Object = 2773},
		ChangeObject {X = 160, Y = 228, Object = 2773},
		ChangeObject {X = 170, Y = 219, Object = 2773},
		ChangeObject {X = 161, Y = 207, Object = 2773},
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9233"},
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9234"},
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9235"},
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9236"},
		Outcry {NpcId = 9201, String = "Er webt sein Blendwerk! Er teilt sich!" , Tag = "oca2gurimP201_010" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 9201, String = "Berührt den Kristall! So haltet Ihr es auf" , Tag = "oca2gurimP201_011" , Delay = FALSE , Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		ODER9
		{
			
			UND(IsGlobalFlagTrue {Name = "g_P201LaurinDoppelgaenger1lebt", UpdateInterval = 10}, IsGlobalFlagTrue {Name = "g_sP201_LaurinStein1Off", UpdateInterval = 10}),
			IsGlobalFlagTrue {Name = "g_sP201LaurinTot"},
		},
	},
	Actions = 
	{ 
		ChangeObject {X = 171, Y = 206, Object = 2789},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9235" },
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		ODER9 
		{
			UND(IsGlobalFlagTrue {Name = "g_P201LaurinDoppelgaenger2lebt", UpdateInterval = 10}, IsGlobalFlagTrue {Name = "g_sP201_LaurinStein2Off", UpdateInterval = 10}),
			IsGlobalFlagTrue {Name = "g_sP201LaurinTot"},
		},
	},
	Actions = 
	{ 
		ChangeObject {X = 160, Y = 228, Object = 2789},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9234" },
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		ODER9 
		{
			UND(IsGlobalFlagTrue {Name = "g_P201LaurinDoppelgaenger3lebt", UpdateInterval = 10}, IsGlobalFlagTrue {Name = "g_sP201_LaurinStein3Off", UpdateInterval = 10}),
			IsGlobalFlagTrue {Name = "g_sP201LaurinTot"},
		},
	},
	Actions = 
	{ 
		ChangeObject {X = 170, Y = 219, Object = 2789},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9236" },
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		ODER9 
		{
			UND(IsGlobalFlagTrue {Name = "g_P201LaurinDoppelgaenger4lebt", UpdateInterval = 10}, IsGlobalFlagTrue {Name = "g_sP201_LaurinStein4Off", UpdateInterval = 10}),
			IsGlobalFlagTrue {Name = "g_sP201LaurinTot"},
		},
	},
	Actions = 
	{ 
		ChangeObject {X = 161, Y = 207, Object = 2789},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9233" },
	}
}



-- golem spawnpoint effekt removen wenn spawning aufhört...
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalCounter {Name = "npc_cnP201ExpCounter", Value = 6, Operator = IsGreater, UpdateInterval = 10},
		FigureDead{NpcId = 8682},
	},
	Actions = 
	{ 
		StopEffect{X = GolemSpawnPosX, Y = GolemSpawnPosY},
		SetEffect{Effect = "AreaHit", X = GolemSpawnPosX, Y = GolemSpawnPosY, Length = 3000},
		SetEffect{Effect = "Lightning", X = GolemSpawnPosX, Y = GolemSpawnPosY, Length = 3500},
	}
}



----I---------------------------------------I
----I                                       I
----I           Bank von Empyria            I
----I           Schatzbrief-Zähler          I
----I         (muß auf alle Karten!)        I
----I                                       I
----I---------------------------------------I



OnEvent
{
	Conditions =
	{
		PlayerHasItem{ItemId = 7357},
		IsGlobalTimeElapsed{Name = "g_SchatzbriefTimer", Seconds = 7000}
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "g_P204_SchatzbriefZins"},
		SetGlobalTimeStamp{Name = "g_SchatzbriefTimer"},
	}
}

----------------------------------------------------------
--				Storyquest Part.
----------------------------------------------------------

---Überquest starten, wenn Phönixspieler
OnOneTimeEvent
{
	Conditions = 
	{ 
	IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"},
	},
	Actions = 
	{ 
	QuestBegin {QuestId = 1087},
	QuestBegin {QuestId = 1088},
	}
}

---Dryade suchen nach Darius Cutscene
OnOneTimeEvent
{
	Conditions = 
	{
	QuestState{QuestId = 1087, State = StateActive}, 
	IsGlobalFlagTrue{Name = "g_StoryQuestPhoenixGotoEmpyria"},
	},
	Actions = 
	{ 
	QuestSolve {QuestId = 1088},
	QuestBegin {QuestId = 1089},
	}
}

EndDefinition()
end
