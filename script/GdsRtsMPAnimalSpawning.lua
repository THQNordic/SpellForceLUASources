dofile("script/GdsDefines.lua")
DefineGlobalConstants()
dofile("script/GdsVariables.lua")
ConsoleDebug = FALSE

function RtsMPAnimalSpawning (NpcId, X, Y, UnitId)
	local FuncName = "GDS: RtsMPAnimalSpawning(): "

	StateMachine = GdsMain:CreateStateMachine("_NPC_" .. NpcId, kGdsStateMachineTypeFigureScript, NpcId)
	StateIdle = CreateState("_IDLE")
	StateDead = CreateState("_DEAD")
	
    TransitionIdleDead = StateIdle:CreateTransition(CreateTransitionName("Base", "MPSpawn", "_IDLE", "_DEAD"), StateDead)
    TransitionDeadIdle = StateDead:CreateTransition(CreateTransitionName("Base", "MpSpawn", "_DEAD", "_IDLE"), StateIdle)

	TransitionIdleDead:AddCondition(CGdsFigureDeadEvent:new(NpcId))
	TransitionIdleDead:AddAction(SetNpcTimeStamp{Name = "Respawntimer"})

	TransitionDeadIdle:AddCondition(IsNpcTimeElapsed {Name ="Respawntimer", Seconds = 300})
	local action = Spawn{NpcId = NpcId, X = X, Y = Y, Range = 6}
	TransitionDeadIdle:AddAction(action)
end
