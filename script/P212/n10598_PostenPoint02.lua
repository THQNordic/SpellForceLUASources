CoordsBlockade =
{
	[1] = { X = 266, Y = 91 },
	[2] = { X = 261, Y = 99 },
	[3] = { X = 263, Y = 99 },
	[4] = { X = 265, Y = 99 },
	[5] = { X = 260, Y = 87 },
	[6] = { X = 262, Y = 87 },
	
}


Waiting =
{
	[1] = { SpawnTime = 12 },
	[2] = { SpawnTime = 22 },
	[3] = { SpawnTime = 32 },
	[4] = { SpawnTime = 42 },
	[5] = { SpawnTime = 52 },
	[6] = { SpawnTime = 62 },
}

SpawnOnlyWhen
{
	X = 479 , Y = 414 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint02On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint02Running", Seconds = (Waiting[MyNumber].SpawnTime) },
	},
}

Respawn
{
	WaitTime = (random(100)+25) ,
	X = 479 , Y = 414 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint02On"},
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
