-- Auflevel-Skelett 3 Stadtaufgang

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
 	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE, 
	Conditions = 
	{  
		Negated(AvatarLevel {Level = 27, Player = self, UpdateInterval = 20}),
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
	}, 
	Actions = 
	{ 
		--Goto{X = 292, Y = 368, Range = 1, NpcId = self},
	}
}



EndDefinition()

end