
-- erst spawnen wenn die letzten fl�chtlinge aus dem portal sind
SpawnOnlyWhen
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "NEVER_TRUE_!!!!!!!!!!!!!!!!!!!"},
	},
	Actions = {
	},
}

