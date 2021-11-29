--5679 - 5693
--5772 - 5776
--Flüchtlinge, die nach dem Tod respawnen und wieder dem Spieler gehören, sammeln sich an PunktXY



Respawn
	{
	WaitTime = 60, UnitId = self , Clan = 0 , X =  282, Y =  103, Chief = none, NoSpawnEffect = FALSE , 
	Conditions = 
	{
		--IsGlobalFlagTrue{ Name = "SklavenÜbergeben", UpdateInterval = 60},
		IsGlobalFlagTrue{ Name = "SklavenRespawnen", UpdateInterval = 60},
	} , 
	Actions = 
	{
		ChangeFigureOwner {NpcId = self}, 
		Goto{X = 319, Y = 219, Range = 7, WalkMode = Run },
	} , 
	DeathActions = { },
	}


--Despawn, wenn Player auf Flee to Ice war
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "PlayerWarAufFleeToIce", UpdateInterval = 20},
	} , 
	Actions = {}
}