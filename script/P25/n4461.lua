function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

------------- CUTSCENE ---------------------------------------------------------
--OneTimeInitAction (	ChangeRace 			{Race = 124} 		)
OneTimeInitAction (	LookAtFigure		{Target = 4460} 	)
OneTimeInitAction (	HoldPosition		{} 					)
OneTimeInitAction ( SetNoFightFlagTrue 	{NpcId = _NpcId}	)
OneTimeInitAction ( SetEffect			{Effect = "Chain" , Length = 0 , TargetType = Figure , NpcId = _NpcId}	)
--------------------------------------------------------------------------------

EndDefinition()

end
