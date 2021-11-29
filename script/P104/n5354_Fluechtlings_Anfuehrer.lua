-- ACHTUNG: dieses script wird mehrfach aufgerufen!!! Absolute one-time events m�ssen daher in n0.lua !!!

-- Anf�hrer einer Fl�chtlingstruppe ...

-- soviel zeit in sekunden verstreicht zwischen dem erscheinen von 2 fl�chtlingsgruppen
FugitiveGroupSpawnDelay = 6

-- XP Reward f�r jeden anf�hrer der es durchs portal schafft
XPAmountPerFugitiveLeader = 6

-- zum beschleunigten testen auf Run stellen, sonst Walk:
FugitivesWalkMode = Walk

-- abh�ngig von der npcid andere params benutzen!
if NpcId == 5354 then -- dies ist die erste gruppe, angef�hrt von npcid 5354 (bei irgendeinem muss man ja anfangen):
	SpawnOnlyWhen
	{
		X = FugeePortalX, Y = FugeePortalY, NoSpawnEffect = TRUE,
		Conditions = {
			IsGlobalCounter{Name = "CurrentFugitiveGroupNumber", Value = 0},
			IsGlobalFlagTrue{Name = "FirstFugitiveGroupComingThroughPortal"},
		},
		Actions = {
			IncreaseGlobalCounter{Name = "CurrentFugitiveGroupNumber"},
			SetGlobalTimeStamp{Name = "NextFugitiveGroupTimer"},
		},
	}
else -- dies sind die folgenden gruppen:
	-- n�chste gruppe bitte:
	CurrentFugitiveGroupNumber = CurrentFugitiveGroupNumber + 1
	SpawnOnlyWhen
	{
		X = FugeePortalX, Y = FugeePortalY, NoSpawnEffect = TRUE,
		Conditions = 
		{
			IsGlobalCounter {Name = "CurrentFugitiveGroupNumber", Value = CurrentFugitiveGroupNumber},
			IsGlobalTimeElapsed {Name = "NextFugitiveGroupTimer", Seconds = FugitiveGroupSpawnDelay},
		},
		Actions = 
		{
			IncreaseGlobalCounter {Name = "CurrentFugitiveGroupNumber"},
			SetGlobalTimeStamp {Name = "NextFugitiveGroupTimer"},
		},
	}
end

OnDeath
{
	Actions = 
	{
		--outcry: 04FugiDead
		-- evtl. mehrere outcries (counter) pro toter gruppe? damit es immer dramatischer klingen wird
		IncreaseGlobalCounter{Name = "LostFugitivesCounter"},
	},
}
-- zum fl�chtlingscamp in den s�mpfen
OnIdleGoHome
{
	X = Punkt1X, Y = Punkt1Y, Direction = West, Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesMovingToPosition1"},
		IsGlobalFlagFalse {Name = "FirstOneTimer"},
	},
	HomeActions = 
	{
		SetGlobalTimeStamp {Name = "SumpfwartenWeiterGehen"},
		SetGlobalFlagTrue {Name = "FirstOneTimer"},
	},
}

-- zum fl�chtlingscamp in den s�mpfen
OnIdleGoHome
{
	X = Flucht1X, Y = Flucht1Y, Direction = West, Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "SumpfwartenWeiterGehen", Seconds = 30},
		IsGlobalFlagFalse {Name = "OneTimer"},
	},
	HomeActions = 
	{
		SetGlobalFlagTrue {Name = "FugitivesReachedPosition1"},
		SetGlobalFlagTrue {Name = "OneTimer"},
		RevealUnExplored {X = 337, Y = 169, Range = 15},
	},
}
-- nun gehen die Fl�chtlinge zum Tor
OnIdleGoHome
{
	X = Flucht2X, Y = Flucht2Y, Direction = random(0,7), Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesMovingToPosition2"},
	},
	HomeActions = 
	{
		SetGlobalFlagTrue{Name = "FugitivesReachedPosition2a"},  -- einmal f�rs weiterlaufen
		SetGlobalFlagTrue{Name = "FugitivesReachedPosition2"},	-- einmal f�r die Angriffe
		RevealUnExplored {X = 297, Y = 215, Range = 15},
	},
}

-- nun gehen die Fl�chtlinge durch das Tor zum Pass
OnIdleGoHome
{
	X = Flucht2Xend, Y = Flucht2Yend, Direction = random(0,7), Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesReachedPosition2"},
		--IsGlobalFlagTrue{Name = "FugitivesReachedPosition2a"},
		IsGlobalTimeElapsed {Name = "FugitivesGate1", Seconds = 20},
	},
	HomeActions = 
	{
		--SetGlobalFlagFalse {Name = "FugitivesReachedPosition2a"},
		SetGlobalFlagFalse {Name = "FugitivesReachedPosition2"},
		RevealUnExplored {X = 304, Y = 275, Range = 15},
	},
}

-- nun gehen die fl�chtlinge vors tor zur garnison (2. lager)
OnIdleGoHome
{
	X = Flucht3X, Y = Flucht3Y, Direction = West, Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesMovingToPosition3"},
	},
	HomeActions = 
	{
		SetGlobalFlagTrue	{Name = "FugitivesReachedPosition3"},
		SetGlobalTimeStamp {Name = "ElfenAngreifen"},
		RevealUnExplored {X = Flucht3X, Y = Flucht3Y, Range = 15},
	},
}
-- nun gehen die fl�chtlinge in die garnison
OnIdleGoHome
{
	X = Flucht4X, Y = Flucht4Y, Direction = random(0,7), Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesMovingToPosition4"},
		IsGlobalFlagTrue {Name = "TorAufLeaLos"},
	},
	HomeActions = {
		SetGlobalFlagTrue{Name = "FugitivesReachedPosition4"},
	},
}
-- nun gehen die fl�chtlinge zum ausgangsportal
OnIdleGoHome
{
	X = Flucht5X, Y = Flucht5Y, Direction = South, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesMovingToPosition5"},
	},
	HomeActions = 
	{
		SetGlobalFlagTrue{Name = "FugitivesReachedPosition5"},
		SetEffect{NpcId = NpcId, Effect = "SimpleInvis", Length = 3333},
		SetNpcFlagTrue{Name = "DespawnMeNow"},
	},
}

-- despawning eines anf�hrers beim endportal richtung vIce City
Despawn
{
	Conditions = 
	{
		IsNpcFlagTrue{Name = "DespawnMeNow"},
	},
	Actions = 
	{
		IncreaseGlobalCounter {Name = "SavedFugees"},
	},
}
