function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Stehen bleiben
OnPlatformOneTimeEvent
{
	Actions =
	{
		HoldPosition {},
	}
}

-- hAt Belial 1/12 seiner Energie verloren kommt ein Outcry
OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth {NpcId = 11190, Percent = 91, UpdateInterval = 2},
	},
	Actions =
	{
		Outcry {Tag = "oca2piperP213_001", NpcId = 9923, String = "So sei es denn! Wir sehen uns auf der anderen Seite!", Color = ColorWhite}, 	
		SetNpcFlagTrue {Name = "n_P213_Despawn"},
	}
}
-- hAt Belial 1/12 seiner Energie verloren stirbt der Magier
Despawn 
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "n_P213_Despawn"},
	},
	Actions =
	{
		SetEffect {Effect ="OccludeBlack", TargetType = World, X = _X, Y = _Y, Length = 4000},	
	}
}

-- Wenn Belial da ist wird gecastet bis der Arzt kommt
-- !!! Muss nach ganz unten, damit die Loop die erzeugt wird nicht die anderen Skriptereignisse unterdrückt
OnToggleEvent 
{
	UpdateInterval = 30,
	OnConditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_Magier"},
	},
	OnActions	=
	{
		--CastSpell {Spell = 14, TargetType = World, Target = 0, X = 442, Y = 227},
		CastSpell {Spell = 3531, TargetType = Figure, Target = 11190, X = 0, Y = 0},
	},
	OffConditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_Magier"},
	},
	OffActions	=
	{
		--CastSpell {Spell = 14, TargetType = World, Target = 0, X = 442, Y = 227},
		CastSpell {Spell = 3531, TargetType = Figure, Target = 11190, X = 0, Y = 0},
	}
}
EndDefinition()

end
