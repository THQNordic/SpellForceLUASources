function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnToggleEvent
{
	UpdateInterval = 1,
	OnConditions =
	{
		FigureInRange{X = _X, Y = _Y, Range = 0},
	},
	OnActions = 
	{
		Goto{X = 364, Y = 198, WalkMode = Walk, GotoMode = GotoForced}
	},
	OffConditions =
	{
		FigureInRange{X = 364, Y = 198, Range = 0},
	},
	OffActions = 
	{
		Goto{X = _X, Y = _Y, WalkMode = Run, GotoMode = GotoForced}
	},
}

EndDefinition()

end
