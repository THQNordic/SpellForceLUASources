-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 378.906677 , 442.719788 , 58.578754 , 14.900021 , [[Camera:ScriptSplineLookAtNpc(8794);]] )
   Camera:MotionSpline_AddSplinePoint( 380.642975 , 441.699249 , 58.578754 , 7.799995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.643250 , 442.877411 , 58.578754 , 12.900013 , [[Camera:ScriptSplineLookAtApproachingModifier(0.03);]] )
   Camera:MotionSpline_AddSplinePoint( 383.369843 , 446.059662 , 58.578754 , 14.800020 , [[Camera:ScriptSplineLookAtNpc(9721);]] )
   Camera:MotionSpline_AddSplinePoint( 383.706421 , 448.742340 , 58.596905 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9721);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
