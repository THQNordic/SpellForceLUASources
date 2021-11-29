function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "DialogHuluEnded"},
		PlayerUnitInRange { X = 332 , Y = 386 , Range = 40 , FigureType = FigureAll , UpdateInterval = 10},
   	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "WaldlaeuferRange"},
	}
}

EndDefinition()

end
