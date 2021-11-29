function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate {}

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
	},
	Actions = 
	{
	},
}

OnDeath 
{
	Actions =
	{
		SetPlatformFlagTrue {Name = "p_n_P203GrabraeuberTot"},
		Outcry {Tag = "oca2lichkingP203_001", NpcId = 8443, String = "Bringen wir es zu Ende! Der Maskierte wird mich rächen!", Color = ColorWhite}, 
	}
}

EndDefinition()

end
