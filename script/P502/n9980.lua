function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnToggleEvent
{
	OnConditions =
	{
		FigureInRange{X = _X, Y = _Y, Range = 0},
	},
	OnActions = 
	{
		Goto{X = 277, Y = 115, WalkMode = Walk, GotoMode = GotoForced}
	},
	OffConditions =
	{
		FigureInRange{X = 277, Y = 115, Range = 0},
	},
	OffActions = 
	{
		Goto{X = _X, Y = _Y, WalkMode = Run, GotoMode = GotoForced}
	},
}
EndDefinition()

end
