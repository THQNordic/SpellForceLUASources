-->INFO: gate
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnPortalEvent
{
	UpdateInterval = 15,
	X = 253, Y = 191,	-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "CutHQgelaufen", UpdateInterval = 20},
		Negated (EnemyUnitInRange {X = 254, Y = 203, NpcId = Avatar, Range = 10 , UnitId = 0 , UpdateInterval = 20}),
		Negated (BuildingInRange {X = 254, Y = 203, Range = 10, Owner = OwnerAll , BuildingId = 0 , UpdateInterval = 20}),
	},
	OpenActions = 
	{
		SetGlobalFlagTrue {Name = "CutGefaengnisStart"},
	},
	StayOpen = TRUE,
		
}

EndDefinition ()
end
