function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Q132GiveElves"},
	},
	Actions =
	{
		Goto {X = 193, Y = 300,  Range = 10, GotoMode = GotoContinous, WalkMode = Run},
		LookAtDirection {Direction = 7},
	}
}
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Q132GiveElves"},
	},
	Actions =
	{
		ChangeOwner {},
	}
}

EndDefinition()

end
