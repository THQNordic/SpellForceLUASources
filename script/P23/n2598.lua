function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END

OnToggleEvent
{
	OnConditions =
	{
		PlayerUnitInRange {X = 240, Y = 241, Range = 5},
		FigureJob {},
	},
	OnActions =
	{
		CastSpell {Spell = 188, Target = 0, TargetType = World, X = 240, Y = 241},
	},
	OffConditions =
	{
		Negated(PlayerUnitInRange {X = 240, Y = 241, Range = 10}),
	},
	OffActions =
	{
		Stop {},
	},
}

EndDefinition()

end
