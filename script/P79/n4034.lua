function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnOneTimeEvent
{
	Conditions = {
		FigureAlive{NpcId = Avatar},
	},
	Actions = {
		AttackTarget{Target = Avatar, FriendlyFire = TRUE},
		SetEffect{Effect = "Inflex", Length = 0},
		SetEffect{Effect = "Spawnboss", Length = 0},
	},
}


OnOneTimeEvent
{
	Conditions = {
		FigureInRangeNpc{TargetNpcId = Avatar, Range = 10},
	},
	Actions = {
		Goto{X = 225, Y = 225, GotoMode = GotoForced, WalkMode = Run},
		StopEffect{},
		SetEffect{Effect = "BuildingFire", Length = 15000},
		SetGlobalFlagTrue{Name = "Defrost"},
	},
}
OnOneTimeEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "Defrost"},
	},
	Actions = {
		--SetFreezeFlagFalse{},
	},
}

--
--OneTimeInitAction( SetNpcTimeStamp{Name = "Riesendepp"} )
--
--Despawn
--{
--	PlayDeathAnim = TRUE,
--	Conditions = {
--		IsNpcTimeElapsed{Name = "Riesendepp", Seconds = 15},
--	},
--	Actions = {
--		--SetNpcTimeStamp{Name = "Riesendepp"},
--	},
--}
--
--Respawn
--{
--	WaitTime = 0.1,
--}
--
----OnToggleEvent
----{
----	OnConditions = {
----		IsNpcFlagFalse{Name = "HörgrSchlecht", UpdateInterval = 5},
----		IsNpcTimeElapsed{Name = "Riesendepp", Seconds = 10, UpdateInterval = 5},
----	},
----	OnActions = {
----		SetNpcTimeStamp{Name = "Riesendepp"},
----		ChangeUnit{Unit = 926 },
----		ChangeRace{Race = 152},
----		Outcry{String = "Hörgr schlafen!"},
----	},
----	OffConditions = {
----		IsNpcFlagFalse{Name = "HörgrSchlecht", UpdateInterval = 5},
----		IsNpcTimeElapsed{Name = "Riesendepp", Seconds = 10, UpdateInterval = 5},
----	},
----	OffActions = {
----		SetNpcTimeStamp{Name = "Riesendepp"},
----		ChangeUnit{Unit = 914 },
----		ChangeRace{Race = 113},
----		Outcry{String = "Hörgr hellwach!"},
----	},
----}	
----
----OnOneTimeEvent
----{
----	Conditions = {
----		FigureHasAggro{},
----	},
----	Actions = {
----		SetNpcFlagTrue{Name = "HörgrSchlecht"},
----		ChangeUnit{Unit = 915 },
----		ChangeRace{Race = 113},
----		Outcry{String = "Hörgr übel!"},
----	},
----}
----
--
--
EndDefinition()
end
