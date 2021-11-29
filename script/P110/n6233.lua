--INFO GARGOYLE

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions =
	{	
    },
	Actions =
	{
		ChangeRace{ Race = 152},
		LookAtDirection { Direction = North , NpcId = self},
		SetFreezeFlagTrue { NpcId = self }
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "GargoyleActionP110"},  
	},
	Actions =
	{
		
		SetFreezeFlagFalse { NpcId = self },
		SetNpcFlagTrue {Name = "GargoyleStartP110"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "GargoyleStartP110"},  
	},
	Actions =
	{
		ChangeUnit { Unit = 326, NpcId = self}, --Gargoyle kann nun Fliegen
		ChangeRace{ Race = 102},
	}
}

EndDefinition()

end
