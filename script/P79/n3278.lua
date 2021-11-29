function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnOneTimeEvent
{
	Conditions = {
		--FigureInRangeNpc{TargetNpcId = Avatar, Range = 2, UpdateInterval = 1},
		IsGlobalFlagTrue{Name = "GO"},
	},
	Actions = {
		--Follow{Target = Avatar},
		--SetEffect{Effect = "Spawnboss"},
		--ChangeBuildingOwner{X = 230, Y = 265},
		--ChangeFigureOwner{},
		--PlaceObject{X = 244, Y = 258, Object = 2104},
		--AttackTarget{NpcId = 4463, Target = Avatar, FriendlyFire = TRUE},
		Goto{X = 200, Y = 250, GotoMode = GotoForced, Range = 0},
	},
}

EndDefinition()

end
