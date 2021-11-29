-- ACHTUNG: dieses script wird mehrfach aufgerufen!!! Absolute one-time events müssen daher in n0.lua !!!

-- ein stinknormaler flüchtling...

MeinFuehrer = 0		-- wenn ein fehler eintritt, laufen sie zum avatar ... das sollte auffallen... ;)

-- abhängig von der eigenen NpcId entscheiden zu welchem anführer man denn nun gehört:
if NpcId > Anfuehrer1 and NpcId < (Anfuehrer1 + 5) then
	MeinFuehrer = Anfuehrer1
elseif NpcId > Anfuehrer2 and NpcId < (Anfuehrer2 + 5) then
	MeinFuehrer = Anfuehrer2
elseif NpcId > Anfuehrer3 and NpcId < (Anfuehrer3 + 5) then
	MeinFuehrer = Anfuehrer3
elseif NpcId > Anfuehrer4 and NpcId < (Anfuehrer4 + 5) then
	MeinFuehrer = Anfuehrer4
elseif NpcId > Anfuehrer5 and NpcId < (Anfuehrer5 + 5) then
	MeinFuehrer = Anfuehrer5
end

-- nur spawnen wenn der anführer da ist
SpawnOnlyWhen
{
	X = FugeePortalX, Y = FugeePortalY, NoSpawnEffect = TRUE,
	Conditions = 
	{ 
		FigureAlive{NpcId = MeinFuehrer},
	},
}

-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = MeinFuehrer},
	},
	Actions = 
	{ 
		Follow {Target = MeinFuehrer} ,
	}, 
}

-- wenn der anführer tot ist, bricht panik aus!
-- alle rennen fluchtartig zurück zum portal (was im grunde deren sicheren untergang bedeutet,
-- aber das wissen die ja nicht ... noch nicht ...)
OnIdleGoHome
{
	X = FugeePortalX, Y = FugeePortalY, Direction = NorthWest, WalkMode = Run, GotoMode = GotoForced,
	Conditions = 
	{
		FigureDead{NpcId = MeinFuehrer},
		IsGlobalFlagFalse{Name = "FugitivesMovingToPosition5"},		-- zum letzten portal schaffen sie es auch alleine
	},
	HomeActions = 
	{
		SetEffect{NpcId = NpcId, Effect = "SimpleInvis", Length = 3333},
		SetNpcFlagTrue{Name = "DespawnMeNowFalsch"},
	},
}
-- nun gehen die flüchtlinge zum endportal
OnIdleGoHome
{
	X = Flucht5X, Y = Flucht5Y, Direction = South,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "FugitivesMovingToPosition5"},
	},
	HomeActions = 
	{
		SetEffect {NpcId = NpcId, Effect = "SimpleInvis", Length = 3333},
		SetNpcFlagTrue {Name = "DespawnMeNow"},
	},
}


OnDeath
{
	Actions = 
	{
		--outcry: 04FugiDead
		-- evtl. mehrere outcries (counter) pro toter gruppe? damit es immer dramatischer klingen wird
		IncreaseGlobalCounter{Name = "LostFugitivesCounter"},
	},
}


-- despawning bei einem der portale
Despawn
{
	Conditions = 
	{
		IsNpcFlagTrue{Name = "DespawnMeNow"},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "SavedFugees"},
		-- Erst mal raus werden dann auf Tirganach vergeben
		--TransferXP {XP = 10},
	}
}

-- despawning bei einem der portale
Despawn
{
	Conditions = 
	{
		IsNpcFlagTrue{Name = "DespawnMeNowFalsch"},
	},
	Actions =
	{
	}
}