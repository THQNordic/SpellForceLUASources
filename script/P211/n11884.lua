--WächterEchse Gefängnis

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}


SpawnOnlyWhen
{
	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
		{
			IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 20},
			IsGlobalFlagTrue {Name = "g_P211GefaengnisCamp1Destroyed", UpdateInterval = 20},
			IsGlobalFlagTrue {Name = "g_P211GefaengnisCamp2Destroyed", UpdateInterval = 20},
			IsGlobalFlagTrue {Name = "g_P211GefaengnisCamp3Destroyed", UpdateInterval = 20},
			Negated(EnemyUnitInRange{X = 185, Y = 137, NpcId = Avatar, Range = 10, UnitId = 0, UpdateInterval = 10}),
		}, 
	Actions = {} 
}


EndDefinition()

end
