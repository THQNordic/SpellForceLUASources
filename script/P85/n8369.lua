function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Umspawn 
{
	 UnitId = self, 
	 Clan = 0, 
	 X = 138, 
	 Y = 173,
	 Target = None,
	 NoSpawnEffect = TRUE,
	 OnlyOnce = FALSE,
	 Conditions = 
	{
		IsGlobalFlagTrue{Name = "Schalter_ein", UpdateInterval = 1},	
		IsGlobalFlagTrue{Name = "Through_Cave", UpdateInterval = 1},	
	} , 
	Actions = 
	{
		SetGlobalFlagFalse{Name = "Schalter_ein"},
	}

}

EndDefinition()

end
