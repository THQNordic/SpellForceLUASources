CoordsBlockade =
{
	[1] = { X = 265, Y = 91 },
	[2] = { X = 260, Y = 99 },
	[3] = { X = 262, Y = 99 },
	[4] = { X = 264, Y = 99 },
	[5] = { X = 266, Y = 99 },
	[6] = { X = 261, Y = 87 },
	
}


Waiting =
{
	[1] = { SpawnTime = 7 },
	[2] = { SpawnTime = 17 },
	[3] = { SpawnTime = 27 },
	[4] = { SpawnTime = 37 },
	[5] = { SpawnTime = 47 },
	[6] = { SpawnTime = 57 },
}

SpawnOnlyWhen
{
	X = 442 , Y = 89 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint06On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint06Running", Seconds = (Waiting[MyNumber].SpawnTime) },
	},
}

Respawn
{
	WaitTime = (random(100)+25) ,
	X = 442 , Y = 89 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint06On"},
	},
}



-- Figur läuft in Barrikade
OnIdleGoHome
{
	X = (CoordsBlockade[MyNumber].X) ,
	Y = (CoordsBlockade[MyNumber].Y) ,
	Range = 1, WalkMode = Run,
	Direction = North,
}
