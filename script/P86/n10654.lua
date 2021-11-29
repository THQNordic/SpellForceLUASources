function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "p86_Karawane_geht_los", UpdateInterval = 1}
	},
	Actions =
	{
		Goto{X = 114, Y = 422, WalkMode = Walk},
	},
}

EndDefinition()

end
