CoordsSpawnpunkt =
{
	[1] = { X = 259, Y = 302 },
	[2] = { X = 382, Y = 393 },
	[3] = { X = 462, Y = 322 },
	[4] = { X = 450, Y = 185 },
	[5] = { X = 211, Y = 159 },
	[6] = { X = 136, Y = 127 },
	[7] = { X = 62, Y = 55 },
	[8] = { X = 70, Y = 109 },
	[9] = { X = 243, Y = 145 },
	[10] = { X = 280, Y = 217 },
	[11] = { X = 58, Y = 345 },
	[12] = { X = 384, Y = 127 },
	[13] = { X = 109, Y = 74 },
	[14] = { X = 453, Y = 373 },
	[15] = { X = 203, Y = 163 },
	
}

Flag =
{
	[1] = { A = "P212Spawnpoint01On" , B = "P212Spawnpoint02On" },
	[2] = { A = "P212Spawnpoint02On" , B = "P212Spawnpoint03On" },
	[3] = { A = "P212Spawnpoint03On" , B = "P212Spawnpoint04On" },
	[4] = { A = "P212Spawnpoint04On" , B = "P212Spawnpoint05On" },
	[5] = { A = "P212Spawnpoint05On" , B = "P212Spawnpoint06On" }, 
	[6] = { A = "P212Spawnpoint06On" , B = "P212Spawnpoint01On" }, 
	[7] = { A = "P212Spawnpoint01On" , B = "P212Spawnpoint03On" }, 
	[8] = { A = "P212Spawnpoint02On" , B = "P212Spawnpoint04On" },
	[9] = { A = "P212Spawnpoint03On" , B = "P212Spawnpoint05On" }, 
	[10] = {A = "P212Spawnpoint04On" , B = "P212Spawnpoint06On" }, 
	[11] = {A = "P212Spawnpoint05On" , B = "P212Spawnpoint01On" },  
	[12] = {A = "P212Spawnpoint06On" , B = "P212Spawnpoint02On" }, 
	[13] = {A = "P212Spawnpoint01On" , B = "P212Spawnpoint04On" }, 
	[14] = {A = "P212Spawnpoint02On" , B = "P212Spawnpoint05On" }, 
	[15] = {A = "P212Spawnpoint03On" , B = "P212Spawnpoint06On" }, 
}

SpawnOnlyWhen
{
	X = (CoordsSpawnpunkt[MyNumber].X) ,
	Y = (CoordsSpawnpunkt[MyNumber].Y) ,
	Conditions =
	{
		IsGlobalFlagTrue{Name ="P212EntryCutsceneEnded"},
		IsGlobalFlagFalse{Name = Flag[MyNumber].A},
	},
}

Respawn
{
	WaitTime = (random(200)+50) ,
	X = (CoordsSpawnpunkt[MyNumber].X) ,
	Y = (CoordsSpawnpunkt[MyNumber].Y) ,
	Conditions =
	{
		IsGlobalFlagTrue{Name ="P212EntryCutsceneEnded"},
		IsGlobalFlagFalse{Name = Flag[MyNumber].A},
		IsGlobalFlagFalse{Name = Flag[MyNumber].B},
	},
}


