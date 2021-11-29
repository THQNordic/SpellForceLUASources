function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END

OnEvent 
{
	Conditions =
	{
		PlayerUnitInRange { X = 265, Y = 305, Range = 10},
	},
	Actions =
	{
		--CastSpell {Spell = 1614, TargetType = World, X = 253, Y = 370, Length = 5000, Target = 0},
		CastSpell {Spell = 1614, Target = 0, TargetType = World, X = 254, Y = 396},
		--SetEffect {Effect = "Fog", NpcId = 0},
	}
}

EndDefinition()

end
