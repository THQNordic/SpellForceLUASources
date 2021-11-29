-- Auflevel-Skelett 1 Höhle, bis Lvl 25

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
 	X = 295, Y = 359, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE, 
	Conditions = 
	{  
		Negated(AvatarLevel {Level = 25, Player = self, UpdateInterval = 20}),
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
	}, 
	Actions = 
	{ 
		Goto{X = 292, Y = 368, Range = 1, NpcId = self},
	}
}

--Respawn, solange Spieler nicht Level 25
Respawn
{
	WaitTime = 10, UnitId = self, Clan = 0, Target = None, X = 295, Y = 359, Chief = none, NoSpawnEffect = TRUE, 
	Conditions = 
	{
		Negated(AvatarLevel {Level = 25, Player = self, UpdateInterval = 20}),
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
	}, 
	Actions = 
	{
		Goto{X = 292, Y = 368, Range = 1, NpcId = self},
	}, 
	DeathActions = {} 

}


EndDefinition()

end
